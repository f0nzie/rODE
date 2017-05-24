#
# ReactionApp.R
#
# ReactionApp solves an autocatalytic oscillating chemical
# reaction (Brusselator model) using
# a fouth-order Runge-Kutta algorithm.


source("./inst/examples/Reaction.R")

ReactionApp <- function(verbose = FALSE) {
    X <- 1; Y <- 5;
    dt <- 0.1

    reaction <- Reaction(c(X, Y, 0))

    solver <- RK4(reaction)

    while (solver@ode@state[3] < 100) {
        if (verbose)
            cat(sprintf("%12f %12f %12f \n", solver@ode@state[1],
                    solver@ode@state[2],
                    solver@ode@state[3]))
        solver <- step(solver)
    }

    # print the last line after solver
    if (verbose)
        cat(sprintf("%12f %12f %12f \n", solver@ode@state[1],
                solver@ode@state[2],
                solver@ode@state[3]))

    return(list(solver@ode@state[1], solver@ode@state[2], solver@ode@state[3]))
}


ReactionApp()


# Java
# at t=100, dt=0.1,  c(2.131958,     1.105316,   100.000000)
#    t=50, dt=0.1,     0.493079    2.821023   50.000000
