record <- read.csv("./data.csv", sep = ";", header = TRUE)

options(scipen = 10)

# Histogram for TREATCOST
h <- hist(record$TREATCOST)
pdf("plots/treatcost.pdf", width = 10, height = 8);
plot(h, main = "Omkosting for behandling per patient i kr.",
     xlab = "Omkostning per patient i kr.",
      ylab = "Frekvens", col = "blue", xaxt = "n")
axis(side = 1, at = axTicks(1),
    labels = formatC(axTicks(1), format = "d", big.mark = ","))
dev.off()

# Opsummering af data
summary(record[2])
sd(unlist(record[2]))

treatMean = mean(unlist(record[2]))
treatSd = sd(unlist(record[2]))

error = qnorm(0.95)*treatSd/sqrt(length(unlist(record[2])))

#venstre
treatMean - error
#højre
treatMean+error

# sandsynligheden for at en behandling koster over 95000 kr
# dette er den teoretiske sandsynlighed 
under95k  <- 1- pnorm(q = 95000, mean = treatMean, sd = treatSd)

# sandsynligheden for at en behandling koster over 95K
sum(record$TREATCOST > 95000)/length(record$TREATCOST)


under40K <- sum(record$TREATCOST < 40000)/length(record$TREATCOST)
over65K <- sum(record$TREATCOST < 65000)/length(record$TREATCOST)

# den endelige sandsynlighed
1 - under40K - over65K


#overblik over data
pdf("plots/caredaysScatterPlot.pdf", width = 10, height = 8)
plot(record$CAREDAYS, record$TREATCOST, pch = 19, xlab = "Dage brugt på hospitalet", ylab = "Behandlingsomkostninger i kr.", main = "Behandlingsomkostninger til antal dage brugt på hospitalet")
dev.off()

pdf("plots/caredaysScatterPlotAbline.pdf", width = 10, height = 8)
plot(record$CAREDAYS, record$TREATCOST, pch = 19, xlab = "Dage brugt på hospitalet", ylab = "Behandlingsomkostninger i kr.", main = "Behandlingsomkostninger til antal dage brugt på hospitalet")
abline(lm(record$TREATCOST~record$CAREDAYS), col = "blue")
dev.off()


linearModel <-lm(record$TREATCOST~record$CAREDAYS)


summary(linearModel)

pdf("plots/caredaysResiduals.pdf", width = 10, height = 8)
plot(linearModel$residuals)
dev.off()


lm(TREATCOST~MEDICINE+LAB+XRAY+INHALATOR+STATUS+CAREDAYS+INTENSIVEDAYS+AGE+GENDER+INSURANCE, data = record)

corretlationMatrix <- cor(record[,c(2:12)])
round(corretlationMatrix, 2)




