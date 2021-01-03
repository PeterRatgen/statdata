library("readxl")
dat <- read_excel("./lalaland_imports.xlsx")

imp <- cor(dat[,c(2:6)])

round(imp,2)

fit <- lm(Imp~MS+GDP+USD+Interest_Rent, data=dat)
summary(fit)
fit <- lm(Imp~GDP+USD+Interest_Rent, data=dat)
summary(fit)
fit <- lm(Imp~GDP+Interest_Rent, data=dat)
summary(fit)
fit <- lm(Imp~GDP+Interest_Rent, data=dat)
summary(fit)
