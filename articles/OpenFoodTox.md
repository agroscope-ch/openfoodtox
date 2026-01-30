# Description of the \`oft\` data object

``` r
library(OpenFoodTox)
library(dm, warn.conflicts = FALSE)
```

The main content of the R package `OpenFoodTox` is a data object named
`oft`, containing 5 tables with a selection of the OpenFoodTox data
published by the European Food Safety Authority (Carnesecchi et al.
2023).

Column names and relations of the data tables in the data object `oft`
made available by the OpenFoodTox R package are shown in the graph
below.

``` r
dm_draw(oft, view_type = "all")
```

The data object is basically a list of tibbles (a tibble is an advanced
type of a dataframe). As with any list object in R, you can access the
list members (i.e. the tables containing the data) using the `$`
operator.

``` r
head(oft$reference_points)
#> # A tibble: 6 × 15
#>   Substance      Author  Year OutputID Study TestType Species Route DurationDays
#>   <chr>          <chr>  <int>    <int> <chr> <chr>    <chr>   <chr>        <dbl>
#> 1 (-)-3,7-Dimet… EFSA …  2016     2864 Anim… subchro… Rat     oral…           84
#> 2 (-)-Hyoscyami… EFSA    2022     4117 Huma… study w… Human   Not …           NA
#> 3 (-)-Hyoscyami… EFSA …  2013     2396 Anim… not rep… Pig     Not …           NA
#> 4 (-)-Hyoscyami… EFSA …  2013     2396 Huma… study w… Human   Not …           NA
#> 5 (1R,2S,5R)-N-… EFSA …  2014     2524 Huma… subchro… Rat     oral…           90
#> 6 (1R,2S,5R)-N-… EFSA …  2012     2147 Huma… subchro… Rat     oral…           90
#> # ℹ 6 more variables: Endpoint <chr>, qualifier <chr>, value <dbl>, unit <chr>,
#> #   Effect <chr>, Toxicity <chr>
```

Please refer to the [documentation of the `dm`
package](https://dm.cynkra.com) for a description of the advanced
features available for this type of data object.

In the following descriptions of the tables contained in the `oft`
object, the `kable()` function of the `knitr` package is used to format
the data tables.

### Reference points

The reference points themselves are numeric outcomes of toxicological or
ecotoxicological studies, and were described as “The critical
toxicological studies and reference points …” (Dorne et al. 2021).

``` r
head(oft$reference_points) |>
  knitr::kable()
```

| Substance                                                                        | Author      | Year | OutputID | Study                          | TestType              | Species | Route        | DurationDays | Endpoint | qualifier |   value | unit         | Effect                        | Toxicity       |
|:---------------------------------------------------------------------------------|:------------|-----:|---------:|:-------------------------------|:----------------------|:--------|:-------------|-------------:|:---------|:----------|--------:|:-------------|:------------------------------|:---------------|
| (-)-3,7-Dimethyl-6-octen-1-ol                                                    | EFSA FEEDAP | 2016 |     2864 | Animal (target species) health | subchronic            | Rat     | oral: feed   |           84 | NOEL     | =         |   50.00 | mg/kg bw/day | no adverse effect observed    | NA             |
| (-)-Hyoscyamine and (-)-Scopolamine group                                        | EFSA        | 2022 |     4117 | Human health                   | study with volunteers | Human   | Not reported |           NA | NOAEL    | =         |    0.16 | µg/kg bw     | clinical signs                | systemic       |
| (-)-Hyoscyamine and (-)-Scopolamine group                                        | EFSA CONTAM | 2013 |     2396 | Animal (target species) health | not reported          | Pig     | Not reported |           NA | NOAEL    | =         | 1500.00 | µg/kg        | not reported                  | not reported   |
| (-)-Hyoscyamine and (-)-Scopolamine group                                        | EFSA CONTAM | 2013 |     2396 | Human health                   | study with volunteers | Human   | Not reported |           NA | NOAEL    | =         |    0.16 | µg/kg bw     | clinical signs                | systemic       |
| (1R,2S,5R)-N-(2-(Pyridine-2-yl)ethyl)-3-p-menthanecarboxamide                    | EFSA CEF    | 2014 |     2524 | Human health                   | subchronic            | Rat     | oral: feed   |           90 | NOAEL    | =         |    5.00 | mg/kg bw/day | histopathology non neoplastic | endocrine      |
| (1R,2S,5R)-N-(4-Methoxyphenyl)-5-methyl-2-(1-methylethyl)-cyclohexanecarboxamide | EFSA CEF    | 2012 |     2147 | Human health                   | subchronic            | Rat     | oral: feed   |           90 | NOAEL    | =         |  100.00 | mg/kg bw/day | organ weights                 | hepatotoxicity |

Apparently, this means that in a certain category of reference points,
the most critical value is selected and only this is reported. Also, it
seems that for pesticidal active substances, reference points for the
representative formulations which are also available in EFSA outputs are
not listed.

The number of reference points by study type is shown below.

``` r
sort(table(oft$reference_points$Study), decreasing = TRUE)
#> 
#>                       Human health         Ecotox (water compartment) 
#>                               4019                               3298 
#> Animal (non-target species) health          Ecotox (soil compartment) 
#>                               3093                               2638 
#>     Animal (target species) health 
#>                                578
```

Example code extracting and printing the reference points on the
springtail species *Folsomia candida*:

``` r
# Collect endpoints on springtails
springtail_endpoints <- oft$reference_points |>
  dplyr::filter(Species == "Folsomia candida") |>
  select(Substance, DurationDays, Endpoint, qualifier, value, unit, Effect)
head(springtail_endpoints) |>
  knitr::kable()
```

| Substance                                  | DurationDays | Endpoint   | qualifier |    value | unit  | Effect       |
|:-------------------------------------------|-------------:|:-----------|:----------|---------:|:------|:-------------|
| 1,2,4-Triazole                             |           NA | NOEC       | =         | 1.80e+00 | mg/kg | not reported |
| 1,3-Dichloropropene                        |           NA | dose level | =         | 3.29e+05 | g/ha  | mortality    |
| 1,3-Dichloropropene                        |           NA | EC10       | =         | 2.50e+00 | mg/kg | reproduction |
| 2,3,6-trichloro-5-cyano-4-hydroxybenzamide |           28 | NOEC       | =         | 1.78e+00 | mg/kg | mortality    |
| 2,4-D                                      |           NA | NOEC       | =         | 1.25e+00 | mg/kg | not reported |
| 2,4-DCP                                    |           28 | NOEC       | =         | 6.30e-01 | mg/kg | reproduction |

### Reference values

The reference values show the outcome of a substance specific
assessment. The number of reference values available for the most
frequent assessment types are shown below.

``` r
sort(table(oft$reference_values$Assessment), decreasing = TRUE)[1:10]
#> 
#>                        MSI/FC            TTC Cramer Class I 
#>                          3692                          2505 
#>                           ADI critical study not identified 
#>                           915                           864 
#>           TTC Cramer Class II                          ARfD 
#>                           691                           587 
#>                          AOEL                            UL 
#>                           509                           274 
#>          TTC Cramer Class III                          PNEC 
#>                           205                           190
```

Some examples of Predicted No-Effect Concentration (PNEC) data can
easily be extracted.

``` r
PNEC_values <- oft$reference_values |>
  dplyr::filter(Assessment == "PNEC")
head(PNEC_values) |>
  knitr::kable()
```

| Substance                                            | Author      | Year | OutputID | Assessment | qualfier |  value | unit  | Population                       |
|:-----------------------------------------------------|:------------|-----:|---------:|:-----------|:---------|-------:|:------|:---------------------------------|
| (2E)-Methylcrotonic acid                             | EFSA FEEDAP | 2016 |     2841 | PNEC       | =        |    903 | µg/L  | Aquatic compartment              |
| (2E)-Methylcrotonic acid                             | EFSA FEEDAP | 2016 |     2841 | PNEC       | =        |   2008 | µg/kg | Soil compartment                 |
| 1,2-Benzisothiazol-3(2H)-one 1,1-dioxide sodium salt | EFSA FEEDAP | 2018 |     3070 | PNEC       | =        |    100 | µg/L  | Aquatic compartment              |
| 1,2-Benzisothiazol-3(2H)-one 1,1-dioxide sodium salt | EFSA FEEDAP | 2018 |     3070 | PNEC       | =        |  10000 | µg/kg | Soil macroorganisms - earthworms |
| 1,2-Benzisothiazol-3(2H)-one 1,1-dioxide sodium salt | EFSA FEEDAP | 2018 |     3070 | PNEC       | =        | 100000 | µg/kg | Aquatic compartment              |
| 1,2-Dimethoxy-4-(prop-1-enyl)-benzene                | EFSA FEEDAP | 2012 |      155 | PNEC       | \<=      |    100 | µg/L  | Aquatic compartment              |

### Substance names

This table only contains the substance names and serves as a reference
table for the reference points and the reference values.

``` r
head(oft$substance_names) |>
  knitr::kable()
```

| Substance                                                         |
|:------------------------------------------------------------------|
| ((E)-2-(2-hydroxymethylphenyl)-2-methoxyimino-N-methyl-acetamide) |
| (+)-13alpha-Tigloyloxylupanine                                    |
| (+)-13alpha-hydroxy-lupanine                                      |
| (+)-Alpha-cedrene                                                 |
| (+)-Lupanine                                                      |
| (-)-17-Oxosparteine                                               |

### Substance characterisation

In this table, substance characterisation data are collected[¹](#fn1).

``` r
head(oft$substance_characterisation, n = 4) |>
  knitr::kable()
```

| Substance                                                         | component_type | Component                                                         | CASNumber   | ECRefNo | MolecularFormula | smiles                                       |
|:------------------------------------------------------------------|:---------------|:------------------------------------------------------------------|:------------|:--------|:-----------------|:---------------------------------------------|
| ((E)-2-(2-hydroxymethylphenyl)-2-methoxyimino-N-methyl-acetamide) | as such        | ((E)-2-(2-hydroxymethylphenyl)-2-methoxyimino-N-methyl-acetamide) | NA          | NA      | C11H14N2O3       | OCc1ccccc1/C(=N)C(=O)NC                      |
| ((E)-2-(2-hydroxymethylphenyl)-2-methoxyimino-N-methyl-acetamide) | metabolite     | Dimoxystrobin                                                     | 149961-52-4 | NA      | C19H22N2O3       | CC1=CC(=C(C=C1)C)OCC2=CC=CC=C2C(=NOC)C(=O)NC |
| (+)-13alpha-Tigloyloxylupanine                                    | as such        | (+)-13-alpha-Tigloyloxylupanine                                   | 57943-34-7  | NA      | C20H30N2O3       | CC=C(C)C(=O)OC1CCN2CC3CC(C2C1)CN4C3CCCC4=O   |
| (+)-13alpha-hydroxy-lupanine                                      | as such        | (+)-13-Alpha-hydroxy-lupanine                                     | 15358-48-2  | NA      | C15H24N2O2       | C1CC2C3CC(CN2C(=O)C1)C4CC(CCN4C3)O           |

The exact meaning of the differenct values in the column
`component_type` (originally named `has`) does not seem to be
documented.

### EFSA output

This table is referred to from the tables containing reference points
and referenec values. It shows some bibliographic information on the
documents that served as data sources for the OpenFoodTox project.

``` r
head(oft$efsa_outputs) |>
  knitr::kable()
```

| Substance                                                         | OutputID | LegalBasis                                                                                    | Panel       | Published  | Title                                                                                                                                                                                                                    | OutputType                           | DOI                            | URL                                          |
|:------------------------------------------------------------------|---------:|:----------------------------------------------------------------------------------------------|:------------|:-----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------|:-------------------------------|:---------------------------------------------|
| ((E)-2-(2-hydroxymethylphenyl)-2-methoxyimino-N-methyl-acetamide) |     1060 | Council Directive (EEC) No 414/1991 (Repealed by Reg. EC No 1107/2009 (amended))              | EFSA        | 2005-08-31 | Conclusion regarding the peer review of the pesticide risk assessment of the active substance dimoxystrobin                                                                                                              | Conclusion on Pesticides Peer Review | <doi:10.2903/j.efsa.2005.46r>  | <http://dx.doi.org/10.2903/j.efsa.2005.46r>  |
| (+)-13alpha-Tigloyloxylupanine                                    |     3321 | Regulation (EC) No 178/2002 (amended)                                                         | EFSA CONTAM | 2019-11-05 | Scientific opinion on the risks for animal and human health related to the presence of quinolizidine alkaloids in feed and food, in particular in lupins and lupin-derived products                                      | EFSA opinion                         | <doi:10.2903/j.efsa.2019.5860> | <http://dx.doi.org/10.2903/j.efsa.2019.5860> |
| (+)-13alpha-hydroxy-lupanine                                      |     3321 | Regulation (EC) No 178/2002 (amended)                                                         | EFSA CONTAM | 2019-11-05 | Scientific opinion on the risks for animal and human health related to the presence of quinolizidine alkaloids in feed and food, in particular in lupins and lupin-derived products                                      | EFSA opinion                         | <doi:10.2903/j.efsa.2019.5860> | <http://dx.doi.org/10.2903/j.efsa.2019.5860> |
| (+)-Alpha-cedrene                                                 |     2039 | Commission Regulation (EC) No 1565/2000 (Repealed by Com. Implementing Reg. (EU) No 872/2012) | EFSA CEF    | 2010-05-19 | Flavouring Group Evaluation 25, Revision 1 (FGE.25Rev1): Aliphatic and aromatic hydrocarbons from chemical group 31                                                                                                      | EFSA opinion                         | <doi:10.2903/j.efsa.2010.1334> | <http://dx.doi.org/10.2903/j.efsa.2010.1334> |
| (+)-Alpha-cedrene                                                 |     2102 | Commission Regulation (EC) No 1565/2000 (Repealed by Com. Implementing Reg. (EU) No 872/2012) | EFSA CEF    | 2011-06-29 | Scientific Opinion on Flavouring Group Evaluation 25, Revision 2 (FGE.25Rev2): Aliphatic and aromatic hydrocarbons from chemical group 31                                                                                | EFSA opinion                         | <doi:10.2903/j.efsa.2011.2177> | <http://dx.doi.org/10.2903/j.efsa.2011.2177> |
| (+)-Alpha-cedrene                                                 |     2299 | Commission Regulation (EC) No 1565/2000 (Repealed by Com. Implementing Reg. (EU) No 872/2012) | EFSA AFC    | 2008-12-16 | Flavouring Group Evaluation 25, (FGE.25)1: Aliphatic and aromatic hydrocarbons from chemical group 3. Scientific Opinion of the Panel on Food Additives, Flavourings, Processing Aids and Materials in Contact with Food | EFSA opinion                         | <doi:10.2903/j.efsa.2008.918>  | <http://dx.doi.org/10.2903/j.efsa.2008.918>  |

## References

Carnesecchi, Edoardo, Aleksandra Mostrag, Andrea Ciacci, Alessandra
Roncaglioni, Aleksey Tarkhov, Davide Gibin, Luca Sartori, Emilio
Benfenati, Chihae Yang, and Jean Lou C. M. Dorne. 2023. “OpenFoodTox:
EFSA’s Chemical Hazards Database.” Zenodo.
<https://doi.org/10.5281/zenodo.8120114>.

Dorne, J. L. C. M., J. Richardson, A. Livaniou, E. Carnesecchi, L.
Ceriani, R. Baldin, S. Kovarich, et al. 2021. “EFSA’s OpenFoodTox: An
Open Source Toxicological Database on Chemicals in Food and Feed and Its
Future Developments.” *Environment International* 146: 106293.
https://doi.org/<https://doi.org/10.1016/j.envint.2020.106293>.

------------------------------------------------------------------------

1.  Only the first four entries are shown, because the `@` character in
    the SMILES codes of the later entries confuses the documentation
    system. It is both misinterpreted to indicate an e-mail address, and
    to indicate a citation
