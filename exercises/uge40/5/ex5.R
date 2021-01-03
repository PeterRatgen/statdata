download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData") 

load("ames.RData") 

area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
pdf("area_hist.pdf", width = 10, height = 10)
hist(area)
dev.off()
