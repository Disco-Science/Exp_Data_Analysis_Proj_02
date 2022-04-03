library(tidyverse)
library(ggpubr)
PM25 = readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")[ , c(1,4,5,6)] %>% 
  mutate(logTrsfm = log10(Emissions)) %>% 
  mutate(infinite = is.infinite(logTrsfm)) %>% 
  filter(infinite != TRUE & fips == "24510")

model = lm(logTrsfm ~ year * factor(type), PM25)

png(filename = "~/Desktop/plot03.png", width=1800,height=1200,res=144)

plot03 = ggplot(PM25, aes(x = year, y = logTrsfm, color = factor(type)))
plot03 +
  facet_wrap(. ~ type, nrow=2,ncol=2) + 
  geom_point() +
  geom_smooth(method = "lm",se=FALSE) +
  theme_bw(base_family="Avenir") +
  labs(x="Year of measurement", 
       y = expression("Total "*PM[2.5]*" pollutant (log10 value)")) +
  ggtitle(
    expression("Baltimore city "*PM[2.5]*" decreases across all measured levels from 1999 to 2008")
  ) +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5)) +
  stat_regline_equation(label.x = 1999, label.y = -5)

dev.off()