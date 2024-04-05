#########################################

#DAY 1 - EXERCISES

##########################################

#Now it's your turn to write some R code!

#-----------------------------------------
# Functions reference list
#-----------------------------------------

#For reference, here is a list of some useful functions.
#If you have trouble with any of these functions, try reading the documentation with ?function_name

#Remember: all these functions take the **data** first.

#filter() - Subset rows using column values
    
#mutate() - Create and modify delete columns
    
#rename() - Rename columns
    
#select() - Subset columns using their names and types
    
#summarise() - Summarise each group to fewer rows
    
#group_by(); ungroup() - Group by one or more variables
    
#arrange() - Arrange rows by column values
    
#count(); tally() - Count observations by group
    
#distinct() - Subset distinct/unique rows
    
#pull() - Extract a single column
    
#ifelse() - useful for coding of binary variables
    
#case_when() - useful for recoding (when ifelse is not enough)
    
#separate() - separate two variables by some separator
    
#pivot_wider() - turn data into wide format
    
#pivot_longer() - turn data into long format
    
#-----------------------------------------
#TASK 1
#-----------------------------------------

#Load the `tidyverse` and `janitor` packages.
#If `tidyverse` or `janitor` packages are not installed yet (it will say `[package] not found`).
#Your first task, is then to install them.


#SOLUTION:



#-----------------------------------------
#TASK 2
#-----------------------------------------

#Read in the already cleaned `palmerpenguins` data set using
#`read_csv` and 
#the following URL:[https://raw.githubusercontent.com/allisonhorst/palmerpenguins/main/inst/extdata/penguins.csv](https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv)

#Assign the resulting data to `penguins`.
#Then take a look a look at it using `glimpse`.
#What kind of variables can you recognize?


#SOLUTION:



#-----------------------------------------
#TASK 3
#-----------------------------------------

#A. Only keep the variables: `species`, `island` and `sex`.
#B. Only keep variables 2 to 4.
#C. Remove the column `year`.
#D. Only include columns that contain "mm" in the variable name.

#Create a new object for each of these operations


#SOLUTION:



#-----------------------------------------
#TASK 4
#-----------------------------------------

#Rename `island` to `location`.


#SOLUTION:



#-----------------------------------------
#TASK 5
#-----------------------------------------

#A. Filter the data so that `species` only includes `Chinstrap`.
#B. Filter the data so that `species` only includes `Chinstrap` or `Gentoo`.
#C. Filter the data so it includes only penguins that are `male` *and* of the species `Adelie`.

#Create a new object for each of these operations.


#SOLUTION:



#-----------------------------------------
#TASK 6
#-----------------------------------------

#A. Create three new variables that calculates `bill_length_mm` and `bill_depth_mm` and `flipper_length_mm` from millimeter to centimeter.
#Tip: divide the length value by 10.

#B. Create a new variable called `bill_depth_cat` which has two values:
#Everything above a bill depth of 18mm and 18mm itself is "high"
#Everything below a bill depth of 18mm is "low"
        
#C. Create a new variable called `species_short`.
#`Adelie` should become `A`
#`Chinstrap` should become `C`
#`Gentoo` should become `G`


#SOLUTION:



#-----------------------------------------
#TASK 7
#-----------------------------------------

# Calculate the average `body_mass_g` per `island`.
# If you haven't done so already, try using the `%>%` operator to do this.


#SOLUTION:



#-----------------------------------------
#TASK 8
#-----------------------------------------

#Use the pipe operator (`%>%`) to do all the operations below.

#A. Filter the `penguins` data so that it only includes `Chinstrap` or `Adelie`.
#B. Rename `sex` to `observed_sex`
#C. Only keep the variables `species`, `observed_sex`, `bill_length_mm` and `bill_depth_mm`
#D. Calculate the ratio between `bill_length_mm` and `bill_depth_mm`
#E. Sort the data by the highest ratio

#Try to create the pipe step by step and execute code as you go to see if it works.
#Once you are done, assign the data to `new_penguins`.

#F. Calculate the average ratio by `species` and `sex`, again using pipes.



#SOLUTION:



#-----------------------------------------
#TASK 9
#-----------------------------------------

#Count the number of penguins by island and species.


#SOLUTION:



#-----------------------------------------
#TASK 10
#-----------------------------------------

#Below is a dataset that needs some cleaning.
#Use the skills that you have learned so far to turn the data into a tidy dataset. 
#Turn the final data into long format.

animal_friends <- data.frame(
    Names = c("Francis", "Catniss", "Theodor", "Eugenia"),
    TheAnimals = c("Dog", "Cat", "Hamster", "Rabbit"),
    Sex = c("m", "f", "m", "f"),
    a_opterr = c("me", "me", "me", "me"),
    `Age/Adopted/Condition` = c("8/2020/Very Good", "13/2019/Wild", "1/2021/Fair", "2/2020/Good")) 


#SOLUTION:
