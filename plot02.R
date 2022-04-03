#1.39Gb of data is being loaded in this code chunk
#5% of rows are removed due to 0 values 

library(tidyverse)
library(plyr)


PM25 = readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")[ , c(1,4,6)] %>% mutate(logTrsfm = log10(Emissions))
# PM25 = sample_n(PM25, 100000)
infValues=is.infinite(PM25$logTrsfm)
PM25 = PM25 %>% mutate(infinite = infValues) %>% filter(infinite != TRUE & fips == "24510")
med1999 = median(filter(PM25, year == 1999)$logTrsfm)
model <- lm(logTrsfm ~ year, PM25)
slope = round(model$coefficients[2], 3)
intercept = round(model$coefficients[1],3)
textEquation = paste("y = ",slope," * x"," + ",intercept, sep="")

png(filename = "~/Desktop/plot02.png", width=1800,height=1200,res=144)


par(mfrow=c(1,2),oma = c(2, 2, 4, 2))

with(PM25,
     plot(year, logTrsfm,
          xlab = "Year", ylab = "Tons of pollutant (log10 value)",
          ylim = c(-10, 10)
          )
     )
legend(x="topright",
       legend = textEquation,
       cex = 1)
abline(model, lwd=2)

boxplot(logTrsfm ~ factor(year), PM25, xlab="Year", ylab = "Tons of pollutant (log10 value)",
        ylim = c(-10, 10))

abline(h=med1999, col="red", pch = 4)

mtext("Baltimore PM2.5 total emission decreases when comparing 1999 recording to subsequent recordings up to 2008", outer = TRUE, cex = 1.5, line = -1)

dev.off()

  