library(tidyverse)
library(plyr)
library(ggplot2)
library(ggpubr)

PM25 = readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
meta = readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
PM25 = arrange(join(PM25,meta),SCC) %>% 
  filter(grepl('Mobile', EI.Sector)) %>% 
  mutate(log10Em = log10(Emissions)) %>%
  mutate(infinite = is.infinite(log10Em)) %>%
  filter(infinite != TRUE) %>% 
  filter(fips == "24510" | fips == "06037") %>% 
  mutate(fips = factor(fips)) %>% 
  mutate(fips = sub("06037", "Los Angeles", fips)) %>%
  mutate(fips = sub("24510", "Baltimore", fips))

png(filename = "~/Desktop/plot06.png", width=1800,height=1200,res=144)
plot03 = ggplot(PM25, aes(x = year, y = log10Em, color = fips))
plot03 +
  facet_wrap(. ~ fips) + 
  geom_point() +
  geom_smooth(method = "lm",se=FALSE) +
  theme_bw(base_family="Avenir") +
  labs(x="Year of measurement", y = expression("Total "*PM[2.5]*" pollutant (log10 value)")) +
  ggtitle(expression("Rate of change in "*PM[2.5]*" is greater in Los Angeles than Baltimore from 1999 to 2008")) +
  theme(legend.position = "none",plot.title = element_text(hjust = 0.5)) +
  stat_regline_equation(label.x = 1999, label.y = -5) 

dev.off()
