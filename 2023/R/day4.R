library(data.table)
dta <- data.table::fread(paste0("../data/day4/input"), sep = "\t", header = FALSE)
dta[, c("card", "values") := tstrsplit(V1, ": ")]; dta[, V1 := NULL]
dta[, c("win", "given") := tstrsplit(values, " | ", fixed = TRUE)]; dta[, values := NULL]
dta[, c("win", "given") := lapply(.SD, FUN = function(x) strsplit(trimws(x), "[[:space:]]+")), .SDcols = c("win", "given")]
dta[, count := 0]

for(p in 1:dim(dta)[1]){
  for (i in as.numeric(unlist(dta[p]$given))){
    for(j in as.numeric(unlist(dta[p]$win))){
      if(i == j) dta[p, count := count + 1]
    }
  }
}

dta[, point := ifelse(count == 0, 0, 2 ^ (count - 1))]

message(sum(dta$point))

