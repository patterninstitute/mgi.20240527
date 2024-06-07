
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mgi.20240527

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/patterninstitute/mgi.20240527/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/patterninstitute/mgi.20240527/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `{mgi.20240527}` package is an R data annotation tool designed to
provide Mouse Genome Informatics (MGI) gene marker identifiers, symbols,
and names. It offers essential functionality for quick mapping between
symbols, identifiers, and names, as well as converting to and from
Entrez and Ensembl gene identifiers, aligned with the latest gene
models. This package is based on the data release from May 27, 2024,
ensuring users have access to the most current information available for
their genomic research needs.

## Installation

``` r
# install.packages("pak")
pak::pak("patterninstitute/mgi.20240527")
```

## Crosswalk between identifiers or symbols

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
#>   <chr>   <chr>    <chr>      <chr>    <chr>        <chr>          <chr>        
#> 1 MGI:87… Gene     Abl2       ABL pro… GRCm39       11352          1            
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
#> # ℹ 9 more variables: entrez_gene_id <chr>, ncbi_gene_chr <chr>,
#> #   ncbi_gene_start <int>, ncbi_gene_end <int>, ncbi_gene_strand <chr>,
#> #   ensembl_gene_chr <chr>, ensembl_gene_start <int>, ensembl_gene_end <int>,
#> #   ensembl_gene_strand <chr>
```

## Old symbols’ remapping

``` r
symbols <- c(
  "Xkr4",
  "LOC102640625",
  "sid2057",
  "Sox17",
  "ENSMUSG00000074760",
  "R75157",
  "6430567E01Rik",
  "VINAS"
)

# Current MGI marker symbols as of 2024-05-27.
update_symbol(symbols)
#> [1] "Xkr4"          NA              "1110004F10Rik" "Sox17"        
#> [5] "1700010L13Rik" "Zyx"           "Zzz3"          "1500026H17Rik"
```

``` r

# Map MGI marker symbols to marker identifiers.
symbol_to_marker_id(symbols)
#> [1] "MGI:3528744" NA            "MGI:1929274" "MGI:107543"  "MGI:1922878"
#> [6] "MGI:103072"  "MGI:1920453" "MGI:1916252"
```

``` r

# Map MGI marker symbols to Ensembl identifiers.
symbol_to_ensembl_id(symbols)
#> [1] "ENSMUSG00000051951" NA                   "ENSMUSG00000030663"
#> [4] "ENSMUSG00000025902" NA                   "ENSMUSG00000029860"
#> [7] "ENSMUSG00000039068" "ENSMUSG00000097383"
```

``` r

# Map MGI marker symbols to Entrez identifiers.
symbol_to_entrez_id(symbols)
#> [1] "497097" NA       "56372"  "20671"  NA       "22793"  "108946" "69002"
```

``` r

# Deprecated Ensembl identifier, e.g. 1700010L13Rik (MGI:1922878) should map
# to ENSMUSG00000074760.
# URL: https://www.informatics.jax.org/marker/MGI:1922878
symbol_to_marker_id("1700010L13Rik")
#> [1] "MGI:1922878"
```

``` r

# But results in NA because ENSMUSG00000074760 has status Retired:
# URL: https://www.ensembl.org/Mus_musculus/Gene/Idhistory?g=ENSMUSG00000074760
symbol_to_ensembl_id("1700010L13Rik")
#> [1] NA
```

## Disclaimer

The `{mgi.20240527}` package is provided “as is” without any warranties,
express or implied. While we strive to ensure the accuracy and
reliability of the data, we do not guarantee its completeness or
correctness. The package is based on the data release from May 27, 2024,
and may not include subsequent updates or corrections. Users are
encouraged to verify the information independently and use it at their
own risk. The authors and maintainers of this package are not liable for
any direct, indirect, incidental, or consequential damages arising from
its use.
