#' MGI marker mapping
#'
#' [symbol_map()] provides a map of MGI marker symbols into the most recent
#' symbol, which can be the same, and to MGI marker identifiers. Unfortunately,
#' the mapping from symbol to identifier can be degenerate, i.e. one symbol
#' may be associated with more than one identifier. The column `n` indicates
#' how many mappings to identifiers exist. Generally, it is just 1 but there are
#' cases of 2 or 3 identifiers for the same symbol. Use the `set` argument
#' to retrieve only unique mappings (`set = "unique"`), default is `"all"`, i.e.
#' all mappings, both unique and degenerate. This is the reason why the `mrk_id`
#' is a list-column.
#'
#' @param set A string indicating whether all mappings are to be returned
#'   (`"all"`) or just the unique (`"unique"`) ones.
#'
#'
#' @returns A [tibble][tibble::tibble-package] with four variables:
#' - `from`: A "from" marker symbol.
#' - `to`: A "to" marker symbol, i.e. the most recent marker symbol. In most
#'         cases this coincides with the symbol in `from` but not always.
#' - `mrk_id`: Marker identifier(s), list-column with identifiers associated
#' with the `from` and `to` symbols.
#' - `n`: Number of mappings to identifiers, typically 1 as most mappings are
#' unique, but there are mappings to 2 and 3 identifiers.
#'
#' @examples
#' # Same as `symbol_map("all")`.
#' symbol_map()
#'
#' # Filter out mappings that do not map to one unique identifier.
#' symbol_map("unique")
#'
#' @importFrom rlang .data
#' @export
symbol_map <- function(set = c("all", "unique")) {

  set <- match.arg(set)

  file <-
    system.file("extdata/symbol_map.rds",
                package = "mgi.20240527",
                mustWork = TRUE)

  map <- read_rds(file = file)

  if (identical(set, "all")) {
    map
  } else {
    dplyr::filter(map, .data$n == 1L)
  }

}
