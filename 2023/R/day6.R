dta <- readLines("../data/day6/input_sample")

# Part 1 pre-processing
time <- as.numeric(unlist(strsplit(unlist(strsplit(
                  dta[1], ":[[:space:]]+"))[2], "[[:space:]]+")))
distance <- as.numeric(unlist(strsplit(unlist(strsplit( 
                  dta[2], ":[[:space:]]+"))[2], "[[:space:]]+")))

# Part 2 pre-processing
time <- as.numeric((paste(time, collapse = "")))
distance <- as.numeric((paste(distance, collapse = "")))

product <- 1
for (i in seq(1, length(time))) {
  message("time: ", time[i], " distance: ", distance[i])
  each_time <- time[i]
  wins <- 0
  for (j in 1:(each_time - 1)) {
    travel <- j * (each_time - j)
    if (travel > distance[i]) {
      wins <- wins + 1
    }
  }
  product <- product * wins
}

message("product: ", product)
