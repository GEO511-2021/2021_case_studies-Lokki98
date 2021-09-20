library(tidyverse)
dataurl <- "D://R//tmp//2021_case_studies-Lokki98//week_02//station.csv"
temp <- read.table(dataurl,header = T,sep = ",")
view(temp)
JJA <- temp$J.J.A
median_JJA <- median(temp$J.J.A)
median_JJA
JJA[JJA == 999.90] <- median_JJA
JJA
ggplot(temp,aes(x = YEAR,y = JJA)) +
  geom_path() +
  geom_smooth(method = 'loess',formula = 'y ~ x') +
  ggtitle("Mean Summer Temperature in BUFFALO NY") +
  xlab("YEAR") +
  ylab("Mean Summer Temperature") +
  labs(subtitle = "summer includes June,July and August 
Data from the Global Historical Climate
Network Redline is a LOESS match")
ggsave("D://R//tmp//2021_case_studies-Lokki98//week_02//temp_sum.png",device = "png",
       width = 3.9,height = 3.6)
      

