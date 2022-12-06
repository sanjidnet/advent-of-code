# Preprocessing
library(data.table)
library(dequer) # library for stack data structure
home <- Sys.getenv("ADVENT_OF_CODE_HOME")
dta_stack <- readLines(paste0(home, "data/day-05.txt"), n = 9)
dta_move <- data.table::fread(paste0(home, "data/day-05.txt"), 
  header = FALSE, fill = TRUE, skip = 9)[, .(Count = V2, Origin = V4, Destination = V6)]
for (col in colnames(dta_move)) data.table::set(dta_move, j=col, value=as.numeric(dta_move[[col]]))
stack_list <- strsplit(dta_stack, "")

return_list_of_stacks <- function(stack_list){ 
  stacks <- NULL
  for (i in 1:length(stack_list[[1]])){
    each_stack <- sapply(stack_list, "[[", i)
    if(is.na(as.numeric(tail(each_stack, 1)))) next
    stacks <- c(stacks, dequer::as.stack(lapply(each_stack[each_stack != " "], identity)))}
  return(stacks)}

# PART 1
stacks_part1 <- return_list_of_stacks(stack_list)
message("Part 1 Answer: ")
for(i in 1:dim(dta_move)[1]){
  for(each_move in 1:dta_move[i]$Count){
    value <- dequer::pop(stacks_part1[[dta_move[i]$Origin]])
    dequer::push(stacks_part1[[dta_move[i]$Destination]], value)}}
for(printer in 1:length(stacks_part1)) cat(dequer::pop(stacks_part1[[printer]]))

# PART 2
stacks_part2 <- return_list_of_stacks(stack_list) # couldn't find a deep copy option in R. 
message("\nPart 2 Answer: ")
for(i in 1:dim(dta_move)[1]){
  transient_queue <- dequer::stack()
  for(each_move in 1:dta_move[i]$Count){
    dequer::push(transient_queue, dequer::pop(stacks_part2[[dta_move[i]$Origin]]))}
  for(each_move in 1:dta_move[i]$Count){
    dequer::push(stacks_part2[[dta_move[i]$Destination]], dequer::pop(transient_queue))}}
for(printer in 1:length(stacks_part2)) cat(dequer::pop(stacks_part2[[printer]]))
