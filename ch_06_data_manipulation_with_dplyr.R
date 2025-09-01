# Data manipulation with dplyr


# Create a data frame
df <- data.frame(
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
df


# -------------------------------------------------


# Select
df |> select(name, stress_level)


# -------------------------------------------------


# Filter
df |> filter(stress_level == "High")

df |> filter(gender == "M" & stress_score > 5)


# -------------------------------------------------


# Arrange
df |> arrange(desc(stress_score))


# -------------------------------------------------


# Summarise
df |>
  summarise(mean_stress = mean(stress_score),
            mean_exam = mean(exam_score))

# Summarise
df |>
  
  # Group by gender
  group_by(gender) |>
  
  # Calculate mean
  summarise(mean_stress = mean(stress_score),
            mean_exam = mean(exam_score)) |>
  
  # Ungroup data
  ungroup()


# Mutate
df |>
  mutate(grade = case_when(
    exam_score >= 90 ~ "A",
    exam_score >= 80 ~ "B",
    exam_score >= 70 ~ "C",
    exam_score >= 60 ~ "D",
    TRUE ~ "F"
  ))


# -------------------------------------------------


# Together 1
df |>
  
  # Group by stress level
  group_by(stress_level) |>
  
  # Calculate mean exam scores
  summarise(mean_exam = mean(exam_score)) |>
  
  # Sort by mean, descending
  arrange(desc(mean_exam))


# Together 2
df |>
  
  # Filter for high stress level and exam score below mean
  filter(stress_level == "High" & 
           exam_score < mean(exam_score)) |>
  
  # Select only relevant columns
  select(name, gender, stress_score, exam_score) |>
  
  # Sort by stress score, descending
  arrange(desc(stress_score)) 


# Together 3
df |>
  
  # Create a performance index from exam and stress scores
  mutate(performance_index = exam_score / stress_score) |>
  
  # Select only relevant columns
  select(name, stress_level, performance_index) |>
  
  # Sort by performance index, descending
  arrange(desc(performance_index))
