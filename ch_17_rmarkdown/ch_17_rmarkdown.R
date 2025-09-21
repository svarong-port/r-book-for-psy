# R Markdown (code for code chunks)

# Load packages
library(readr)
library(dplyr)
library(ggplot2)


# Load the dataset
extraversion_df <- read_csv("Extrovert vs. Introvert Behavior Data.csv")

# View the dataset structure
glimpse(extraversion_df)


# Select independent and dependent variables
time_alone_df <- extraversion_df |>
  select(Personality, Time_spent_Alone)

# View the result
head(time_alone_df)


# Perform an independent-samples t-test
t.test(Time_spent_Alone ~ Personality,
       data = time_alone_df,
       var.equal = FALSE)


# Plot the difference
time_alone_df |>
  
  # Group by personality
  group_by(Personality) |>
  
  # Calculate mean time spent alone
  summarise(mean_time_alone = mean(Time_spent_Alone)) |>
  
  # Ungroup
  ungroup() |>
  
  # Create a bar plot
  ggplot(aes(x = Personality,
             y = mean_time_alone,
             fill = Personality)) +
  geom_col() +
  theme_bw() +
  labs(title = "Time Alone by Personality (Extraversion vs Introversion)",
       x = "Personality",
       y = "Average Time Alone (Hours/Day)")