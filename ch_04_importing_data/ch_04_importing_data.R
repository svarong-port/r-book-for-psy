# Importing data


# CSV example content:
# id,name,gender,response_time_ms
# 1,Alex,M,545
# 2,Sarah,F,480
# 3,Michael,M,612
# 4,Jessica,F,510
# 5,David,M,555
# 6,Emily,F,530
# 7,Chris,M,580
# 8,Olivia,F,505
# 9,Daniel,M,590
# 10,Mia,F,525


# ---------------------------------------------


# 1. Importing CSV

# Base R: read.csv()
df1 <- read.csv("response_time.csv")

# read_csv() from readr package
df2 <- read_csv("response_time.csv")


# ---------------------------------------------


# 2. Importing Excel

# read_excel() from readxl package
df <- read_excel("response_time.xls")


# ---------------------------------------------


# 3. Importing SPSS

# read_sav() from haven package
df <- read_sav("response_time.sav")


# ---------------------------------------------


# 4. Exploring data

# Import from CSV
response_time_df <- read.csv("response_time.csv")

# View the first 6 rows
head(response_time_df)

# Import from CSV
response_time_df <- read.csv("response_time.csv")

# View the last 6 rows
tail(response_time_df)

# Import from CSV
response_time_df <- read.csv("response_time.csv")

# View the structure
str(response_time_df)

# Import from CSV
response_time_df <- read.csv("response_time.csv")

# View the summary
summary(response_time_df)

# dim()
dim(response_time_df)

# nrow()
nrow(response_time_df)

# ncol()
ncol(response_time_df)