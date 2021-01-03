download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData") 

load("ames.RData") 

area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
pdf("area_hist.pdf", width = 10, height = 10)
hist(area)
dev.off()

samp1 <- sample(area,50)

pdf("sample_area_hist.pdf", width = 10, height = 10)
hist(samp1)
dev.off()
 
summary(samp1)
mean(samp1)

samp2 <- sample(area,50)
mean(samp2)

mean(sample(area,100))
mean(sample(area,1000))

sample_means10 <- rep(NA, 5000)
sample_means50 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)

for(i in 1:5000) {
  samp <- sample(area,10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area,50)
  sample_means50[i] <- mean(samp)
  samp <- sample(area,100)
  sample_means100[i] <- mean(samp)
}

pdf("sample_means50.pdf", width = 10, height = 10)
hist(sample_means50, breaks=25)
dev.off()

mean(sample_means50)

pdf("sample_means_all.pdf", width = 10, height = 10)
par(mfrow = c(3,1))

xlimits <- range(sample_means10)
hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)
dev.off()

sampPrice <- sample(price, 50)
mean(sampPrice)

sampPrice_mean50 <- rep(NA, 5000)
sampPrice_mean150 <- rep(NA, 5000)

for(i in 1:5000) {
  samp <- sample(price, 50)
  sampPrice_mean50[i] <- mean(samp)
  samp <- sample(price, 150)
  sampPrice_mean150[i] <- mean(samp)
}


pdf("sampPrice_mean50.pdf", width = 10, height = 10)
hist(sampPrice_mean50, breaks = 20)
dev.off()

mean(price)

pdf("sampPrice_mean150.pdf", width = 10, height = 10)
hist(sampPrice_mean150, breaks = 20)
dev.off()

pdf("pricesample_means_all.pdf", width = 10, height = 10)
par(mfrow = c(2,1))

xlimits <- range(sampPrice_mean50)
hist(sampPrice_mean50, breaks = 20, xlim = xlimits)
hist(sampPrice_mean150, breaks = 20, xlim = xlimits)
dev.off()
