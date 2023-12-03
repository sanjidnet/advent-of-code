library(data.table)
dta <- data.table::fread(paste0("../data/day3/input"), sep = "\t", header = FALSE)
raw_text <- readLines("../data/day3/input")
raw_matrix <- Reduce("rbind", sapply(raw_text, strsplit, ""))
running_total <- 0
for (i in 1:dim(dta)[1]) {
  numbers <- grep("[0-9]+", unlist(strsplit(dta$V1[i], "[^0-9]")), value = TRUE)

  for (each_number in numbers){
    starting_index <- grepRaw(each_number, dta$V1[i], fixed = TRUE)
    ending_index <- starting_index + nchar(each_number) - 1
    
    tryCatch(
    focus_matrix <- raw_matrix[
      ifelse(i == 1, 1, i - 1) : 
        ifelse(i == dim(raw_matrix)[1], dim(raw_matrix)[1], i + 1), 
      ifelse(starting_index == 1, 1, starting_index - 1) : 
        ifelse(ending_index == dim(raw_matrix)[2], dim(raw_matrix)[2], ending_index + 1)],
    warning = function(w) message("Wait! Something's not right in line ", i)
    )
    
    dta[i]$V1 <- sub(each_number, paste(rep(0, nchar(each_number)), collapse = ""), dta[i]$V1)
    
    if(length(grep("[0-9]|[.]", focus_matrix, invert = TRUE))) running_total <- running_total + as.numeric(each_number)
  }
}

# PART 1
message(running_total)

# PART 2

