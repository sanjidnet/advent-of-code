library(data.table)
dta <- data.table::fread(paste0("../data/day3/input"), sep = "\t", header = FALSE)
raw_text <- readLines("../data/day3/input")
raw_matrix <- Reduce("rbind", sapply(raw_text, strsplit, ""))
running_total <- 0

values_table <- data.table(); 
asterisks_table <- data.table(); 

for (i in 1:dim(dta)[1]) {
  numbers <- grep("[0-9]+", unlist(strsplit(dta$V1[i], "[^0-9]")), value = TRUE)
  
  # PART 2
  astericks_index <- which(grepl("[*]", unlist(strsplit(dta$V1[i], ""))) == TRUE)
  if(length(astericks_index)){
    for (j in astericks_index) {
      asterisks_table <- rbind(asterisks_table, t(c(i, j)))
    }
  }
  
  for (each_number in numbers){
    starting_index <- grepRaw(each_number, dta$V1[i], fixed = TRUE)
    ending_index <- starting_index + nchar(each_number) - 1
    
    # PART 2
    values_table <- rbind(values_table, t(c(i, each_number, starting_index, ending_index)))
    
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

setnames(values_table, c("row", "value", "starting_index", "ending_index"))
values_table <- as.data.table(sapply( values_table, as.numeric ))
setnames(asterisks_table, c("row", "index"))
asterisks_table <- as.data.table(sapply( asterisks_table, as.numeric ))

# PART 1
message(running_total)

# PART 2
gear_sum <- 0
for (k in 1:dim(asterisks_table)[1]) {
  asterisks_focus_table <- values_table[ row %in% (
    ifelse(asterisks_table[k]$row == 1, 1, (asterisks_table[k]$row - 1)) : 
      ifelse(asterisks_table[k]$row == dim(raw_matrix)[1], dim(raw_matrix)[1], (asterisks_table[k]$row + 1))) ][
        ending_index >= asterisks_table[k]$index - 1  & starting_index <= asterisks_table[k]$index + 1]
  # message(paste(asterisks_focus_table$value, collapse = "-"))
  if(dim(asterisks_focus_table)[1] > 1){
    if(dim(asterisks_focus_table)[1] > 2) stop("now")
    gear_sum <- gear_sum + prod(as.double(asterisks_focus_table$value))
  }
}
message(gear_sum)
