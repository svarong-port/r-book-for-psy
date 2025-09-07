# Exploratory factor analysis (EFA)


# Load psych
library(psych)
library(GPArotation)

# Load the dataset
data(bfi)

# View the structure
str(bfi)

# Subset Big Five items
efa_df <- bfi[, 1:25]

# View the result
str(efa_df)

# Check for NA
sum(is.na(efa_df))

# Drop NA
efa_df <- na.omit(efa_df)

# Check for NA
sum(is.na(efa_df))

# View the result
str(efa_df)


# -------------------------------------


# 1. Check suitability

# KMO
KMO(efa_df)

# Bartlet’s test of sphericity
cortest.bartlett(cor(efa_df),
                 n = nrow(efa_df))


# -------------------------------------


# 2. Determine the number of factors to extract

# Compute eigenvalues
eigen_results <- eigen(cor(efa_df))

# Get eigenvalues
eigen_results$values

# Create a scree plot
scree(cor(efa_df),
      factors = TRUE,
      pc = FALSE)

# Parallel analysis
fa.parallel(cor(efa_df),
            fm = "ml",
            fa = "fa")


# -------------------------------------


# 3. Perform EFA

# Perform EFA for a 5-factor model
efa_result_5 <- fa(cor(efa_df),
                   nfactors = 5,
                   fm = "ml",
                   rotate = "oblimin")

# Perform EFA for a 6-factor model
efa_result_6 <- fa(cor(efa_df),
                   nfactors = 6,
                   fm = "ml",
                   rotate = "oblimin")

# Print the result for the 5-factor model
print("1️⃣ 5-factor model:")
print(efa_result_5$loadings, cutoff = .30)

# Print the result for the 6-factor model
print("2️⃣ 6-factor model:")
print(efa_result_6$loadings, cutoff = .30)