library(ggplot2)
library(dplyr)
set("/Users/yaelrmz/Documents/curso_bedu/fase_2/sesion_3")

alturas <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep = ";")

hist(alturas$Altura)
alturas %>% ggplot() + 
  aes(Altura) + 
  geom_histogram(binwidth = 5)

nba <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-02/players_stats.csv")
#1
nba %>% ggplot() + 
  aes(MIN) + 
  geom_histogram(binwidth = 10) +
  geom_vline(xintercept = mean(nba$MIN))
#2
nba %>% ggplot() + 
  aes(Age) + 
  geom_histogram(binwidth = 5) +
  geom_vline(xintercept = mean(na.omit(nba$Age)))
#3
sizes <- nba %>% ggplot() + 
  aes(x = Weight, y = Height) + 
  geom_point() + 
  geom_smooth(method = "lm", se = T)
#4
tallest <- nba$Name[which.max(nba$Height)]
paste("El jugador mas alto es: ", tallest)
#5
smallest <- nba$Name[which.min(nba$Height)]
paste("El jugador mas pequeño es: ", tallest)
#6
paste("La altura promedio es: ", mean(na.omit(nba$Age)))
#7
nba %>% ggplot() + 
  aes(AST, TOV, PTS) + 
  geom_point() + 
  facet_wrap("Pos")
