#' AbstractODESolver class
#'
#' @slot stepSize numeric.
#' @slot numEqn numeric.
#' @slot ode ODE.
#'
#' @param object the main class binder
#' @param .ode    the ODE object
#' @param stepSize how much the solver should move
#' @param ... additional parameters
#'
#'
#' @aliases AbstractODESolver-class
#' @rdname AbstractODESolver
#' @name AbstractODESolver
#'
#' @include ODESolver.R ODE.R
#' @export
setClass("AbstractODESolver", slots = c(
    stepSize = "numeric",
    numEqn   = "numeric",
    ode      = "ODE"
), prototype = prototype(
    stepSize = 0.1,
    numEqn = 0
), contains = c("ODESolver")
)


setGeneric("initialize", function(.Object, ...) standardGeneric("initialize"))

setMethod("initialize", "AbstractODESolver", function(.Object, .ode, ...) {
    .Object <- init(.Object, 0.1)
    return(.Object)
})

#' step(): advance the solver one step at a time
#' @rdname AbstractODESolver
#' @aliases step,AbstractODESolver-methods
setMethod("step", "AbstractODESolver", function(object, ...) {
    object
})


#' setStepSize():
#' @rdname AbstractODESolver
setMethod("setStepSize", "AbstractODESolver", function(object, stepSize, ...) {
    object@stepSize = stepSize
    object
})

#' init(): not the same as initialize
#' @rdname AbstractODESolver
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


#' getStepSize()
#' @rdname ODESolver
#' @aliases getStepSize,AbstractODESolver-class
setMethod("getStepSize", "AbstractODESolver", function(object, ...) {
    return(object@stepSize)
})



#' AbstractODESolver constructor
#'
#' @importFrom methods new
#' @export
AbstractODESolver <- function(.ode) {
    odesolver <- new("AbstractODESolver", .ode)
    odesolver@ode <- .ode
    odesolver
}
