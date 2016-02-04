
### **Challenge 1.1**  Learn how to pass arguments
### to function

# TASK: Use setwd() function to navigate  to
# `Sunday_AM` folder.








#############################
### **Challenge 1.1: Answer**
setwd("Sunday_AM") 

####################################################

### **Challenge 1.2**  Learn how to assign values to
### variables 

# TASK: What will be the value of each  variable  after each 
# statement in the following code?

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20







#############################
### **Challenge 1.2: Answer**

mass = 109.25
age = 102

####################################################

### **Challenge 2.1**  Learn how to read the output
### of nested help functions

# TASK: Break the following expression into multiple single
# function calls. You will need to assign the output
# of each function to a variable that will serve as
# input(argument) for a next function.
# What is the value of each variable? What does each function do?
# Assign: `score<-79`

is.logical(is.numeric(typeof(is.integer(score))))

#############################
### **Challenge 2.1: Answer**
score <- 79
step1 <- is.integer(score)
step2 <- typeof(step1)
step3 <- is.numeric(step2)
step4 <- is.logical(step3)

####################################################

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

# *Hint: Define your elements first, then create a list
# with them.






#############################
### **Challenge 2.2: Answer**

menuItems<-c("chicken", "soup", "salad", "tea")
menuType<-factor(c("solid", "liquid", "solid", "liquid"))
menuCost<-c(4.99, 2.99, 3.29, 1.89)

myOrder<-list(menuItems, menuType, menuCost)

####################################################

### **Challenge 4.1** Learn how to read data tables into R

# TASK: Use help functions to read about read.table `?read.table()`
# or `args(read.table)` and use it load file into R.
# It might be helpful to compare `args(read.csv)` and `args(read.table)`.

# Look at `dim(myData)` output after each try. Is it different? Why?






#############################
### **Challenge 4.1: Answer**

myData<-read.table("gapminderData.csv", header=TRUE, sep = ",")
####################################################

### **Challenge 4.2**
###################################################
# Answer the following questions about myData object
# 1. Overall object structure? what function will you use?
# 2. Can you tell what is the data type of elements in each cloumn?
# 3. Can you extract 3rd and 5th column of the dataset?
# 4. Can you extract the list of countries in this dataset
# 5. Can you get a part of this dataset that includes information about Sweden?
# 6. Can you extract all countries for which life expectancy is below 70?
# 7. Can you make a new column that contains population in units of millions of people?

#############  Answers #######
#1
str()
#2
typeof()
#3
myData[ , c(3,5)]
#4
names(table(myData$country))
#5
myData[myData$country=="Sweden", ]
#6
myData[myData$lifeExp<70, ]
#7
myData$PopM<-myData$pop/10^6