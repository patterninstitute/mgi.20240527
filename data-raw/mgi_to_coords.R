library(tidyverse)
library(here)

# Report with markers gene model coordinates (NCBI and Ensembl).
# Download date: 2024-05-27.
path <- here::here("data-raw/MGI_Gene_Model_Coord.rpt.xz")

col_names <-
  c(
    "mrk_id",
    "mrk_type",
    "mrk_symbol",
    "mrk_name",
    "genome_build",
    "entrez_gene_id",
    "ncbi_gene_chr",
    "ncbi_gene_start",
    "ncbi_gene_end",
    "ncbi_gene_strand",
    "ensembl_gene_id",
    "ensembl_gene_chr",
    "ensembl_gene_start",
    "ensembl_gene_end",
    "ensembl_gene_strand",
    "PHONY"
  )

col_types <- "ccccciciiccciic-"
chromosomes <- c(1:19, "X", "Y", "MT")
strands <- c("+", "-")
markers <- readr::read_tsv(
  file = path,
  col_names = col_names,
  col_types = col_types,
  skip = 1,
  na = "null"
) |>
  dplyr::mutate(
    mrk_type = factor(mrk_type, levels = unique(mrk_type)),
    genome_build = as.factor(genome_build),
    ncbi_gene_chr = factor(ncbi_gene_chr, levels = chromosomes),
    ensembl_gene_chr = factor(ensembl_gene_chr, levels = chromosomes),
    ncbi_gene_strand = factor(ncbi_gene_strand, levels = strands),
    ensembl_gene_strand = factor(ensembl_gene_strand, levels = strands),
    )

mrk_id_to_ens_id <-
  markers[c("mrk_id", "ensembl_gene_id")]

# There are Ensembl gene ids that map to more than one marker identifier,
# so here we keep only those that map to one.
ens_id_to_mrk_id <-
  markers[c("ensembl_gene_id", "mrk_id")] |>
  dplyr::group_by(ensembl_gene_id) %>%
  dplyr::filter(n() == 1L) %>%
  dplyr::ungroup()

mrk_id_to_entrez_id <-
  markers[c("mrk_id", "entrez_gene_id")]

# There are Entrez gene ids that map to more than one marker identifier,
# so here we keep only those that map to one.
entrez_id_to_mrk_id <-
  markers[c("entrez_gene_id", "mrk_id")] |>
  dplyr::group_by(entrez_gene_id) %>%
  dplyr::filter(n() == 1L) %>%
  dplyr::ungroup()


readr::write_rds(markers, file = "inst/extdata/markers.rds", compress = "xz")

readr::write_rds(mrk_id_to_ens_id, file = "inst/extdata/mrk_id_to_ens_id.rds", compress = "xz")
readr::write_rds(ens_id_to_mrk_id, file = "inst/extdata/ens_id_to_mrk_id.rds", compress = "xz")

readr::write_rds(mrk_id_to_entrez_id, file = "inst/extdata/mrk_id_to_entrez_id.rds", compress = "xz")
readr::write_rds(entrez_id_to_mrk_id, file = "inst/extdata/entrez_id_to_mrk_id.rds", compress = "xz")
