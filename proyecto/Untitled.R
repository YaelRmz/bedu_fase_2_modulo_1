library(dplyr)
library(ggplot2)

#dataCovid <- read.csv(file = "owid-covid-data.csv")
dataCovid <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")
dataCovid <- dataCovid %>% select(location, date, new_cases, people_vaccinated)
dataCovidFilter <- dataCovid %>% filter(people_vaccinated > 0)
dataCovidFilter <- dataCovidFilter %>% filter(location != "World")

dataCovidFilter$date = as.Date(dataCovidFilter$date, format = "%Y-%m-%d")

dataCovidFilter %>%
  group_by(location) %>%
  ggplot(aes(x = date, y = people_vaccinated, color = location)) +
  geom_line(size = 1) + 
  geom_point(size = 1.5)

dataCovidFilter %>%
  group_by(location, date) %>%
  ggplot(aes(x = date, y = new_cases, color = location)) +
  geom_line(size = 1) + 
  geom_point(size = 1.5)

orderedDataCovid <- dataCovidFilter[order(dataCovidFilter$people_vaccinated, decreasing = TRUE),]
dataCovidUnique <- orderedDataCovid[match(unique(orderedDataCovid$location), orderedDataCovid$location),]
topDataCovidUnique <- dataCovidUnique[1:10,]
topDataCovid <- dataCovidFilter %>% filter(location %in% topDataCovidUnique$location)

topDataCovid %>%
  group_by(location) %>%
  ggplot(aes(x=date, y=people_vaccinated, color=location)) +
  geom_line(size=1) + 
  geom_point(size=1.5)

topDataCovid %>%
  group_by(location, date) %>%
  ggplot(aes(x=date, y=new_cases, color=location)) +
  geom_line(size=1) + 
  geom_point(size=1.5)
