# Preprocessing
library(data.table)
dta <- data.table::fread(paste0("../data/day2/input"), sep = "\t", header = FALSE)[, tstrsplit(V1, ":")]
dta[, outcome := trimws(V2)]

for (i in 1:dim(dta)[1]) {
  red_temp <- as.numeric(gsub("([0-9]+).*$", "\\1", grep("red", unlist(strsplit(dta[i, ]$outcome, ", |; ")), value = TRUE)))
  green_temp <- as.numeric(gsub("([0-9]+).*$", "\\1", grep("green", unlist(strsplit(dta[i, ]$outcome, ", |; ")), value = TRUE)))
  blue_temp <- as.numeric(gsub("([0-9]+).*$", "\\1", grep("blue", unlist(strsplit(dta[i, ]$outcome, ", |; ")), value = TRUE)))
  
  # PART 1
  if(any(red_temp > 12)){ dta[i, impossible := TRUE] }
  if(any(green_temp > 13)){ dta[i, impossible := TRUE] }
  if(any(blue_temp > 14)){ dta[i, impossible := TRUE] }
  
  # PART 2
  dta[i, power := max(red_temp) * max(green_temp) * max(blue_temp)]
}

# PART 1
message(sum(as.numeric(dta[is.na(impossible), tstrsplit(V1, " ")]$V2)))

# PART 2
message(sum(dta$power))
