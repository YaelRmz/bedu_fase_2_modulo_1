library(dplyr)

#Carga de archivos
archivesName <- list(
  "SP1-2017.csv",
  "SP1-2018.csv",
  "SP1-2019.csv"
)
dataSoccer <- list()
for (i in 1:length(archivesName)) {
  dataSoccer[[i]] <- read.csv(file = archivesName[[i]])
}
#Seleccion de variables de interes
for (i in 1:length(dataSoccer)) {
  dataSoccer[[i]] <- select(dataSoccer[[i]], Date, HomeTeam, AwayTeam, FTHG, FTAG)
}
#Conversion de char a Date
for (i in 1:length(dataSoccer)) {
  dataSoccer[[i]] <- mutate(dataSoccer[[i]], Date = as.Date(dataSoccer[[i]]$Date, format = "%d/%m/%y"))
}
#Un unico data frame
dataFrameSoccer <- do.call("rbind", dataSoccer)
write.csv(dataFrameSoccer, file = "soccer.csv", row.names = FALSE)
