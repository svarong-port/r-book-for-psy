# Working with data frame: Indexing and subsetting


# Create a data frame
df <- data.frame(
  name = c("Alex", "Bella", "Chris", "Diana", "Ethan", "Fiona", "Greg", "Helen", "Ian", "Jane"),
  gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"),
  extraversion = c(8, 9, 4, 7, 2, 6, 5, 8, 3, 9),
  neuroticism = c(3, 5, 7, 4, 8, 2, 6, 3, 9, 1),
  psychoticism = c(2, 1, 6, 3, 9, 1, 4, 2, 7, 0)
)

# View the df
df


# -------------------------------------


# Select name with $
df$name

# Select name with [[]]
df[["name"]]


# -------------------------------------


# Select row 5
df[5, ]

# Select column psychoticism
df[, "psychoticism"]

# Select row 5 and column psychoticism
df[5, "psychoticism"]


# -------------------------------------


# Select rows 1–5
df[1:5, ]

# Select columns gender and extraversion
df[, c("gender", "extraversion")]

# Select rows 1–5, columns gender and extraversion
df[1:5, c("gender", "extraversion")]
