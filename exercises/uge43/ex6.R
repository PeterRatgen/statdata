library("readxl")

dataa <- read_excel("./Basketbold scoringer.xlsx")

data_stac <- stack(dataa)
colnames(data_stac) <- c("Scoring", "Spiller")

library(dplyr)
group_by(data_stac, Spiller)%>%
  summarize(
    count = n(),
    mean = mean(Scoring),
    sd = sd(Scoring),
    var = var(Scoring)
  )

library("ggpubr")
boxplot(Scoring~Spiller, data=data_stac,
  names = c("Michael", "Damon", "Allen"))

Anov <- aov(Scoring~Spiller, data=data_stac)
summary(Anov)

