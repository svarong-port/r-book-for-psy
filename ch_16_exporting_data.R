# Exporting data


# Set seed for reproducibility
set.seed(42)

# Create a data frame
survey_df <- data.frame(
  id = 1:30,
  gender = sample(c("Female", "Male"), 30, replace = TRUE),
  autonomy = round(rnorm(30, mean = 20, sd = 2)),
  life_satisfaction = round(rnorm(30, mean = 15, sd = 2))
)

# View the df
survey_df


# --------------------------------------------------


# 1. Export as CSV
write.csv(survey_df,
          "survey_data.csv",
          row.names = FALSE)


# --------------------------------------------------


# 2. Export as Excel

# Install writexl
install.packages("writexl")

# Load writexl
library(writexl)

# Export as Excel
write_xlsx(survey_df, "survey_data.xlsx")


# --------------------------------------------------


# 3. Export as SPSS


# Load haven
library(haven)

# Export as .sav
write_sav(survey_df, "survey_data.sav")


# --------------------------------------------------


# 4. Export plots

# Load ggplot2
library(ggplot2)

# Create a plot
ggplot(survey_df,
       aes(x = autonomy, y = life_satisfaction, color = gender)) +
  geom_point(size = 2.5) +
  labs(title = "Relationship Between Autonomoy and Life Satisfaction",
       x = "Autonomy",
       y = "Life Satisfaction",
       legend = "Gender") +
  theme_bw()