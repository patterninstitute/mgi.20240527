mrk_id_to_ens_id <- function() {

  file <-
    system.file("extdata/mrk_id_to_ens_id.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  read_rds(file = file)

}

ens_id_to_mrk_id <- function() {

  file <-
    system.file("extdata/ens_id_to_mrk_id.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  read_rds(file = file)

}

mrk_id_to_entrez_id <- function() {

  file <-
    system.file("extdata/mrk_id_to_entrez_id.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  read_rds(file = file)

}

entrez_id_to_mrk_id <- function() {

  file <-
    system.file("extdata/entrez_id_to_mrk_id.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  read_rds(file = file)

}
