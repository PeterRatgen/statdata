co2  <- read.csv("CO2.csv", sep = ";", row.names = NULL)

h <- hist(co2$CO2)
pdf("co2plot.pdf", width = 10, height = 8)
plot(h, xlab = "CO2 udledning per indbygger", ylab = "Frekvens"
     , main = "Histogram af CO2 udledning per indbygger", col = "blue")
dev.off()

pdf("co2boxplot.pdf", width = 10, height = 4)
boxplot(co2$CO2, main = "CO2 udledning i ton per indbygger per land"
        , col = "blue", horizontal = TRUE
        , xlab = "CO2 udledning i ton per indbygger"
        , ylab = "Land", boxwex = 1.5)
dev.off()

#lande der ligger uden for 1.5 IRQ (potentielle outliers)
for (i in 1:length(co2$CO2)) {
  if (co2$CO2[i] > 6.6646 + (6.6646 - 0.828) *  1.5) {
    print(co2$Country[i])
    print(co2$CO2[i])
  }
}

# Deskriptiv analyse
#standardafvigelse
sd(co2$CO2)
summary(co2$CO2)

#standard error
sd(co2$CO2) / length(co2$CO2)
var(co2$CO2)
