# Exploring Relationships between Demographic Characteristics, Health, Finances, Living Arrangements, and Happiness: An Analysis of the General Social Survey (GSS) Data from 1972 to 2012

## This repository is organized as Follows: 

1. This project relies on data and literature as its primary inputs. The data is comprised of three files: original labels and dictionaries from the United States Cross-Sectional Cumulative Data microdata between 1972 and 2012, as well as a cleaned data file in CSV format. However, the raw data is not provided due to licensing constraints. The literature encompasses all peer-reviewed articles cited in the report, but omits websites and documents with restricted licenses.

2. The data cleaning process involves two scripts. The first script, 01_data_clean, transforms the raw United States GSS data from 1972 to 2012 into more understandable variables and labels. The second script, 01-download_data, refines the cleaned data for the report by selecting variables, renaming levels, removing missing observations, and choosing data pertinent to the report. A comprehensive explanation of the data cleaning process can be found in the script 02-data_cleaning, while 02-test_data conducts data detection tasks, such as identifying integers, calculating averages, and detecting NA data.

3. The output data folder contains the final data set utilized for the report. This folder includes the R markdown and PDF versions of the report, a bibliography for reference citations, and a Text preamble designed to properly position figures within the report's designated sections.

## To access the United States Cross-Sectional Cumulative Data from 1972-2012, follow these steps:

1. Visit https://gss.norc.org/get-the-data/stata to access the General Social Survey database.

2. Choose GSS 1972-2012 Cross-Sectional Cumulative Data and select a preferred language to explore the available surveys.

3. Locate GSS 1972-2012 Cross-Sectional Cumulative Data, click on "data", and download the three files: CSV data file, STATA data definition, and codebook. Make sure to select all variables.

4. Store the downloaded files on your local device.
