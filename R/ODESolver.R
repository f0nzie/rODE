setClass("ODESolver")


#' @rdname AbstractODESolver
setMethod("init", "ODESolver", function(object, stepSize, ...) {
    object
})


#' @rdname AbstractODESolver
setMethod("setStepSize", "ODESolver", function(object, stepSize, ...) {
    object
})


#' @rdname AbstractODESolver
setMethod("getStepSize", "ODESolver", function(object, ...) {
    object@stepSize
})


#' @rdname AbstractODESolver
setMethod("step", "ODESolver", function(object, ...) {
    object
})


