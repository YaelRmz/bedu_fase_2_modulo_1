install.packages("rvest")
install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
install.packages("ggplot2")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
dim(DataDB)
head(DataDB)

library(dplyr)
lenguage.spanish <-  DataDB %>% 
  filter(Language == "Spanish") 
head(lenguage.spanish)

library(ggplot2)
ggplot(data=lenguage.spanish, aes(x=Percentage, y=CountryCode, fill=IsOfficial)) +
  geom_bar(stat="identity")

library(rvest)
theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file <- read_html(theurl)
tables <- html_nodes(file, "table")
table1 <- html_table(tables[1], fill = TRUE)
table <- na.omit(as.data.frame(table1))
head(table)
table$Sueldo = gsub('[a-zA-Z$/,]', '', table$Sueldo)
head(table)
summary(table)
table$Sueldo <- as.numeric(table$Sueldo)
head(table)
table[which.max(table$Sueldo),]
table[which.min(table$Sueldo),]
