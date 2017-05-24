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
    cat(sprintf("%3d testing ... %30s %s \n", i, app, application))
    source(paste(system.file("examples", package = "rODE"),
                 app, sep ="/"))
    if (i == 1) {
        # result <- do.call("ComparisonRK45App", list(FALSE))
        result <- do.call(application, list(FALSE))
        # print(result)
        expect_equal(result, list(53.25076, 1.053471e-09, 1.053471e-09, 604),
                     tolerance = 1e-7)
    }
    if (i == 2) {
        result <- do.call(application, list(FALSE))
        expect_equal(result, list(51.958888, 9.584591e-08, 9.584591e-08, 286),
                     tolerance = 1e-7)
    }

    i <- i + 1
}

# print(examples)
