# Codebook Project 2 of Coursera Exploratory Data Analysis course

- Author: Nathan Choi
- Date: 04/03/2022

# Libraries

- tidyverse (all files)
- plyr (all files)
- ggpubr (ggplot files)

# Universal to all R files in this repo

- The data is read in using readRDS
- Log10 transformation is performed; all values that are converted to type Inf is removed using a logical index through is.infinite() function call across transformed values and removed by filter() 
- png() and dev.off() is used to create the image file


# Plot01.R 

- lm() is called on log10 transformed data  and stored in model; the coefficient data is stored and rounded in slope and intercept to create a string of the quation in textEquation calling paste to concatenate the information. 

- boxplot() and plot() are used with annotation methods or arguments 

- mtext() is used to create a single title into the frame of mfrow and placed into the outer margein 

# Plot02.R

- Almost exactly the same as Plot01.R except an additional filter call to isolate Baltimore fips identity

# Plot03.R 

- ggplot is applied with the facet_wrap call to make multiple graphs onto a single frame and adding a linear model through geom_smooth. Confidence intervals are turned off 

- ggpubr is loaded to overlay the linear model information onto the graph

- factor call to 'type' transforming the data  column in dataframe to factors to support 'color' argument in aes() function call 

# Plot04.R 

- Unique here is a filter call using a regular expression method; grepl() is applied to identify and subset '[Cc]oal' into a new dataframe 

- linear model method and base plot graphing same as plot01.R 

# Plot05.R 

- Similar to Plot05.R with grep of 'Mobile' in EI.Sector except with addition of a filter call to fips == '24510' to subset Baltimore specific data

# Plot06.R 

- Similar in data pull to Plot05.R but also subset Los Angeles
- Mutate fips to string of Los Angeles or Baltimore 
- Same ggplot action as plot03.R 
 

