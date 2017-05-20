# ODESolver.R
#

#' ODESolver class
#'
#' @param object a class object
#' @param stepSize size of the step
#' @param stepSize size of the step
#'
#' @include ode_generics.R
setClass("ODESolver")


#' Set initial values and get ready to start the solver
#'
#' @rdname init-method
setMethod("init", "ODESolver", function(object, stepSize, ...) {
})


#' @rdname step-method
setMethod("step", "ODESolver", function(object, ...) {
    NULL
})

#' Set the size of the step
#'
#' @rdname setStepSize-method
setMethod("setStepSize", "ODESolver", function(object, stepSize, ...) {
})

setMethod("getStepSize", "ODESolver", function(object, ...) {
})
