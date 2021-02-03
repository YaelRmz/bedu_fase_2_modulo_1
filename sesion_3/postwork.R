library(dplyr)
library(ggplot2)

#Carga de archivos
dataSoccer <- read.csv(file = "dataSoccer.csv")
#Seleccion de variables de interes
dataSoccer <- select(dataSoccer, FTHG, FTAG)
#Conversion de DF a table
tableSoccer <- table(dataSoccer)
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles
probMargHG <- rowSums(tableSoccer) / margin.table(tableSoccer)
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles
probMargAG <- colSums(tableSoccer) / margin.table(tableSoccer)
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles 
probConHGAG <- prop.table(tableSoccer)
#Un grafico de barras para las probabilidades marginales estimadas del numero de goles que anota el equipo de casa
barplot(probMargHG,
     main = "Equipo de casa",
     xlab = "Goles", 
     ylab = "Probabilidad marginal", 
     )
#Un grafico de barras para las probabilidades marginales estimadas del numero de goles que anota el equipo visitante
barplot(probMargAG,
        main = "Equipo de visita",
        xlab = "Goles", 
        ylab = "Probabilidad marginal", 
)
#Un HeatMap para las probabilidades conjuntas estimadas de los numeros de goles que anotan el equipo de casa y el equipo visitante en un partido.
heatmap(probConHGAG)

write.csv(probMargHG, file = "probMargHG.csv")
write.csv(probMargAG, file = "probMargAG.csv")
write.csv(probConHGAG, file = "probConHGAG.csv")