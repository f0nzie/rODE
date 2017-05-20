#' Euler class
#'
#' Euler implements an Euler method ODE solver.
#'
#' The Euler method is unstable for many systems.  It is included as an
#' example of how to use the ODE and ODESolver interface.
#'
#' @author              Java: Wolfgang Christian
#'
#' @author              R: Alfonso R. Reyes
#'
#'
#' @include AbstractODESolver.R
#' @export
setClass("Euler",
    contains = c("AbstractODESolver")
)

#' @export
setMethod("initialize", "Euler", function(.Object, ode, ...) {
    # initialized the Euler ODE solver
    .Object@ode <- ode                          # set the ode to ODESolver slot
    .Object@ode@rate <- vector("numeric")       # create vector for the rate
    return(.Object)
})


#' Start the Euler ODE solver
#'
#' @rdname init
#' @aliases init,Euler-method
#' @importFrom methods callNextMethod
setMethod("init", "Euler", function(object, stepSize, ...) {
    object <- callNextMethod(object, stepSize)           # call superclass init
    object@ode@rate <- vector("numeric", object@numEqn)  # make the rate vector
    invisible(object)                                               #   right dimensions
})


#' @rdname step
#' @aliases step,Euler-method
#' @export
setMethod("step", signature(object = "Euler"), function(object, ...) {
    # step through the differential equation
    state <- getState(object@ode)                         # get the state
    # ode_object <- getRate(object@ode, state, object@ode@rate)  # get the rate
    # rate <- ode_object@rate
    rate  <- getRate(object@ode, state, object@ode@rate)@rate  # get the rate

    for (i in 1:object@numEqn) {
        state[i] <- state[i] + object@stepSize * rate[i]  # calc the new state
    }
    object@ode@state <- state              # return state and rate for new iter
    object@ode@rate  <- rate
    invisible(object)                                 # use this object to ressign in R

})



#' @rdname setStepSize
#' @export
setMethod("setStepSize", "Euler", function(object, stepSize, ...) {
    # set the time step
    object@stepSize <-  stepSize
    invisible(object)
})


#' @rdname getStepSize
#' @export
setMethod("getStepSize", "Euler", function(object, ...) {
    return(object@stepSize)
})


#' Constructor of Euler ODE solver
#'
#' @param .ode and ODE object
#'
#' @rdname Euler
#' @importFrom methods new
#' @aliases Euler-constructor
#' @export
Euler <- function(.ode) {
    # Euler constructor
    euler <- new("Euler", .ode)                     # create the Euler object
    euler <- init(euler, euler@stepSize)            # iniialize Euler
    return(euler)
}

