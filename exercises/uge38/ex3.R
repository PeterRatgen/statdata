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
barplot(table(kobe_streak))
