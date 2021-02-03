install.packages("mongolite")
library(mongolite)

#Importacion de los datos
dataSoccer <- data.table::fread("data.csv")
#Creando la conexion, base de datos y coleccion
#Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match
myCollection = mongo(collection = "match", db = "match_games")
myCollection$insert(dataSoccer)
#realizar un count para conocer el numero de registros que se tiene en la base
myCollection$count()
#Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el numero de goles que metio el 
#Real Madrid el 20 de diciembre de 2015 y contra que equipo jugo, perdio o fue goleada?
query = myCollection$find('{"HomeTeam" : "Real Madrid", "Date" : "2015-12-20" }')
#158 2015-12-20 Real Madrid Vallecano   10    2   H - Goliza! Hala Madrid!
myCollection$drop()
myCollection$disconnect()
