# Basic R


# 1. Variables
my_name <- "Shi"

# Allowance and expense
allowance <- 500
expense <- 200

# Calculate remaining balance
allowance - expense

# Calculate remaining balance and store in variable
remaining <- allowance - expense
remaining


# -----------------------------------------------------


# 2. Data types

# Create a variable
my_name <- "Shi"

# Check the data type
class(my_name)


# -----------------------------------------------------


# 3. Data structures

# (1) Vector

# Numeric vector
num_vec <- 1:10

# Character vector
char_vec <- c("Shi", "Todd", "Jim", "Adrian")

# Logical vector
log_vec <- c(TRUE, FALSE, TRUE, TRUE)


# (2) Factor

# Vector of stress levels
stress <- c("High", "Low", "Medium", "Medium", "Low", "High")

# Convert to a factor
factor_stress <- factor(stress)

# View the result
factor_stress

# Order factor levels
factor_stress <- factor(stress,
                        levels = c("Low", "Medium", "High")) # Set levels

# View the result
factor_stress


# (3) Data frame

# Create a data frame
scores <- data.frame(
  name = c("Todd", "Jim", "Adrian"),
  happiness_score = c(62, 71, 85),
  is_extrovert = c(FALSE, TRUE, TRUE)
)

# View the result
scores


# -----------------------------------------------------


# 4. Functions

# Example of manual sum
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10

# Use a function
sum(1:10)


# (1) Base R functions

# Create a vector storing neuroticism scores
neuroticism_score <- c(7, 9, 6, 8, 10)

# Calculate mean neuroticism
mean(neuroticism_score)


# (2) Package functions

# Install a package
install.packages("readr")

# Load a package
library(readr)

# Use a function from the package
read_csv("my_data.csv")


# (3) Custom functions
name <- function(arguments) {
  body
}

# Example: calculate area
calculate_area <- function(length, width) {
  area <- length * width
  return(area)
}

# Call the function
calculate_area(12, 25)


# (4) Help with functions
?sum