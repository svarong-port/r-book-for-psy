# Linear regression


# Set seed for reproducibility
set.seed(123)

# Create a data frame
sleep_df <- data.frame(
  
  # ID
  id = 1:30,
  
  # Exercise: hours/week
  exercise = round(rnorm(30, mean = 4, sd = 2), 1),
  
  # Caffeine intake: mg/day
  caffeine = round(rnorm(30, mean = 200, sd = 80), 0),
  
  # Screen time: hours/day
  screen_time = round(rnorm(30, mean = 6, sd = 2), 1),
  
  # Sleep: hours/day
  sleep = round(rnorm(30, mean = 7, sd = 1), 1)
)

# View the df
regression_df


# -------------------------------------------------------


# Perform a simple linear regression analysis
lm_1 <- lm(sleep ~ screen_time, data = sleep_df)

# View the result
summary(lm_1)


# -------------------------------------------------------


# Perform a mulitple linear regression analysis
lm_2 <- lm(sleep ~ exercise + caffeine + screen_time, data = sleep_df)

# View the result
summary(lm_2)