library(dplyr)

#Carga del archivo
dataSoccer <- read.csv(file = "SP1.csv")
#Seleccion de variables de interes
dataSoccer <- select(dataSoccer, FTHG, FTAG)
#Conversion de DF a table
tableSoccer <- table(dataSoccer)
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles
rowSums(tableSoccer) / margin.table(tableSoccer)
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles
colSums(tableSoccer) / margin.table(tableSoccer)
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles 
prop.table(tableSoccer)