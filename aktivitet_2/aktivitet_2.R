record <- read.csv("~/documents/statdata/aktivitet_2/data.csv", sep = ";", header = TRUE)

options(scipen = 10)

# Histogram for TREATCOST
h <- hist(record$TREATCOST)
pdf("treatcost.pdf", width = 10, height = 8);
plot(h, main = "Omkosting for behandling per patient i kr.",
     xlab = "Omkostning per patient i kr.",
      ylab = "Frekvens", col = "blue", xaxt = "n")
axis(side = 1, at = axTicks(1),
    labels = formatC(axTicks(1), format = "d", big.mark = ","))
dev.off()

# Opsummering af data
summary(record[2])
sd(unlist(record[2]))

r <- rnorm(500, mean = 78754, sd = 55608.07)
