.onLoad <- function(libname, pkgname) {
  symbol_map <<- memoise::memoise(symbol_map)
  markers_all <<- memoise::memoise(markers_all)
  mrk_id_to_ens_id <<- memoise::memoise(mrk_id_to_ens_id)
  ens_id_to_mrk_id <<- memoise::memoise(ens_id_to_mrk_id)
  mrk_id_to_entrez_id <<- memoise::memoise(mrk_id_to_entrez_id)
  entrez_id_to_mrk_id <<- memoise::memoise(entrez_id_to_mrk_id)
}
