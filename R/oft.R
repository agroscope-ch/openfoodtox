#' Connected tables of data published in OpenFoodTox
#'
#' This data object was created to facilitate the access to the list of so-called
#' 'reference points' published as part of the OpenFoodTox datasets (Carnesecchi
#' et al. 2023). These reference points are linked to substance
#' characterisations and the outputs of the European Food Safety Authority
#' (EFSA) in which the data were published. Also, a table of 'reference values'
#' is included, which is also linked to substance characterisations and EFSA
#' outputs. Other data tables published as part of OpenFoodTox are not included
#' in this R package.
#'
#' See `vignette("oft")` for a description of the contents of the individual
#' tables.
#'
#' The R code used to create this data object is installed with this package
#' in the 'dataset_generation' directory.
#'
#' @source
#' Carnesecchi E, Mostrag A, Ciacci A, Roncaglioni A, Tarkhov A, Gibin D, Sartori L, Benfenati E, Yang C, Dorne JLCM (2023). OpenFoodTox: EFSA's chemical hazards database (Version 5). Zenodo. \doi{10.5281/zenodo.8120114}
#'
#' Dorne JLCM, Richardson J, Livaniou A, Carnesecchi E, Ceriani L, Baldin R, Kovarich S, Pavan M, Saouter E, Biganzoli F, Pasinato L, Zare Jeddi M, Robinson TP, Kass GEN, Liem AKD, Toropov AA, Toropova AP, Yang C, Tarkhov A, Georgiadis N, Di Nicola MR, Mostrag A, Verhagen H, Roncaglioni A, Benfenati E, Bassan A. EFSA's OpenFoodTox: An open source toxicological database on chemicals in food and feed and its future developments. Environ Int. 2021 Jan;146:106293. \doi{10.1016/j.envint.2020.106293}
#' @name oft
#' @importFrom dm dm_draw
#' @importFrom dplyr filter select
#' @docType data
#' @format list A [dm] object
#' @examples
#' library(dm, warn.conflicts = FALSE)
#' library(dplyr, warn.conflicts = FALSE)
#'
#' # Show the relational structure of the data tables (only works in online HTML help)
#' dm_draw(oft, view_type = "all")
#'
#' # List species used in aquatic tests
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (water compartment)") |>
#'   select(Species) |>
#'   unique() |>
#'   arrange(Species) |>
#'   print(n = Inf)
#'
#' # Collect endpoints on green algae
#' green_algae_endpoints <- oft$reference_points |>
#'   dplyr::filter(Species %in% oft_aq_green_algae) |>
#'   select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#' print(green_algae_endpoints)
#'
#' # Show aquatic endpoints for spinosad
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (water compartment)") |>
#'   dplyr::filter(grepl("^Spinos", Substance)) |>
#'   arrange(Species) |>
#'   select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#'
#' # Check substance characterisation of spinosad (no useful information available)
#' oft$substance_characterisation |>
#'   dplyr::filter(grepl("^Spinos", Substance))
#'
#' # List species used in terrestrial tests
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (soil compartment)") |>
#'   select(Species) |>
#'   unique() |>
#'   arrange(Species) |>
#'   print(n = Inf)
#'
#' # Show terrestrial endpoints for spinosad
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (soil compartment)") |>
#'   dplyr::filter(grepl("^Spinos", Substance)) |>
#'   arrange(Species) |>
#'   select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#'
#' # Show terrestrial endpoints for terbuthylazine 
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (soil compartment)") |>
#'   dplyr::filter(grepl("^Terbuthyl", Substance)) |>
#'   arrange(Species) |>
#'   select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
#'
#' # Show terrestrial endpoints for florasulam (an example where terrestrial plant data are available)
#' oft$reference_points |>
#'   dplyr::filter(Study == "Ecotox (soil compartment)") |>
#'   dplyr::filter(grepl("^Floras", Substance)) |>
#'   arrange(Species) |>
#'   select(Substance, Species, DurationDays, Endpoint, qualifier, value, unit, Effect)
"oft"

#' Aquatic green algae
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_green_algae)
oft_aq_green_algae <- c(
  "Chlorella pyrenoidosa",
  "Chlorella vulgaris",
  "Green alga",
  "Pseudokirchneriella subcapitata",
  "Scenedesmus pannonicus",
  "Scenedesmus quadircauda",
  "Scenedesmus subspicatus"
)

#' Aquatic diatoms
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_diatom_algae)
oft_aq_diatom_algae <- c(
  "Navicula pelliculosa",
  "Nitzschia palea",
  "Marine centric diatom")

#' Aquatic Cyanobacteria
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_cyanobacteria)
oft_aq_cyanobacteria <- c(
  "Anabaena flosaquae",
  "Anabaena variabilis",
  "Aphanizomenon flos-aquae Ralfs ex Bornet &",
  "Microcystis aeruginosa")

#' Aquatic macrophytes
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_macrophytes)
oft_aq_macrophytes <- c(
  "Swollen duckweed",
  "Common duckweed",
  "Eurasian watermilfoil",
  "Aquatic plants group",
  "American waterweed (Pondweed) (live plants)",
  "Common hornwort (live plants)",
  "Green cabomba (live plants)",
  "Wild celery (water celery) (live plants)",
  "Parrot feather",
  "Floating sweet-grass")

#' Aquatic primary producers
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_primary_producers)
oft_aq_primary_producers <- c(
  oft_aq_green_algae,
  oft_aq_diatom_algae,
  oft_aq_cyanobacteria,
  oft_aq_macrophytes)

#' Aquatic invertebrates
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_invertebrates)
oft_aq_invertebrates <- c(
  "Daphnia magna",
  "Harlequin fly",
  "Eastern oyster",
  "Mysid shrimp",
  "Daphnia pulex",
  "Ctenodrilus serratus",
  "Great pond snail",
  "Dungeness crab",
  "Gammaridae",
  "Macrocyclops fuscus",
  "Hyalella azteca",
  "Ceriodaphnia dubia",
  "Ceriodaphnia sp.",
  "Palaemonetes kadlakensis",
  "Chironomus tentans",
  "Daggerblade grass Shrimp",
  "Gammarus pseudolimnaeus",
  "Gammarus pulex",
  "Northern quahog",
  "Chironomus yoshimatsui",
  "Tiger worm",
  "Gastropoda - Gastropods")

#' Aquatic fish
#'
#' @family oft_aq
#' @docType data
#' @export
#' @examples
#' print(oft_aq_fish)
oft_aq_fish <- c(
  "Rainbow trout",
  "Bluegill",
  "Fathead minnow",
  "Sheepshead minnow",
  "Common carp",
  "Zebra fish",
  "Red seabream",
  "American flag fish",
  "Brook trout",
  "Brown trout",
  "Ide",
  "Louisiana crayfish",
  "Atlantic salmon",
  "Channel catfish",
  "Guppy",
  "European perch",
  "Inland silverside",
  "Mosquitofish",
  "Three-spined stickleback",
  "Mozambique tilapia",
  "Spot croaker")

