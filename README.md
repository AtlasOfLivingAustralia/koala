
<!-- README.md is generated from README.Rmd. Please edit that file -->

# corroboree <img src="man/figures/corroboree-logo.png" align="right" style="margin: 0px 10px 0px 10px;" alt="" width="120"/><br>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/corroboree)](https://CRAN.R-project.org/package=corroboree)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Overview

`corroboree` is an R package that helps users standardize their data
using the [‘Darwin Core’](https://dwc.tdwg.org) data standard, used for
biodiversity data like species occurrences. The package provides tools
to edit, prepare and validate data against the standard’s criteria. Once
standardized, data can be subsequently  
shared as a [‘Darwin Core
Archive’](https://ipt.gbif.org/manual/en/ipt/latest/dwca-guide#what-is-darwin-core-archive-dwc-a)—a
packaged set of files with a simple descriptor to inform how data are
organised—and published to open data infrastructures like the Atlas of
Living Australia and GBIF. `corroboree` was built, and is maintained, by
the [Science & Decision Support Team](https://labs.ala.org.au) at the
[Atlas of Living Australia](https://www.ala.org.au) (ALA).

The package is named for an endangered Australian species of alpine frog
native to the marshlands and forests of ACT and NSW.

If you have any comments, questions or suggestions, please [contact
us](mailto:support@ala.org.au).

## Installation

You can install the development version of `corroboree` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("AtlasOfLivingAustralia/corroboree")
```

## Example

## Citing galaxias

To generate a citation for the package version you are using, you can
run:

``` r
citation(package = "corroboree")
```

The current recommended citation is:

> Westgate MJ, Balasubramaniam S & Kellie D (2024) corroboree: Tools to
> standardize biodiversity data to Darwin Core. R Package version
> 0.1.0.9999.
