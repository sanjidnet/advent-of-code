global_input <- c(1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19, 
  1,9,19,23,2,23,13,27,1,27,9,31,2,31,6,35,1, 5,35,39,1,10,39,43,2,43,6,47,1,10,47,51,2,6, 
  51,55,1,5,55,59,1,59,9,63,1,13,63,67,2,6,67,71,1,5,71,75,2,6,75,79,2,79,6,83,1,13,83,87, 
  1,9,87,91,1,9,91,95,1,5,95,99,1,5, 99,103,2,13,103,107,1,6,107,111,1,9,111,115,2,6, 
  115,119,1,13,119,123,1,123,6,127,1,127,5,131,2,10, 
  131,135,2,135,10,139,1,13,139,143,1,10,143,147, 1,2,147,151,1,6,151,0,99,2,14,0,0) 

ideal_outcome <- 19690720

opcode_positions <- seq(1, length(global_input), by = 4) 
 
for(i in 0:99){ # added later for part 2
  for(j in 0:99){ # added later for part 2
    input <- global_input # added later for part 2
    input[2] <- i # added later for part 2
    input[3] <- j # added later for part 2
    for(opcode_position in opcode_positions){ 
      operand1 <- input[input[opcode_position + 1] + 1] 
      operand2 <- input[input[opcode_position + 2] + 1] 
      if(input[opcode_position] == 1){ 
        input[input[opcode_position + 3] + 1] <- operand1 + operand2 
        } else if(input[opcode_position] == 2){ 
          input[input[opcode_position + 3] + 1] <- operand1 * operand2 
          } else if(input[1] == ideal_outcome){ # this else if block added later for part 2
            message("Noun: ", input[2], ", verb: ", input[3], ", output: ", 100 * input[2] + input[3])
            stop("SUCCESSFUL")
            } else if(input[opcode_position] == 99){ 
              #message(sprintf("OPCODE 99 Detected at noun %s and verb %s", i, j)) 
              } else { 
                #message(sprintf("Invalid OPCODE (%s) detected at noun %s, verb %s and position (%s)", 
                #                input[opcode_position], input[2], input[3], opcode_position)) 
              } 
    } 
  } 
} 
