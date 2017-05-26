# RK45.R
#
# Simplified calling class of DormandPrince45
#

#' RK45 class
#'
#' @param ode and ODE object
#'
#' @rdname RK45-class
#' @examples
#'
#' ComparisonRK45App <- function(verbose = FALSE) {
#'
#'     ode <- new("ODETest")                     # create an `ODETest` object
#'
#'     ode_solver <- RK45(ode)                   # select the ODE solver
#'
#'     ode_solver <- setStepSize(ode_solver, 1)      # set the step
#'     ode_solver <- setTolerance(ode_solver, 1e-8)  # set the tolerance
#'
#'     time <-  0
#'
#'     rowVector <- vector("list")
#'     i <- 1
#'     while (time < 50) {
#'         rowVector[[i]] <- list(t  = ode_solver@ode@state[2],
#'                                s1 = getState(ode_solver@ode)[1],
#'                                s2 = getState(ode_solver@ode)[2],
#'                                xs = getExactSolution(ode_solver@ode, time),
#'                                rc = getRateCounts(ode),
#'                                time = time
#'
#'         )
#'         ode_solver <- step(ode_solver)       # advance one step
#'         stepSize <-  ode_solver@stepSize     # update the step size
#'         time <- time + stepSize
#'         state <- getState(ode_solver@ode)    # get the `state` vector
#'         if (verbose)
#'             cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n", time, state[1],
#'                         (state[1] - getExactSolution(ode_solver@ode, time)),
#'                         getRateCounts(ode)))
#'         i <- i + 1
#'     }
#'     DT <- data.table::rbindlist(rowVector)    # a data table with the results
#'
#'     if (verbose)
#'         cat("rate evaluated #", getRateCounts(ode))
#'
#'     return(DT)
#' }
#'
#' ComparisonRK45App()                          # run the example
#'
#' # This example can also be found in ./examples/ComparisonRK45App.R
#' # The class ODETest can be found in ./R/xP-ODETest.R
#'
setClass("RK45",
    contains = c("DormandPrince45")
)

setMethod("initialize", "RK45", function(.Object, ode, ...) {
    # initialized the ODE solver
    .Object@ode <- ode                          # set the ode to ODESolver slot
    return(.Object)
})



#' RK45 class constructor
#'
#' @rdname RK45-class
#'
#' @export
RK45 <- function(ode) {
    rk45 <- DormandPrince45(ode)             # equivalent to Java "super(ode)"
    return(rk45)
}


