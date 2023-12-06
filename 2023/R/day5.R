dta <- readLines("../data/day5/input")

seeds <- as.numeric(unlist(strsplit(unlist(strsplit(dta[1], ": "))[2], " ")))
seeds <- seeds[1:4]

range_seeds <- NULL # bit64::as.integer64()
for (i in seq(1, length(seeds), by = 2)) {
  range_seeds <- c(range_seeds, seq(seeds[i], (seeds[i] + seeds[i+1]-1)))
  message(length(range_seeds))
}
seeds <- range_seeds
range_seeds <- NULL

seed_count <- 1
for (each_seed in seeds) {
  for (i in 2:length(dta)) {
    if(length(grep("map", dta[i]))) {
      # message(dta[i])
      i <- i + 1
      while (dta[i] != "") {
        map_line <- as.numeric(unlist(strsplit(dta[i], " ")))
        if(seeds[seed_count] >= map_line[2] & seeds[seed_count] < map_line[2] + map_line[3]){
          seeds[seed_count] <- seeds[seed_count] + map_line[1] - map_line[2]
          break
        }
        # message("seed: ", each_seed, " row: ", i, " transformed to: ", seeds[seed_count])
        i <- i + 1
      }
    }
  }
  seed_count <- seed_count + 1
}

message(paste(seeds, collapse = "-"))
message(min(seeds))
