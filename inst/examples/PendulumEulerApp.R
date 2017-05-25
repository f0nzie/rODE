#
# PendulumEulerApp.R
#

library(ggplot2)

# ####################################################  Test Pendulum with Euler

source(paste(system.file("examples", package = "rODE"),
             "PendulumEuler.R",
             sep ="/"))

PendulumEulerApp <- function(verbose = FALSE) {

    ode <- new("ODE")
    pendulum <- PendulumEuler()

    dt <- 0.01
    theta <- 0.2
    thetaDot <- 0

    pendulum@state[3] <- 0      # set time to zero, t = 0

    pendulum <- setState(pendulum, theta, thetaDot)
    stepSize <- dt
    pendulum <- setStepSize(pendulum, stepSize)

    pendulum@odeSolver <- setStepSize(pendulum@odeSolver, dt) # set new step size

    rowvec <- vector("list")
    i <- 1
    while (pendulum@state[3] <= 1000)    {
        rowvec[[i]] <- list(state1 = pendulum@state[1],
                            state2 = pendulum@state[2],
                            state3 = pendulum@state[3])
        if (verbose)
            cat(sprintf("state1=%12f state2=%12f state3=%12f \n",
                        pendulum@state[1],
                    pendulum@state[2], pendulum@state[3]))
        i <- i + 1
        pendulum <- step(pendulum)
    }
    DTE <- data.table::rbindlist(rowvec)

    if (verbose) {
        cat(sprintf("state1=%12f state2=%12f state3=%12f \n",
                    pendulum@state[1],
                    pendulum@state[2], pendulum@state[3]))
        print(ggplot(DTE, aes(x = state3, y = state1)) + geom_line(col = "blue"))
        print(ggplot(DTE, aes(x = state3, y = state2)) + geom_line(col = "red"))
    }

    # save(DTE, file = "./data/pendulumDTE_1e-2.rda")
    return(list(pendulum@state[1],
                pendulum@state[2],
                pendulum@state[3]
    ))
}


PendulumEulerApp()
