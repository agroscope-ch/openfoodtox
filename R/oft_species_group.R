#' Group species names occurring in reference points
#'
#' Convenience function to group species into fish, aquatic invertebrates,
#' aquatic primary producers, birds, mammals, bees, earthworms, arthropods
#' and plants. The entries 'Unspecified' and 'not reported' are translated
#' to NA.
#'
#' @param species The species name, i.e. the Species column in the referenec
#' point table
#' @return A species group name
#' @importFrom dplyr filter select mutate case_when
#' @export
#' @examples
#' library(dplyr)
#' oft$reference_points |>
#'   dplyr::filter(Substance == "Thiacloprid") |>
#'   mutate(Species_group = oft_group_species(Species)) |>
#'   select(Substance, Species, Species_group, Endpoint, qualifier, value, unit, Effect)
oft_group_species <- function(species) {
  case_when(
    species %in% oft_aq_fish ~ "fish",
    species %in% oft_aq_invertebrates ~ "aq_invertebrates",
    species %in% oft_aq_primary_producers ~ "aq_primary_producers",
    species %in% oft_birds ~ "birds",
    species %in% oft_soil_macroorganisms ~ "soil_macroorganisms",
    species %in% oft_bees ~ "bees",
    species %in% oft_arthropods ~ "arthropods",
    species %in% oft_mammals ~ "mammals",
    species %in% oft_plants ~ "plants",
    species %in% oft_other ~ "other",
    .default = NA)
}

#' Aquatic green algae
#'
#' @family oft_species_group
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
  "Scenedesmus subspicatus",
  "Scenedesmus quadricauda")

#' Aquatic diatoms
#'
#' @family oft_species_group
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
#' @family oft_species_group
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
#' @family oft_species_group
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
#' @family oft_species_group
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
#' @family oft_species_group
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

#' Fish
#'
#' @family oft_species_group
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
  "Spot croaker",
  "Japanese rice fish",
  "Crucian carp",
  "Yellow bullhead catfish"
  ) 

#' Earthworms
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_earthworms)
oft_earthworms <- c(
  "Earthworm",
  "Grey worm",
  "Lob worm",
  "Red tiger worm")

#' Soil macroorganisms
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_soil_macroorganisms)
oft_soil_macroorganisms <- c(
  oft_earthworms,
  "Folsomia candida",
  "Hypoaspis aculeifer")

#' Birds
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_birds)
oft_birds <- c(
  "Bobwhite quail",
  "Common quail",
  "Mallard duck",
  "Bird",
  "Ringneck dove",
  "Common pheasant",
  "Japanese quail",
  "Duck",
  "Zebra finch",
  "Quail",
  "Turkey",
  "Red-winged blackbird",
  "Canary",
  "Black duck",
  "Helmeted Guineafowl",
  "Partridge",
  "Goose"
  )

#' Bees
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_bees)
oft_bees <- c(
  "Honey bee")

#' Beneficial Arthropods
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_arthropods)
oft_arthropods <- c(
  "Aleochara bilineata",
  "Aphidius rhopalosiphi",
  "Aphidius colemani",
  "Aphidius matricariae",
  "Typhlodromus pyri",
  "Poecilus cupreus",
  "Green lacewing",
  "Trichogramma cacoeciae",
  "Encarsia formosa",
  "Seven-spot ladybird",
  "Minute pirate bug",
  "Marmalade hoverfly"
  )

#' Mammals
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_mammals)
oft_mammals <- c(
  "Rat",
  "Human",
  "Pig",
  "Mouse",
  "Dog",
  "Rabbit",
  "Sheep",
  "American mink",
  "Cattle",
  "Chicken",
  "Cynomolgus monkey",
  "Horse",
  "Cat",
  "Goat",
  "Rhesus monkey",
  "Rodents",
  "Pardosa sp."
  )

#' Plants
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_plants)
oft_plants <- c(
  "Onion",
  "Maize",
  "Carrot",
  "Lettuce",
  "Mung bean",
  "Soybean",
  "Monocots",
  "White mustard",
  "Sunflower",
  "Wild cabbage",
  "Cucumber",
  "Tomato",
  "Perennial ryegrass",
  "Sugar beet",
  "Radish",
  "Redroot amaranth",
  "Common oat",
  "Common chickweed",
  "Garden pea",
  "Wheat",
  "Rye",
  "Sorghum",
  "Lob worm",
  "Field bean (Fava bean)",
  "Garden cress",
  "Rapeseed (oilseed rape)",
  "Wild oat"
  )

#' Other
#'
#' @family oft_species_group
#' @docType data
#' @export
#' @examples
#' print(oft_other)
oft_other <- c(
  "African clawed frog",
  "Mammalian cell line"
  )

