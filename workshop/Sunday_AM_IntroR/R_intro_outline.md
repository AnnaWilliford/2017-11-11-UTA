---
title: "R_intro_outline"
author: "Anna Williford"
date: "January 28, 2016"
output: html_document
---

##Morning checklist

* Greetings
* Setup Etherpad: http://pad.software-carpentry.org/2016-01-30-UTA
* Workshop website: https://annawilliford.github.io/2016-01-30-UTA
* Links to add to etherpad
https://annawilliford.github.io/2016-01-30-UTA/data/gapminderData.csv

## 1. Intro to RStudio

* Why R <br>

* RStudio as interface for R(IDE)

* The 4 Windows of R studio

    * Navigation Commands
        * ...
        * Challenge 1.1
    * Command flow
        * ...
        * Go to Sunday_AM, save file "MyRcommands.R"
    * More on console
        * complete commands; `Esc` to return to `>`
        * output is not reusable
<br><br>
* Variables and Assignment
    * Challenge 1.2
<br><br>
* Manage environment

* Help functions for functions

* R packages


## 2. Data types and Data structures

###Data types

* Data types (5): age; age1; name; young

* Help functions to identify data types: is.integer()

* Together `score<-79` exercise - use nested help funcions

    *Challenge 2.1
    
* Functions to convert one data type into another. Not always possible: as.integer(name)

[Data types talk with challenge: 15 min]

###**Data Structures**

* Now is time for interesting things! Data types can be combined into bigger structures - Data Structures. But first let's take a look at the dataset we will be using this morning

* make sure you have `data` folder in Sunday_AM directory

* little bash practice lesson...open Git bash, navigate to `data` folder, then download file.
    * `curl -O https://annawilliford.github.io/2016-01-30-UTA/data/gapminderData.csv`
    * Open in Excel

* any ideas about how this kind of dataset can be represented in R?
* what would be simplest data structure? simplest way to combine the single-element objects? what is the simplest data structure with multiple elements?

* vectors: REFER TO gapminer dataset
    * elements of the same data type
    * how to create c()
    * let's make one: v<-c(1:3, 45)
        * examine: typeof(), str(); bash-like commands; tail(v,n=2), head(), length()
        * look at: tail(v,n=2), head(), length()
        * manipulate:
        
            * add element: v<-(v, 56)
            * name: names() 
            * vectorizaton: v1<-2*v; v2<-c(1:5); v3<-v+v2
            * coersion v4<-as.character(v1)

* matrices -- multidimensional vectors (skip)
    *create: matrix(c(1:18), 3,6)
    
* factors--categorical data -- refer to dataset
    * create: factor(c())
    * str(), typeof()
    * reorder
    
* list : generic vector -- reffer to data, record a row as a a list
    * different data types
    * create: list()
    * str(), typeof()
    * length()
    * **CHALLENGE**
    
    **Challenge 2.2**  Learn how to construct lists

```
Try to create a list named `myOrder` that contains the following data structures as list elements:

* Element 1 is a character vector of length 4 that lists the menu items you ordered from the restaurant
* Element 2 is a factor that describes menu items as "liquid" or "solid"
* Element 3 is a list that contains the address of the restaurant and the total dollar amount of your order

    *Hint: Define your elements first, than create a list with them.
```       
**Answer**
```
menuItems<-c("chicken", "soup", "salad", "tea")
menuType<-factor(c("solid", "liquid", "solid", "liquid"))
otherInfo<-list("Abram st", 12.56)

myOrder<-list(menuItems, menuType, otherInfo)
```

**Together** Ask to apply the following functions to the list they created

Veiw it
Examine: `length(myOrder)` - unexpected output?
`str(myOrder)
<br><br>

* Data frames

    * Back to gapminder
    * Could you make an informative guess about how this data structure can be represented in R?
    
**Yes!** It is a list of vectors of equal length. 
Let's modify our `myOrder` list to construct a data frame. What should we change?
```
menuItems<-c("chicken", "soup", "salad", "tea")
menuType<-factor(c("solid", "liquid", "solid", "liquid"))
menuCost<-c(3.99, 2.99, 4.69, 2.09)
```
Combine as a list:

* `myOrder<-list(menuItems, menuType, menuCost)`
* View it! Does not look like our dataset...
* Check with `str()`; keeps the data  types we asigned

Now combine as data.frame. Ask students to do that. Give it a different name, `myOrder_df`. Why?

* `myOrder_df<-data.frame(menuItems, menuType, menuCost)`
* view it! Magic..
* Check with `str()`; keeps the data types we asigned???

## 3. General subsetting rules

* Three general ways to subset the data
    * By position index: `v<-c(1:10)`; v[2]; v[c(3:6)]; v[-c(3:5)] 
        * with `which` function that extracts the position index of the elements with a specified values:`v<-c(1,3,5,5,7,5)`; `v1<-v[which(v==7)]`
         * for 2D structures (matrices and dataframes) use [row, column] index to extract individual elements
            * Use `myOrder_df` dataframe: get first3 rows:
                * `myOrder_df[1:3, ]`
    * By name
        * name our `myOrder` list: `names(myOrder)<-c("item", "type","cost")`
        * extract the first element of the list by name: `myOrder["item"]`
            * what type of data structure is returned? `str()`, `typeof()` --> LIST
        * you can also use `$` operator to subset by name (for lists and dataframes):
            * Try `myOrder$item` ; What type is returned? --> VECTOR
    * by logical vector index: selects values corresponding to TRUE values of logical vector
        * `v<-c(1,4,4,7,8)` and I want to get back all the elements of v such that v is equal to 4:
            * `v1<-v[v==4]`; Try only `v==4`
            * `v2<-v[v>4]`; Try only `v>4`
        * Use `myOrder_df` dataframe:select rows that satisfy various conditions
            * `df1<-myOrder_df[myOrder_df$menuType=="solid", ]`
            * `df2<-myOrder_df[myOrder_df$menuCost>3, ]`
            * `df3<-myOrder_df[which(myOrder_df$menuCost>3), ]` ;  how is it different from the previous line?

## 4. Overview using our gapminder dataset:
Let's return to our gapminder dataset that you have downloaded to SCW_Jan2016/Sunday_AM/data/gapminderData.csv

Before we examine our data, let's read this dataset into R:

* Method 1: Use `read.csv()` function

    * `myData<-read.csv("gapminderData.csv")`
    * Take a look at the new object `myData` 

A bit hard to see? Different ways to see what your object looks like:

    * Use `head()` function:
        * `head(myData)`
    * Look at the top right window, environment tab - gives you a brief summary of the object and Excel-like format

    
* Method 2. Use `read.table()` function

**Challenge 4.1** Purpose: read data into R.

**Answer**
* myData2<-read.table("gapminderData.csv", header=TRUE, sep = ",")

**Together** Now we know how read in dataframes into R. Let's play with this dataset to go over what we talked about this morning.
    
    * Overall object structure?
    * Can you tell what is the data type of elements in each cloumn?
    * Can you extract 3rd and 5th column of the dataset?
    * Can you extract the list of countries in this dataset
    * Can you get a part of this dataset that includes information about Sweden?
    * can you extract all countries for which life expectancy is below 70?
    * Can you make a new column that contains population in units of millions of people?
    * and so on for as long as I have time...
    
##Summary

  * R is made up objects and functions [that manipulate objects in various ways]
  * Objects and functions can be as simple or as complex as you want them to be (builtin + custom-made). Name some data structures/functions you know?
  * Help functions are super valuble to write your own code or navigate through script written by others. Do you remember what they are?
  
####**You are now ready to use R objects and functions to write your script**




