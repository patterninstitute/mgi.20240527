#' Crosswalks involving gene markers
#'
#' - [update_symbol()] maps (potentially old) symbols to most up-to-date symbols.
#' - [symbol_to_marker_id()] maps (potentially old) symbols to marker identifiers.
#' - [marker_id_to_ensembl_id()] maps MGI gene markers identifiers to an Ensembl gene identifiers.
#' - [ensembl_id_to_marker_id()] maps Ensembl gene identifiers to MGI gene markers identifiers.
#' - [marker_id_to_entrez_id()] maps MGI gene markers identifiers to an Entrez gene identifiers.
#' - [entrez_id_to_marker_id()] maps Entrez gene identifiers to MGI gene markers identifiers.
#'
#'
#' @param symbol A character vector of marker symbols.
#'
#' @returns A character of most recent marker symbols or identifiers.
#'
#' @examples
#' symbols <- c("Xkr4", "LOC102640625", "LOC102640548", "Rp1", "Sox17",
#'              "Gm7357", "Gm7369", "LOC102640704", "LOC102631571", "Mrpl15")
#'
#' update_symbol(symbols)
#'
#' symbol_to_marker_id(symbols)
#'
#' @importFrom rlang .data
#' @export
update_symbol <- function(symbol) {

  map <- symbol_map()
  symbol_query <- tibble::tibble(from = symbol)
  dplyr::left_join(symbol_query, map, by = "from") |>
    dplyr::pull("to")

}

#' @importFrom rlang .data
#' @rdname update_symbol
#' @export
symbol_to_marker_id <- function(symbol) {

  map <- symbol_map()

  symbol_query <- tibble::tibble(from = symbol)
  dplyr::left_join(symbol_query, map, by = "from") |>
    dplyr::pull("mrk_id")

}

#' @rdname update_symbol
#' @export
marker_id_to_ensembl_id <- function(marker_id) {

  map <- mrk_id_to_ens_id()
  marker_id_query <- tibble::tibble(mrk_id = marker_id)
  dplyr::left_join(marker_id_query, map, by = "mrk_id") |>
    dplyr::pull("ensembl_gene_id")
}

#' @param ensembl_id A character vector of Ensembl gene identifiers.
#' @rdname update_symbol
#' @export
ensembl_id_to_marker_id <- function(ensembl_id) {
  map <- ens_id_to_mrk_id()
  ensembl_id_query <- tibble::tibble(ensembl_gene_id = ensembl_id)
  dplyr::left_join(ensembl_id_query, map, by = "ensembl_gene_id") |>
    dplyr::pull("mrk_id")
}

#' @param marker_id A character vector of MGI marker identifiers.
#' @rdname update_symbol
#' @export
marker_id_to_entrez_id <- function(marker_id) {

  map <- mrk_id_to_entrez_id
  marker_id_query <- tibble::tibble(mrk_id = marker_id)
  dplyr::left_join(marker_id_query, map, by = "mrk_id") |>
    dplyr::pull("entrez_gene_id")
}

#' @param entrez_id A character vector of Entrez gene identifiers.
#' @rdname update_symbol
#' @export
entrez_id_to_marker_id <- function(entrez_id) {
  map <- ens_id_to_mrk_id()
  entrez_id_query <- tibble::tibble(entrez_gene_id = entrez_id)
  dplyr::left_join(entrez_id_query, map, by = "entrez_gene_id") |>
    dplyr::pull("mrk_id")
}
