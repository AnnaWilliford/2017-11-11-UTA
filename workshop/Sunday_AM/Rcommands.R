#WRITE YOUR CODE HERE - text editor

# TASK: Use setwd() function to navigate  to
# `SoftwareCarpentry_Spr16` folder.

#File system navigation
getwd()
setwd("C:/Users/Anna/Dropbox/Public/SoftwareCarpentry_Spr16/")
dir.create("Sunday_AM/")
setwd("Sunday_AM/")
dir.create("data")

#Variables
cost <- 34
#`alt` + `-`
cost2 <- cost +34
cost2 <- cost2+2

cost2 <- 45
#names: meaningful, no spaces, do not start with numbers


### **Challenge 1.2**  Learn how to assign values to
### variables 

# TASK: What will be the value of each  variable  after each 
# statement in the following code?

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
##############################################

# environment
ls()
rm("cost2")
ls()
rm(cost2)
ls()
rm(list=ls())
# function help
?ls
help(ls)
help(setwd)
args(setwd)
args(read.csv)
#where do functions come from?
# R packages: collection of functions (>7000)
install.packages("knitr")
library(knitr)
knit()

#R legos
# bash lesson:
# open git bash, navigate to data folder om Sunday_AM
# when in data, download file:
# curl -O command

##smallest lego pieces R

age <- 45
length(age)
length(age)
str(age)

# common data types:
#numeric: double, ineger
#character
#logical
#complex
#...

score <- 79
typeof(score)
is.integer(score)
typeof(is.integer(score))

### **Challenge 2.1**  Learn how to read the output
### of nested help functions


# TASK: Break the following expression into multiple single
# function calls. You will need to assign the output
# of each function to a variable that will serve as
# input(argument) for a next function.
# What is the value of each variable? What does each function do?
# Assign: `score<-79`

is.logical(is.numeric(typeof(is.integer(score))))

# coersion of data types
age <- as.integer(age)
typeof(age)

name <- "sasha"
typeof(name)
name <- as.integer(name)

#complex structures

#vector : same type
v <- c(2,5,78)
v1<- c(1:3, 56)
v2 <- seq(20, 100, by=0.5)

# examine them

typeof(v)
v<-as.integer(v)
str(v)

# matrices: 2D vector: same data type
m <- matrix(18, 3, 6)
m
#play with  it

# factor: special vector used to represent categorical data
f <- factor(c("M", "M", "F", "M"))
str(f)
typeof(f)

# list: elements of different types
### **Challenge 2.2**  Learn how to construct lists

# TASK: Try to create a list named `myOrder` that contains
# the following data structures as list elements:

# *** Element 1 is a character vector of length 4 that
# lists the menu items you ordered from the restaurant:
# chicken, soup, salad, tea.

# *** Element 2 is a factor that describes menu items as
# "liquid" or "solid".

# *** Element 3 is a vector that records the cost of each
# menu item: 4.99, 2.99, 3.29, 1.89.

menuItems<-c("chicken", "soup", "salad", "tea")
menuType<-factor(c("solid", "liquid", "solid", "liquid"))
menuCost<-c(4.99, 2.99, 3.29, 1.89)

myOrder<-list(menuItems, menuType, menuCost)

#given the above ...
myOrder<-data.frame(menuItems, menuType, menuCost)
myOrder<-list(menuItems, menuType, menuCost)
myOrder_df <- data.frame(menuItems, menuType, menuCost)
str(myOrder)
str(myOrder_df)

#subsetting
#1. By position index :
v<-c(2:20)
v
v[2]
v[1:4]
v[c(1:5, 67)]
myOrder[[1]]
#2d-structures (matrices + data frames) - suply [row, col]
myOrder_df
# By name:
myOrder_df$menuCost
#3 By logical vector index

myOrder_df[myOrder_df$menuType=="solid", ]
myOrder_df$menuType=="solid"

myOrder_df[myOrder_df["menuType"]=="solid", ]
myOrder_df$menuType
myOrder_df["menuType"]
typeof(myOrder_df["menuType"])
myOrder_df["menuType"]
myOrder_df["menuType"]=="solid"
myOrder_df
