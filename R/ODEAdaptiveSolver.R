#' The ODEAdaptiveSolver class
#'
#' @slot NO_ERROR numeric.
#' @slot DID_NOT_CONVERGE numeric.
#' @slot BISECTION_EVENT_NOT_FOUND numeric.
#'
#' @param object a class object
#' @param tol tolerance
#' @param ... additional parameters
#'
#' @aliases ODEAdaptiveSolver-class
#' @rdname ODEAdaptiveSolver
#' @name ODEAdaptiveSolver
#'
#' @include ODESolver.R
#' @export
#'
setClass("ODEAdaptiveSolver", slots = c(
    NO_ERROR                  = "numeric",
    DID_NOT_CONVERGE          = "numeric",
    BISECTION_EVENT_NOT_FOUND = "numeric"
    ),
    prototype = prototype(
        NO_ERROR                  = 0,
        DID_NOT_CONVERGE          = 1,
        BISECTION_EVENT_NOT_FOUND = 2
    ),
    contains = c("ODESolver")
)




#' @rdname ODEAdaptiveSolver
#' @export
setGeneric("setTolerance", function(object, tol, ...) standardGeneric("setTolerance"))

#' Set the tolerance for the adaptive solver
#' @rdname ODEAdaptiveSolver
#' @export
setMethod("setTolerance", "ODEAdaptiveSolver", function(object, tol) {
})

#' @rdname ODEAdaptiveSolver
#' @export
setGeneric("getTolerance", function(object, ...) standardGeneric("getTolerance"))

#' @rdname ODEAdaptiveSolver
#' @export
setMethod("getTolerance", "ODEAdaptiveSolver", function(object) {
})

#' @rdname ODEAdaptiveSolver
#' @export
setGeneric("getErrorCode", function(object, tol, ...) standardGeneric("getErrorCode"))

#' @rdname ODEAdaptiveSolver
#' @export
setMethod("getErrorCode", "ODEAdaptiveSolver", function(object) {
})
