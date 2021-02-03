library(ggplot2)
library(reshape2)
#1
dbinom(x = 10, size = 35, prob = 0.51)
#2
pbinom(q = 10, size = 35, prob = 0.49)
#3
qbinom(p = 0.5, size = 35, prob = 0.51)
#4
set.seed(4857)
muestra <- rbinom(n = 1000, size = 35, prob = 0.51)
df1 <- as.data.frame(table(muestra)/length(muestra))
names(df1) <- c("Exitos", "FR")
df2 <- melt(df1)
ggplot(df2, aes(x = Exitos, y = value, fill = variable)) + 
  geom_bar (stat="identity", position = "dodge")


x <- seq(-4, 4, 0.01)*6 + 110
y <- dnorm(x, mean = 110, sd = 7)
#1
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 110, " y ", sigma == 7)))
#2
pnorm(q = 140, mean = 110, sd = 7, lower.tail = FALSE)
#3
b <- qnorm(p = 0.95, mean = 110, sd = 7)
pnorm(b, 110, 7)
#4
set.seed(7563)
muestra <- rnorm(n = 1000, mean = 110, sd = 7)
mdf <- as.data.frame(muestra)
ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.3,
                 binwidth = 3) + 
  geom_density(aes(y = 3*..count..))+
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))

