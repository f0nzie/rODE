# ComparisonRK45App.R
#
# Compares the solution by the RK45 ODE solver versus the analytical solution
#


ComparisonRK45App <- function(verbose = FALSE) {
    ode <- new("ODETest")

    ode_solver <- RK45(ode)

    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-8)

    time <-  0

    rowVector <- vector("list")
    i <- 1
    while (time < 50) {
        rowVector[[i]] <- list(t = ode_solver@ode@state[2],
                               s1 = getState(ode_solver@ode)[1],
                               s2 = getState(ode_solver@ode)[2],
                               xs = getExactSolution(ode_solver@ode, time),
                               rc = getRateCounts(ode),
                               time = time

        )
        ode_solver <- step(ode_solver)
        stepSize <-  ode_solver@stepSize     # update the step size
        time <- time + stepSize
        state <- getState(ode_solver@ode)    # get the `state` vector
        if (verbose)
            cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n", time, state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    getRateCounts(ode)))
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    if (verbose)
        cat("rate evaluated #", getRateCounts(ode))

    return(DT)
}

ComparisonRK45App()
