# t-tests


# 1. One-sample t-test (Extraversion scores)

# Create a data frame
df1 <- data.frame(
  id = 1:10,
  extraversion = c(4, 5, 3, 4, 2, 5, 4, 3, 4, 5)
)

# View the df
df1

# Perform a one sample t-test
t.test(df1$extraversion,
       mu = 3)


# ----------------------------------------------------


# 2. Independent-samples t-test

# Create a data frame
df2 <- data.frame(
  group = rep(c("Athlete", "Non-athlete"), each = 5),
  reaction_time = c(510, 495, 500, 505, 490,
                    570, 580, 590, 575, 585)
)

# View the df
df2

# Perform an independent samples t-test
t.test(reaction_time ~ group,
       data = df2,
       var.equal = TRUE)


# ----------------------------------------------------


# 3. Paired-samples t-test (Depression pre vs post therapy)

# Create a data frame
df3 <- data.frame(
  id = 1:10,
  pre_depression  = c(25, 30, 28, 32, 26, 31, 29, 27, 33, 30),
  post_depression = c(20, 24, 22, 25, 21, 23, 24, 20, 26, 25)
)

# View the df
df3

# Perform a paired samples t-test
t.test(x = df3$pre_depression,
       y = df3$post_depression,
       paired = TRUE)
