# ODETest.R

setClass("ODETest", slots = c(
    n     = "numeric",           # counts the number of getRate evaluations
    stack = "environment"        # environnment to keep stack
    ),
    contains = c("ODE")
    )


setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@stack$rateCounts <-  0              # counter for rate calculations
    .Object@state <- c(5.0, 0.0)
    return(.Object)
})


setMethod("getExactSolution", "ODETest", function(object, t, ...) {
    return(5.0 * exp(-t))
})


setMethod("getState", "ODETest", function(object, ...) {
    object@state
})


setMethod("getRate", "ODETest", function(object, state, ...) {

    object@rate[1] <- - state[1]
    object@rate[2] <-  1            # rate of change of time, dt/dt

    # accumulate how many the rate has been called to calculate
    object@stack$rateCounts <- object@stack$rateCounts + 1

    object@state <- state
    object@rate
})



setMethod("getRateCounts", "ODETest", function(object, ...) {
    # use environment stack to accumulate rate counts
    object@stack$rateCounts
})


# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}
