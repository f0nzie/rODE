# Generic functions for constructors +++++++++++++++++++++++++++++++++++++++++

#' @export
setGeneric("AbstractODESolver", function(ode, ...)
    standardGeneric("AbstractODESolver"))

#' @export
setGeneric("EulerRichardson", function(ode, ...)
    standardGeneric("EulerRichardson"))

#' @export
setGeneric("RK4", function(ode, ...)
    standardGeneric("RK4"))

#' @export
setGeneric("Verlet", function(ode, ...)
    standardGeneric("Verlet"))

#' @export
setGeneric("Euler", function(ode, ...)
    standardGeneric("Euler"))

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#' @export
setGeneric("getRate", function(object, state, rate, ...) standardGeneric("getRate"))

#' @export
setGeneric("getState", function(object, ...) standardGeneric("getState"))

#' @export
setGeneric("step", function(object, ...) standardGeneric("step"))

#' @export
setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))

#' @export
setGeneric("doStep", function(object, ...) standardGeneric("doStep"))
# setGeneric("setState", function(object, x, vx, y, vy, ...) standardGeneric("setState"))
# setGeneric("setState", function(object, theta, thetaDot, ...) standardGeneric("setState"))

#' @export
setGeneric("init", function(object, ...) standardGeneric("init"))


# setStepSize uses either of two step parameters: stepSize and dt
# `stepSize`` works for most of the applications
# `dt`` is used in Pendulum
#' @export
setGeneric("setStepSize", function(object, ...) standardGeneric("setStepSize"))


#' New setState that should work with different methods
#'  "theta", "thetaDot":  used in PendulumApp
#'  "x", "vx", "y", "vy": used in ProjectileApp
#' @export
setGeneric("setState", function(object, ...) standardGeneric("setState"))

#' @export
setGeneric("getExactSolution", function(object, t, ...) standardGeneric("getExactSolution"))

#' @export
setGeneric("setTolerance", function(object, tol, ...) standardGeneric("setTolerance"))

#' @export
setGeneric("getTolerance", function(object, ...) standardGeneric("getTolerance"))

#' @export
setGeneric("getErrorCode", function(object, tol, ...) standardGeneric("getErrorCode"))

#' @export
setGeneric("enableRuntimeExceptions", function(object, enable, ...)
    standardGeneric("enableRuntimeExceptions"))

#' @export
setGeneric("getRateCounter", function(object, ...) standardGeneric("getRateCounter"))

#' @export
setGeneric("getTime", function(object, ...) standardGeneric("getTime"))

#' @export
setGeneric("getEnergy", function(object, ...) standardGeneric("getEnergy"))


# setState
# setGeneric("setState", function(object, x, vx, y, vy, theta, thetaDot, ...)
#     standardGeneric("setState"),
#     signature = c("object", "x", "vx", "y", "vy", "theta", "thetaDot"))



# setGeneric("setStepSize", function(object, stepSize, dt, ...)
#     standardGeneric("setStepSize"),
#     signature = c("object", "stepSize", "dt"))
