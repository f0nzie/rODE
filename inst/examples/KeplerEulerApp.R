# KeplerVerletApp.R
#
# Demostration of the use of ODE solver RK45
#
#


source("./inst/examples/KeplerEuler.R")

KeplerEulerApp <- function(verbose = FALSE) {

    particle <- Kepler()

    x  <- 1
    vx <- 0
    y  <- 0
    vy <- 2 * pi
    dt <- 0.01
    tol <- 1e-3

    particle <- init(particle, c(x, vx, y, vy, 0))

    odeSolver <- Euler(particle)
    odeSolver <- init(odeSolver, dt)

    particle@odeSolver <- odeSolver


    initialEnergy <- getEnergy(particle)
    i <- 0
    while (i < 100) {
        # odeSolver <- step(odeSolver)
        particle <- doStep(particle)
        # odeSolver <- particle@odeSolver
        energy <- getEnergy(particle)
        if (verbose)
            cat(sprintf("time=%12f energy=%12f state[5]=%12f \n",
                        getTime(particle), energy, particle@state[5]))
        i <- i + 1
    }

}

KeplerEulerApp()
