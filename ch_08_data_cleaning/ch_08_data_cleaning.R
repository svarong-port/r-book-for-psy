# Data cleaning


# 1. Wrong data types

# Create a data frame
df1 <- data.frame(
  id = 1:5,
  gender = c("F", "M", "M", "F", "F"),
  positive_affect = c("5", "3", "4", "2", "1"),
  negative_affect = c("4", "2", "5", "3", "2")
)

# View the structure
str(df1)

# Load dplyr
library(dplyr)

# Fix the data types
df1 <- df1 |>
  mutate(
    
    # Convert gender: character -> factor
    gender = as.factor(gender),
    
    # Convert positive_affect and negative_affect: character -> numeric
    across(c(positive_affect, negative_affect), as.numeric)
  )

# View the result
str(df1)


# -------------------------------------------------


# 2. Missing values

# Create a data frame
df2 <- data.frame(
  id = 1:10,
  words_recalled = c(12, 11, 15, 10, NA, 14, 13, 11, NA, 16),
  trial_time = c(NA, 50, NA, 42, NA, NA, 46, NA, 44, 49)
)

# View the df
df2

# Calculate the mean of words_recalled
mean(df2$words_recalled)

# Check for NA by column
is.na(df2) |> colSums()

# Check for NA overall
is.na(df2) |> sum()

# Drop rows
df2_clean <- na.omit(df2)

# View the result
df2_clean

# Drop columns
df2$trial_time <- NULL

# View the result
df2

# Replace

# Install tidyr
install.packages("tidyr")

# Load tidyr
library(tidyr)

# Calculate the mean
mean_words <- mean(df2$words_recalled, na.rm = TRUE)

# Replace NA with mean
df2_cleaned <- df2 |>
  mutate(
    words_recalled = replace_na(words_recalled, mean_words)
  )

# View the result
df2_cleaned


# -------------------------------------------------


# 3. Duplicates

# Create a data frame
df3 <- data.frame(
  name = c("Anna", "Ben", "Chai", "Chai", "Dana", "Eli"),
  extraversion = c(4, 3, 2, 2, 5, 4),
  conscientiousness = c(3, 4, 2, 2, 5, 3)
)

# View the df
df3

# Check for duplicates
duplicated(df3) |> sum()

# Remove duplicates
df3_clean <- distinct(df3)

# View the result
df3_clean


# -------------------------------------------------


# 4. Outliers

# Group without outlier
weights_normal <- c(60, 62, 65, 66, 68, 70, 72, 75)

# Group with outlier
weights_outlier <- c(60, 62, 65, 66, 68, 70, 72, 75, 200)

# Calculate the means
paste0("Mean (no outliers): ", mean(weights_normal))
paste0("Mean (with outliers): ", mean(weights_outlier))


# Create a data frame with 10 rows
df4 <- data.frame(
  id = 1:10,
  reaction_time = c(560, 610, 590, 580, 605, 620, 575, 1200, 1500, 585) # outlier: 1200, 1500
)

# Load ggplot2
library(ggplot2)

# Create a box plot
ggplot(df4, aes(y = reaction_time)) +
  geom_boxplot(color = "red") +
  theme_minimal()


# Calculate Q1 and Q3
q1 <- quantile(df4$reaction_time, 0.25)
q3 <- quantile(df4$reaction_time, 0.75)

# Calculate IQR
iqr <- q3 - q1

# Calculate lower and upper bounds
lower_bound <- q1 - (iqr * 1.5)
upper_bound <- q3 + (iqr * 1.5)

# Filter out outliers
df4_cleaned <- df4[df4$reaction_time >= lower_bound &
                     df4$reaction_time <= upper_bound, ]

# View the result
df4_cleaned


# -------------------------------------------------


# 5. Reverse-scoring

# Create a data frame
df5 <- data.frame(
  id = 1:5,
  i_hate_myself = c(4, 5, 3, 2, 4),
  i_love_myself = c(2, 1, 3, 5, 4)
)

# View the df
df5

# Reverse-score
df5_reversed <- df5 |> 
  mutate(i_hate_myself = (5 + 1) - i_hate_myself)

# View the result
df5_reversed