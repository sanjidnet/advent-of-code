# Preprocessing
elf_calories <- data.table::fread(
  "C:/Users/SanjidRahman/projects/advent-of-code/2022/data/day-01.txt")[, .(
    Input = V1)]
elf_calories[1, elf_id := 0]
elf_calories[is.na(Input), elf_id := .I]
elf_calories[, elf_id := data.table::nafill(elf_id, "locf")]

calories_summary <- elf_calories[
  , .(Calories = sum(Input, na.rm = TRUE)), by = elf_id][
    order(Calories, decreasing = TRUE)]

# PART 1
message("Part 1 Answer: ", calories_summary[1]$Calories)
# PART 1 Answer: 70698

# PART 2
message("Part 2 Answer: ", sum(calories_summary[1:3]))
# PART 2 Answer: 206922
