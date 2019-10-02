##################################################################
#  Name:   Introduction to R.R                                   #
#  Date:   October 2, 2019                                       #
#  Author: Bomi Lee                                              #
#  Purpose: Introduction to R for first time users               #
#  Thanks to Desmond D. Wallace, Jielu Yao, and                  #
#  Elizabeth Menninga for some of this code.                     #
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
as.character(my_numeric1)
class(my_numeric1) # R does not update automatically
new_numeric1 <- as.character(my_numeric1)
class(new_numeric1)


# Creating Objects

## Matrix

mymat <- matrix(-8:7,
                nrow = 4,
                ncol = 4)

mymat2 <- matrix(0,
                 nrow = 4,
                 ncol = 4)
mymat2

mymat3 <- matrix(1:4,
                 nrow = 4,
                 ncol = 4)
mymat3

mymat # View object in R console

mymat[2,
      3] # Report single maxtrix element

View(mymat) # View object in RStudio

View(mymat[2,
           3])

## Vector
c() 
### Class Numeric

A <- c(1,
       2,
       3) # Integer

A
A[3]

B <- c(1.5,
       -2.34,
       NA) # Double
B
is.na(B)

?ifelse
B2 <- ifelse(is.na(B)==TRUE, 0, B)
B2

B3 <- B[-3]
B3

## Character

C <- c("R is hard.",
       "But I can learn.")


## Logical

D <- c(TRUE,
       TRUE)

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

exData <- mtcars # Example dataset already installed
View(exData)

varnames<-names(mtcars)
varnames

mtcars_mpg <- mtcars$mpg
mtcars_mpg

View(mtcars$mpg)

## Array

array(-9:8,
      dim = c(3,
              3,
              2))

## List

song <- list(c("yesterday", "fake love"),
             c(190, 242),
             c(5, 1))
names(song) <- c("title", "duration", "track") # name a list
song

song[1]
song[3]
song[[2]]
song[[3]][1]

### To list the objects you created

ls()

### To remove the objects

rm(A)

ls()

### To remove all objects

rm(list=ls(all=TRUE))

ls()