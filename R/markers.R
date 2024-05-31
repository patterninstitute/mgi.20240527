markers <- function() {

  file <-
    system.file("extdata/markers.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "ccccciciiccciic")

}
