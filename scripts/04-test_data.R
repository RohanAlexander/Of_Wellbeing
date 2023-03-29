#### Preamble ####
# Purpose: The purpose of this code is to conduct a series of tests on the data frame to check for the presence of missing (NA) values in various variables. By running these tests, the user can ensure the data is complete and free of missing values before proceeding with further analysis.Test One: The code checks for any missing values across the entire data frame.Test Two: The code examines the 'happy' variable for missing values.Test Three: The code assesses the 'year' variable for missing values.Test Four: The code evaluates the 'sex' variable for missing values.Test Five: The code inspects the 'degree' variable for missing values.For each test, the code prints "Check passed" if there are no missing values, and "Check failed" if missing values are detected. This information helps the user decide on necessary data cleaning steps and maintain data integrity during analysis.
# Author: SHAOHAN CHANG 
# Data: 29 March 2023 
# Contact: SHAOHAN.CHANG@Toronto.ca 
# License: MIT
# Pre-requisites: Prior to executing these tests on the test data, it is presumed that the data has already been imported into R and stored as a data frame. Additionally, it is assumed that the necessary packages for performing these tests, such as "dplyr" or "tidyverse", have been installed and loaded in R. It is also crucial to comprehend the research question and objectives, as this knowledge will steer the data analysis and establish the most suitable tests to employ.Moreover, it is advisable to meticulously examine the cookbook or documentation for the dataset, as this will supply vital details about the variables, their definitions, and any coding or missing value conventions utilized in the dataset. By possessing a thorough understanding of these prerequisites, researchers can guarantee that their data analysis is well-founded and precise.

#### Work space setup ####
library(tidyverse)
library(janitor)
library(dplyr)


#### Test data ####


data <- 
  readr::read_csv("inputs/data/cleaned_data.csv")

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
