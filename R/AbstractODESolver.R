#' AbstractODESolver class
#'
#' @slot stepSize numeric.
#' @slot numEqn numeric.
#' @slot ode ODE.
#'
#' @aliases AbstractODESolver-class
#' @rdname AbstractODESolver
#' @name AbstractODESolver
#'
#' @include ODESolver.R ODE.R ode_generics.R
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



#' @export
setMethod("initialize", "AbstractODESolver", function(.Object, .ode, ...) {
    .Object <- init(.Object, 0.1)
    return(.Object)
})




#' Advance the solver one step at a time
#'
#' @param object the main class binder
#' @param ... additional parameters
#'
#' @rdname step
setMethod("step", "AbstractODESolver", function(object, ...) {
    object
})




#' Set the size of step to move each step of the solver
#'
#' @param object the main class binder
#' @param stepSize how much the solver should move
#' @param ... additional parameters
#'
#' @rdname setStepSize
#' @export
setMethod("setStepSize", "AbstractODESolver", function(object, stepSize, ...) {
    object@stepSize = stepSize
    object
})




#' Sets the values of the ODE solver and gets ready to start
#'
#' @param object the main class binder
#' @param stepSize how much the solver should move
#' @param ... additional parameters
#'
#' @rdname init
#' @export
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





#' Get the current size of the step
#'
#' @param object the main class binder
#' @param ... additional parameters
#'
#' @rdname getStepSize
#' @export
setMethod("getStepSize", "AbstractODESolver", function(object, ...) {
    return(object@stepSize)
})





#' AbstractODESolver constructor
#'
#' @param .ode an ODE object
#'
#' @importFrom methods new
#' @export
AbstractODESolver <- function(.ode) {
    odesolver <- new("AbstractODESolver", .ode)
    odesolver@ode <- .ode
    odesolver
}
