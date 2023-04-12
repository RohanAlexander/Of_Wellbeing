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

#### Work space setup ####
library(tidyverse)

#### Simulate data ####
set.seed(123)
n <- 100

# Generate individual variables
year <- sample(1972:2021, n, replace = TRUE)
sex <- sample(c("female", "male"), n, replace = TRUE)
babies <- sample(0:5, n, replace = TRUE)
health <-
  sample(c("excellent", "good", "fair", "poor"), n, replace = TRUE)
finance_satisfaction <-
  sample(c(
    "not satisfied at all",
    "more or less satisfied",
    "pretty well satisfied"
  ),
  n,
  replace = TRUE)
happiness <-
  sample(c("not too happy", "happy", "very happy"), n, replace = TRUE)

# Bring them together
simulated_data <-
  tibble(year, sex, babies, health, finance_satisfaction, happiness)
