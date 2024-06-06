#' @importFrom readr read_csv
markers_all <- function() {

  file <-
    system.file("extdata/markers.csv.tar.gz",
                package = "mgi.20240527",
                mustWork = TRUE)

  readr::read_csv(file = file, col_types = "ccccccciiccciic")

}

#' MGI markers
#'
#' @description
#'
#' [markers()] provides a data set of MGI markers that have a current
#' associated genomic location. By current we mean as of 27 May 2024.
#'
#' Use the `query` parameter to retrieve only a subset of the data. The query
#' can be any of:
#' - marker identifier, if `var` is `"mrk_id"` (default);
#' - marker symbol, if `var` is `"mrk_symbol"`;
#' - Entrez gene identifier, if `var` is `"entrez_gene_id"`;
#' - Ensembl gene identifier, if `var` is `"ensembl_gene_id"`.
#'
#' @param query A character vector of query terms to be used in the filtering
#' of the returned data set of MGI markers.
#' @param var A string, one of: `"mrk_id"`, for marker identifiers;
#'   `"mrk_symbol"`, for marker symbols; `"entrez_gene_id"`, for Entrez gene
#'   identifiers, or `"ensembl_gene_id"` for Ensembl gene identifiers.
#'
#' @returns A [tibble][tibble::tibble-package] of 15 variables:
#' - `mrk_id`: MGI marker identifier;
#' - `mrk_type`: MGI marker type;
#' - `mrk_symbol`: MGI marker symbol;
#' - `mrk_name`: MGI marker name.
#' - `genome_build`: Mouse genome build: always `"GRCm39"`.
#' - `entrez_gene_id`: Entrez gene identifier.
#' - `ncbi_gene_chr`: Chromosome name, following NCBI's gene model.
#' - `ncbi_gene_start`: Chromosome start position, following NCBI's gene model.
#' - `ncbi_gene_end`: Chromosome end position, following NCBI's gene model.
#' - `ncbi_gene_strand`: Chromosome strand, following NCBI's gene model.
#' - `ensembl_gene_id`: Ensembl gene identifier.
#' - `ensembl_gene_chr`: Chromosome name, following Ensembl's gene model.
#' - `ensembl_gene_start`: Chromosome start position, following Ensembl's gene model.
#' - `ensembl_gene_end`: Chromosome end position, following Ensembl's gene model.
#' - `ensembl_gene_strand`: Chromosome strand, following Ensembl's gene model.
#'
#' @examples
#' # All markers.
#' markers()
#'
#' # actin, beta
#' markers("Actb", "mrk_symbol")
#'
#' @importFrom rlang :=
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
