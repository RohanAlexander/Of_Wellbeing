#### Preamble ####
# Purpose: The purpose of this code is to clean and preprocess a dataset called "the_raw_data", which contains information about individuals' demographics, 
#employment status, job satisfaction, and happiness. The code selects relevant variables from the dataset, converts them into factors, and renames them to 
#more understandable names. It also removes any observations with missing or invalid values and filters the data to only include years between 1972 and 2012 
#and individuals under the age of 89. Additionally, the code creates a new variable called "age_range" based on the age variable, which categorizes individuals 
#into different age groups. Finally, the cleaned dataset is saved as a CSV file called "cleaned_data.csv" in the "outputs" folder. The cleaned dataset is now ready 
# to be used for further analysis and modeling.
# Author: SHAOHAN CHANG  
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@utoronto.ca 
# License: MIT
# Pre-requisites:
## 1. Go the website : https://gss.norc.org/get-the-data/stata
## 2.Scroll down to the "Stata Data" section and click the "Download the GSS Stata data files" link.
## 3. Select the years you want to download from the list provided. You can select multiple years by holding down the "Ctrl" key on your keyboard while clicking on the years you want.
## 4. Click the "Download Selected Files" button at the bottom of the page. 
## 5. On the next page, select the "Stata" file format.
## 6. Select "ALL" from the dropdown menu next to the green "ALL" button to download all variables.
## 7. Click the "Create File" button and wait for the file to be generated.
## 8. Once the file has been created, click the "Download File" button to save the file to your computer.
# Any other information needed? [...UPDATE THIS...]
## 1. Make sure to note the location where the downloaded data file is saved on your computer, as you will need to provide the file path when reading the data into R.
## 2. The GSS data file is likely to be very large, especially if you downloaded the data for multiple years. It may be necessary to filter the data to a specific time period or subset of 
# variables in order to work with it more efficiently. This can be done using functions like subset() or dplyr::select().
## 3. Since the downloaded data file is in Stata format, you will need to use a package like "haven" or "foreign" to read the data into R. For example, you can use the haven::read_dta() 
# function to read a Stata file into R.
## 4. It is important to familiarize yourself with the codebook or documentation for the dataset, which can be found on the GSS website or in the downloaded file. This will provide information on
# the variables and their meanings, as well as any codes or missing values used in the dataset. Understanding the codebook is crucial for cleaning, manipulating, and analyzing the data.
## 5. Depending on your research question, it may be necessary to merge the GSS data with other datasets or sources of information to obtain additional variables or contextual information. This can 
#be done using functions like dplyr::left_join() or merge().

#### Workspace setup ####
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
    res16,
    happy,
    degree,
  )

data <- 
  labelled :: to_factor(data)

data <- data %>%
  clean_names() %>%
  rename(finance_satified = satfin,
         living_area = res16)




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
  mutate(living_area = case_when(
    living_area == 'in a suburb near a suburb near' ~ 'suburb near suburb near',
    living_area == 'in a large city (over 250,000)' ~ 'large city',
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

 