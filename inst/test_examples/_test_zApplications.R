# Test by opening all application under the `examples` folder

library(testthat)

# this is where examples live
examples_dir <- system.file("examples", package = "rODE")

# get all the scripts that `App` in them
examples <- list.files(path = examples_dir, pattern = "*App", all.files = FALSE,
           full.names = FALSE, recursive = FALSE, ignore.case = FALSE,
           include.dirs = FALSE, no.. = FALSE)


# loop to open each file
for (app in examples) {
    cat(app, "\n")
    source(paste(system.file("examples", package = "rODE"),
                 app, sep ="/"))
}
