mrk_id_to_ens_id <- function() {

  file <-
    system.file("extdata/mrk_id_to_ens_id.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "cc")

}

ens_id_to_mrk_id <- function() {

  file <-
    system.file("extdata/ens_id_to_mrk_id.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "cc")

}

mrk_id_to_entrez_id <- function() {

  file <-
    system.file("extdata/mrk_id_to_entrez_id.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "cc")

}

entrez_id_to_mrk_id <- function() {

  file <-
    system.file("extdata/entrez_id_to_mrk_id.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "cc")

}
