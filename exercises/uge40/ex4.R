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
