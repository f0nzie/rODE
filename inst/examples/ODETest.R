# ODETest.R

idSource <- function() {
    nextId <- 1
    list(nextID = function() {
        r <- nextId
        nextId <<- nextId + 1
        r
    })
}

setClass("ODETest", slots = c(
    n     = "numeric",           # counts the number of getRate evaluations
    stack = "environment",
    kfunc = "list"
    ),
    contains = c("ODE")
    )


setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@kfunc <- idSource()
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
    # cat(object@stack$cntr, "\t")

    # object@n <- object@kfunc$nextID()

    # cat(object@n, "\t")

    object@state <- state
    # object@rate  <- rate

    object@rate
    # return(object)
})


# constructor

ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}
