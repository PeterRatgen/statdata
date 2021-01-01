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

pdf("normal_fhgt.pdf", height = 10, width = 10)
hist(fdims$hgt, probability = TRUE, ylim = c(0, 0.06))
x <- 140:190
y <- dnorm(x = x, mean = fhgtmean, sd = fhgtsd)
lines(x = x, y = y, col = "blue")
dev.off()

pdf("normal_fhgt_fit.pdf", height = 10, width = 10)
qqnorm(fdims$hgt)  
qqline(fdims$hgt)  
dev.off()

sim_norm <- rnorm(n = length(fdims$hgt), mean = fhgtmean, sd = fhgtsd) 

pdf("sim_fhgt_fit.pdf", height = 10, width = 10)
qqnorm(sim_norm)  
qqline(sim_norm)  
dev.off()



fwgtmean <- mean(fdims$wgt)
fwgtsd  <- sd(fdims$wgt)

pdf("normal_fwgt.pdf", height = 10, width = 10)
hist(fdims$wgt, probability = TRUE, ylim = c(0, 0.06))
x <- 40:90
y <- dnorm(x = x, mean = fwgtmean, sd = fwgtsd)
lines(x = x, y = y, col = "blue")
dev.off()

pdf("normal_fwgt_fit.pdf", height = 10, width = 10)
qqnorm(fdims$wgt)  
qqline(fdims$wgt)  
dev.off()
