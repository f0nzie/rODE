# source("./R/AbstractODESolver.R")

# /**
# * Euler implements an Euler method ODE solver.
# *
# * The Euler method is unstable for many systems.  It is included as an
# * example of how to use the ODE and ODESolver interface.
# *
# * @author              Wolfgang Christian
# * @version 1.0
# * converted to R by    Alfonso R> Reyes
# */


.Euler <- setClass("Euler",
            contains = c("AbstractODESolver")
        )

setMethod("initialize", "Euler", function(.Object, ode, ...) {
    tryCatch({
        if (missing(ode)) stop("ode param not supplied")
    }, error = "No ode param")

    # initialized the Euler ODE solver
    .Object@ode <- ode                          # set the ode to ODESolver slot
    .Object@ode@rate <- vector("numeric")       # create vector for the rate
    return(.Object)
})


#' @importFrom methods callNextMethod
setMethod("init", "Euler", function(object, stepSize, ...) {
    object <- callNextMethod(object, stepSize)           # call superclass init
    object@ode@rate <- vector("numeric", object@numEqn)  # make the rate vector
    invisible(object)                                               #   right dimensions
})


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

setMethod("setStepSize", "Euler", function(object, stepSize, ...) {
    # set the time step
    object@stepSize <-  stepSize
    invisible(object)
})


setMethod("getStepSize", "Euler", function(object, ...) {
    return(object@stepSize)
})


#' # constructor ODE solver using Euler method
#'
#' @export
setMethod("Euler", signature(ode = "ODE"), function(ode, ...) {
    .euler <- .Euler(ode = ode)
    .euler <- init(.euler, .euler@stepSize)
    return(.euler)
})

setMethod("Euler", signature(ode = "missing"), function(ode, ...) {
    if (missing(ode)) {
        ode <- new("ODE")
        warning("No ODE supplied. Using an empty one!")
    }
    .euler <- .Euler(ode = ode)
    .euler <- init(.euler, .euler@stepSize)
    return(.euler)
})
