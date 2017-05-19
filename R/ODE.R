#' ODE class
#'
#' Creates an ODE object to be processed by an ODE solver
#'
#' @slot state numeric.
#' @slot rate numeric.
#'
#' @name ODE-class
#' @rdname ODE-class
#' @aliases ODE
#' @exportClass ODE
setClass("ODE", slots = c(
    state = "numeric",
    rate  = "numeric"
))

#' @rdname getRate
#' @exportMethod getRate
setGeneric("getRate", function(object, state, rate, ...) standardGeneric("getRate"))

#' Gets the current rate of the system
#'
#' Given a state, return the rate calculated by the ODE solver after a step
#'
#' @param object the class object
#' @param state  state of the ODE
#' @param rate   rate of the ODE
#' @param ...    additional parameters
#'
#' @rdname getRate
#' @aliases getRate,ODE-method
setMethod("getRate", "ODE", function(object, state, rate, ...) {
    # Gets the rate of change using the argument's state variables.
    object
})



#' @rdname getState
#' @export
setGeneric("getState", function(object, ...) standardGeneric("getState"))

#' Gets the current state of the system
#'
#' A state must be supplied to calculate the rate
#'
#' @param object the class object
#' @param ...    additional parameters
#'
#' @rdname getState
#' @aliases getState,ODE-method
setMethod("getState", "ODE", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

