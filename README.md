
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
