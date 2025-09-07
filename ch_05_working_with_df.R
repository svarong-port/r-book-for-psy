# Working with data frame: Indexing and subsetting


# Create a data frame
personality_df <- data.frame(
  name = c("Alex", "Bella", "Chris", "Diana", "Ethan", "Fiona", "Greg", "Helen", "Ian", "Jane"),
  gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"),
  extraversion = c(8, 9, 4, 7, 2, 6, 5, 8, 3, 9),
  neuroticism = c(3, 5, 7, 4, 8, 2, 6, 3, 9, 1),
  psychoticism = c(2, 1, 6, 3, 9, 1, 4, 2, 7, 0)
)

# View the df
personality_df


# -------------------------------------


# 1. Indexing

# Select name with $
personality_df$name

# Select name with [[]]
personality_df[["name"]]


# -------------------------------------


# Select row 5
personality_df[5, ]

# Select column psychoticism
personality_df[, "psychoticism"]

# Select row 5 and column psychoticism
personality_df[5, "psychoticism"]


# -------------------------------------


# 2. Subsetting

# Select rows 1–5
personality_df[1:5, ]

# Select columns gender and extraversion
personality_df[, c("gender", "extraversion")]

# Select rows 1–5, columns gender and extraversion
personality_df[1:5, c("gender", "extraversion")]


# -------------------------------------


# 3. Filtering

# 3. Filtering

# Filter for female participants
personality_df[personality_df$gender == "Female", ]

# Filter for female participants with neuroticism greater than or equal to 3
personality_df[personality_df$gender == "Female" & 
                 personality_df$neuroticism >= 3, ]