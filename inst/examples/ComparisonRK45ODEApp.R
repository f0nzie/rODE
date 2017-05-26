# Example file: ComparisonRK45ODEApp.R
# ODE Solver:   Runge-Kutta 45
# Class:        RK45
#
# Updates the ODE state instead of using the internal state in the ODE solver
# Also plots the solver solution versus the analytical solution at a
# tolerance of 1e-6

importFromExamples("ODETest.R")

ComparisonRK45ODEApp <- function(verbose = FALSE) {

    ode <- new("ODETest")                         # new ODE instance
    ode_solver <- RK45(ode)                       # select ODE solver
    ode_solver <- setStepSize(ode_solver, 1)      # set the step
    ode_solver <- setTolerance(ode_solver, 1e-6)  # set the tolerance

    time <-  0
    rowVector <- vector("list")                   # row vector
    i <- 1    # counter
    while (time < 50) {
        # add solution objects to a row vector
        rowVector[[i]] <- list(t = ode_solver@ode@state[2],
                               ODE = getState(ode_solver@ode)[1],
                               s2 = getState(ode_solver@ode)[2],
                               exact = getExactSolution(ode_solver@ode, time),
                               rc = getRateCounts(ode),
                               time = time
        )
        ode_solver <- step(ode_solver)            # advance solver one step
        stepSize <-  getStepSize(ode_solver)      # get the current step size
        time <- time + stepSize
        ode <- ode_solver@ode                     # get updated ODE object
        state <- getState(ode)                    # get the `state` vector
        if (verbose)
            cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n",
                    time,
                    state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    getRateCounts(ode)))
        i <- i + 1                                # add a row vector
    }
    DT <- data.table::rbindlist(rowVector)        # create data table

    if (verbose)
        cat("Number of rates evaluated #", getRateCounts(ode))

    return(DT)
}

DT <- ComparisonRK45ODEApp()


library(ggplot2)
library(dplyr)
library(tidyr)

DT.multi <- DT %>%
    select(t, ODE, exact)

plot(DT.multi)

DT.2x1 <- DT.multi %>%
    gather(key, value, -t)

t
g <- ggplot(DT.2x1, mapping = aes(x = t, y = value, color = key))
g <-  g + geom_line(size = 1) + labs(title = "ODE vs Exact solution",
                                     subtitle = "tolerance = 1E-6")
print(g)

# This example can also be found under the package folder ./examples
# ComparisonRK45ODEApp.R
