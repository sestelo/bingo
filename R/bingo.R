#' Generate n bingo cards
#'
#' @param ncards number of cards
#' @return a list with the generated cards
#' @author Marta Sestelo and Nora M. Villanueva
#' @examples
#' cards <- bingo(8)
#' @export
bingo <- function(ncards, seed = NULL){

  if(is.null(seed)) set.seed(29072017)

  cards <- list()
  numbers <- matrix(NA, ncol = ncards, nrow = 15)

  for (i in 1:ncards){

    res <- sapply(c(1, seq(1, 8, 1) * 10), sample_dec)
    sec <- 1:9
    ii <- sample(sec, size = 4, replace = FALSE)
    ii2 <- sample(sec[!sec %in% ii], size = 4, replace = FALSE)
    res2 <- rbind(res, rep(NA, 9))

    sel <- res2[, ii]; sel[2:3, ] <- sel[1:2, ]; sel[1, ] <- NA
    res2[, ii] <- sel

    sel <- res2[, ii2]; sel[3, ] <- sel[2, ]; sel[2, ] <- NA
    res2[, ii2] <- sel

    iii <- sample(c(1:9)[!is.na(res2[3,])], size = 3)
    res2[3, iii] <- NA

    m <- t(res2)
    mcopy <- m; m[, 3] <- mcopy[, 1]; m[, 1] <- mcopy[, 3]

    cards[[i]] <- m
  }
  class(cards) <- "bingo"
  return(cards)
}





# Sample 2 numbers from each ten
#
# @param x ten indicator (1:[1, 9], 2:[10, 19], 3:[20, 29], etc.)
# @author Marta Sestelo and Nora M. Villanueva
sample_dec <- function(x){
  if(x == 1){
    aux <- x:(x+8)
  }else{
    aux <- x:(x+9)
  }
  return(sort(sample(aux, size = 2, replace = FALSE)))
}











