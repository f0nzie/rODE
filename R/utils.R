#' @export
showMethods2 <- function(myClass) {
    # get the method printout
    mtext <-  showMethods(class=myClass, printTo = FALSE )

    # extract only what is between "Function :" and " (pack ... .GlobalEnv)"
    fvec  <- gsub( "Function(\\:\\s|\\s\\\")(.+)(\\s\\(|\\\")(.+$)",
                   "\\2", mtext[grep("^Function: ", mtext)] )

    fvec

    # vector comparison of methods
    # expect_equal(fvec, c("getStepSize", "init", "setStepSize", "step"))

}
