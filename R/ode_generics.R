






#'
#' #' initialize(): set up class
#' #' @rdname ODESolver
#' setGeneric("initialize", function(.Object, ...) standardGeneric("initialize"))
#'
#' #' step(): set up class
#' #' @rdname ODESolver
#' setGeneric("step", function(object, ...) standardGeneric("step"))
#'
#' #' @rdname ODESolver
#' setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))
#'
#' #' @rdname ODESolver
#' setGeneric("setStepSize", function(object, ...) standardGeneric("setStepSize"))
#'
#' #' doStep():
#' #' @rdname ODESolver
#' setGeneric("doStep", function(object, ...) standardGeneric("doStep"))
#'

#
#
# # New setState that should work with different methods
# #  "theta", "thetaDot":  used in PendulumApp
# #  "x", "vx", "y", "vy": used in ProjectileApp
# setGeneric("setState", function(object, ...) standardGeneric("setState"))
#
#
# setGeneric("getExactSolution", function(object, t, ...) standardGeneric("getExactSolution"))
#
#
# setGeneric("setTolerance", function(object, tol, ...) standardGeneric("setTolerance"))
# setGeneric("getTolerance", function(object, ...) standardGeneric("getTolerance"))
# setGeneric("getErrorCode", function(object, tol, ...) standardGeneric("getErrorCode"))
#
# setGeneric("enableRuntimeExceptions", function(object, enable, ...)
#     standardGeneric("enableRuntimeExceptions"))
#
#
# setGeneric("getRateCounter", function(object, ...) standardGeneric("getRateCounter"))
# setGeneric("getTime", function(object, ...) standardGeneric("getTime"))
# setGeneric("getEnergy", function(object, ...) standardGeneric("getEnergy"))
