# ###########################
# FallingParticleApp.R
#


source(paste(system.file("examples", package = "rODE"),
             "FallingParticleODE.R", sep ="/"))


FallingParticleODEApp <- function(verbose = FALSE) {

    initial_y <- 10
    initial_v <- 0
    dt <- 0.01

    ball <- FallingParticleODE(initial_y, initial_v)

    solver <- Euler(ball)
    solver <- setStepSize(solver, dt)

    # stop loop when the ball hits the ground
    while (ball@state[1] > 0) {
        solver <- step(solver)
        ball <- solver@ode
        if (verbose) {
            cat(sprintf("%12f %12f ",  ball@state[1], ball@rate[1] ))
            cat(sprintf("%12f %12f ",  ball@state[2], ball@rate[2] ))
            cat(sprintf("%12f %12f\n", ball@state[3], ball@rate[3] ))
        }
    }
    return(list(ball@state[1], ball@rate[1],
           ball@state[2], ball@rate[2],
           ball@state[3], ball@rate[3]))
}
