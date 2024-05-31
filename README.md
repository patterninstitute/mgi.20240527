
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
markers("MGI:87860")
#> # A tibble: 1 × 15
#>   mrk_id  mrk_type mrk_symbol mrk_name genome_build entrez_gene_id ncbi_gene_chr
#>   <chr>   <chr>    <chr>      <chr>    <chr>                 <int> <chr>        
#> 1 MGI:87… Gene     Abl2       ABL pro… GRCm39                11352 1            
#> # ℹ 8 more variables: ncbi_gene_start <int>, ncbi_gene_end <int>,
#> #   ncbi_gene_strand <chr>, ensembl_gene_id <chr>, ensembl_gene_chr <chr>,
#> #   ensembl_gene_start <int>, ensembl_gene_end <int>, ensembl_gene_strand <chr>
```

``` r

markers("ENSMUSG00000066583", "ensembl_gene_id")
#> # A tibble: 1 × 15
#>   ensembl_gene_id    mrk_id    mrk_type mrk_symbol mrk_name         genome_build
#>   <chr>              <chr>     <chr>    <chr>      <chr>            <chr>       
#> 1 ENSMUSG00000066583 MGI:87862 Gene     Scgb1b27   secretoglobin, … GRCm39      
#> # ℹ 9 more variables: entrez_gene_id <int>, ncbi_gene_chr <chr>,
#> #   ncbi_gene_start <int>, ncbi_gene_end <int>, ncbi_gene_strand <chr>,
#> #   ensembl_gene_chr <chr>, ensembl_gene_start <int>, ensembl_gene_end <int>,
#> #   ensembl_gene_strand <chr>
```
