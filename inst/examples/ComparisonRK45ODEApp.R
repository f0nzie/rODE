# ComparisonRK45ODEApp.R
#
# Updates ODE state instead of using internal state in the ODE solver
# File ComparisonRK45App.R does npt makde ode abstraction
#

source(paste(system.file("examples", package = "rODE"),
             "ODETest.R", sep ="/"))

# source("./inst/examples//ODETest.R")


ComparisonRK45ODEApp <- function(verbose = FALSE) {
    ode <- new("ODETest")

    ode_solver <- RK45(ode)

    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-6)

    time <-  0

    while (time < 50) {
        ode_solver <- step(ode_solver)
        stepSize <-  getStepSize(ode_solver)
        time <- time + stepSize
        ode <- ode_solver@ode
        state <- getState(ode)
        if (verbose)
        cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n",
                    time,
                    state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    getRateCounts(ode)))
    }
    if (verbose)
        cat("Number of rates evaluated #", getRateCounts(ode))

    return(list(time , state[1],
                state[1] - getExactSolution(ode_solver@ode, time),
                getRateCounts(ode)
    ))

}



ComparisonRK45ODEApp()
