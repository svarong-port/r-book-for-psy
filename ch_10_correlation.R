# Correlation

# Set seed for reproducibility
set.seed(42)

# Create a data frame
exam_df <- data.frame(
  
  # Student ID
  id = 1:30,
  
  # Conscientiousness
  conscientiousness = round(rnorm(30, mean = 50, sd = 10)),
  
  # Intelligence (IQ)
  iq = round(rnorm(30, mean = 100, sd = 15)),
  
  # Exam score
  exam_score = round(rnorm(30, mean = 70, sd = 20))
)

# View the first 6 rows
head(exam_df)


# ----------------------------------------------------


# 1. cor()

# Create a correlation matrix with cor()
cor(exam_df, method = "pearson") |> round(2)


# ----------------------------------------------------


# 2. cor.test()

# Compute Pearson's r for iq and exam_score
cor.test(exam_df$iq,
         exam_df$exam_score,
         method = "pearson")


# ----------------------------------------------------


# 3. corr.test()

# Install psych
install.packages("psych")

# Load psych
library(psych)

# Create a correlation matrix with corr.test()
corr.test(exam_df, method = "pearson")