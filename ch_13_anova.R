# ANOVA


# 1. One-way ANOVA

# Create a data frame
set.seed(42)

df1 <- data.frame(
  music = rep(c("Classic", "Jazz", "Rock"), each = 12),
  words_recalled = c(
    round(rnorm(12, mean = 18, sd = 3)), # Classic
    round(rnorm(12, mean = 22, sd = 3)), # Jazz
    round(rnorm(12, mean = 25, sd = 3)) # Rock
  )
)

# View the result
df1

# Perform a one-way ANOVA
ow_anova_results <- aov(words_recalled ~ as.factor(music),
                        data = df1)

# View the result
summary(ow_anova_results)



# ----------------------------------------------------------



# 2. Two-way ANOVA

# Set seed for reproducibility
set.seed(88)

# Define factors
music  <- rep(c("Classical", "Jazz", "Rock"), each = 20)   # 20 participants per music
gender <- rep(rep(c("Male", "Female"), each = 10), times = 3)

# Generate outcome
words_recalled <- c(
  round(rnorm(10, mean = 17, sd = 3)),  # Classical - Male
  round(rnorm(10, mean = 19, sd = 3)),  # Classical - Female
  round(rnorm(10, mean = 21, sd = 3)),  # Jazz - Male
  round(rnorm(10, mean = 23, sd = 3)),  # Jazz - Female
  round(rnorm(10, mean = 24, sd = 3)),  # Rock - Male
  round(rnorm(10, mean = 26, sd = 3))   # Rock - Female
)

# Combine factors and outcome into a dataframe
df2 <- data.frame(music, gender, words_recalled)

# View the result
df2

# Perform a two-way ANOVA
tw_anova_results <- aov(words_recalled ~ music * gender,
                        data = df2)

# View the result
summary(tw_anova_results)



# ----------------------------------------------------------



# 3. Perform a post-hoc test
TukeyHSD(ow_anova_results)
