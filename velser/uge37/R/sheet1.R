eksempel <- rnorm(500, mean = 70, sd = 15)
his <- plot(hist(eksempel,
            main = "500 samples mean 70 and a standard deviation of 15",
           xlab = "name of the variable its", xlim = c(40, 100),
           col = "blue"))
quartz.save(his, type = "pdf")

# Opgave 2

kunder <- c(72, 89, 78, 87, 86, 40, 73, 83, 77, 82, 70, 60, 63, 56, 59, 72, 44,
            28, 68, 69, 98, 52, 68, 74, 53, 84, 81, 77, 73, 71)

## Deskriptiv statistik
  # Histogram eller et timeseries.
  #hist(kunder, main = "Histogram over kunder", xlab = "Antal kunder/ dag"
  theplot <- plot(ts(kunder), ylab = "Antal kunder", xlab = "Dage")
  quartz.save(theplot, type = "pdf")
  # calculating descriptive statistics
  # setting up a confidence interval (95% here)
  # setting up a box plot and investigating for outliers
