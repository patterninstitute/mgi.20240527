.onLoad <- function(libname, pkgname) {
  read_rds <<- memoise::memoise(read_rds)
}
