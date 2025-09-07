# Linear regression


# Load packages
library(psych)
library(dplyr)

# Load the dataset
data(sat.act)

# Select predictors and outcome
predict_score_df <- sat.act |>
  select(age, education, SATV, SATQ, ACT)

# View the result
head(predict_score_df)

# Create a linear regression model
score_model <- lm(ACT ~ age + education + SATV + SATQ,
                  data = predict_score_df)

# View the model summary
summary(score_model)