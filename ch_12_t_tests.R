# t-tests


# 1. One-sample t-test

# Create a data frame
extraversion_df <- data.frame(
  id = 1:10,
  extraversion = c(4, 5, 3, 4, 2, 5, 4, 3, 4, 5)
)

# View the df
extraversion_df

# Perform a one sample t-test
t.test(extraversion_df$extraversion,
       mu = 3)


# ----------------------------------------------------


# 2. Independent-samples t-test

# Create a data frame
reaction_time_df <- data.frame(
  group = rep(c("Athlete", "Non-athlete"), each = 5),
  reaction_time = c(510, 495, 500, 505, 490,
                    570, 580, 590, 575, 585)
)

# View the df
reaction_time_df

# Perform an independent samples t-test
t.test(reaction_time ~ group,
       data = reaction_time_df,
       var.equal = FALSE)


# ----------------------------------------------------


# 3. Paired-samples t-test

# Create a data frame
depression_df <- data.frame(
  id = 1:10,
  pre_depression  = c(25, 30, 28, 32, 26, 31, 29, 27, 33, 30),
  post_depression = c(20, 24, 22, 25, 21, 23, 24, 20, 26, 25)
)

# View the df
depression_df

# Perform a paired samples t-test
t.test(x = depression_df$pre_depression,
       y = depression_df$post_depression,
       paired = TRUE)