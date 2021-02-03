setwd("/Users/yaelrmz/Documents/curso_bedu/fase_2/sesion_1/")

netflix <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")
dim(netflix)
typeof(netflix)
net.2015 <- netflix[netflix$release_year > 2015,]
write.csv(x=net.2015, file="res.netflix.csv")