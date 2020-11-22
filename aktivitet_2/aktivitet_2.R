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

plot(record$CAREDAYS, record$TREATCOST)

linearModel <-lm(record$TREATCOST~record$CAREDAYS)
summary(linearModel)

pdf("plots/caredaysResiduals.pdf", width = 10, height = 8)
plot(linearModel$residuals)
dev.off()

library(ggcorrplot)

corretlationMatrix <- cor(record[,c(2:12)])
corretlationMatrix = round(corretlationMatrix, 2)

pdf("plots/corretlationMatrix.pdf", width = 10, height = 10)
ggcorrplot(corretlationMatrix, type = "lower",  lab = TRUE)
dev.off()

pdf("./plots/elim1.pdf", width = 10, height = 10)
# fulde model R2_adj 0.8859
elim1 <- lm(TREATCOST~MEDICINE+LAB+XRAY+INHALATOR+STATUS+CAREDAYS+INTENSIVEDAYS+AGE+GENDER+INSURANCE, data = record)
plot(elim1$residuals)
dev.off()
summary(elim1)

elim2 <- lm(TREATCOST~MEDICINE+LAB+XRAY+INHALATOR+CAREDAYS+INTENSIVEDAYS+AGE+GENDER+INSURANCE, data = record)
plot(elim2$residuals)
summary(elim2)
# status 0.8867

elim3 <- lm(TREATCOST~MEDICINE+LAB+XRAY+INHALATOR+CAREDAYS+INTENSIVEDAYS+GENDER+INSURANCE, data = record)
plot(elim3$residuals)
summary(elim3)
# AGE 0.8874

pdf("./plots/elim4.pdf", width = 10, height = 10)
elim4 <- lm(TREATCOST~MEDICINE+LAB+XRAY+INHALATOR+CAREDAYS+INTENSIVEDAYS+INSURANCE, data = record)
plot(elim4$residuals)
dev.off()
summary(elim4)
# GENDER 0.888


inregion <- record[,c(6,13)]
print(inregion)

region1 <- subset(inregion, REGION == 1)
region2 <- subset(inregion, REGION == 2)
region3 <- subset(inregion, REGION == 3)

hist(region1$INHALATOR)





