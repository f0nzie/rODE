
<!-- README.md is generated from README.Rmd.  -->
[![Rdoc](http://www.rdocumentation.org/badges/version/rODE)](http://www.rdocumentation.org/packages/rODE)

rODE
====

The goal of `rODE` is to explore R and its `S4` classes and its differences with Java and Python classes while exploring physics simulations by solving ordinary differential equations (`ODE`).

`rODE` has been inspired on the extraordinary physics library for computer simulations OpenSourcePhyisics. Take a look at <http://opensourcephysics.org>.

The ODE solvers implemented in R so far:

-   Euler
-   Euler-Richardson
-   RK4
-   RK45, Dormand-Prince45
-   Verlet

Installation
------------

You can install the latest version of `rODE` from github with:

``` r
# install.packages("devtools")
devtools::install_github("AlfonsoRReyes/rODE")
```

Or from `CRAN`:

``` r
install.packages("rODE")
```

Examples
--------

Example scripts are located under the folder `examples` inside the package.

These examples make use of a parent class containing a customized rate calculation as well as the step and startup method. The methods that you would commonly find in the base script or parent class are:

-   getRate()
-   getState()
-   step() or doStep()
-   setStepSize()
-   init(), which is not the same as the `S4` class `initialize` method
-   initialize(), and
-   the constructor

These methods are defined in the virtual classes `ODE` and `ODESolver`.

Two other classes that serve as definition classes for the ODE solvers are: `AbstractODESolver` and `ODEAdaptiveSolver`.

For instance, the application `KeplerApp.R` needs the class `Kepler` located in the `Kepler.R` script, which is called with `planet <- Kepler(r, v)`, an `ODE` object. The solver for the same application is `RK45` called with `solver <- RK45(planet)`, where `planet` is a previuously declared `ODE` object. Since `RK45` is an ODE solver, the script `RK45.R` will be located in the folder `./R` in the package.

Vignettes
---------

The vignettes contain examples of the use of the various ODE solvers.

For instance, the notebook `Comparison` and `Kepler` use the ODE solver `RK45`; `FallingParticle` and `Planet` use the `Euler` solver; `Pendulum` makes use of `EulerRichardson`; `Planet` of `Euler`, `Projectile`; `Reaction` of `RK4`, and `KeplerEnergy` uses the ODE solver `Verlet`.

Tests
-----

There are tests for the core ODE solver classes under tests/testthat, as well as additional tests for the examples themselves.

### Test this folder

The tests for the examples are two: one for the base/parent classes such as `Kepler` or `Planet` or `Projectile`; this test runner is called `run_tests_this_folder.R`.

For the applications there is another runner (`run_test_applications.R`) that opens each of the applications as request for a return value. If the hard coded value is not returned, the test will fail. This ensures that any minor change in the core solver classes do not have any impact on the application solutions, and if there is, it must be explained.

### Tests all the application examples

You can test all applications under the `examples` folder by running the script `run_test_applications.R`. The way it works is by getting the list of all applications by filtering those ending with `App`. Then removes the extension `.R` from each app and starts looping to call each of the applications with `do.call`. A list contains the `expected` results that are compared against the result coming out from the call to the R application.

ComparisonRK45App
-----------------

``` r
# ++++++++++++++++++++++++++++++++++++++++++++++++  example: ComparisonRK45App.R
# Compares the solution by the RK45 ODE solver versus the analytical solution
# Example file: ComparisonRK45App.R
# ODE Solver:   Runge-Kutta 45
# Class:        RK45
library(rODE)
#> 
#> Attaching package: 'rODE'
#> The following object is masked from 'package:stats':
#> 
#>     step
importFromExamples("ODETest.R")

 ComparisonRK45App <- function(verbose = FALSE) {
     ode <- new("ODETest")                     # create an `ODETest` object
     ode_solver <- RK45(ode)                   # select the ODE solver
     ode_solver <- setStepSize(ode_solver, 1)      # set the step
     ode_solver <- setTolerance(ode_solver, 1e-8)  # set the tolerance
     time <-  0
     rowVector <- vector("list")
     i <- 1
     while (time < 50) {
         rowVector[[i]] <- list(t  = ode_solver@ode@state[2],
                                s1 = getState(ode_solver@ode)[1],
                                s2 = getState(ode_solver@ode)[2],
                                xs = getExactSolution(ode_solver@ode, time),
                                rc = getRateCounts(ode),
                                time = time)
         ode_solver <- step(ode_solver)       # advance one step
         stepSize <-  ode_solver@stepSize     # update the step size
         time <- time + stepSize
         state <- getState(ode_solver@ode)    # get the `state` vector
         i <- i + 1
     }
     return(data.table::rbindlist(rowVector))    # a data table with the results
 }
# show solution
solution <- ComparisonRK45App()                          # run the example
plot(solution)
```

![](README-unnamed-chunk-3-1.png)

FallingParticleODE
------------------

``` r
# +++++++++++++++++++++++++++++++++++++++++++++++  example: FallingParticleApp.R
# Application that simulates the free fall of a ball using Euler ODE solver
library(rODE)
importFromExamples("FallingParticleODE.R")      # source the class

FallingParticleODEApp <- function(verbose = FALSE) {
    # initial values
    initial_y <- 10
    initial_v <- 0
    dt <- 0.01
    ball <- FallingParticleODE(initial_y, initial_v)
    solver <- Euler(ball)                        # set the ODE solver
    solver <- setStepSize(solver, dt)            # set the step
    rowVector <- vector("list")
    i <- 1
    # stop loop when the ball hits the ground, state[1] is the vertical position
    while (ball@state[1] > 0) {
        rowVector[[i]] <- list(t  = ball@state[3],
                               y  = ball@state[1],
                               vy = ball@state[2])
        solver <- step(solver)                   # move one step at a time
        ball <- solver@ode                       # update the ball state
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}
# show solution
solution <- FallingParticleODEApp()
plot(solution)
```

![](README-unnamed-chunk-4-1.png)

Kepler
------

``` r
#  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ example KeplerApp.R
#  KeplerApp solves an inverse-square law model (Kepler model) using an adaptive
#  stepsize algorithm.
#  Application showing two planet orbiting
#  File in examples: KeplerApp.R
library(rODE)
importFromExamples("Kepler.R") # source the class Kepler

KeplerApp <- function(verbose = FALSE) {

    # set the orbit into a predefined state.
    r <- c(2, 0)                                   # orbit radius
    v <- c(0, 0.25)                                # velocity
    dt <- 0.1

    planet <- Kepler(r, v)
    solver <- RK45(planet)

    rowVector <- vector("list")
    i <- 1
    while (planet@state[5] <= 10) {
        rowVector[[i]] <- list(t  = planet@state[5],
                               planet1.r = planet@state[1],
                               p1anet1.v = planet@state[2],
                               planet2.r = planet@state[3],
                               p1anet2.v = planet@state[4])
        solver <- step(solver)
        planet <- solver@ode
        i <-  i + 1
    }
    DT <- data.table::rbindlist(rowVector)

    return(DT)
}

solution <- KeplerApp()
plot(solution)
```

![](README-unnamed-chunk-5-1.png)

KeplerEnergyApp
---------------

``` r
# ++++++++++++++++++++++++++++++++++++++++++++++++++  example: KeplerEnergyApp.R
# Demostration of the use of the Verlet ODE solver
#
library(rODE)
importFromExamples("KeplerEnergy.R") # source the class Kepler

KeplerEnergyApp <- function(verbose = FALSE) {
    # initial values
    x  <- 1
    vx <- 0
    y  <- 0
    vy <- 2 * pi
    dt <- 0.01
    tol <- 1e-3
    particle <- KeplerEnergy()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)
    odeSolver <- init(odeSolver, dt)
    particle@odeSolver <- odeSolver
    initialEnergy <- getEnergy(particle)
    rowVector <- vector("list")
    i <- 1
    while (getTime(particle) <= 1.20) {
        rowVector[[i]] <- list(t  = particle@state[5],
                               x  = particle@state[1],
                               vx = particle@state[2],
                               y  = particle@state[3],
                               vy = particle@state[4],
                               E  = getEnergy(particle))
        particle <- doStep(particle)
        energy <- getEnergy(particle)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}


solution <- KeplerEnergyApp()
plot(solution)
```

![](README-unnamed-chunk-6-1.png)

LogisticApp
-----------

``` r
library(rODE)
importFromExamples("Logistic.R") # source the class Logistic

# Run the application
LogisticApp <- function(verbose = FALSE) {
    x  <- 0.1
    vx <- 0
    r  <- 2        # Malthusian parameter (rate of maximum population growth)
    K  <- 10.0     # carrying capacity of the environment
    dt   <- 0.01; tol  <- 1e-3; tmax <- 10
    population <- Logistic()
    population <- init(population, c(x, vx, 0), r, K)
    odeSolver <- Verlet(population)
    odeSolver <- init(odeSolver, dt)
    population@odeSolver <- odeSolver
    rowVector <- vector("list")
    i <- 1
    while (getTime(population) <= tmax) {
        rowVector[[i]] <- list(t = getTime(population),
                               s1 = population@state[1],
                               s2 = population@state[2])
        population <- doStep(population)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}
# show solution
solution <- LogisticApp()
plot(solution)
```

![](README-unnamed-chunk-7-1.png)
