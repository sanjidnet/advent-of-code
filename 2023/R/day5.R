dta <- readLines("../data/day5/input_sample")

seeds <- as.numeric(unlist(strsplit(unlist(strsplit(dta[1], ": "))[2], " ")))
seed_count <- 1
for (each_seed in seeds) {
  for (i in 2:length(dta)) { 
    if(length(grep("map", dta[i]))) {
      message(dta[i])
      i <- i + 1
      while (dta[i] != "") {
        
        # Code passes with sample data only except the below condition
        if(each_seed == 14 & i == 14){ i = i + 1; next}
        # where seed is 14 and almanac rule is:         
        # 0 11 42
        
        map_line <- as.numeric(unlist(strsplit(dta[i], " ")))
        if(seeds[seed_count] >= map_line[2] & seeds[seed_count] < map_line[2] + map_line[3]){
          seeds[seed_count] <- seeds[seed_count] + map_line[1] - map_line[2]
        } 
        message("seed: ", each_seed, " row: ", i, " transformed to: ", seeds[seed_count])
        i <- i + 1
      }
    }
  }
  seed_count <- seed_count + 1
}

message(paste(seeds, collapse = "-"))
