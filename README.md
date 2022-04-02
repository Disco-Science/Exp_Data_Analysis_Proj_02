#Exploratory data analysis of the National Emissions Inventory (NEI)#
Author: Nathan Choi
Date: April 02 2022
Course: Exploratory data analysis

#Introduction: 
Hello, this repo holds PNG files of plots constructed in R. There also R files that provide the code of how each PNG file was constructed. The goal of this repo is to fulfill the assignment for project 2 of the Coursera Exploratory data analysis course. In each section of this README is relevant information for the how, what, and why of the R and PNG files. 

#Data source: 
The National Emissions Inventory (NEI) is a record produced by the Environmental Protection Agency (EPA). In it are measures of things like air pollutants across the United States. In this analysis, I review the measures of fine particulate matter with a diameter estimated to be 2.5 micrometers in length, known as "PM2.5". The NEI records being evaluated are specific to the years 1999, 2002, 2005, and 2008. 

Data structure: The NEI data is stored in RDS files provided by the course instructors; RDS is a file format that serializes R objects. The total memory allocation for the two files applied is ~32 MB. There are two RDS files. 

"Source_Classification_Code.rds" file loads a dataframe object of dimensions 11717 x 15. It holds additional metadata related to the "summarySCC_PM25.RDS" dataframe and is mapped to values by the SCC digit string, which is the first column of within it. Each vector (column) is loaded as a factor. Therefore, all the data within it is a string datatype. The dimensions are 11717 x 15.

Column names: 

1] "SCC"                 "Data.Category"       "Short.Name"          "EI.Sector"          
 [5] "Option.Group"        "Option.Set"          "SCC.Level.One"       "SCC.Level.Two"      
 [9] "SCC.Level.Three"     "SCC.Level.Four"      "Map.To"              "Last.Inventory.Year"
[13] "Created_Date"        "Revised_Date"        "Usage.Notes" 

"summarySCC_PM25.RDS" file loads a dataframe object of dimensions 6497651 x 6. It holds the values described below. 

fips: A five-digit number (represented as a string) indicating the U.S. county
SCC: The name of the source as indicated by a digit string (see source code classification table)
Pollutant: A string indicating the pollutant
Emissions: Amount of PM2.5 emitted, in tons
type: The type of source (point, non-point, on-road, or non-road)
year: The year of emissions recorded

Assignment: The instructor has requested the following questions be answered through the visualization of the data. The .R file within this repo aims to return a PNG file that fulfills the assignment. 

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the point, nonpoint, onroad, nonroad variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?



