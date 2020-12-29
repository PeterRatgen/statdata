download.file("http://www.openintro.org/stat/data/kobe.RData", destfile = "kobe.RData")
load("kobe.RData")
head(kobe)

kobe$basket[1:9]

calc_steak <- function(dataset){
  vec <- c(0)
  for (element in dataset) {
    if ("H" %in% element){
      vec <- replace(vec, length(vec), vec[length(vec)] + 1)
    }
    if ("M" %in% element){
      vec <- append(vec, 0:0)
    }
  }
  return(vec) 
}

kobe_streak <- calc_steak(kobe$basket)
table(kobe_streak)
barplot(table(kobe_streak))

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 133, replace = TRUE)
table(calc_steak(sim_basket))
pdf("sim_barplot.pdf", width = 10, height = 10)
barplot(table(calc_steak(sim_basket)))
dev.off()

sim_kobe_bias <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2,0.8))
table(sim_kobe_bias)
