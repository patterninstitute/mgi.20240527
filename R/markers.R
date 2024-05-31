markers_all <- function() {

  file <-
    system.file("extdata/markers.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "ccccciciiccciic")

}


#' @export
markers <- function(query,
                    var = c("mrk_id", "mrk_symbol", "entrez_gene_id", "ensembl_gene_id")) {

  mrk <- markers_all()
  if (missing(query)) {
    return(mrk)
  }

  var <- match.arg(var)
  query_tbl <- tibble::tibble("{var}" := query)
  query_tbl |>
    dplyr::left_join(mrk, by = var)

}
