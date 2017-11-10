# # rODE 0.99.5.9007
* 20171109-201711
* add exercise using the ODE Solver RK4. find the saturation value at pressure of 3 with a time step 0.05
* remove Google citations URL link because they do not work
* add file `rODE_biblio.bib` edited with JabRef
* add knitcitations and some bibliography
* move NAODE vignette to notebooks

# # rODE 0.99.5.9006
* 20171107-20171107
* Plot the errors between the ODE solver solutions
* Create a one-step approach using two nested lapply functions iterating through the all the solvers and all the step sizes.
* Using a ODEFactory to send only the name of the solvers instead of composing an implementation for each of the solvers
* Show two solvers first: Euler and Runge-Kutta. Compare results
* Start with Euler solver
* select step sizes to be 0.2., 0.1, 0.05
* add new vignette `Muskat-MBal`

# rODE 0.99.5.9005
* 20171105 - 20171106
* add vignette `ErrorEuler` that shows using an internal accumulator in the ODE solver class.
* `ErrorEuler` is similar to `ODETest` but differs in the way the loop has been built. The constructor receives an argument for the initial conditions of the variables. The loop is not controlled by time -as in `ODETest`-, but by the number of steps. The objective is to calculate and plot the step size versus the error. Two log-log plots are produced. A exact solution value is also calculated to find the error.
* modify vignette `Comparison` that shows the use of the internal accumulator.

# rODE 0.99.5.9004
* 20171104 - test if badges update build status
* push feature site built with pkgdown to gh-pages
* change badges from master to develop


# rODE 0.99.5.9003
* 20171103
* add small TOC for the applications
* improve vignette Reaction with plots
* remove date from NEWS sections and move it as body text

# rODE 0.99.5.9002
* 20171103
* Use only 17 examples because adding more causes a problem in 00Index producing blank lines.
* add demo folder with 19 examples


# rODE 0.99.5.9001
* reorganize roxygen2 comments to have better visualization in help pages
* add constructors to ODE, ODESOlver, ODESolverFactory
* move class generics to its own class file
* add travis, coverage, cran badges


# rODE 0.99.5.9000
* 20170718
* change to getState() instead of internal class objects

# rODE 0.99.5
* 20170712
* to be released to CRAN
* change github user to f0nzie
* testing rODE in Linux Mint 18.2. Passed.
* add section Applications in README
* testing rODE in osX. Passed.

# rODE 9007
* 20170712
* fix tests that we were using showMethods2
* split examples in classes and applications
* add applications to README. Includes figures.
* move figures folder to man/figures

# rODE 0.99.4.9006
* add NEWS.md
* add file cran-comments.md
* add pre-commit hook for README in Windows
* couple of changes in README

# rODE 0.99.4.9005
* fix vignettes names
* change name of test runner to run_test_applications.R
* add app VanderpolMuTimeControlApp.R
* add app VanderpolApp.R
* add app SpringRKApp.R
* Change all examples to have data.table as output for tests
* Add new app AdaptiveStepApp.R
* Add new method createODESolver
* Add new class ODESolverFactory
* Add new example SHOApp.R

# rODE 0.99.4
* Released by CRAN on May 28, 2017
