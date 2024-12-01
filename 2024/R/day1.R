# Preprocessing
library(data.table)
dta <- data.table::fread(paste0("../data/day1/input"), header = FALSE)

output <- data.table(cbind(sort(dta[,V1]), sort(dta[, V2])))
output[, diff := abs(V2 - V1)]
message("Part 1: ", sum(output$diff))

# Frequency table for part 2
frequency_table <- output[, .N, by = V2]
# JOIN frequency table to actual table
output2 <- merge(output, frequency_table, by.x = "V1", by.y = "V2")
output2[, product := V1 * N]
message("Part 2: ", sum(output2$product))
