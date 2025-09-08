# Correlation


# Install psych
install.packages("psych")

# Load packages
library(psych)
library(dplyr)

# Load the dataset
data(sat.act)

# View the first 6 rows:
head(sat.act)

# Subset data
score_df <- sat.act |>
  select(ACT, SATV, SATQ)

# View the result
head(score_df)


# ----------------------------------------------------


# 1. cor()

# Create a correlation matrix with cor()
cor(score_df,
    use = "complete.obs",
    method = "pearson") |> 
  round(2)


# ----------------------------------------------------


# 2. cor.test()

# Compute Pearson's r for SATV and SATQ
cor.test(score_df$SATV,
         score_df$SATQ,
         method = "pearson",
         na.action = na.omit)


# ----------------------------------------------------


# 3. corr.test()

# Create a correlation matrix with corr.test()
corr.test(score_df,
          use = "complete",
          method = "pearson")