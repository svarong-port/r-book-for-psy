# Chi-square tests


# 1. Goodness of fit

# Create a data frame
die_df <- data.frame(
  die_roll = 1:6,
  observed_counts = c(8, 9, 6, 10, 9, 7),
  expected_counts = rep(10, 6)
)

# View the df
die_df

# Perform a test of goodness of fit
chisq.test(x = die_df$observed_counts,
           p = die_df$expected_counts / sum(die_df$expected_counts))


# ------------------


# 2. Test of independence

# Create a data frame
students_df <- data.frame(
  gender = c(rep("Boy", 2), rep("Girl", 2)),
  subject = c("Math", "Science", "Math", "Science"),
  observed_counts = c(15, 12, 20, 31)
  )

# View the df
students_df

# Create a contigency table
con_table <- xtabs(
  observed_counts ~ gender + subject,
  data = students_df
)

# View the table
con_table

# Perform a test of independence
chisq.test(con_table)