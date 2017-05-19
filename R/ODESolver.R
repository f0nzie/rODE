#' ODESolver class
#'
#' @param object the object
#' @param stepSize the size
#' @param ... add
#'
#' @aliases ODESolver-class
#' @rdname ODESolver
#' @name ODESolver
#' @export
setClass("ODESolver")


#' @rdname ODESolver
#' @export
setGeneric("init", function(object, stepSize, ...) standardGeneric("init"))

#' @rdname ODESolver
#' @export
setMethod("init", "ODESolver", function(object, stepSize, ...) {
    object
})


#' @rdname ODESolver
#' @export
setGeneric("setStepSize", function(object, ...) standardGeneric("setStepSize"))

#' @rdname ODESolver
#' @export
setMethod("setStepSize", "ODESolver", function(object, stepSize, ...) {
    object
})


#' @rdname ODESolver
#' @export
#' @aliases getStepSize,ODESolver-class
setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))

#' @rdname ODESolver
#' @aliases getStepSize,ODESolver-class
#' @export
setMethod("getStepSize", "ODESolver", function(object, ...) {
    object@stepSize
})

#' @rdname ODESolver
#' @export
setGeneric("step", function(object, ...) standardGeneric("step"))

#' @rdname ODESolver
#' @export
setMethod("step", "ODESolver", function(object, ...) {
    object
})


