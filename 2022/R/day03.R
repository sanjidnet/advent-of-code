# Preprocessing
dta <- data.table::fread(
  "C:/Users/SanjidRahman/projects/advent-of-code/2022/data/day-03.txt", 
  header = FALSE)[, .(
    Input = V1)]
letter_ref <- data.table::data.table(
  LETTER_REFERENCE = c(letters, LETTERS), NUMERIC_LETTER = 1:52)

# PART 1
dta[, Count := nchar(Input)]
dta[, FIRST := substr(Input, 1, ceiling(Count/2))]
dta[, SECOND := substr(Input, ceiling(Count/2) + 1, Count)]

for(i in 1:dim(dta)[1]){
  dta[i, LETTER_PART1 := unique(grep(
    paste(unlist(strsplit(FIRST, "")), collapse = "|"),
    unlist(strsplit(SECOND, "")), value = TRUE))]
}

dta <- merge(dta, letter_ref, 
  by.x = "LETTER_PART1", by.y = "LETTER_REFERENCE", sort = FALSE)

message("Part 1 Answer: ", sum(dta$NUMERIC_LETTER))
# PART 1 Answer: 7863

# PART 2
dta[, GROUP := paste0("COL", rep(1:3, 100))]

dta_part2 <- cbind(
  dta[GROUP == "COL1", .(GROUP1 = Input)], 
  dta[GROUP == "COL2", .(GROUP2 = Input)],
  dta[GROUP == "COL3", .(GROUP3 = Input)])

for(i in 1:dim(dta_part2)[1]){
  dta_part2[i, NEW_LET := intersect(intersect(
  unique(unlist(strsplit(GROUP1, ""))), 
  unique(unlist(strsplit(GROUP2, "")))),
  unique(unlist(strsplit(GROUP3, ""))))]
}

dta_part2 <- merge(dta_part2, letter_ref, by.x = "NEW_LET", by.y = "LETTER_REFERENCE", sort = FALSE)
message("Part 2 Answer: ", sum(dta_part2$NUMERIC_LETTER))
# PART 2 Answer: 2488
