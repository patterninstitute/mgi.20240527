#' Crosswalks for MGI markers
#'
#' Crosswalks involving MGI gene symbols, identifiers, Entrez gene identifiers
#' and Ensembl gene identifiers.
#'
#' Mappings to Entrez or Ensembl gene identifiers are provided only when these
#' identifiers were valid at 27 May 2024, in other words, mappings to
#' identifiers that have been deprecated results in `NA`.
#'
#' @details
#'
#' - [update_symbol()] maps (potentially old) symbols to most up-to-date symbols.
#' - [symbol_to_marker_id()] maps (potentially old) symbols to marker identifiers.
#' - [symbol_to_ensembl_id()] maps (potentially old) symbols to Ensembl identifiers.
#' - [symbol_to_entrez_id()] maps (potentially old) symbols to Entrez gene identifiers.
#' - [marker_id_to_symbol()] maps MGI gene markers identifiers to marker symbols.
#' - [marker_id_to_ensembl_id()] maps MGI gene markers identifiers to an Ensembl gene identifiers.
#' - [marker_id_to_entrez_id()] maps MGI gene markers identifiers to an Entrez gene identifiers.
#' - [ensembl_id_to_marker_id()] maps Ensembl gene identifiers to MGI gene markers identifiers.
#' - [ensembl_id_to_symbol()] maps Ensembl gene identifiers to marker symbols.
#' - [entrez_id_to_marker_id()] maps Entrez gene identifiers to MGI gene markers identifiers.
#'
#' @param symbol A character vector of marker symbols.
#'
#' @returns A character of mapped marker symbols or identifiers (as of 27 May
#'   2024).
#'
#' @examples
#' symbols <- c(
#' "Xkr4",
#' "LOC102640625",
#' "sid2057",
#' "Sox17",
#' "ENSMUSG00000074760",
#' "R75157",
#' "6430567E01Rik",
#' "VINAS"
#' )
#'
#' # Current MGI marker symbols as of 2024-05-27.
#' update_symbol(symbols)
#'
#' # Map MGI marker symbols to marker identifiers.
#' symbol_to_marker_id(symbols)
#'
#' # Map MGI marker symbols to Ensembl identifiers.
#' symbol_to_ensembl_id(symbols)
#'
#' # Map MGI marker symbols to Entrez identifiers.
#' symbol_to_entrez_id(symbols)
#'
#' # Deprecated Ensembl identifier, e.g. 1700010L13Rik (MGI:1922878) should map
#' # to ENSMUSG00000074760.
#' # URL: https://www.informatics.jax.org/marker/MGI:1922878
#' symbol_to_marker_id("1700010L13Rik")
#'
#' # But results in `NA` because ENSMUSG00000074760 has status Retired:
#' # URL: https://www.ensembl.org/Mus_musculus/Gene/Idhistory?g=ENSMUSG00000074760
#' symbol_to_ensembl_id("1700010L13Rik")
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

  map <- mrk_id_to_entrez_id()
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


#' @rdname update_symbol
#' @export
symbol_to_ensembl_id <- function(symbol) {
  marker_id_to_ensembl_id(symbol_to_marker_id(symbol))
}

#' @rdname update_symbol
#' @export
marker_id_to_symbol <- function(marker_id) {

  map <- markers()
  marker_id_query <- tibble::tibble(mrk_id = marker_id)
  dplyr::left_join(marker_id_query, map, by = "mrk_id") |>
    dplyr::pull("mrk_symbol")

}

#' @rdname update_symbol
#' @export
ensembl_id_to_symbol <- function(ensembl_id) {
  marker_id_to_symbol(ensembl_id_to_marker_id(ensembl_id))
}

#' @rdname update_symbol
#' @export
symbol_to_entrez_id <- function(symbol) {
  marker_id_to_entrez_id(symbol_to_marker_id(symbol))
}
