library(dplyr)

#Carga de archivos
archivesName <- list(
  "SP1-2015.csv",
  "SP1-2016.csv",
  "SP1-2017.csv",
  "SP1-2018.csv",
  "SP1-2019.csv"
)
dataSoccer <- list()
for (i in 1:length(archivesName)) {
  dataSoccer[[i]] <- read.csv(file = archivesName[[i]])
}
#dataSoccer <- list(read.csv(file = "SP1-2017.csv"), read.csv(file = "SP1-2018.csv"), read.csv(file = "SP1-2019.csv"))
#Obten una mejor idea de las caracteristicas de los data frames al usar las funciones: str, head, View y summary
lapply(dataSoccer, str)
lapply(dataSoccer, head)
lapply(dataSoccer, View)
lapply(dataSoccer, summary)
#Con la funcion select del paquete dplyr selecciona unicamente las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada uno de los data frames
for (i in 1:length(dataSoccer)) {
  dataSoccer[[i]] <- select(dataSoccer[[i]], Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
}
#Asegurate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo (Hint 1: usa as.Date y mutate para arreglar las fechas)
for (i in 1:3) {
  dataSoccer[[i]] <- mutate(dataSoccer[[i]], Date = as.Date(dataSoccer[[i]]$Date, format = "%d/%m/%y"))
}
for (i in 4:5) {
  dataSoccer[[i]] <- mutate(dataSoccer[[i]], Date = as.Date(dataSoccer[[i]]$Date, format = "%d/%m/%Y"))
}
#Con ayuda de la funcion rbind forma un unico data frame que contenga las seis columnas mencionadas en el punto 3
dataFrameSoccer <- do.call("rbind", dataSoccer)
write.csv(dataFrameSoccer, file = "dataSoccer.csv")
