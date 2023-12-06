dta <- readLines("../data/day6/input_sample")

time <- as.numeric(unlist(strsplit(unlist(strsplit(
                  dta[1], ":[[:space:]]+"))[2], "[[:space:]]+")))
distance <- as.numeric(unlist(strsplit(unlist(strsplit( 
                  dta[2], ":[[:space:]]+"))[2], "[[:space:]]+")))

product <- 1
for (i in 1:length(time)) { # 
   message("time: ", time[i], " distance: ", distance[i]) 
   each_time <- time[i] 
   wins <- 0
   for (j in 1:(each_time - 1)) {
      travel <- j * (each_time - j) 
      if (travel > distance[i]) {
        wins <- wins + 1
      }
   }
   product = product * wins 
}
message("product: ", product)

# message(paste(time, collapse = "-"))
# message(paste(distance, collapse = "-"))
