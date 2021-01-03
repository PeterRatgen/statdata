library(readxl)
bar <- read_excel("./bar.xls")
plot(bar)

pdf("abline.pdf", width = 10, height = 10)
attach(bar)
plot(Alder, Beløb, main = "Forbrug", xlab="Alder", ylab="Beløb i baren", pch = 19)
abline(lm(Beløb~Alder), col="Blue")
dev.off()

lmBar <- lm(Beløb~Alder, data=bar )
summary(lmBar)

pdf("residualer.pdf", width = 10, height = 10)
plot(lmBar$residuals)
dev.off()

fridge <- read_excel("./regression_fridge.xlsx")

pdf("fridge_plot.pdf", width = 10, height = 10)
attach(fridge)
plot(pris, volumen, main = "Volumen for køleskabe", xlab="Pris", ylab="Volumen", pch = 19)
abline(lm(volumen~pris), col="Blue")
dev.off()

lmsum <- lm(volumen~pris)
summary(lmsum)

pdf("fridge_residuals.pdf", width = 10, height = 10)
plot(lmsum$residuals)
dev.off()
