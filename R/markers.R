markers <- function() {

  file <-
    system.file("extdata/markers.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  read_rds(file = file)

}
