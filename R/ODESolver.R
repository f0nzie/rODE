#' @export
setClass("ODESolver")


#' @rdname init
setMethod("init", "ODESolver", function(object, stepSize, ...) {
    object
})

#' @rdname step
setMethod("step", "ODESolver", function(object, ...) {
    object
})


#' @rdname setStepSize
setMethod("setStepSize", "ODESolver", function(object, stepSize, ...) {
    object
})


#' @rdname getStepSize
setMethod("getStepSize", "ODESolver", function(object, ...) {
    object@stepSize
})




