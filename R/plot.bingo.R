#' Plot bingo cards
#'
#' @param x a \code{\link{bingo}} object containing one or more bingo cards
#' @param dir directory where you want to write files
#' @param pdf_base base of the sequential filenames for the printable bingo card
#'   files
#' @param ... not used
#' @importFrom png readPNG
#' @note Does not actually plot the cards to the graphics device
#' @return Vector containing the filenames of all the generated cards
#'   (invisibly)
#' @author Marta Sestelo and Nora M. Villanueva
#' @examples
#' cards <- bingo(2)
#' plot(cards)
#' @export
plot.bingo <- function(x, dir = ".", pdf_base = "bingo-", title = "PETARDBINGO", ...) {
  ncards <- length(x)
  img_cascovello <- png::readPNG(system.file("img", "casco_vello.png", package="bingo"))
  imgR <- png::readPNG(system.file("img", "Rlogo.png", package="bingo"))
  #img_cascovello <- png::readPNG("casco_vello.png")
  #imgR <- png::readPNG("Rlogo.png")
  message("Writing to file ...")
  filenames <- c()
  fname <- file.path(dir, paste0(pdf_base, sprintf("%02d", ncards), ".pdf"))
  message("  ", fname)
  filenames <- c(filenames, fname)
  grDevices::pdf(fname, width = 14, height = 7)

  for (i in seq_len(ncards)) {
    m <- x[[i]]
    aux <- as.numeric(t(m))
    par(mai = c(1, 0.1, 1, 0.1))
    image(m, xaxt = "n", yaxt = "n")
    rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col =
           "grey", cex = 0.6)
    image(m, col = "white", xaxt = "n", yaxt = "n", add = TRUE, bty = "n")
    box(col = 'black')
    title(title, line = 1.5, cex.main = 2)
    xcoords <- c(0, (1/8 * c(1:8)))
    ycoords <- c(0.0, 0.5, 1)
    coords <- expand.grid(ycoords, xcoords)
    text(coords[, 2], coords[, 1], aux, col="black", cex = 7)
    abline(v = seq(0.062, 1.5, 0.125), lwd = 0.5)
    abline(h = c(0.25, 0.75), lwd = 0.5)
    mtext("Orgullo 2017 - Asociación cultural do Barrio Alto do Casco Vello de Vigo",
          side = 1, line = 1.7, col = 1)
    mtext("Feito con código",
          side = 1, line = 3.1, col = 1, cex = 0.7)
    par(xpd = NA)
    rasterImage(img_cascovello, 0.97, -0.5, 1.03, -0.28)
    rasterImage(imgR, 0.533, -0.486, 0.553, -0.436)
    par(xpd = FALSE)
  }
  invisible(filenames)
  grDevices::dev.off()
}
