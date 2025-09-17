# Reliability


# 1. Internal consistency

# Load psych
library(psych)

# Load the dataset
data(bfi)

# View the first 6 rows
head(bfi)


# Load dplyr
library(dplyr)

# Select agreeableness items
agreeableness <- bfi |>
  select(starts_with("A"), -age)

# Preview the result
head(agreeableness)

# Compute Cronbach's alpha
alpha(agreeableness,
      check.keys = TRUE,
      na.rm = TRUE)


# -----------------------------------------------


# 2. Test-retest reliability

# Load psychTools
library(psychTools)

# Load dplyr
library(dplyr)

# Load the dataset
data(sai)

# View the dataset structure
str(sai)

# Subset data
salt_df <- sai |>
  filter(study == "SALT") |>
  select(-study)

# View the dataset structure
str(salt_df)

# Compute test-retest reliability with testRetest()
testRetest(t1 = salt_df,
           id = "id",
           time = "time",
           check.keys = TRUE,
           lmer = FALSE)