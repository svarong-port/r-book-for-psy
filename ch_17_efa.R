# Exploratory factor analysis (EFA)


# Load packages
library(dplyr)
library(psych)

# Load the dataset
data(bfi)

# View the structure
str(bfi)

# Subset Big Five items
efa_df <- bfi |>
  select(A1:O5)

# Check for NA
colSums(is.na(efa_df))

# Drop NA
efa_df <- na.omit(efa_df)

# Check for NA
colSums(is.na(efa_df))

# View the df
head(efa_df)


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
cor(efa_df) |> eigen()

# Create a scree plot
scree(efa_df, pc = FALSE)

# Parallel analysis
fa.parallel(efa_df,
            fm = "ml",
            fa = "fa")

# -------------------------------------


# 3. Perform EFA

# Perform EFA for a 5-factor solution
efa_result_5 <- fa(efa_df,
                   nfactors = 5,
                   fm = "ml",
                   rotate = "oblimin")

# Print the result
print(efa_result_5$loadings, cutoff = .30)

# Perform EFA for a 6-factor solution
efa_result_6 <- fa(efa_df,
                   nfactors = 6,
                   fm = "ml",
                   rotate = "oblimin")

# Print the result
print(efa_result_6$loadings, cutoff = .30)