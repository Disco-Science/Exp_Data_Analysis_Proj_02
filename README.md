# **Exploratory data analysis of the National Emissions Inventory (NEI)** 

Author: Nathan Choi
Date: April 02 2022
Course: Exploratory data analysis

# Introduction: 
Hello, this repo holds PNG files of plots constructed in R. There also R files that provide the code of how each PNG file was constructed. The goal of this repo is to fulfill the assignment for project 2 of the Coursera Exploratory data analysis course. In each section of this README is relevant information for the how, what, and why of the R and PNG files. 

**A codebook is written and stored in this repo but is part of this README markdown. Find the Codebook.md in this repo for details of coding decisions.**

# Data source: 
The National Emissions Inventory (NEI) is a record produced by the Environmental Protection Agency (EPA). In it are measures of things like air pollutants across the United States. In this analysis, I review the measures of fine particulate matter with a diameter estimated to be 2.5 micrometers in length, known as "PM2.5". The NEI records being evaluated are specific to the years 1999, 2002, 2005, and 2008. 

# Data structure: 

- **The NEI data is stored in RDS files provided by the course instructors; RDS is a file format that serializes R objects. The total memory allocation for the two files applied is ~32 MB. There are two RDS files**. 

- "Source_Classification_Code.rds" file loads a dataframe object of dimensions 11717 x 15. It holds additional metadata related to the "summarySCC_PM25.RDS" dataframe and is mapped to values by the SCC digit string, which is the first column of within it. Each vector (column) is loaded as a factor. Therefore, all the data within it is a string datatype. The dimensions are 11717 x 15.

Column names: 

1. "SCC" 
2. 2. "Data.Category" 
3. 3. "Short.Name"          
4. "EI.Sector"          
5. "Option.Group"        
6. "Option.Set"          
7. "SCC.Level.One"       
8. "SCC.Level.Two"      
9. "SCC.Level.Three"     
10. "SCC.Level.Four"      
11. "Map.To"              
12. "Last.Inventory.Year"
13. "Created_Date"        
14. "Revised_Date"        
15. "Usage.Notes" 

- "summarySCC_PM25.RDS" file loads a dataframe object of dimensions 6497651 x 6. It holds the values described below. 

1. fips: A five-digit number (represented as a string) indicating the U.S. county
2. SCC: The name of the source as indicated by a digit string (see source code classification table)
3. Pollutant: A string indicating the pollutant
4. Emissions: Amount of PM2.5 emitted, in tons
5. type: The type of source (point, non-point, on-road, or non-road)
6. year: The year of emissions recorded

# Assignment: 

- The instructor has requested the following questions be answered through the visualization of the data. The .R file within this repo aims to return a PNG file that fulfills the assignment. 

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the point, nonpoint, onroad, nonroad variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

# Submission
Here I am describing the data each plot is aiming to suggest.
**Zero values from the data were removed to support log10 transformation. This represented ~5% of the data points.**

- Plot01.png shows on the left graph a dot plot of recorded data for each year. Using a linear model equation and representing the line of that equation onto the graph I am observiing a negative slope . On the right is a box plot of the same data, with the median value of year 1999 acting as the comparator. I see a shift in the median values downward for each subsequent year.

- Plot02.png shows similar trends to Plot01.png; differences between the more global data and Baltimore is the range of values mainnly and a weaker slope in change. 

- Plot03.png here are 4 graphs that represent the change through only a dot plot and linear model. For all four factors of data a negative slope is observed. The greatest change is observed on the "Point" source of data. 

- Plot04.png in similar fashion to Plot01.png, the graphs on the left is a dot plot with a linear model and on the right a box plot with comparator (year 1999) median value as a horizontal axis. Observed is a positive trend for PM2.5 emission values. 

- Plot05.png for motor vehicles that are defined by the categorization of 'Mobile' in the EI.Sector column of the metadata file "Source_Classification_Code", again a dot plot and box plot are provided. Again, a negative trend is observed in emissions.

- Plot06.png when comparing between the changes in emission of PM2.5 values between Los Angeles and Baltimore for 'Mobile' classified EI.Sector values I observe a negative trend for both, but Los Angeles having almost 2.7 times the change over time. 



