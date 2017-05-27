#' Get the number of times that the rate has been calculated
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getRateCounts-method
#' @export
setGeneric("getRateCounts", function(object, ...) standardGeneric("getRateCounts"))


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
#' @param ... additional parameters
#'
#' @export
setGeneric("getRate", function(object, state, ...) standardGeneric("getRate"))


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
#' @example ./inst/examples/ReactionApp.R
setGeneric("step", function(object, ...) standardGeneric("step"))



#' Get the step size
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getStepSize-method
#' @export
setGeneric("getStepSize", function(object, ...) standardGeneric("getStepSize"))



#' Perform a step
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname doStep-method
#' @export
#' @example ./inst/examples/PlanetApp.R
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
#' @example ./inst/examples/PlanetApp.R
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
#' @example ./inst/examples/ProjectileApp.R
setGeneric("setState", function(object, ...) standardGeneric("setState"))



#' Set the tolerance for the solver
#'
#' @param object a class object
#' @param ... additional parameters
#' @param tol tolerance
#'
#' @rdname setTolerance-method
#'
#' @export
setGeneric("setTolerance", function(object, tol, ...) standardGeneric("setTolerance"))


#' Get the tolerance for the3 solver
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getTolerance-method
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

#' Enable Runtime Exceptions
#'
#' @rdname DormandPrince45-class
#' @export
setGeneric("enableRuntimeExceptions", function(object, enable, ...)
    standardGeneric("enableRuntimeExceptions"))

#' Get the rate counter
#'
#' How many time the rate has changed with a step
#'
#' @rdname Verlet-class
#' @export
setGeneric("getRateCounter", function(object, ...) standardGeneric("getRateCounter"))


#' Get the elapsed time
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getTime-method
#' @export
setGeneric("getTime", function(object, ...) standardGeneric("getTime"))



#' Get the calculated energy level
#'
#' @param object a class object
#' @param ... additional parameters
#'
#' @rdname getEnergy-method
#' @export
setGeneric("getEnergy", function(object, ...) standardGeneric("getEnergy"))



#' Compare analytical and calculated solutions
#'
#' @param object a class object
#' @param ... additional parameters
#' @param t time ath what we are performing the evaluation
#'
#' @rdname getExactSolution-method
#' @export
setGeneric("getExactSolution", function(object, t, ...) standardGeneric("getExactSolution"))

