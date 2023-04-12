#### Preamble ####
# Purpose:The General Social Survey (GSS) is a comprehensive survey conducted in 
# the United States since 1972 to 2012, providing insight into various social 
# and demographic trends and attitudes. Accessing and analyzing the data requires 
# downloading the data package from the GSS website and cleaning and processing 
# the data to select relevant variables for the research question. This is a manual
# process. Here we assume the dataset has been saved into `inputs/data/gss7221_r3b.dta`.
# Author: shaohan chang
# Date: 12 April 2023
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
write_csv(raw_data, "inputs/data/raw_data.csv") 
