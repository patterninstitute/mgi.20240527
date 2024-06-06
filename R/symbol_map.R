#' MGI marker mapping
#'
#' [symbol_map()] provides a map of MGI marker symbols into the most recent
#' symbol, which can be the same, and to MGI marker identifiers and names.
#'
#' @returns A [tibble][tibble::tibble-package] with four variables:
#' - `from`: A "from" marker symbol.
#' - `to`: A "to" marker symbol, i.e. the most recent marker symbol. In most
#'         cases this coincides with the symbol in `from` but not always.
#' - `mrk_id`: Marker identifier.
#' - `mrk_name`: Marker name.
#'
#' @examples
#' symbol_map()
#'
#' @export
symbol_map <- function() {

  file <-
    system.file("extdata/symbol_map.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "cccc")

}
