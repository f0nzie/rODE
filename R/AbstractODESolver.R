# AbstractODESolver.R

#' AbstractODESolver class
#'
#' Defines the basic methods for all the ODE solvers.
#'
#' Inherits from: ODESolver class
#'
#' @param ode an ODE object
#' @param object a class object
#' @param stepSize the size of the step
#' @param value the step size value
#' @param ... additional parameters
#'
#' @rdname AbstractODESolver-class
#'
#' @include ODE.R ODESolver.R ode_generics.R
.AbstractODESolver <- setClass("AbstractODESolver", slots = c(
                    stepSize = "numeric",
                    numEqn   = "numeric",
                    ode      = "ODE"
                ), prototype = prototype(
                    stepSize = 0.1,
                    numEqn = 0
                ), contains = c("ODESolver")
                )


setMethod("initialize", "AbstractODESolver", function(.Object, .ode, ...) {
    .Object <- init(.Object, 0.1)                   # default value for stepSize
    return(.Object)
})

#' @rdname AbstractODESolver-class
setMethod("step", "AbstractODESolver", function(object, ...) {
    object
})

#' @rdname AbstractODESolver-class
#' @aliases getODE,getODE-method
#' setMethod("getODE", "AbstractODESolver", function(object, ...) {
#'     object@ode
#' })


#' @rdname AbstractODESolver-class
#' @aliases setStepSize,setStepSize-method
setMethod("setStepSize", "AbstractODESolver", function(object, stepSize, ...) {
    object@stepSize = stepSize
    object
})


#' @rdname AbstractODESolver-class
setMethod("init", "AbstractODESolver", function(object, stepSize, ...) {
    object@stepSize <- stepSize
    state <- getState(object@ode)
    if (is.null(state)) {
        object@numEqn <-  0
    } else {
        object@numEqn = length(state)
    }
    object
})


#' @rdname AbstractODESolver-class
setReplaceMethod("init", "AbstractODESolver", function(object, ..., value) {
    stepSize <- value
    object@stepSize <- stepSize
    state <- getState(object@ode)
    if (is.null(state)) {
        object@numEqn <-  0
    } else {
        object@numEqn = length(state)
    }
    object
})


#' @rdname AbstractODESolver-class
setMethod("getStepSize", "AbstractODESolver", function(object, ...) {
    return(object@stepSize)
})




#' AbstractODESolver constructor `missing``
#'
#' @rdname AbstractODESolver-class
#'
#' @importFrom methods new
#' @export
setMethod("AbstractODESolver", signature(ode = "missing"), function(ode, ...) {
    # use this method when no ODE object is passed
    if (missing(ode)) {
        ode <- new("ODE")
        warning("No ODE supplied. Using an empty one!")
    }
    odesolver <- .AbstractODESolver(ode = ode)
    odesolver@ode <- ode
    odesolver
})


#' AbstractODESolver constructor `ODE`
#'
#' Uses this constructor when ODE object is passed
#'
#' @rdname AbstractODESolver-class
#'
#' @importFrom methods new
setMethod("AbstractODESolver", signature(ode = "ODE"), function(ode, ...) {
    odesolver <- .AbstractODESolver(ode = ode)
    odesolver@ode <- ode
    odesolver
})
