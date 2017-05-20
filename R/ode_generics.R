

setGeneric("initialize", function(.Object, ...) standardGeneric("initialize"))

#' @rdname init
#' @export
#' @aliases init-method
setGeneric("init", function(object, stepSize, ...) standardGeneric("init"))

#' @rdname setStepSize
#' @export
#' @aliases setStepSize,AbstractODESolver-method,,ODESolver-method
setGeneric("setStepSize", function(object, ...) standardGeneric("setStepSize"))


#' @rdname getStepSize
#' @export
setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))


#' @rdname step
#' @export
setGeneric("step", function(object, ...) standardGeneric("step"))



#' Set a new for the ODE solver
#'
#' New setState that should work with different methods
#'
#'  "theta", "thetaDot":  used in PendulumApp
#'  "x", "vx", "y", "vy": used in ProjectileApp
#' @rdname setState
#' @export
setGeneric("setState", function(object, ...) standardGeneric("setState"))






#'

#'
#' #' step(): set up class

#'

#'

#'
#' #' doStep():
#' #' @rdname ODESolver
#' setGeneric("doStep", function(object, ...) standardGeneric("doStep"))
#'

#
#

#
#
# setGeneric("getExactSolution", function(object, t, ...) standardGeneric("getExactSolution"))
#
#


#
# setGeneric("enableRuntimeExceptions", function(object, enable, ...)
#     standardGeneric("enableRuntimeExceptions"))
#
#
# setGeneric("getRateCounter", function(object, ...) standardGeneric("getRateCounter"))
# setGeneric("getTime", function(object, ...) standardGeneric("getTime"))
# setGeneric("getEnergy", function(object, ...) standardGeneric("getEnergy"))
