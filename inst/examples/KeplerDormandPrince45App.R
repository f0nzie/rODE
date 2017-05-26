# KeplerDormandPrince45App.R
#
# Demostration of the use of ODE solver RK45
# Brought from original routine for testing Verlet ODE solver
#
#

importFromExamples("KeplerDormandPrince45.R")

KeplerDormandPrince45App <- function(verbose = FALSE) {
    # values for the examples
    x  <- 1
    vx <- 0
    y  <- 0
    vy <- 2 * pi
    dt <- 0.01          # step size
    tol <- 1e-3         # tolerance

    particle <- Kepler()                            # use class Kepler
    particle <- init(particle, c(x, vx, y, vy, 0))  # enter state vector

    odeSolver <- DormandPrince45(particle)      # select the ODE solver
    odeSolver <- init(odeSolver, dt)            # start the solver

    odeSolver <- setTolerance(odeSolver, tol)   # this works for adaptive solvers
    particle@odeSolver <- odeSolver             # copy the solver to ODE object
    initialEnergy <- getEnergy(particle)        # calculate the energy

    rowVector <- vector("list")
    i <- 1
    while (getTime(particle) < 1.5) {
        rowVector[[i]] <- list(t = particle@state[5], s1 = particle@state[1],
                               s2 = particle@state[2], s3 = particle@state[3],
                               s4 = particle@state[4],
                               energy = getEnergy(particle) )
        particle <- doStep(particle)            # advance one step
        energy   <- getEnergy(particle)         # calculate energy

        if (verbose)
            cat(sprintf("time=%12f energy=%12f state[5]=%12f x=%10f y=%10f \n",
                    getTime(particle),
                    energy, particle@state[5], particle@state[1], particle@state[3]))
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}


DT <- KeplerDormandPrince45App()
plot(DT)


# Values from Java simulator at t approx = 1.5
# time=    1.444831 energy=  -19.737930 state[4]=    1.444831
# time=    1.507215 energy=  -19.737875 state[4]=    1.507215
# time=    1.569599 energy=  -19.737819 state[4]=    1.569599
