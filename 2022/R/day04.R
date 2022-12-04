# Preprocessing
library(data.table)
dta <- data.table::fread(
  "C:/Users/SanjidRahman/projects/advent-of-code/2022/data/day-04.txt", header = FALSE)[, .(
    Input1 = V1, Input2 = V2)]
dta[, c("Input1_Min", "Input1_Max") := tstrsplit(Input1, "-")]
dta[, c("Input2_Min", "Input2_Max") := tstrsplit(Input2, "-")]

# Convert columns to numeric
for (col in c("Input1_Min", "Input1_Max", "Input2_Min", "Input2_Max")){
  data.table::set(dta, j=col, value=as.numeric(dta[[col]]))
} 

# PART 1
message("Part 1 Answer: ", dim(
  dta[(Input1_Min <= Input2_Min & Input1_Max >= Input2_Max) |
        (Input2_Min <= Input1_Min & Input2_Max >= Input1_Max)])[1])
# PART 1 Answer: 483

# PART 2
message("Part 2 Answer: ", dim(
  dta[!(Input1_Max < Input2_Min | Input2_Max < Input1_Min)])[1])
# PART 2 Answer: 874
