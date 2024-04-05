#########################################

#DAY 1 - SOLUTIONS

##########################################


#-----------------------------------------
#TASK 1
#-----------------------------------------

#Load the `tidyverse` and `janitor` packages.
#If `tidyverse` or `janitor` packages are not installed yet (it will say `[package] not found`).
#Your first task, is then to install them.


#SOLUTION:

library(janitor)
library(tidyverse)

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

penguins <- read_csv("https://raw.githubusercontent.com/allisonhorst/palmerpenguins/main/inst/extdata/penguins_raw.csv")

glimpse(penguins)

#-----------------------------------------
#TASK 3
#-----------------------------------------

#A. Only keep the variables: `species`, `island` and `sex`.
#B. Only keep variables 2 to 4.
#C. Remove the column `year`.
#D. Only include columns that contain "mm" in the variable name.

#Create a new object for each of these operations


#SOLUTION:

penguins <- clean_names(penguins)

penguins_1 <- select(penguins, c(species, island, sex))
penguins_2 <- penguins[,2:5]
penguins_3 <- select(penguins, -stage)
penguins_4 <- select(penguins, contains("mm"))


#-----------------------------------------
#TASK 4
#-----------------------------------------

#Rename `island` to `location`.


#SOLUTION:

data_modified <- rename(penguins, location = island)

#-----------------------------------------
#TASK 5
#-----------------------------------------

#A. Filter the data so that `species` only includes `Chinstrap`.
#B. Filter the data so that `species` only includes `Chinstrap` or `Gentoo`.
#C. Filter the data so it includes only penguins that are `male` *and* of the species `Adelie`.

#Create a new object for each of these operations.


#SOLUTION:

chinstrap_only <- filter(penguins, species == "Chinstrap")
chinstrap_gentoo_only <- filter(penguins, species %in% c("Chinstrap", "Gentoo"))
male_adelie_only <- filter(penguins, species == "Adelie", sex == "male")

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

data_modified_cm <- mutate(penguins, bill_length_cm = bill_length_mm / 10,
                           bill_depth_cm = bill_depth_mm / 10,
                           flipper_length_cm = flipper_length_mm / 10)

penguins_depth_cat <- mutate(penguins, bill_depth_cat = ifelse(bill_depth_mm <= 18, "low", "high"))

penguins_species_short <- mutate(penguins, species_short = case_when(
  species == "Adelie" ~ "A",
  species == "Chinstrap" ~ "C",
  species == "Gentoo" ~ "G"
))

#-----------------------------------------
#TASK 7
#-----------------------------------------

# Calculate the average `body_mass_g` per `island`.
# If you haven't done so already, try using the `%>%` operator to do this.


#SOLUTION:

penguins %>% 
  group_by(island) %>% 
  summarise(average_body_mass = mean(body_mass_g, na.rm = TRUE))

test <- penguins %>% 
  group_by(island) %>% 
  mutate(average_body_mass = mean(body_mass_g, na.rm = TRUE))

#-----------------------------------------
#TASK 8
#-----------------------------------------

#Use the pipe operator (`%>%`) to do all the operations below.

#A. Filter the `penguins` data so that it only includes `Chinstrap` or `Adelie`.
#B. Rename `sex` to `observed_sex`
#C. Only keep the variables `species`, `observed_sex`, `culmen_length_mm` and `culmen_depth_mm`
#D. Calculate the ratio between `culmen_length_mm` and `culmen_depth_mm`
#E. Sort the data by the highest ratio

#Try to create the pipe step by step and execute code as you go to see if it works.
#Once you are done, assign the data to `new_penguins`.

#F. Calculate the average ratio by `species` and `sex`, again using pipes.



#SOLUTION:

# Filter the penguins data to only include Chinstrap or Adelie
filtered_penguins <- penguins %>% 
  filter(species %in% c("Gentoo penguin (Pygoscelis papua)", "Adelie Penguin (Pygoscelis adeliae)")) %>%
  # Rename `sex` to `observed_sex`
  rename(observed_sex = sex) %>%
  # Only keep the desired columns
  select(species, observed_sex, culmen_length_mm, culmen_depth_mm) %>%
  # Calculate the ratio between bill_length_mm and bill_depth_mm
  mutate(ratio = culmen_length_mm / culmen_depth_mm) %>%
  # Sort the data by the highest ratio
  arrange(desc(ratio)) %>% 
  drop_na(ratio, observed_sex)

# Assigning the data to new_penguins
new_penguins <- filtered_penguins

# Calculate the average ratio by species and sex
new_penguins %>% 
  group_by(species, observed_sex) %>% 
  summarise(average_ratio = mean(ratio, na.rm = TRUE))


#-----------------------------------------
#TASK 9
#-----------------------------------------

#Count the number of penguins by island and species.


#SOLUTION:

penguins %>% 
  group_by(island, species) %>%
  tally()

test <- penguins %>% 
  group_by(island,species) %>% 
  mutate(number=n())

penguins %>% 
  group_by(island, species) %>%
  summarise(n())

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

# Clean the dataset
tidy_animal_friends <- animal_friends %>%
  clean_names() %>% 
  # Remove unwanted column
  select(-a_opterr) %>%
  # Separate the Age/Adopted/Condition column into three distinct columns
  separate(age_adopted_condition, into = c("age", "adopted", "condition"), sep = "/") %>%
  # Convert data to long format
  gather(key = "variable", value = "value", -names, -the_animals, -sex)

tidy_animal_friends

