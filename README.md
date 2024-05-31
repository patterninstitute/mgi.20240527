
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mgi.20240527

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

``` r
# install.packages("pak")
pak::pak("patterninstitute/mgi.20240527")
```

## Example

``` r
library(mgi.20240527)

symbol_to_marker_id("Rp1")
#> [1] "MGI:1341105"
```

``` r
symbol_to_ensembl_id("Rp1")
#> [1] "ENSMUSG00000025900"
```
