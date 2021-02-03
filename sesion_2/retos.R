 library(DescTools)

set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

mean(x)
median(x)
Mode(x)

quantile(x, seq(0.1,0.9, by = 0.1))

IQR(x)
var(x)
sd(x)


str(mtcars)
summary(mtcars)
head(mtcars)
View(mtcars)

library(dplyr)
setwd("/Users/yaelrmz/Documents/curso_bedu/fase_2/sesion_2/files/")

u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

download.file(url = u1011, destfile = "SP1-1011.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-1112.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-1213.csv", mode = "wb")
download.file(url = u1314, destfile = "SP1-1314.csv", mode = "wb")

lista <- lapply(dir(), read.csv)
lista <- lapply(lista, select, Date:FTR)
data <- do.call(rbind, lista)
head(data)
dim(data)
