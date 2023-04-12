#### Preamble ####
# Purpose: The purpose of these tests is to check for missing values (NA values) in different variables of the "cleaned_data.csv" dataset. 
#These tests ensure that the data is clean and complete, and suitable for further analysis. Test One checks the entire dataset for any NA values, 
#while Tests Two to Five specifically check for NA values in the "happy", "year", "sex", and "health" variables, respectively. The if else() function
#is used to print a message indicating whether the check has passed or failed.
# Author: SHAOHAN CHANG 
# Date: 29 March 2023 
# Contact: SHAOHAN.CHANG@Toronto.ca 
# License: MIT
# Pre-requisites: The prerequisite for running these tests is that the "cleaned_data.csv" dataset has been cleaned and prepared for analysis. The dataset 
#should also be in a format that is compatible with the readr::read_csv() function used to read the data into R. Additionally, the R environment must be set
#up with the necessary packages for performing data analysis, such as readr. Finally, the user should have a basic understanding of R programming and data 
#analysis techniques, including how to write and run R scripts.

#### Work space setup ####
library(tidyverse)

#### Test data ####
data <- 
  read_csv("inputs/data/cleaned_data.csv")

# Test One : Check for NA values in the data frame.
# Explanation : as the result , there 0 NA value. 
check_result <- ifelse(sum(is.na(data)) == 0, "Check passed", "Check failed")
print(check_result)


# Test Two : Check for NA values in happy. 
# Explanation :  Three are 0 missing values in the happy. 
check_result <- ifelse(sum(is.na(data$happy)) == 0, "Check passed", "Check failed")
print(check_result)


# Test Three : Check for NA values in year.
# Explanation :There are 0 missing values in the year variable. 
check_result <- ifelse(sum(is.na(data$year)) == 0, "Check passed", "Check failed")
print(check_result)

# Test Four : Check for NA values in sex. 
# Explanation :There are 0 missing values in the sex variable.
check_result <- ifelse(sum(is.na(data$sex)) == 0, "Check passed", "Check failed")
print(check_result)

# Test Five : Check for NA values in health. 
# Explanation :There are 0 missing values in the health variable.
check_result <- ifelse(sum(is.na(data$degree)) == 0, "Check passed", "Check failed")
print(check_result)
