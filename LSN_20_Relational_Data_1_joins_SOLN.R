## SE370 AY 22-2
## Lesson 20: Relational Data I - Keys and Joins

library(dplyr)

#---Relational data: Multiple tables that are interconnected or related, but are stored in separate data files. Understanding the relations between data sets is just as important as understanding indiviual data

# There are 3 families of verbs that help you work with relational data:
# 1. Mutating Joins: Add new variables to one dataframe from matching observations in another
# 2. Filtering Joins: Filter observations from one data frame based on whether or 
#  not they match an observation on the other table
# 3. Set Operations: Treat observations like they are set elements.

#---KEYS
# Keys are variables used to connect each pair of tables. It is a variable that 
# uniquely identifies an observation.

# A PRIMARY KEY identifies an observation on its own table.
# A FOREIGN KEY identifies an observation on another table.

#---BASIC JOINS
# Consider two dataframes -- x and y

x <- data.frame(key = c(1, 2, 3), val_x = c("x1", "x2", "x3"))
x

y <- data.frame(key = c(1, 2, 4, 2), val_y = c("y1", "y2", "y3", "y4"))
y

#--MUTATING JOINS
# Check out this venn diagram
venn <- load.image("joins_venn_diagram.png")

# inner_join(): return all rows from x where there are matching values in y, 
# and all columns from x and y. If there are multiple matches between x and y, 
# all combination of the matches are returned.
# BLUF: Where there is no match, you lose data

inner <- x %>%
  inner_join(y, by = "key")

inner

# left_join(): return all rows from x, and all columns from x and y. Rows in x 
# with no match in y will have NA values in the new columns. If there are 
# multiple matches between x and y, all combinations of the matches are returned.
# BLUF: Preserves all x rows, even if y columns will be NA

left <- x %>%
  left_join(y, by = "key")

left

# right_join(): return all rows from y, and all columns from x and y. Rows in y 
# with no match in x will have NA values in the new columns. If there are 
# multiple matches between x and y, all combinations of the matches are returned.
# BLUF: Preserves all y rows, even if x columns will be NA

right <- x %>%
  right_join(y, by = "key")
right

# full_join(): return all rows and all columns from both x and y. 
# Where there are not matching values, returns NA for the one missing.
# BLUF: Perserves all existing data, but may produce a lot of NA values!

full <- x %>%
  full_join(y, by = "key")
full


#--FILTERING JOINS: filter rows from x 
# based on the presence or absence of matches in y

# semi_join(): return all rows from x where there are matching values in y, 
# keeping just columns from x. A semi join differs from an inner join because 
# an inner join will return one row of x for each matching row of y, where a 
# semi join will never duplicate rows of x.

semi <- x %>%
  semi_join(y, by = "key")
semi

# anti_join():  return all rows from x without a match in y

anti <- x %>%
  anti_join(y, by = "key")
anti


#--NESTING JOINS: create a list column of data.frames

# nest_join():

nest <- x %>%
  nest_join(y, by = "key")
nest


# Let's do some joins...

#---1) Read in the TRANSCOM data, show the first 6 rows, and explore the data: 


#---2) Read in the carrier data, show the first 6 rows, and explore the data:


#---3) Find the top 5 (known) carriers that sent the most (total) weight to or 
# from AFRICOM. Print the result.


#---4) Use a join to merge the carrier data with your result from the above question. Print the result.







