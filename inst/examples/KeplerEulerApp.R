# KeplerVerletApp.R
#
# Demostration of the use of ODE solver RK45
#
#

source(paste(system.file("examples", package = "rODE"),
             "KeplerEuler.R",
             sep ="/"))

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
            cat(sprintf("time=%11f energy=%11f s[1]=%11f s[2]=%11f s[3]=%11f s[4]=%11f s[5]=%11f\n",
                        getTime(particle), energy,
                        particle@state[1],
                        particle@state[2],
                        particle@state[3],
                        particle@state[4],
                        particle@state[5]))
        i <- i + 1
    }
    return(list(getTime(particle), energy,
                particle@state[1],
                particle@state[2],
                particle@state[3],
                particle@state[4],
                particle@state[5]
    ))

}

KeplerEulerApp()
