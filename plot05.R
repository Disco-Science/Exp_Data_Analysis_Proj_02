library(tidyverse)
library(plyr)
PM25 = readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
meta = readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
PM25 = arrange(join(PM25,meta),SCC) %>% 
  filter(
    grepl('Mobile', EI.Sector)
  ) %>% 
  mutate(log10Em = log10(Emissions)) %>%
  mutate(infinite = is.infinite(log10Em)) %>%
  filter(infinite != TRUE & fips == "24510")

med1999 = median(filter(PM25, year == 1999)$log10Em)
model <- lm(log10Em ~ year, PM25)
slope = round(model$coefficients[2], 3)
intercept = round(model$coefficients[1],3)
textEquation = paste("y = ",slope," * x"," + ",intercept, sep="")
# 
png(filename = "~/Desktop/plot05.png", width=1800,height=1200,res=144)
# 
par(mfrow=c(1,2),oma = c(2, 2, 4, 2))

with(PM25,
     plot(year, log10Em,
          xlab = "Year", ylab = "Tons of pollutant (log10 value)",
          ylim = c(-10, 10)
     )
)
legend(x="topright",
       legend = textEquation,
       cex = 1.0)
abline(model, lwd=2)

boxplot(log10Em ~ factor(year), PM25, xlab="Year", ylab = "Tons of pollutant (log10 value)",
        ylim = c(-10, 10))

abline(h=med1999, col="red", pch = 4)

mtext(expression("Baltimore total "*PM[2.5]*" motor vehicles emission decreases when comparing 1999 recording to subsequent recordings up to 2008"), outer = TRUE, cex = 1.2, line = -1)

dev.off()
