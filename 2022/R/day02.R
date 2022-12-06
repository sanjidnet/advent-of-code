# Preprocessing
library(data.table)
home <- Sys.getenv("ADVENT_OF_CODE_HOME")
dta <- data.table::fread(paste0(home, "data/day-02.txt"), header = FALSE)[, .(
  Opponent = V1, Part1_Me = V2)]

# PART 1
dta[Opponent == "A" & Part1_Me == "X", `:=`(Score = 3, Shape = 1)]
dta[Opponent == "A" & Part1_Me == "Y", `:=`(Score = 6, Shape = 2)] #
dta[Opponent == "A" & Part1_Me == "Z", `:=`(Score = 0, Shape = 3)] 

dta[Opponent == "B" & Part1_Me == "X", `:=`(Score = 0, Shape = 1)] # 
dta[Opponent == "B" & Part1_Me == "Y", `:=`(Score = 3, Shape = 2)] #
dta[Opponent == "B" & Part1_Me == "Z", `:=`(Score = 6, Shape = 3)] #

dta[Opponent == "C" & Part1_Me == "X", `:=`(Score = 6, Shape = 1)] #
dta[Opponent == "C" & Part1_Me == "Y", `:=`(Score = 0, Shape = 2)] #
dta[Opponent == "C" & Part1_Me == "Z", `:=`(Score = 3, Shape = 3)] #

dta[, Total_Score := Score + Shape]

message("Part 1 Answer: ", sum(dta$Total_Score))
# PART 1 Answer: 10816

# PART 2
dta[, Part2_Outcome := Part1_Me]
dta[Opponent == "A" & Part2_Outcome == "X", `:=`(Score = 0, Shape = 3)]
dta[Opponent == "A" & Part2_Outcome == "Y", `:=`(Score = 3, Shape = 1)] #
dta[Opponent == "A" & Part2_Outcome == "Z", `:=`(Score = 6, Shape = 2)] 

dta[Opponent == "B" & Part2_Outcome == "X", `:=`(Score = 0, Shape = 1)] # 
dta[Opponent == "B" & Part2_Outcome == "Y", `:=`(Score = 3, Shape = 2)] #
dta[Opponent == "B" & Part2_Outcome == "Z", `:=`(Score = 6, Shape = 3)] #

dta[Opponent == "C" & Part2_Outcome == "X", `:=`(Score = 0, Shape = 2)] #
dta[Opponent == "C" & Part2_Outcome == "Y", `:=`(Score = 3, Shape = 3)] #
dta[Opponent == "C" & Part2_Outcome == "Z", `:=`(Score = 6, Shape = 1)] #

dta[, Total_Score := Score + Shape]
message("Part 2 Answer: ", sum(dta$Total_Score))
# PART 2 Answer: 11657
