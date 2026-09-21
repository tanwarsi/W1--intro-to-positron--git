#--------------------------------------------------
# Week 1: In-class assignment
#--------------------------------------------------

# There is no one correct way to write the code to answer the questions
# But your code needs to 
# a. answer the question
# b. be fully reproducible

# For this assignment, we will use 
# the `yrbss` data 
# in the `openintro` package 

install.packages("openintro")
library(openintro)
#hello

# Other useful packages
install.packages("tidyverse")
library(tidyverse)

# Read the documentation for `yrbss` to learn about all the variables.
?yrbss

# The code below uses the `flextable` package to create a table of summary characteristics of
# Grade and Gender
# Modify the code below such that the grade shows in increasing order
# and all category labels start with a capital letter
#change2

install.packages("flextable")
library(flextable)


yrbss$gender[yrbss$gender == "female"] <- "Female"
yrbss$gender[yrbss$gender == "male"] <- "Male"
yrbss$grade[yrbss$grade == "other"] <- "Other"

yrbss$grade <- factor(
  yrbss$grade,
  levels = c("9", "10", "11", "12", "Other", "Missing")
)


yrbss$Grade <- yrbss$grade
yrbss$Gender <- yrbss$gender

z <- summarizor(
  yrbss[c("Grade", "Gender")],
  overall_label = NULL,
)
z
ft_1 <- as_flextable(z, groups_arrange= TRUE) 
ft_1







# To understand the pattern of physical activity by grade and gender,
# 1) aggregate  `physically_active_7d` by calculating its mean within each grade and gender
# 2) create a plot showing the average number of physically active days
#      x-axis: grade
#      y-axis: Mean of `physcially_active_7d`
#      Distinguish gender using different colors, symbols, or lines
# *** I would use the following functions: aggregate(), ggplot(), geom_line() but there is 
# no one correct way to do this
# Ensure that the figure is clearly labeled and includes an appropriate legend

ag_yrbss
ag_yrbss<- aggregate(physically_active_7d ~ Grade + Gender, data = yrbss, FUN = mean)
ggplot(ag_yrbss, aes(x=Grade, y= physically_active_7d), color = Gender) + 
  geom_line(show.legend = TRUE) +
  labs(
    title = "Physical activity by Grade and Gender",
  )


aggregate( |>
  ggplot(aes(xxx)) + 
  geom_line()
...


# Create a plot that shows the relationship betwen physical activity and bmi
# among female students in grade 12 
# Ensure that the figure is clearly labeled and includes an appropriate legend
yrbss<-
yrbss2 <- mutate(yrbss, BMI = height/weight)
yrbss2 <- filter(yrbss2, gender== "Female", grade==12)


ggplot(ag_yrbss, aes(x=Grade, y= physically_active_7d), color = Gender) + 
  geom_line(show.legend = TRUE) +
  labs(
    title = "Physical activity by Grade and Gender",
  )

# Push your completed code to your GitHub repository
