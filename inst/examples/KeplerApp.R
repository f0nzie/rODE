#
# KeplerApp.R
#
#

source("./inst/examples/Kepler.R")

KeplerApp <- function(verbose = FALSE) {

    # set the orbit into a predefined state.
    r <- c(2, 0)
    v <- c(0, 0.25)
    dt <- 0.1

    planet <- Kepler(r, v)
    solver <- RK45(planet)

    # solver <- step(solver)

    while (planet@state[5] <= 10) {
        solver <- step(solver)
        planet <- solver@ode
        if (verbose)
            cat(sprintf("state[1]=%10f, state[2]= %10f,  state[3]=%10f, state[5]=%10f\n",
                    planet@state[1],
                    planet@state[2], planet@state[3], planet@state[5]))
    }

    return(list(planet@state[1], planet@state[2], planet@state[3], planet@state[5]))
}


KeplerApp()






# at t=100, dt=0.1,  c(2.131958,     1.105316,   100.000000)
# Java: state[0] = 0.444912, state[1]= -1.436203, state[2]= 0.459081, state[4]= 10.033245
#       currentStep=    0.061646

# R:    state[1] = 0.444912, state[2]= -1.436203, state[3]= 0.459081, state[5]= 10.033245
#       currentStep= 0.06164632
