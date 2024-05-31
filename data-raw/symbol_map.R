library(tidyverse)
library(here)

# Report with markers excluding withdrawn ones.
# Download date: 2024-05-27.
path <- here::here("data-raw/MRK_List2.rpt.xz")

col_names <-
  c(
    "mrk_id",
    "chr",
    "cM_pos",
    "start",
    "end",
    "strand",
    "mrk_symbol",
    "status",
    "mrk_name",
    "type1",
    "feature_type",
    "synonyms"
  )

col_types <- "ccciiccccccc"
# Import data
markers <- readr::read_tsv(
  file = path,
  col_names = col_names,
  col_types = col_types,
  skip = 1
) |>
  dplyr::select(c("mrk_id", "mrk_symbol", "mrk_name", "synonyms")) |>
  dplyr::mutate(
    synonyms = strsplit(synonyms, "|", fixed = TRUE)
  ) |>
  tidyr::unnest(cols = "synonyms") |>
  dplyr::rename(synonym = "synonyms")

# Subset of symbols that are not remapped.
symbol_mapping01 <-
  markers |>
  dplyr::mutate(from = mrk_symbol, to = from) |>
  dplyr::relocate(from, to) |>
  dplyr::select(-c("synonym", "mrk_symbol")) |>
  dplyr::distinct()

# Subset of symbols that are remapped from synonyms.
symbol_mapping02 <-
  markers |>
  dplyr::filter(!is.na(synonym)) |>
  dplyr::relocate(from = "synonym", to = "mrk_symbol") |>
  dplyr::group_by(from) %>%
  dplyr::filter(n() == 1L) %>%
  dplyr::ungroup()

unique_symbols_in_synonyms <- setdiff(symbol_mapping02$from, symbol_mapping01$from)

symbol_mapping03 <-
  symbol_mapping02 |>
  dplyr::filter(from %in% unique_symbols_in_synonyms)

symbol_map <-
  dplyr::bind_rows(symbol_mapping01, symbol_mapping03)

readr::write_rds(symbol_map, file = "inst/extdata/symbol_map.rds", compress = "xz")

