library(dplyr)

#Carga del archivo
probMargHG <- read.csv(file = "probMargHG.csv")
probMargAG <- read.csv(file = "probMargAG.csv")
probConHGAG <- read.csv(file = "probConHGAG.csv")

#Obten una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes
nrow(probConHGAG)
ncol(probConHGAG)

cocientes = c()
for (i in 1:nrow(probConHGAG)) {
  for (j in 2:ncol(probConHGAG)) {
    cocientes[(i - 1) * (ncol(probConHGAG) - 1)  + (j - 1)] <- probConHGAG[i,j] / probMargAG$x[j - 1] * probMargHG$x[i]
  }
}
