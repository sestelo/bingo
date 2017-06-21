

#' Checking equal cards
#'
#' @param cards list containing the generated cards
#' @return none, only message
#' @author Marta Sestelo
#' @examples
#' cards <- bingo(10)
#' check_equal_cards(cards)
#' @export
check_equal_cards <- function(cards){

  numbers <- sapply(cards, as.vector, simplify = TRUE)
  numbers <- apply(numbers, 2, na.omit)

  ncards <- length(cards)

  aux <- combn(ncards, m = 2) # all combinationfs of n elements taken m at a time
  cat(paste("Number of combinations:", dim(aux)[2], sep = " ")) # number of combinations
  cat("\n")
  cat("\n")
  ii <- apply(aux, 2, same_elemets, data = numbers)
  if(sum(ii) == 0){
    cat("There isn't equal cards... Perfect!")
  }else{
    cat("Pay attention! There are equal cards and they are:")
    cat("\n")
    print(aux[, ii])
  }

}







# Checking columns equallity of a matrix
#
# @description  function for checking if two given columns
# of a matrix contain the same elements
# @param x: indicators of the two column to check
# @param data: matrix with the data
# @author Marta Sestelo
same_elemets <- function(x, data){
  res <- ifelse(sum(data[, x[1]] %in% data[, x[2]]) == dim(data)[1], TRUE, FALSE)
}
