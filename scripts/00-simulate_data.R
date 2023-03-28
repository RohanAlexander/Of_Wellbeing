#### Preamble ####
# Purpose:The code above simulates a dataset called "happiness_and_income" with information on individuals' happiness, income, and other characteristics. 
#The "set.seed" function sets a specific seed for the random number generator, ensuring that the same random values are generated each time the code is run.
#The "size_of_population" variable sets the number of individuals in the simulated population.The "tibble" function creates a table with columns for the year of observation, 
#age, sex, education level ("degree"), job satisfaction ("job_satisfied"), happiness level ("happy"), satisfaction level ("sat"), and age group ("age2").The "sample" function generates 
#random samples for each of these variables, with the "replace" argument set to TRUE so that each individual can be sampled more than once.The "mutate" function creates a new column for 
#age group based on the age variable, with individuals grouped into "age 18-39", "age 40-59", or "age 60+" based on their age.Overall, this code is simulating a population of individuals 
#with varying characteristics, including their level of happiness, income, and education, among other variables. This type of simulation could be used to explore relationships between 
#these variables and test different hypotheses.
# Author: SHAOHAN CHANG  
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@utoronto.ca
# License: MIT
# Pre-requisites: You have downloaded the data from the library. To do that:
## 1. Go the website : https://gss.norc.org/get-the-data/stata
## 2.Download the all file from 1972 to the 2012 file. 
## 3. Click the file of download.
## 4. select the SATA file 
## 5. Can select all variables by clicking button next to the green colored 'ALL'. Then continue 
## 6. Create the file, download and save the file. 
# Any other information needed? 
## 1. It is important to note the location where the downloaded data file is saved on your computer, as this will be needed when reading the data into R.
## 2. The downloaded data file is likely to be very large, as it contains survey data from 1972 to 2012. It may be necessary to filter the data to a specific 
# time period or subset of variables in order to work with it more efficiently.
## 3. The downloaded data file is likely to be in Stata format, so it will need to be read into R using a package like "haven" or "foreign".
## 4. It is also important to familiarize oneself with the codebook or documentation for the dataset, which can be found on the GSS website or in the downloaded file. 
# This will provide information on the variables and their meanings, as well as any codes or missing values used in the dataset.
## 5. Depending on the research question, it may also be necessary to merge the GSS data with other datasets or sources of information to obtain additional variables or contextual information.
#### Workspace setup ####

#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
# [...ADD CODE HERE...]



