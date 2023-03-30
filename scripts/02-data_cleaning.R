#### Preamble ####
# Purpose: The purpose of the final line write_csv(data, "inputs/data/cleaned_data.csv") is to save the 
#cleaned and transformed data into a CSV file named "cleaned_data.csv" in the directory "inputs/data". 
#This line is saving the cleaned data as a CSV file so that it can be easily loaded and used in future 
#analysis or modeling.This is a good practice because it ensures that the cleaned data can be easily accessed
#and used later on without having to repeat the cleaning and transformation process every time. It also allows 
#for easier sharing of the cleaned data with others who may need to use it.
# Author: SHAOHAN CHANG  
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@utoronto.ca 
# License: MIT
# Pre-requisites:
## 1. Go to the GSS website by entering https://gss.norc.org/get-the-data/stata into your web browser.
## 2.Scroll down the page until you find the "Stata Data" section, and then click on the "Download the GSS Stata data files" link.
## 3. Select the years of interest from the list provided, and if you need to download multiple years, hold down the "Ctrl" key while clicking to select each year.
## 4. Click the "Download Selected Files" button located at the bottom of the page. 
## 5. On the next page, select the "Stata" file format.
## 6. To download all variables, choose "ALL" from the drop-down menu next to the green "ALL" button.
## 7. Click the "Create File" button and wait for the file to be generated. This may take a few moments, depending on the size of the file and your internet connection.
## 8. Once the file has been created, click the "Download File" button to save it to your computer. Make sure to save the file in a location where you can easily find it later.

# Any other information needed?
## 1. Take note of the file path where the downloaded data file is saved on your computer, as this information is necessary to read the data into R.
## 2. Keep in mind that the GSS data file can be quite large, especially if you have downloaded multiple years of data. To work with it more efficiently, consider filtering the data to a specific time period or a subset of variables using functions like subset() or dplyr::select().
## 3. Because the downloaded data file is in Stata format, you'll need to use a package like "haven" or "foreign" to read the data into R. For example, you can use the haven::read_dta() function.
## 4. Familiarize yourself with the code book or documentation for the dataset, which can be found on the GSS website or in the downloaded file. This resource provides information about the variables and their meanings, as well as any codes or missing values used in the dataset. Understanding the codebook is essential for cleaning, manipulating, and analyzing the data.
## 5. Depending on your research question, you may need to merge the GSS data with other data sets or sources of information to obtain additional variables or contextual information. This can be achieved using functions like dplyr::left_join() or merge().

#### Work space setup ####
library(tidyverse)
library(janitor)
library(tidyverse)

#### Clean data ####
# [...UPDATE THIS...]
the_raw_data <-
  haven :: read_dta("inputs/data/gss7221_r3b.dta")

data <- 
  the_raw_data |>
  select(
    year,
    age,
    sex,
    babies,
    divorce,
    health, 
    satfin,
    happy,
    degree,
  )

data <- 
  labelled :: to_factor(data)

data <- data %>%
  clean_names() %>%
  rename(finance_satified = satfin)




data <- data %>%
  mutate(year = as.numeric(as.character(year))) %>%
  filter(year >= 1972 & year <= 2012)


data <- data %>%
  mutate(babies = case_when(
    babies == '1' ~ '1',
    babies == '2' ~ '2',
    babies == '3' ~ '3',
    babies == '4' ~ '4',
    babies == '0 household members under 6' ~ '0',
    TRUE ~ 'unknown'
  ))


data <- data %>%
  mutate(happy = case_when(
    happy == 'not too happy' ~ 'not too happy',
    happy == 'pretty happy' ~ 'happy',
    happy == 'very happy' ~ 'very happy',
  ))


data$divorce_score <- ifelse(data$divorce == "no", 0, 1)


data$happy_score <- ifelse(data$happy == "not too happy", 0,
                           ifelse(data$happy == "happy", 1,
                                  ifelse(data$happy == "very happy", 3,4)))

# Create ordinal variable for degree score
data$degree_score <- ifelse(data$degree == "less than high school", 1,
                            ifelse(data$degree == "high school", 2,
                                   ifelse(data$degree == "associate/junior college", 3,
                                          ifelse(data$degree == "bachelor's", 4,
                                                 ifelse(data$degree == "graduate", 5, 6)))))

# Create ordinal variable for health score
data$health_score <- ifelse(data$health == "poor", 1,
                            ifelse(data$health == "fair", 2,
                                   ifelse(data$health == "good", 3,
                                          ifelse(data$health == "excellent", 4, 5))))

# Create ordinal variable for finance score
data$finance_score <- ifelse(data$finance_satified == "Not at all satisfied", 1,
                             ifelse(data$finance_satified == "more or less satisfied", 2,
                                    ifelse(data$finance_satified == "pretty well satisfied", 3, 4 )))

data$babies_number <- ifelse(data$babies == "0", 0,
                             ifelse(data$babies == "1", 1,
                                    ifelse(data$babies == "2", 2,
                                           ifelse(data$babies == "3", 3,
                                                  ifelse(data$babies == "4", 4, 5)))))


# convert age variable from character to numeric
data$age <- as.numeric(data$age)



data <- na.omit(data)



#### Save data ####
write_csv(data, "inputs/data/cleaned_data.csv")

 