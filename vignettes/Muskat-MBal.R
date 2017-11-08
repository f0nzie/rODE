## ----message=FALSE, results="hold"---------------------------------------
# the ODE object

library(rODE)
library(ggplot2)

setClass("MuskatODE", slots = c(
    stack = "environment"                # environment object inside the class
    ),
    contains = c("ODE")
    )

setMethod("initialize", "MuskatODE", function(.Object, ...) {
    .Object@stack$n <-  0               
    .Object@state   <- vector("numeric", 1)
    return(.Object)
})

setMethod("getState", "MuskatODE", function(object, ...) {
    object@state
})

setMethod("getRate", "MuskatODE", function(object, state, ...) {
    object@rate[1] <- state[1] + 2 * state[2]         # 2P + S
    object@rate[2] <- 1                               # dP/dP
    object@stack$n <- object@stack$n + 1              # add 1 to the rate count
    object@rate
})

# constructor
MuskatODE <- function(P, S) {
    .MuskatEuler <- new("MuskatODE")
    .MuskatEuler@state[1] = S        # S
    .MuskatEuler@state[2] = P        # P = t
    return(.MuskatEuler)
}

## ------------------------------------------------------------------------
# class implementation
MuskatEulerApp <- function(p_max, stepSize) {
    initial_P <- 0
    initial_S <- 1
    
    xmax      <- p_max
    stepSize  <- stepSize
    n_steps   <- as.integer((xmax + stepSize / 2) / stepSize)
    
    ode        <- MuskatODE(initial_P, initial_S)
    ode_solver <- Euler(ode)
    ode_solver <- setStepSize(ode_solver, stepSize)
    
    steps <- 0
    rowVector <- vector("list")
    i <-  1
    while (steps < n_steps) {
        ode_solver <- step(ode_solver)
        state      <- getState(ode_solver@ode)
        steps      <- ode_solver@ode@stack$n
        rowVector[[i]] <- list(
                            P = state[2],     # x = t
                            S = state[1],     # y
                            steps = steps)
        i <- i + 1
    }
    data.table::rbindlist(rowVector)
}

## ------------------------------------------------------------------------
# calculate the saturations at different pressures up to Pmax=0.2
df <- MuskatEulerApp(p_max = 0.2, stepSize = 0.005)
df

## ------------------------------------------------------------------------
# plot saturation vs pressure
library(ggplot2)
ggplot(df, aes(P, S)) +
    geom_point()

## ------------------------------------------------------------------------
# get the last row of the dataframe
df <- MuskatEulerApp(p_max = 0.25, stepSize = 0.1)
last_row <- df[nrow(df),]
last_row

last_saturation <- last_row$S

## ------------------------------------------------------------------------
# function that gets the error for different step sizes
get_last_saturation <- function(stepSize) {
    df <- MuskatEulerApp(p_max = 0.25, stepSize)
    last_row <- df[nrow(df),]
    last_saturation <- last_row$S
    c(step_size = stepSize, Sat = last_saturation, n_steps = last_row$steps)
}

step_sizes <- c(0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0001, 1e-5, 5e-6)
last_sat   <- data.frame(t(sapply(step_sizes, get_last_saturation)))
last_sat

## ------------------------------------------------------------------------
# class implementation
MuskatRK4App <- function(p_max, stepSize) {
    initial_S <- 1
    initial_P <- 0
    
    xmax      <- p_max
    stepSize  <- stepSize
    n_steps   <- as.integer((xmax + stepSize / 2) / stepSize)
    
    ode        <- MuskatODE(initial_P, initial_S)
    ode_solver <- EulerRichardson(ode)
    ode_solver <- setStepSize(ode_solver, stepSize)
    
    steps <- 0
    rowVector <- vector("list")
    i <-  1
    while (steps < n_steps) {
        ode_solver <- step(ode_solver)
        state      <- getState(ode_solver@ode)
        steps      <- ode_solver@ode@stack$n
        rowVector[[i]] <- list(
                            P = state[2],     # x = t
                            S = state[1],     # y
                            steps = steps)
        i <- i + 1
    }
    data.table::rbindlist(rowVector)
}

## ------------------------------------------------------------------------
# function that gets the error for different step sizes
get_last_saturation <- function(stepSize) {
    df <- MuskatRK4App(p_max = 0.25, stepSize)
    last_row <- df[nrow(df),]
    last_saturation <- last_row$S
    c(step_size = stepSize, Sat = last_saturation, n_steps = last_row$steps)
}

# step_sizes <- c(0.1, 0.05, 0.01, 0.005, 0.001, 0.0001, 1e-5, 5e-6)
step_sizes <- c(0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0001, 1e-5, 5e-6)
last_sat   <- data.frame(t(sapply(step_sizes, get_last_saturation)))
last_sat

