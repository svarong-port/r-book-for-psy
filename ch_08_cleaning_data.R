# Cleaning data in R

# 1. Wrong data types

# df
df1 <- data.frame(
  id = 1:5,
  gender = c("F", "M", "M", "F", "F"),
  positive_afffect = c("5", "3", "4", "2", "1"),
  negative_affect = c("4", "2", "5", "3", "2")
)

# View structure
str(df1)

# Clean data types
df1$gender <- as.factor(df1$gender)

df1[c("positive_afffect", "negative_affect")] <- lapply(df1[c("positive_afffect", "negative_affect")], as.numeric)

# View df
str(df1)


# -------------------------------------------------


# 2. Missing values

# df
df2 <- data.frame(
  id = 1:6,
  words_recalled = c(12, NA, 15, 10, NA, 14),
  trial_time = c(45, 50, NA, 42, 48, 47)
)

# Check for NA
colSums(is.na(df2))

# Fix 1: drop rows
df2_clean <- na.omit(df2)

df2_clean

# Fix 2: drop columns
df2$words_recalled <- NULL

df2

# Impute

# Calculate means
mean_words <- mean(df2$words_recalled, na.rm = TRUE)
mean_time <- mean(df2$trial_time, na.rm = TRUE)

# Impute
df2_cleaned <- df2 |>
  mutate(
    words_recalled = replace_na(words_recalled, mean_words),
    trial_time = replace_na(trial_time, mean_time)
  )

df2_cleaned


# -------------------------------------------------


# 3. Duplicates

# Create a data frame
df3 <- data.frame(
  name = c("Anna", "Ben", "Chai", "Chai", "Dana", "Eli"),
  extraversion = c(4, 3, 2, 2, 5, 4),
  conscientiousness = c(3, 4, 2, 2, 5, 3)
)

# Check for duplicates
sum(duplicated(df3))

# Remove duplicates
df3_clean <- distinct(df3)

df3_clean


# -------------------------------------------------


# 4. Out of range

# df
df4 <- data.frame(
  id = 1:6,
  life_satisfaction = c(5, 4, 0, 2, 2, 8)
)

table(df4$life_satisfaction)

# Drop rows
df4_cleaned <- df4 |> 
  filter(life_satisfaction >= 1 & life_satisfaction <= 5)

df4_cleaned

# Replace with NA
df4_clean <- df4 |>
  mutate(life_satisfaction = ifelse(
    life_satisfaction < 1 | life_satisfaction > 5,
    NA,
    life_satisfaction
  ))

df4_clean

# Replace with range limits
df4_cleaned <- df4 |>
  mutate(life_satisfaction = case_when(
    life_satisfaction < 1 ~ 1,
    life_satisfaction > 5 ~ 2,
    TRUE ~ life_satisfaction
  ))

df4_cleaned


# -------------------------------------------------


# 5. Outliers

# df
df5 <- data.frame(
  id = 1:8,
  reaction_time = c(560, 610, 590, 580, 605, 620, 575, 9000) # outlier: 9000
)

# View the result
df5

# Calculate mean
mean(df5$reaction_time)

# Box plot
ggplot(df5, aes(y = reaction_time)) +
  geom_boxplot(color = "blue")

# summary
summary(df5)


# Calculate IQR
iqr <- IQR(df5$reaction_time)

# Calculate Q1 and Q3
q1 <- quantile(df5$reaction_time, 0.25)
q3 <- quantile(df5$reaction_time, 0.75)

# Calculate IQR
iqr = q3 - q1

# Calculate lower and upper bounds
lower <- q1 - (iqr * 1.5)
upper <- q3 + (iqr * 1.5)

# Filter out outliers
df5_cleaned <- df5 |>
  filter(reaction_time >= lower & reaction_time <= upper)

df5_cleaned


# -------------------------------------------------


# 6. Inconsistent format

# df
df6 <- data.frame(
  id = 1:6,
  gender = c("Male", "M", "male", "F", "Female", "f")
)

df6

# Plot
ggplot(df6, aes(x = gender, fill = gender)) +
  geom_bar()

# Check for
unique(df6$gender)

library(dplyr)

df6 <- data.frame(
  id = 1:6,
  gender = c("Male", "M", "male", "F", "Female", "f")
)

# Fix inconsistencies using case_when()
df6_cleaned <- df6 |>
  mutate(gender = case_when(
    gender %in% c("Male", "M", "male") ~ "Male",
    gender %in% c("Female", "F", "f") ~ "Female",
    TRUE ~ gender
  ))

df6_cleaned


# Create a bar plot
ggplot(df6_cleaned, aes(x = gender, fill = gender)) +
  geom_bar()


# -------------------------------------------------


# 7. Reverse-scoring
df7 <- data.frame(
  id = 1:5,
  i_hate_myself = c(4, 5, 3, 2, 4),
  i_love_myself = c(2, 1, 3, 5, 4)
)

# Reverse-score
df7_reversed <- df7 |> 
  mutate(i_hate_myself = (5 + 1) - i_hate_myself)

# View the result
df7_reversed
