
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

## Quick crosswalk between identifiers or symbols

``` r
library(mgi.20240527)

update_symbol("Dcdc3")
#> [1] "Rp1"
```

``` r
symbol_to_marker_id("Rp1")
#> [1] "MGI:1341105"
```

``` r
symbol_to_ensembl_id("Rp1")
#> [1] "ENSMUSG00000025900"
```

## Markers with genomic coordinates

``` r
markers()
#> # A tibble: 71,489 × 15
#>    mrk_id mrk_type mrk_symbol mrk_name genome_build entrez_gene_id ncbi_gene_chr
#>    <chr>  <chr>    <chr>      <chr>    <chr>                 <int> <chr>        
#>  1 MGI:8… Gene     a          nonagou… GRCm39                50518 2            
#>  2 MGI:8… Gene     Pzp        PZP, al… GRCm39                11287 6            
#>  3 MGI:8… Gene     Abl1       c-abl o… GRCm39                11350 2            
#>  4 MGI:8… Gene     Abl2       ABL pro… GRCm39                11352 1            
#>  5 MGI:8… Gene     Scgb1b27   secreto… GRCm39                11354 7            
#>  6 MGI:8… Gene     Scgb2b27   secreto… GRCm39               233099 7            
#>  7 MGI:8… Gene     Scgb2b26   secreto… GRCm39               110187 7            
#>  8 MGI:8… Gene     Acadl      acyl-Co… GRCm39                11363 1            
#>  9 MGI:8… Gene     Acadm      acyl-Co… GRCm39                11364 3            
#> 10 MGI:8… Gene     Acads      acyl-Co… GRCm39                11409 5            
#> # ℹ 71,479 more rows
#> # ℹ 8 more variables: ncbi_gene_start <int>, ncbi_gene_end <int>,
#> #   ncbi_gene_strand <chr>, ensembl_gene_id <chr>, ensembl_gene_chr <chr>,
#> #   ensembl_gene_start <int>, ensembl_gene_end <int>, ensembl_gene_strand <chr>
```
