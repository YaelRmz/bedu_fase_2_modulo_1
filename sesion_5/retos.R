
mediciones <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-05/Reto-01/datoslineal.csv")
#1
plot(mediciones$x, mediciones$y, xlab = "Tamaño de ejecución", 
     ylab = "Tiempo de ejecución", pch = 16)
#2
m1 <- lm(mediciones$y~mediciones$x) # Y ~ X
summary(m1)
plot(mediciones$x, mediciones$y, xlab = "Tamaño de ejecución", 
     ylab = "Tiempo de ejecución", pch = 16)
abline(lsfit(mediciones$y, mediciones$x))
mtext(expression(paste('Modelo de regresión lineal simple:',
                       ' ',
                       y[i] == beta[0] + beta[1]*x[i] + e[i])),
      side = 3, adj=1, font = 2)
#3
anova(m1)
par(mfrow = c(2, 2))
plot(m1)
dev.off()