# Test by opening all application under the `examples` folder

library(testthat)

# this is where examples live
examples_dir <- system.file("examples", package = "rODE")

# get all the scripts that `App` in them
examples <- list.files(path = examples_dir, pattern = "*App", all.files = FALSE,
           full.names = FALSE, recursive = FALSE, ignore.case = FALSE,
           include.dirs = FALSE, no.. = FALSE)


# loop to open each file
i <- 1
for (app in examples) {
    application <- sub("\\.R$", '', app)
    cat(sprintf("\n %3d testing ... %30s %25s", i, app, application))
    source(paste(system.file("examples", package = "rODE"),
                 app, sep ="/"))
    if (i == 1) {
        # ComparisonRK45App. tolerance = 1e-6
        result <- do.call(application, list(FALSE))
        expect_equal(result, list(53.25076, 1.053471e-09, 1.053471e-09, 604),
                     tolerance = 1e-7)
        cat("\t tested")
    }
    if (i == 2) {
        # ComparisonRK45ODEApp. tolerance = 1e-6
        result <- do.call(application, list(FALSE))
        expect_equal(result, list(51.958888, 9.584591e-08, 9.584591e-08, 286),
                     tolerance = 1e-7)
        cat("\t tested")
    }
    if (i == 3) {
        # FallingParticleApp
        result <- do.call(application, list(FALSE))
        expect_equal(result,
                     list(-0.090080, -14.014000, -14.112000, -9.800000,
                          1.440000, 1.000000),
                     tolerance = 1e-13)
        cat("\t tested")
    }
    if (i == 4) {
        # KeplerApp
        result <- do.call(application, list(FALSE))
        expect_equal(result,
                     list(0.444912, -1.436203, 0.459081, 10.033245
                          ),
                     tolerance = 1e-6)
        cat("\t tested")
    }
    if (i == 5) {
        # KeplerDormandPrince45App
        result <- do.call(application, list(FALSE))
        expect_equal(result,
                     list(1.507215, -19.737875, 1.507215, -0.999051, -0.044948
                     ),
                     tolerance = 1e-5)
        cat("\t tested")
    }


    if (i == 13) {
        # Reaction
        result <- do.call(application, list(FALSE))
        expect_equal(result,
                     list(1.987618, 1.143675, 100.1
                     ), tolerance = 1e-6)
        cat("\t tested")
    }


    i <- i + 1
}


# Java results

# ComparisonRK45App. tolerance = 1e-6
# time=49.53332952390886	x1 = 1.0534708814724231E-9 	 error= 1.0534708814708852E-9n=604

# ComparisonRK45ODEApp. tolerance = 1e-6
# time=46.88208701055634	x1 = 9.584591194345978E-8 	 error= 9.584591194343798E-8n=286

# FallingParticleApp: state[1], state[2], state[3]
# -0.090080   -14.112000     1.440000
