# ODESolver.R
#

#' ODESolver class
#' @include ode_generics.R
setClass("ODESolver")


setMethod("init", "ODESolver", function(object, stepSize, ...) {
})


#' @rdname step-method
setMethod("step", "ODESolver", function(object, ...) {
    NULL
})

#' @rdname setStepSize-method
setMethod("setStepSize", "ODESolver", function(object, stepSize, ...) {
})

setMethod("getStepSize", "ODESolver", function(object, ...) {
})
