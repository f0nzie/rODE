# Test by opening all applications under the `examples` folder Get the list of
# appliations by filtering those ending with `App`.
#
# Remove the extension `.R` from each app and loop to call each of the
# applications with `do.call`.
#
# A list contains the expected results that are compared against the result
# coming out from the call to the application.


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
    # cat(sprintf("\n %3d testing ... %30s %25s", i, app, application))
    cat(sprintf("\n %3d testing ... %30s", i, app))
    source(paste(system.file("examples", package = "rODE"),
                 app, sep ="/"))


    if (i == 1) {
        # AdaptiveStepApp, tolerance =
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),])
        expect_equal(.result, list(s1 = 9.910181, s2 = 2.697124, t=6.635591),
                     tolerance = 1e-7)
        cat("\t tested")
    }

    if (i == 2) {
        # ComparisonRK45App. tolerance = 1e-6
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),])
        expect_equal(.result, list(t=45.75203, s1=9.691675e-10, s2=45.75203,
                                   xs=1.6393e-21, rc=598, time=49.46946),
                     tolerance = 1e-7)
        cat("\t tested")
    }
    if (i == 3) {
        # ComparisonRK45ODEApp. tolerance = 1e-6
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),])
        expect_equal(.result, list(t=43.22881, ODE=1.108886e-07, s2=43.22881,
                                  exact=5.249407e-21, rate.counts=280,
                                  time=48.30561),
                     tolerance = 1e-6)
        cat("\t tested")
    }
    if (i == 4) {
        # FallingParticleApp
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),])
        expect_equal(.result,
                     list(t=1.43, y=0.05006, vy=-14.014),
                     tolerance = 1e-12)
        cat("\t tested")
    }
    if (i == 5) {
        # KeplerApp
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=9.971599, planet1.r=0.5303791, p1anet1.v=-1.339153,
                          planet2.r=0.4781323, p1anet2.v=-0.2645141),
                     tolerance = 1e-6)
        cat("\t tested")
    }
    if (i == 6) {
        # KeplerDormandPrince45App
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=1.444831, x=-0.9404485, vx=-2.136978,
                          y=0.3400727, vx=-5.908522, energy=-19.73793),
                     tolerance = 1e-5)
        cat("\t tested")
    }

    if (i == 7) {
        # KeplerEnergyApp
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=1.19, x=0.3757742, vx=-5.817511,
                          y=0.927382, vy=2.363469, E=-19.73918),
                     tolerance = 1e-5)
        cat("\t tested")
    }

    if (i == 8) {
        # KeplerEulerApp
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=0.98, x=-0.6514722, vx=4.019233,
                          y=-1.578873, vy=-2.069668, E=-12.89498),
                     tolerance = 1e-5)
        cat("\t tested")
    }


    if (i == 9) {
        # PendulumApp
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=39.9, theta=0.2066864, thetadot=-0.05442821),
                     tolerance = 1e-5)
        cat("\t tested")
    }


    if (i == 10) {
        # PendulumEulerApp. dt <- 0.01
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=50, theta=-0.1246416, thetaDot=0.6912865
                     ),
                     tolerance = 1e-5)
        cat("\t tested")
    }

    if (i == 11) {
        # PendulumRK4App. dt <- 0.01
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(state1=-0.1969044, state2=-0.06044034, state3=19.9),
                     tolerance = 1e-5)
        cat("\t tested")
    }

    if (i == 12) {
        # PlanetApp
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]); #cat("\n");print(.result)
        expect_equal(.result,
                     list(t=89.95, x=0.5448977, vx=1.754475,
                          y=-8.489961, vy=0.2846164),
                     tolerance = 1e-5)
        cat("\t tested")
    }


    if (i == 13) {
        # ProjectileApp
        cat(sprintf("%25s", application))
        result  <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]);
        expect_equal(.result,
                     list(t=2.04, x=20.4, vx=10, y=0.00816, vy=-9.992),
                     tolerance = 1e-5)
        cat("\t tested")
    }


    if (i == 14) {
        # Reaction
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]); #cat("\n");print(.result)
        expect_equal(.result,
                     list(t=100, X=2.131958, Y=1.105316), tolerance = 1e-6)
        cat("\t tested")
    }

    if (i == 15) {
        # RigidBodyNXFApp
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]); #cat("\n");print(.result)
        expect_equal(.result,
                     list(t=12, y1=-0.7434223, y2=-0.7347173, y3=0.8655997),
                     tolerance = 1e-6)
        cat("\t tested")
    }


    if (i == 16) {
        # SHOApp
        cat(sprintf("%25s", application))
        result <- do.call(application, list(FALSE))
        .result <- as.list(result[nrow(result),]); #cat("\n");print(.result)
        expect_equal(.result,
                     list(x=-1.007698, v=0.422443, t=499.905),
                     tolerance = 1e-6)
        cat("\t tested")
    }

    i <- i + 1
}


