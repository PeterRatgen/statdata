download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData") 

load("bdims.RData")

mdims <- subset(bdims, sex == 1)
fdims <- subset(bdims, sex == 0)

pdf("mdims_height.pdf", height = 10, width = 10)
hist(mdims$hgt)
dev.off()

pdf("fdims_height.pdf", height = 10, width = 10)
hist(fdims$hgt)
dev.off()

fhgtmean <- mean(fdims$hgt)
fhgtsd  <- sd(fdims$hgt)

hist(fdims$hgt, probability = TRUE)
x <- 140:190
y <- dnorm(x = x, mean = gfhtmean, sd = fhgtmean)
lines(x = x, y = y, col = "blue")
