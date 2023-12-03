# Preprocessing
library(data.table)
dta <- data.table::fread(paste0("../data/day1/input"), header = FALSE)

mega_sum <- 0
for (i in 1:dim(dta)[1]) {
  
  # PART 2 pre-processing
  dta[i]$V1 <- gsub("zero", "zero0zero", dta[i]$V1)
  dta[i]$V1 <- gsub("one", "one1one", dta[i]$V1)
  dta[i]$V1 <- gsub("two", "two2two", dta[i]$V1)
  dta[i]$V1 <- gsub("three", "three3three", dta[i]$V1)
  dta[i]$V1 <- gsub("four", "four4four", dta[i]$V1)
  dta[i]$V1 <- gsub("five", "five5five", dta[i]$V1)
  dta[i]$V1 <- gsub("six", "six6six", dta[i]$V1)
  dta[i]$V1 <- gsub("seven", "seven7seven", dta[i]$V1)
  dta[i]$V1 <- gsub("eight", "eight8eight", dta[i]$V1)
  dta[i]$V1 <- gsub("nine", "nine9nine", dta[i]$V1)
  
  # PART 1
  values <- grep("[[:digit:]]", unlist(strsplit(dta[i]$V1, "")), value = TRUE)
  mini_sum <- as.numeric(paste0(values[1], values[length(values)]))
  
  mega_sum <- mega_sum + mini_sum
}

message(mega_sum)
