# ODETest.R


setGeneric("getRateCounter", function(object) standardGeneric("getRateCounter"))


setClass("ODETest", slots = c(
    n     = "numeric",           # counts the number of getRate evaluations
    stack = "environment",
    rateEvals = "numeric"
    ),
    contains = c("ODE")
    )


setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@stack$cntr <-  0
    .Object@n <-  0
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

    # increm <- function() {
    #     i <- 1
    #     function() {
    #         i <<- i + 1
    #         i
    #     }
    # }
    object@rate[1] <- - state[1]
    object@rate[2] <-  1            # rate of change of time, dt/dt

    object@stack$cntr <-  object@stack$cntr + 1


    object@n <- object@stack$cntr
    object@rateEvals <- object@stack$cntr

    # object@rateEvals <- object@kfunc$nextID()

    # cat(object@n, "\t")

    object@state <- state
    # object@rate  <- rate

    object@rate
    # return(object)
})

setMethod("getRateCounter", "ODETest", function(object, ...) {
    # object@n <- object@stack$cntr
    # object@n <- object@rateEvals
    # object@n
    # object@rateEvals <- object@stack$cntr
    # object@rateEvals
    object@stack$cntr
})


# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}
