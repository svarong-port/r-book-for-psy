# Regression


# 1. Linear regression

# Load psychTools
library(psychTools)

# Load the dataset
data(msq)

# Select predictors and outcome
mood_df <- msq[, c("calm", "afraid", "angry", "happy")]

# View the result
head(mood_df)

# Create a linear regression model
linear_model <- lm(happy ~ calm + afraid + angry,
                   data = mood_df)

# View the model summary
summary(linear_model)


# ----------------------------------------------------


# 2. Logistic regression

# Create binary outcome (low vs high happy)

# Calculate median happy
median_happy <- median(mood_df$happy, na.rm = TRUE)

# Categorise happy into low and high
mood_df$binary_happy <- ifelse(mood_df$happy <= median_happy, 0, 1)


# Create a logistic regression model
log_model <- glm(binary_happy ~ calm + afraid + angry,
                 data = mood_df,
                 family = "binomial")

# View the model summary
summary(log_model)

# Convert log-odds to odds ratios
coef(log_model) |> exp()