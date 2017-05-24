# ComparisonRK45App.R
#
# Compares the solution by the RK45 ODE solver versus the analytical solution
#
#

source("./inst/examples/ODETest.R")           # hold the step and rate

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
    cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n", time, state[1],
                (state[1] - getExactSolution(ode_solver@ode, time)),
                getRateCounts(ode)))
}
cat("rate evaluated #", getRateCounts(ode))
