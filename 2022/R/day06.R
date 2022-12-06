# Preprocessing
library(data.table)
home <- Sys.getenv("ADVENT_OF_CODE_HOME")
dta <- readLines(paste0(home, "data/day-06.txt"))
chars <- unlist(strsplit(dta, ""))

solve_puzzle <- function(i){
  offset_by <- i - 1
  while (i < length(chars)) {
    stream_in_question <- chars[(i-offset_by):i]
    if(any(duplicated(stream_in_question))){
      i <- i + 1
    }else return(i)}}

message("Part 1 Answer: ", solve_puzzle(i = 4))
message("Part 2 Answer: ", solve_puzzle(i = 14))
