# Data manipulation with dplyr


# Install dplyr
install.packages("dplyr")

# Load dplyr
library(dplyr)


# Pipe operator examples

# Calculate mean of 1:10
mean(1:10)

# Calculate mean of 1:10
1:10 |> mean()

# Calculate mean of 1:10 (round to 0)
round(mean(1:10), 0)

# Calculate mean of 1:10 (round to 0)
1:10 |>
  mean() |>
  round(0)


# ---------------------------------------------------


# Create a data frame
students_df <- data.frame(
  name = c("Anna", "Ben", "Chai", "Dana", "Eli",
           "Fah", "Gina", "Hiro", "Ivan", "Jin"),
  gender = c("F", "M", "M", "F", "M",
             "F", "F", "M", "M", "M"),
  stress_level = c("Medium", "Medium", "High", "Medium", "Low",
                   "High", "Low", "Medium", "Medium", "High"),
  stress_score = c(7, 5, 8, 6, 4,
                   9, 3, 6, 5, 7),
  exam_score = c(78, 85, 72, 80, 88,
                 68, 90, 82, 79, 74)
)

# View the df
students_df


# ---------------------------------------------------


# 1. select()

# Select name and stress_level
students_df |> select(name, stress_level)


# ---------------------------------------------------


# 2. filter()

# Filter for stress_level is "High"
students_df |> filter(stress_level == "High")


# Filter for males with stress_score greater than 5
students_df |> filter(gender == "M" & stress_score > 5)


# ---------------------------------------------------


# 3. arrange()

# Sort by stress_score
students_df |> arrange(stress_score)


# Sort by stress_score (descending)
students_df |> arrange(desc(stress_score))


# ---------------------------------------------------


# 4. summarise()

# Summarise mean for stress_score and exam_score
students_df |>
  summarise(mean_stress = mean(stress_score),
            mean_exam = mean(exam_score))


# Summarise mean for stress_score and exam_score by gender
students_df |>
  
  # Group by gender
  group_by(gender) |>
  
  # Calculate means
  summarise(mean_stress = mean(stress_score),
            mean_exam = mean(exam_score))


# ---------------------------------------------------


# 5. mutate()

# Create column grade
students_df |>
  mutate(grade = case_when(
    exam_score >= 90 ~ "A",
    exam_score >= 80 ~ "B",
    exam_score >= 70 ~ "C",
    exam_score >= 60 ~ "D",
    TRUE ~ "F"
  ))


# ---------------------------------------------------


# 6. Put It All Together

# dplyr verbs together 1
students_df |>
  
  # Group by stress level
  group_by(stress_level) |>
  
  # Calculate mean exam scores
  summarise(mean_exam = mean(exam_score)) |>
  
  # Sort by mean, descending
  arrange(desc(mean_exam))


# dplyr verbs together 2
students_df |>
  
  # Filter for high stress level and exam score below mean
  filter(stress_level == "High" & exam_score < mean(exam_score)) |>
  
  # Select only relevant columns
  select(name, gender, stress_score, exam_score) |>
  
  # Sort by stress score, descending
  arrange(desc(stress_score))


# dplyr verbs together 3
students_df |>
  
  # Create a performance index from exam and stress scores
  mutate(performance_index = exam_score / stress_score) |>
  
  # Select only relevant columns
  select(name, stress_level, performance_index) |>
  
  # Sort by performance index, descending
  arrange(desc(performance_index))