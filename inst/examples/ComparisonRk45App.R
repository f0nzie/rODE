# ComparisonRK45App.R
#
# Compares the solution by the RK45 ODE solver versus the analytical solution
#
#
context("ComparisonRK45App.R")
source(paste(system.file("examples", package = "rODE"),
             "ODETest.R", sep ="/"))

# source("./inst/examples/ODETest.R")           # hold the step and rate

ComparisonRK45App <- function(verbose = FALSE) {
    ode <- new("ODETest")

    ode_solver <- RK45(ode)

    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-8)

    time <-  0

    while (time < 50) {
        ode_solver <- step(ode_solver)
        stepSize <-  ode_solver@stepSize     # update the step size
        time <- time + stepSize
        state <- getState(ode_solver@ode)
        if (verbose)
            cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n", time, state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    getRateCounts(ode)))
    }
    if (verbose)
        cat("rate evaluated #", getRateCounts(ode))

    return(list(time , state[1],
                state[1] - getExactSolution(ode_solver@ode, time),
           getRateCounts(ode)
           ))
}

ComparisonRK45App()
