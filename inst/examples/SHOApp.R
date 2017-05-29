# SHO.R
#

.SHO <- setClass("SHO", slots = c(
    k        = "numeric",
    state    = "numeric",
    amp      = "numeric",
    phase    = "numeric",
    omega    = "numeric",
    energy   = "numeric",
    count    = "numeric"),
    prototype = prototype(
        k = 0.1,
        state = c(pi/2.0, 0.0, 0.0)
    ),
    contains = c("ODE"))

setMethod("getState", "SHO", function(object) {
    object@state
})

setMethod("getRate", "SHO", function(object, state, ...) {
    object@rate[1] <- state[2]     # rate of change
    object@rate[2] <- -object@k * state[1]
    object@rate[3] <- 1            # rate of change of time, dt/dt
    object@rate
    # count++
})

setGeneric("getAnalyticX", function(object, ...) standardGeneric("getAnalyticX"))
setMethod("getAnalyticX", "SHO", function(object, ...) {
    object@amp * sin(object@omega * object@state[3] + object@phase)
})

setGeneric("getPositionError", function(object, ...) standardGeneric("getPositionError"))
setMethod("getPositionError", "SHO", function(object, ...) {
    object@state[1] - object@sin(object@omega * object@state[3] * object@phase)
})

setGeneric("getEnergyError", function(object, ...) standardGeneric("getEnergyError"))
setMethod("getEnergyError", "SHO", function(object, ...) {
    0.5 * (object@k * object@state[1] * object@state[1] +
               object@state[2] * object@state[2]) - object@energy
})

# constructor
SHO <- function(x, v, k) {
    sho <- .SHO()
    sho@k <- k
    sho@state[1] = x
    sho@state[2] = v
    sho@amp <- sqrt(x*x + v*v / k)
    sho@phase <- atan2(x, v/sqrt(k))
    sho@omega <- sqrt(k)
    sho@energy <- 0.5 * (k *x*x + v*v)
    return(sho)
}


# SHOApp.R
SHOApp <- function(...) {
    x <- 1.0; v <- 0; k <- 1.0; dt <- 0.01; tolerance <- 1e-3
    sho    <- SHO(x, v, k)
    solver_factory <- ODESolverFactory()
    solver <- createODESolver(solver_factory, sho, "DormandPrince45")
    # solver <- DormandPrince45(sho)                    # this can also be used
    solver <- setTolerance(solver, tolerance)
    solver <- init(solver, dt)
    i <- 1; rowVector <- vector("list")
    while (sho@state[3] <= 500) {
        rowVector[[i]] <- list(x = sho@state[1],
                               v = sho@state[2],
                               t = sho@state[3])
        solver <- step(solver)
        sho    <- solver@ode
        i <- i + 1
    }
    return(data.table::rbindlist(rowVector))
}

solution <- SHOApp()
plot(solution)


