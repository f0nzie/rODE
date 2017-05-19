#' ODE class
#'
#' @slot state numeric.
#' @slot rate numeric.
#'
#' @param object the class object
#' @param state  state of the ODE
#' @param rate   rate of the ODE
#' @param ...    additional parameters
#'
#' @return .Object
#'
#' @aliases ODE-class
#' @rdname ODE
#' @name ODE
#' @export
setClass("ODE", slots = c(
    state = "numeric",
    rate  = "numeric"
))

#' @rdname ODE
#' @aliases getRate,ODE-method
#' @export
setGeneric("getRate", function(object, state, rate, ...) standardGeneric("getRate"))

#' Gets the rate from the ODE solver after a step
#'
#' @rdname ODE
#' @aliases getRate,ODE-method
#' @export
setMethod("getRate", "ODE", function(object, state, rate, ...) {
    # Gets the rate of change using the argument's state variables.
    object
})

#' @rdname ODE
#' @aliases getState
#' @export
setGeneric("getState", function(object, ...) standardGeneric("getState"))


#' @rdname ODE
#' @export
setMethod("getState", "ODE", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

