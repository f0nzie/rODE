# Generic functions for constructors +++++++++++++++++++++++++++++++++++++++++
#' @rdname AbstractODESolver-class
#' @export
setGeneric("AbstractODESolver", function(ode, ...)
    standardGeneric("AbstractODESolver"))

#' @rdname EulerRichardson-class
#' @export
setGeneric("EulerRichardson", function(ode, ...)
    standardGeneric("EulerRichardson"))

#' @rdname RK4-class
#' @export
setGeneric("RK4", function(ode, ...)
    standardGeneric("RK4"))

#' @rdname Verlet-class
#' @export
setGeneric("Verlet", function(ode, ...)
    standardGeneric("Verlet"))

#' @rdname Euler-class
#' @export
setGeneric("Euler", function(ode, ...)
    standardGeneric("Euler"))

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#' Get a new rate given a state
#'
#' @rdname getRate-method
#'
#' @param object a class object
#' @param state current state
#' @param rate new rate
#' @param ... additional parameters
#'
#' @export
setGeneric("getRate", function(object, state, rate, ...) standardGeneric("getRate"))

#' Get current state of the system
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getState-method
#' @export
setGeneric("getState", function(object, ...) standardGeneric("getState"))


#' Advances a step in the ODE solver
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname step-method
#' @export
setGeneric("step", function(object, ...) standardGeneric("step"))



#' @export
setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))

#' @export
setGeneric("doStep", function(object, ...) standardGeneric("doStep"))
# setGeneric("setState", function(object, x, vx, y, vy, ...) standardGeneric("setState"))
# setGeneric("setState", function(object, theta, thetaDot, ...) standardGeneric("setState"))



#' Set initial values before starting the ODE solver
#'
#' @param object a class object
#' @param ... additional parameters
#' @param stepSize size of the step
#'
#' @rdname init-method
#' @export
setGeneric("init", function(object, ...) standardGeneric("init"))


#' setStepSize uses either of two step parameters: stepSize and dt
#' `stepSize`` works for most of the applications
#' `dt`` is used in Pendulum
#'
#' @param object a class object
#' @param ... additional parameters
#' @param stepSize size of the step
#'
#' @rdname setStepSize-method
#' @export
setGeneric("setStepSize", function(object, ...) standardGeneric("setStepSize"))


#' New setState that should work with different methods
#'  "theta", "thetaDot":  used in PendulumApp
#'  "x", "vx", "y", "vy": used in ProjectileApp
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @export
setGeneric("setState", function(object, ...) standardGeneric("setState"))

#' @export
setGeneric("getExactSolution", function(object, t, ...) standardGeneric("getExactSolution"))

#' @export
setGeneric("setTolerance", function(object, tol, ...) standardGeneric("setTolerance"))

#' @export
setGeneric("getTolerance", function(object, ...) standardGeneric("getTolerance"))


#' Get an error code
#'
#' @param object a class object
#' @param ... additional parameters
#' @param tol tolerance
#' @rdname getErrorCode-method
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
