# Connected tables of data published in OpenFoodTox

This data object was created to facilitate the access to the list of
so-called 'reference points' published as part of the OpenFoodTox
datasets (Carnesecchi et al. 2023). These reference points are linked to
substance characterisations and the outputs of the European Food Safety
Authority (EFSA) in which the data were published. Also, a table of
'reference values' is included, which is also linked to substance
characterisations and EFSA outputs. Other data tables published as part
of OpenFoodTox are not included in this R package.

## Usage

``` r
oft
```

## Format

list A [dm](https://dm.cynkra.com/reference/dm.html) object

## Source

Carnesecchi E, Mostrag A, Ciacci A, Roncaglioni A, Tarkhov A, Gibin D,
Sartori L, Benfenati E, Yang C, Dorne JLCM (2023). OpenFoodTox: EFSA's
chemical hazards database (Version 5). Zenodo.
[doi:10.5281/zenodo.8120114](https://doi.org/10.5281/zenodo.8120114)

Dorne JLCM, Richardson J, Livaniou A, Carnesecchi E, Ceriani L, Baldin
R, Kovarich S, Pavan M, Saouter E, Biganzoli F, Pasinato L, Zare Jeddi
M, Robinson TP, Kass GEN, Liem AKD, Toropov AA, Toropova AP, Yang C,
Tarkhov A, Georgiadis N, Di Nicola MR, Mostrag A, Verhagen H,
Roncaglioni A, Benfenati E, Bassan A. EFSA's OpenFoodTox: An open source
toxicological database on chemicals in food and feed and its future
developments. Environ Int. 2021 Jan;146:106293.
[doi:10.1016/j.envint.2020.106293](https://doi.org/10.1016/j.envint.2020.106293)

## Details

See
[`vignette("OpenFoodTox")`](https://agroscope-ch.github.io/openfoodtox/articles/OpenFoodTox.md)
for a description of the contents of the individual tables.

The R code used to create this data object is installed with this
package in the 'dataset_generation' directory.

## See also

species_group

## Examples

``` r
library(dm, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)

# Show the relational structure of the data tables (only works in online HTML help)
dm_draw(oft, view_type = "all")
%0


efsa_outputs
efsa_outputsSubstanceOutputIDLegalBasisPanelPublishedTitleOutputTypeDOIURLSubstance, OutputIDreference_points
reference_pointsSubstanceAuthorYearOutputIDStudyTestTypeSpeciesRouteDurationDaysEndpointqualifiervalueunitEffectToxicitySubstance, OutputIDreference_points:Substance, OutputID->efsa_outputs:Substance, OutputID
substance_names
substance_namesSubstancereference_points:Substance->substance_names:Substance
reference_values
reference_valuesSubstanceAuthorYearOutputIDAssessmentqualfiervalueunitPopulationSubstance, OutputIDreference_values:Substance, OutputID->efsa_outputs:Substance, OutputID
reference_values:Substance->substance_names:Substance
substance_characterisation
substance_characterisationSubstancecomponent_typeComponentCASNumberECRefNoMolecularFormulasmilessubstance_characterisation:Substance->substance_names:Substance

# List species used in aquatic tests
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (water compartment)") |>
  select(Species) |>
  unique() |>
  arrange(Species) |>
  print(n = Inf)
#> # A tibble: 70 × 1
#>    Species                                    
#>    <chr>                                      
#>  1 African clawed frog                        
#>  2 American flag fish                         
#>  3 American waterweed (Pondweed) (live plants)
#>  4 Anabaena flosaquae                         
#>  5 Anabaena variabilis                        
#>  6 Aphanizomenon flos-aquae Ralfs ex Bornet & 
#>  7 Aquatic plants group                       
#>  8 Atlantic salmon                            
#>  9 Bluegill                                   
#> 10 Brook trout                                
#> 11 Brown trout                                
#> 12 Ceriodaphnia dubia                         
#> 13 Ceriodaphnia sp.                           
#> 14 Channel catfish                            
#> 15 Chironomus tentans                         
#> 16 Chironomus yoshimatsui                     
#> 17 Chlorella pyrenoidosa                      
#> 18 Chlorella vulgaris                         
#> 19 Common carp                                
#> 20 Common duckweed                            
#> 21 Common hornwort (live plants)              
#> 22 Ctenodrilus serratus                       
#> 23 Daggerblade grass Shrimp                   
#> 24 Daphnia magna                              
#> 25 Daphnia pulex                              
#> 26 Dungeness crab                             
#> 27 Eastern oyster                             
#> 28 Eurasian watermilfoil                      
#> 29 European perch                             
#> 30 Fathead minnow                             
#> 31 Floating sweet-grass                       
#> 32 Gammaridae                                 
#> 33 Gammarus pseudolimnaeus                    
#> 34 Gammarus pulex                             
#> 35 Gastropoda - Gastropods                    
#> 36 Great pond snail                           
#> 37 Green alga                                 
#> 38 Green cabomba (live plants)                
#> 39 Guppy                                      
#> 40 Harlequin fly                              
#> 41 Hyalella azteca                            
#> 42 Ide                                        
#> 43 Inland silverside                          
#> 44 Louisiana crayfish                         
#> 45 Macrocyclops fuscus                        
#> 46 Marine centric diatom                      
#> 47 Microcystis aeruginosa                     
#> 48 Mosquitofish                               
#> 49 Mozambique tilapia                         
#> 50 Mysid shrimp                               
#> 51 Navicula pelliculosa                       
#> 52 Nitzschia palea                            
#> 53 Northern quahog                            
#> 54 Palaemonetes kadlakensis                   
#> 55 Parrot feather                             
#> 56 Pseudokirchneriella subcapitata            
#> 57 Rainbow trout                              
#> 58 Red seabream                               
#> 59 Scenedesmus pannonicus                     
#> 60 Scenedesmus quadricauda                    
#> 61 Scenedesmus subspicatus                    
#> 62 Sheepshead minnow                          
#> 63 Spot croaker                               
#> 64 Swollen duckweed                           
#> 65 Three-spined stickleback                   
#> 66 Tiger worm                                 
#> 67 Unspecified                                
#> 68 Wild celery (water celery) (live plants)   
#> 69 Zebra fish                                 
#> 70 not reported                               

# Collect endpoints on green algae
green_algae_endpoints <- oft$reference_points |>
  dplyr::filter(Species %in% oft_aq_green_algae) |>
  select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
print(green_algae_endpoints)
#> # A tibble: 513 × 8
#>    Substance        Species DurationDays Endpoint qualifier   value unit  Effect
#>    <chr>            <chr>          <dbl> <chr>    <chr>       <dbl> <chr> <chr> 
#>  1 (2E)-Methylcrot… Green …           NA EC50     =         9.03e+2 mg/L  morta…
#>  2 (3RS,4RS;3RS,4S… Scened…            3 EC50     =         2.1 e-3 mg/L  bioma…
#>  3 (8,9-Z)-isomer … Pseudo…            3 EC50     >         9   e+3 µg/L  bioma…
#>  4 (8,9-Z)-isomer … Pseudo…            3 EC50     >         9   e+0 mg/L  bioma…
#>  5 (E,E)-8,10-Dode… Pseudo…            3 EC50     =         5.23e-1 mg/L  growth
#>  6 (RS)-2,4-dinitr… Pseudo…            4 EC50     =         2.12e+0 mg/L  other 
#>  7 1,2,4-Triazole   Pseudo…            3 EC50     =         8.2 e+0 mg/L  bioma…
#>  8 1,2-Benzisothia… Scened…           NA EC50     >         1   e+2 mg/L  growth
#>  9 1,3-Dichloropro… Pseudo…            4 EC50     =         5.45e+0 mg/L  growth
#> 10 1,4-Dimethylnap… Pseudo…            4 EC50     =         3.2 e-1 mg/L  bioma…
#> # ℹ 503 more rows

# Show aquatic endpoints for spinosad
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (water compartment)") |>
  dplyr::filter(grepl("^Spinos", Substance)) |>
  arrange(Species) |>
  select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#> # A tibble: 7 × 8
#>   Substance Species         DurationDays Endpoint qualifier   value unit  Effect
#>   <chr>     <chr>                  <dbl> <chr>    <chr>       <dbl> <chr> <chr> 
#> 1 Spinosad  Common carp                4 LC50     =          4      mg/L  morta…
#> 2 Spinosad  Fathead minnow           110 NOEC     =          0.217  mg/L  repro…
#> 3 Spinosad  Harlequin fly              2 EC50     >         32      µg/L  morta…
#> 4 Spinosad  Harlequin fly             25 NOEC     =          0.62   µg/L  not r…
#> 5 Spinosad  Harlequin fly             28 NOEC     =          0.0585 mg/kg not r…
#> 6 Spinosad  Navicula pelli…            3 EC50     =          0.47   mg/L  growth
#> 7 Spinosad  Swollen duckwe…           NA EC50     >         71      mg/L  frond…

# Check substance characterisation of spinosad (no useful information available)
oft$substance_characterisation |>
  dplyr::filter(grepl("^Spinos", Substance))
#> # A tibble: 1 × 7
#>   Substance component_type Component CASNumber ECRefNo MolecularFormula smiles
#>   <chr>     <chr>          <chr>     <chr>     <chr>   <chr>            <chr> 
#> 1 Spinosad  as such        Spinosad  NA        NA      NA               NA    

# List species used in terrestrial tests
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (soil compartment)") |>
  select(Species) |>
  unique() |>
  arrange(Species) |>
  print(n = Inf)
#> # A tibble: 51 × 1
#>    Species                
#>    <chr>                  
#>  1 Aleochara bilineata    
#>  2 Aphidius colemani      
#>  3 Aphidius matricariae   
#>  4 Aphidius rhopalosiphi  
#>  5 Carrot                 
#>  6 Common chickweed       
#>  7 Common oat             
#>  8 Cucumber               
#>  9 Earthworm              
#> 10 Encarsia formosa       
#> 11 Field bean (Fava bean) 
#> 12 Folsomia candida       
#> 13 Garden cress           
#> 14 Garden pea             
#> 15 Green lacewing         
#> 16 Grey worm              
#> 17 Harlequin fly          
#> 18 Honey bee              
#> 19 Hypoaspis aculeifer    
#> 20 Lettuce                
#> 21 Lob worm               
#> 22 Maize                  
#> 23 Marmalade hoverfly     
#> 24 Minute pirate bug      
#> 25 Monocots               
#> 26 Mung bean              
#> 27 Onion                  
#> 28 Pardosa sp.            
#> 29 Perennial ryegrass     
#> 30 Poecilus cupreus       
#> 31 Radish                 
#> 32 Rapeseed (oilseed rape)
#> 33 Red tiger worm         
#> 34 Redroot amaranth       
#> 35 Rye                    
#> 36 Seven-spot ladybird    
#> 37 Sorghum                
#> 38 Soybean                
#> 39 Sugar beet             
#> 40 Sunflower              
#> 41 Swollen duckweed       
#> 42 Tiger worm             
#> 43 Tomato                 
#> 44 Trichogramma cacoeciae 
#> 45 Typhlodromus pyri      
#> 46 Unspecified            
#> 47 Wheat                  
#> 48 White mustard          
#> 49 Wild cabbage           
#> 50 Wild oat               
#> 51 not reported           

# Show terrestrial endpoints for spinosad
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (soil compartment)") |>
  dplyr::filter(grepl("^Spinos", Substance)) |>
  arrange(Species) |>
  select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#> # A tibble: 4 × 8
#>   Substance Species         DurationDays Endpoint qualifier   value unit  Effect
#>   <chr>     <chr>                  <dbl> <chr>    <chr>       <dbl> <chr> <chr> 
#> 1 Spinosad  Aphidius rhopa…           NA LR50     =          0.371  g/ha  morta…
#> 2 Spinosad  Honey bee                 NA LD50     =          0.0036 µg/p… morta…
#> 3 Spinosad  Honey bee                 NA LD50     =          0.057  µg/p… morta…
#> 4 Spinosad  Tiger worm                NA NOEC     =         35.2    mg/kg growth

# Show terrestrial endpoints for terbuthylazine 
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (soil compartment)") |>
  dplyr::filter(grepl("^Terbuthyl", Substance)) |>
  arrange(Species) |>
  select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#> # A tibble: 5 × 8
#>   Substance      Species      DurationDays Endpoint qualifier value unit  Effect
#>   <chr>          <chr>               <dbl> <chr>    <chr>     <dbl> <chr> <chr> 
#> 1 Terbuthylazine Aphidius rh…           NA LR50     >         750   g/ha  morta…
#> 2 Terbuthylazine Folsomia ca…           28 NOEC     =          42.2 mg/kg not r…
#> 3 Terbuthylazine Honey bee               2 LD50     >          22.6 µg/p… morta…
#> 4 Terbuthylazine Tiger worm             14 LC50     >         283.  mg/kg morta…
#> 5 Terbuthylazine Typhlodromu…           NA LR50     >         750   g/ha  morta…

# Show terrestrial endpoints for florasulam (an example where terrestrial plant data are available)
oft$reference_points |>
  dplyr::filter(Study == "Ecotox (soil compartment)") |>
  dplyr::filter(grepl("^Floras", Substance)) |>
  arrange(Species) |>
  select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#> # A tibble: 8 × 8
#>   Substance  Species        DurationDays Endpoint qualifier   value unit  Effect
#>   <chr>      <chr>                 <dbl> <chr>    <chr>       <dbl> <chr> <chr> 
#> 1 Florasulam Aphidius rhop…            2 LR50     >         1.5 e+1 g/ha  morta…
#> 2 Florasulam Honey bee                 2 LD50     >         1   e+2 µg/p… morta…
#> 3 Florasulam Honey bee                 2 LD50     >         1   e+2 µg/p… morta…
#> 4 Florasulam Rapeseed (oil…           NA ER50     =         5.96e-1 g/ha  seedl…
#> 5 Florasulam Sunflower                NA ER50     =         2.22e-1 g/ha  other 
#> 6 Florasulam Tiger worm               14 LC50     >         1.32e+3 mg/kg morta…
#> 7 Florasulam Tiger worm               NA NOEC     =         2.03e-1 mg/kg not r…
#> 8 Florasulam Typhlodromus …            7 LR50     >         1.5 e+1 g/ha  morta…
```
