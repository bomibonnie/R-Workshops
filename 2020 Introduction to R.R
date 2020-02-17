##################################################################
#  Name:   Introduction to R.R                                   #
#  Date:   February 19, 2020                                     #
#  Author: Bomi Lee                                              #
#  Purpose: Introduction to R for first time users               #
#  Thanks to Desmond D. Wallace, Elizabeth Menninga, and         #
#  Jielu Yao, for some of this code.                             #
##################################################################

# Installation

## Install RStudio

### https://www.rstudio.com/

# Working Directory

getwd() # Current working directory

## Change working directory

### setwd("Your Directory Here")
setwd("C:/Users/bomim/Documents/Rworkshop")

# Packages

## CRAN Packages (Comprehensive R Archive Network)

### install.packages('package name')

## GitHub

### devtools::install_github

## Load packages

### library('package name')

install.packages("rio")
library("rio")


# Data types

numeric1 <- 4.5 # numeric:demimals
numeric2 <- 4L # numeric: integers
logical <- FALSE # logical(Boolean values) - TRUE & FALSE 
character <- "hello" # characters

## Identify data type
class(logical)
class(numeric2)
str(numeric2) # display the structure of an object

## Check data type
is.numeric(numeric1)
is.character(numeric1)
is.logical(numeric1)

## Data type coercion: as.characer() | as.numeric() | as.logical()
as.character(numeric1)
class(numeric1) # R does not update automatically
new_numeric1 <- as.character(numeric1)
class(new_numeric1)

?as.numeric

# Creating Objects

## Matrix

mymat <- matrix(-8:7,
                nrow = 4,
                ncol = 4)

mymat # View object in R console
View(mymat) # View object in RStudio

mymat2 <- matrix(0,
                 nrow = 4,
                 ncol = 4)
mymat2

mymat3 <- matrix(1:4,
                 nrow = 4,
                 ncol = 4)
mymat3

mymat[2,
      3] # Report single maxtrix element
mymat
## Vector
c() 

### Numeric

A <- c(1,
       2,
       3) # Integer

A
A[3]

B <- c(1.5,
       -2.34,
       NA) 
B
is.na(B)

B2 <- ifelse(is.na(B)==TRUE, 0, B)
?ifelse
B2


B3 <- B[-1]
B3

## Character

C <- c("R is hard.",
       "But I can learn.")
C

## Logical

D <- c(TRUE,
       TRUE)

D

ex.cbind <- cbind(C, D)
ex.rbind <- rbind(C, D)

class(ex.cbind)
class(ex.rbind)

ex.cbind
ex.rbind

## Data Frame

ex.dataframe <- data.frame(C, D)

class(ex.dataframe)
View(ex.dataframe)
names(ex.dataframe)

exData <- mtcars # Example dataset already installed
View(exData)

names(mtcars)

mtcars_mpg <- mtcars$mpg
mtcars_mpg

View(mtcars$mpg)

## List

song <- list("fake love",
             242,
             c(1,2))
names(song) <- c("title", "duration", "track") # name a list
song

song[1]
song[3]
song[[2]]
song[[3]][1]

### To list the objects you created

ls()

### To remove the objects
rm(C, A, B)

ls()

### To remove all objects

rm(list=ls(all=TRUE))

ls()