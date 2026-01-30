# Group species names occurring in reference points

Convenience function to group species into fish, aquatic invertebrates,
aquatic primary producers, birds, mammals, bees, earthworms, arthropods
and plants. The entries 'Unspecified' and 'not reported' are translated
to NA.

## Usage

``` r
oft_group_species(species)
```

## Arguments

- species:

  The species name, i.e. the Species column in the referenec point table

## Value

A species group name

## Examples

``` r
library(dplyr)
oft$reference_points |>
  dplyr::filter(Substance == "Thiacloprid") |>
  mutate(Species_group = oft_group_species(Species)) |>
  select(Substance, Species, Species_group, Endpoint, qualifier, value, unit, Effect)
#> # A tibble: 26 × 8
#>    Substance   Species     Species_group Endpoint qualifier   value unit  Effect
#>    <chr>       <chr>       <chr>         <chr>    <chr>       <dbl> <chr> <chr> 
#>  1 Thiacloprid Canary      birds         NOAEL    =          15     mg/k… morta…
#>  2 Thiacloprid Rat         mammals       LD50     =         177     mg/k… morta…
#>  3 Thiacloprid Canary      birds         LD50     =           3.5   mg/k… not r…
#>  4 Thiacloprid Rat         mammals       NOAEL    =           3.3   mg/k… repro…
#>  5 Thiacloprid Aphidius r… arthropods    ER50     >           0.95  g/ha  morta…
#>  6 Thiacloprid Honey bee   bees          LD50     =          38.8   µg/p… morta…
#>  7 Thiacloprid Honey bee   bees          LD50     =          17.3   µg/p… morta…
#>  8 Thiacloprid Tiger worm  soil_macroor… LC50     =         105     mg/kg morta…
#>  9 Thiacloprid Typhlodrom… arthropods    LR50     =           0.331 g/ha  morta…
#> 10 Thiacloprid Red tiger … soil_macroor… EC10     =           0.04  mg/kg repro…
#> # ℹ 16 more rows
```
