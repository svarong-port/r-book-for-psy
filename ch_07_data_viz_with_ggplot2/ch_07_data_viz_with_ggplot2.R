# Data visualisation with ggplot2


# Install ggplot2
install.packages("ggplot2")

# Load ggplot2
library(ggplot2)

# Load mpg dataset
data(mpg)

# View the data structure
str(mpg)


# ------------------------------------------------


# 1. Histogram

# Histogram 1
ggplot(mpg, aes(x = hwy)) +
  geom_histogram()

# Histogram 2
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 10)


# ------------------------------------------------


# 2. Box plot

# Box plot 1
ggplot(mpg, aes(y = hwy)) +
  geom_boxplot()

# Box plot 2
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()


# ------------------------------------------------


# 3. Scatter plot

# Scatter plot 1
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

# Scatter plot 2
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() + 
  geom_smooth()


# ------------------------------------------------


# 4. Line plot

# Line plot 1
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_line()

# Line plot 2

# Load dplyr
library(dplyr)

# Summarise the data
hwy_by_cyl <- mpg |>
  group_by(cyl) |>
  summarise(avg_hwy = mean(hwy))

# Create a line plot
ggplot(hwy_by_cyl, aes(x = cyl, y = avg_hwy)) +
  geom_line()


# Create a line plot with points
ggplot(hwy_by_cyl, aes(x = cyl, y = avg_hwy)) +
  geom_line() +
  geom_point()


# ------------------------------------------------


# 5. Bar plot

# Bar plot 1

# Summarise the data and create a bar plot
mpg |>
  group_by(class) |>
  summarise(avg_hwy = mean(hwy, na.rm = TRUE)) |>
  ggplot(aes(x = class, y = avg_hwy)) +
  geom_col()


# ------------------------------------------------


# Customise with aes() and geom_*()

# Using color in aes()
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point()

# Using color in geom_*()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "orange")


# ------------------------------------------------


# Theme

# Set theme to black and white
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  theme_bw()


# Install jtools
install.packages("jtools")

# Load jtools
library(jtools)

# Set theme to apa
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  theme_apa()


# ------------------------------------------------


# Adding labels
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  theme_bw() +
  labs(title = "Fuel Efficiency by Engine Size and Drive Type",
       x = "Engine Displacement (Liters)",
       y = "Highway Miles Per Gallon (MPG)",
       color = "Drive Type")


# ------------------------------------------------


# Facetting

# Using facet_wrap()
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  theme_bw() +
  facet_wrap(~ drv)

# Using facet_grid()
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  theme_bw() +
  facet_grid(cyl ~ drv)