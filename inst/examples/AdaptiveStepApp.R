# AdaptiveStepApp.R

setClass("Impulse", contains = c("ODE"),
         slots = c(
             epsilon = "numeric"
         ))

setMethod("initialize", signature = c("Impulse"), function(.Object) {
    .Object@epsilon <- 0.01
    .Object@state <- c(-3.0, 1.0, 0.0)    # x, v, t
    return(.Object)
})

setMethod("getState", signature = c("Impulse"), function(object, ...) {
    return(object@state)
})

setMethod("getRate", signature = c("Impulse"), function(object, state, ...) {
    object@rate[1] <- state[2]
    object@rate[2] <- object@epsilon / ( object@epsilon * object@epsilon +
                                             state[1] * state[1] )
    object@rate[3] <- 1                             # dt/dt
    return(object@rate)
})


# running function
AdaptiveStepApp <- function() {
    ode        <- new("Impulse")
    ode_solver <- RK45(ode)
    ode_solver <- init(ode_solver, 0.1)
    ode_solver <- setTolerance(ode_solver, 1.0e-4)
    i <- 1; rowVector <- vector("list")
    while (getState(ode)[1] < 12) {
        rowVector[[i]] <- list(s1 = getState(ode)[1],
                               s2 = getState(ode)[2],
                               t  = getState(ode)[3])
        ode_solver <- step(ode_solver)
        ode <- ode_solver@ode
        i <- i + 1
    }
    return(data.table::rbindlist(rowVector))
}

# run application
solution <- AdaptiveStepApp()
plot(solution)
