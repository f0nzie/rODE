# ODE.R
#
# ODE base class
#
# Inherited by: ODE solver objects


#' @include ode_generics.R
setClass("ODE", slots = c(
    state = "numeric",              # variables
    rate  = "numeric"               # derivatives
))

#' @rdname getState-method
setMethod("getState", "ODE", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

#' @rdname getRate-method
setMethod("getRate", "ODE", function(object, state, ...) {
    # Gets the rate of change using the argument's state variables.
    return(object@rate)
})
