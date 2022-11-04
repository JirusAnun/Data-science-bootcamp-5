rock_paper_scissors <- function(){
  ## Win : Tied : Loss
  score <- c(0,0,0)
  msg <- "Result Win : %i Tied : %i Loss : %i"
  msgcom <- "Your move is %s and Computer move is : %s"
  
  while (T) {
    ans <- sample(c("rock","paper","scissor") , 1)
    
    user_action <- tolower(readline("Rock paper scissor? : "))
    
    con1 <- (user_action == "rock" & ans == "paper") | 
      (user_action == "paper" & ans == "scissor") |
      (user_action == "scissor" & ans == "rock")
    
    con2 <- (user_action == "rock" & ans == "scissor") | 
      (user_action == "paper" & ans == "rock") |
      (user_action == "scissor" & ans == "paper")
    
    
    if(user_action == ans){
      print(sprintf(msgcom,user_action,ans))
      print("tied")
      score[2] <- score[2]+1
      print(sprintf(msg,score[1],score[2],score[3]))
    }
    else if(con1){
      print(sprintf(msgcom,user_action,ans))
      print("loss")
      score[3] <- score[3]+1
      print(sprintf(msg,score[1],score[2],score[3]))
    }
    else if(con2){
      print(sprintf(msgcom,user_action,ans))
      print("win")
      score[1] <- score[1]+1
      print(sprintf(msg,score[1],score[2],score[3]))
    }
    else if (user_action == "exit"){
      print("Exit")
      break
    }
    else{
      print("Error")
    }
  }
}
