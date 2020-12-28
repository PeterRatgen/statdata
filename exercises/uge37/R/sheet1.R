eksempel <- rnorm(500, mean = 70, sd = 15)
pdf("plot.pdf")
plot(hist(eksempel,
        main = "500 samples mean 70 and a standard deviation of 15",
        xlab = "name of the variable its", xlim = c(40, 100),
        col = "blue"))
dev.off()

# Opgave 2

kunder <- c(72, 89, 78, 87, 86, 40, 73, 83, 77, 82, 70, 60, 63, 56, 59, 72, 44,
            28, 68, 69, 98, 52, 68, 74, 53, 84, 81, 77, 73, 71)

pdf("opg2plot.pdf")
plot(hist(kunder, , breaks = 9), ylab = "Antal kunder", xlab = "Dage")
dev.off()

mean <- mean(kunder)
sd(kunder)/sqrt(length(kunder))
median(kunder)
sd(kunder)
var(kunder)
length(kunder)
summary(kunder)
sum(kunder)

error <- qnorm(0.975)*sd(kunder)/sqrt(length(kunder))
mean-error
mean+error

#kvartilafstand
80.25-60.75

pdf("opg21plot.pdf")
boxplot(kunder, xlab = "Antal kunder", col = "blue", horizontal = TRUE, 
        main = "Antal kunder i buikken per dag")
dev.off()

korrekte <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
korrektesvar <- c(0, 0, 0, 15, 119, 552, 1451, 2490, 2808, 2265, 1210, 407, 122, 24, 2, 0)

mean(sum(korrekte * korrektesvar)/sum(korrektesvar))
sd(korrektesvar)
pdf("opg3plot.pdf")
barplot(korrektesvar, names.arg=korrekte, xlab = "Korrekte svar", ylab = "Frekvens")                   
dev.off()


# Opgave 4

opkaldstid  <- c(7.0, 6.9, 8.2, 7.8, 7.7, 7.3, 6.8, 6.7, 8.2, 8.4, 7.0, 6.7, 7.5, 7.2, 7.9, 7.6, 6.7, 6.3, 6.6, 5.6, 7.8, 5.5, 6.2, 5.8, 6.1, 5.8, 6.0, 7.3, 7.5, 7.3, 7.2, 7.4, 7.2, 7.6)

mean(opkaldstid) 
summary(opkaldstid)

pdf("opg4plot.pdf")
stripchart(opkaldstid)
dev.off()

