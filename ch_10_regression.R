# Regression


# 1. Linear regression

# Install psychTools
install.packages("psychTools")

# Load psychTools
library(psychTools)

# Load the dataset
data(msq)

# Select predictors and outcome
mood_df <- msq[, c("calm", "afraid", "angry", "anxious")]

# View the result
head(mood_df)

# Create a linear regression model
linear_model <- lm(anxious ~ calm + afraid + angry,
                   data = mood_df)

# View the model summary
summary(linear_model)


# ----------------------------------------------------


# 2. Logistic regression

# Create binary outcome

# Calculate median anxious
median_anxious <- median(mood_df$anxious, na.rm = TRUE)

# Categorise anxious into low and high
mood_df$binary_anxious <- ifelse(mood_df$anxious <= median_anxious, 0, 1)


# Create a logistic regression model
log_model <- glm(binary_anxious ~ calm + afraid + angry,
                 data = mood_df,
                 family = "binomial")

# View the model summary
summary(log_model)

# Convert log odds to odds ratios
coef(log_model) |> exp()