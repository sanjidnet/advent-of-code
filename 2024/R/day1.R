# Preprocessing
library(data.table)
dta <- data.table::fread(paste0("../data/day1/input"), header = FALSE)

output <- data.table(cbind(sort(dta[,V1]), sort(dta[, V2])))
output[, diff := abs(V2 - V1)]
sum(output$diff)
