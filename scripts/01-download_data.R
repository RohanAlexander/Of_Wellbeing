
#### Preamble ####
# Purpose:The General Social Survey (GSS) is a comprehensive survey conducted in the United States since 1972 to 2012, 
#providing insight into various social and demographic trends and attitudes. Accessing and analyzing the data 
#requires downloading the data package from the GSS website and cleaning and processing the data to select relevant 
#variables for the research question. This may involve dropping irrelevant variables, transforming or recording variables, 
#and creating new variables. Once the data cleaning is complete, the selected variables can be analyzed using statistical software 
#or other analytically tools to explore patterns and relationships. Despite being a valuable source of information, careful attention #
#to data cleaning and analysis is crucial to ensure the validity and reliability of the findings.
# Author: shaohan chang
# Date: 4 April 2023
# Contact: shaohan.chang@utoronto.ca
# License: MIT
# Pre-requisites: Download all the packages under the Work space section
# Any other information needed? None


#### Work space setup ####
library(haven)
library(tidyverse)

#### Download data ####
raw_data <- read_dta("inputs/data/gss7221_r3b.dta")

raw_data <-
  labelled::to_factor(raw_data)


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "inputs/data/raw_data.csv") 
