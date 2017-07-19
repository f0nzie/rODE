# ++++++++++++++++++++++++++++++++++++++++++ example: KeplerDormandPrince45App.R
# Demostration of the use of ODE solver RK45 for a particle subjected to
# a inverse-law force. The difference with the example KeplerApp is we are
# seeing the effect in thex and y axis on the particle.
# The original routine used the Verlet ODE solver

importFromExamples("KeplerDormandPrince45.R")

set_solver <- function(ode_object, solver) {
    slot(ode_object, "odeSolver") <- solver
    ode_object
}

KeplerDormandPrince45App <- function(verbose = FALSE) {
    # values for the examples
    x  <- 1
    vx <- 0
    y  <- 0
    vy <- 2 * pi
    dt <- 0.01          # step size
    tol <- 1e-3         # tolerance
    particle  <- KeplerDormandPrince45()                            # use class Kepler
    particle  <- init(particle, c(x, vx, y, vy, 0))  # enter state vector
    odeSolver <- DormandPrince45(particle)      # select the ODE solver
    odeSolver <- init(odeSolver, dt)            # start the solver
    odeSolver <- setTolerance(odeSolver, tol)   # this works for adaptive solvers

    # these all produce the same positive result to copy the solver to ODE object
    # (the problem with these solutions is that the user has to know the name of
    #  the slot @odeSolver)
    #     particle@odeSolver <- odeSolver
        slot(particle, "odeSolver") <- odeSolver
    #     particle <- set_solver(particle, odeSolver)

    initialEnergy <- getEnergy(particle)        # calculate the energy
    rowVector <- vector("list")
    i <- 1
    while (getTime(particle) < 1.5) {
    rowVector[[i]] <- list(t  = getState(particle)[5],
                           x  = getState(particle)[1],
                           vx = getState(particle)[2],
                           y  = getState(particle)[3],
                           vx = getState(particle)[4],
                           energy = getEnergy(particle) )
        particle <- doStep(particle)            # advance one step
        energy   <- getEnergy(particle)         # calculate energy
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}


solution <- KeplerDormandPrince45App()
plot(solution)

