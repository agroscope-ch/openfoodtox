# OpenFoodTox - R package making OpenFoodTox data accessible in R

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![openfoodtox status badge](https://agroscope-ch.r-universe.dev/badges/OpenFoodTox)](https://agroscope-ch.r-universe.dev/ui/#package:openfoodtox)
<!-- badges: end -->

This R package provides convenient access to data extracted from some of
the spreadsheet files made available as OpenFoodTox, the chemical hazards
database of the European Food Safety Authority (EFSA). The original files have
been published under the 
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/deed.en) 
licence and can be accessed via
the [EFSA website](https://www.efsa.europa.eu/en/data-report/chemical-hazards-database-openfoodtox)
or directly at
[Zenodo](https://zenodo.org/doi/10.5281/zenodo.780543).

The core component of the package is the data object `oft`, which contains the
data from four OpenFoodTox spreadsheets which are currently relevant for our
group at Agroscope. These are the spreadsheets on substance characterisation,
EFSA outputs, reference points and reference values.

When using this R package, the data are available in the form of
a [`dm`](https://cran.r-project.org/package=dm) object. Basically, a
`dm` object is a list of tables with defined relations.

## Documentation

The online documentation is [available on github](https://agroscope-ch.github.io/openfoodtox/index.html).

A graphical representation of these tables and their relations and some
usage examples are shown in the
[documentation of the `oft` object](https://agroscope-ch.github.io/openfoodtox/reference/oft.html).
In addition, there is a 
[package vignette on the `oft` object](https://agroscope-ch.github.io/openfoodtox/articles/OpenFoodTox.html),
describing the contents of the individual tables.

For further information on relational data models as implemented in the
[`dm`](https://cran.r-project.org/package=dm) package, please refer to its
[online documentation](https://dm.cynkra.com/).

## Installation

```r
install.packages("OpenFoodTox", repos = c("https://agroscope-ch.r-universe.dev", "https://cran.r-project.org"))
```

You can then load the package in R using

```
library(OpenFoodTox)
```

to have the data object `oft` available.
