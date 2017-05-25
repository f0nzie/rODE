#' Get the methods in a class
#'
#' But only those specific to the class
#'
#' @param theClass class to analyze
#'
#' @importFrom methods showMethods
#' @export
showMethods2 <- function(theClass) {
    # get the method printout
    mtext <-  showMethods(classes=theClass, printTo = FALSE )

    # extract only what is between "Function :" and " (pack ... .GlobalEnv)"
    fvec  <- gsub( "Function(\\:\\s|\\s\\\")(.+)(\\s\\(|\\\")(.+$)",
                   "\\2", mtext[grep("^Function: ", mtext)] )

    fvec

    # vector comparison of methods
    # expect_equal(fvec, c("getStepSize", "init", "setStepSize", "step"))
}
