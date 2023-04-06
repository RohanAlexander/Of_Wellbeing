#### Preamble ####
# Purpose: generate a simulated dataset with 100 observations, where each observation contains information 
#about an individual's demographics, well-being, and satisfaction levels. The purpose of this simulated dataset 
#is to explore relationships and trends among the variables, which can be useful for research, analysis, or practice
#in understanding factors that may affect people's lives.
# Author: shaohan chang
# Date: 4 April 2023
# Contact: shaohan.chang@utoronto.ca
# License: MIT
# Pre-requisites: Download package of tidyverse 
# Any other information needed? None

library(tidyverse)

#### Simulate data ####
set.seed(123) # set seed for reproducibility

# generate 100 observations
n <- 100

# generate year variable (1972 to 2021)
year <- sample(1972:2021, n, replace = TRUE)

# generate sex variable
sex <- sample(c("female", "male"), n, replace = TRUE)

# generate babies variable (0 to 5)
babies <- sample(0:5, n, replace = TRUE)

# generate health variable
health <- sample(c("excellent", "good", "fair", "poor"), n, replace = TRUE)

# generate finance_satisfaction variable
finance_satisfaction <- sample(c("not satisfied at all", "more or less satisfied", "pretty well satisfied"), n, replace = TRUE)

# generate happiness variable
happiness <- sample(c("not too happy", "happy", "very happy"), n, replace = TRUE)

# create a data frame with the generated variables
simulated_data <- data.frame(year, sex, babies, health, finance_satisfaction, happiness)
