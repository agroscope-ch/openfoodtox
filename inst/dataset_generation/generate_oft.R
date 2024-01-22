# The current version should always be resolved from
# https://zenodo.org/doi/10.5281/zenodo.780543

library(here) # For writing to the right directory from an RStudio project
library(readxl) # For reading Excel sheets
library(dplyr)
library(dm)

# Base URL of files to be downloaded
current_file_base <- "https://zenodo.org/records/8120114/files"

# Table of EFSA outputs with OutputID
download.file(
  file.path(current_file_base, "EFSAOutputs_KJ_2023.xlsx"),
  outputs_file <- tempfile()
)

efsa_outputs <- read_excel(outputs_file) |>
  mutate(OutputID = as.integer(OutputID)) |>
  mutate(Published = as.Date(Published))

# Substance characterisation data
download.file(
  file.path(current_file_base, "SubstanceCharacterisation_KJ_2023.xlsx"),
  characterisation_file <- tempfile()
)

substance_characterisation <- read_excel(characterisation_file) |>
  rename(c(component_type= "has"))

# Table of unique substance names

substance_names <- substance_characterisation |>
  select(Substance) |>
  unique()

# OpenFoodTox endpoints (not read in at the moment)
#download.file(
#  file.path(current_file_base, "OpenFoodToxTX22809_2023.xlsx"),
#  foodtox_file <- tempfile()
#)

#foodtox_dictionary<- read_excel(foodtox_file, sheet = "Dictionary")
#foodtox_component <- read_excel(foodtox_file, sheet = "COMPONENT")

# Reference points
download.file(
  file.path(current_file_base, "ReferencePoints_KJ_2023.xlsx"),
  rp_file <- tempfile())

reference_points<- read_excel(rp_file) |>
  mutate(across(c(Year, OutputID), as.integer))

# Reference values
download.file(
  file.path(current_file_base, "ReferenceValues_KJ_2023.xlsx"),
  rv_file <- tempfile())

reference_values<- read_excel(rv_file) |>
  mutate(across(c(Year, OutputID), as.integer))

oft <- dm(efsa_outputs, substance_names, substance_characterisation, reference_points, reference_values) |>
  dm_add_pk(efsa_outputs, c("Substance", "OutputID")) |>
  dm_add_pk(substance_names, "Substance") |>
  dm_add_fk(reference_points, c("Substance", "OutputID"), efsa_outputs) |>
  dm_add_fk(substance_characterisation, "Substance", substance_names) |>
  dm_add_fk(reference_points, "Substance", substance_names) |>
  dm_add_fk(reference_values, c("Substance", "OutputID"), efsa_outputs) |>
  dm_add_fk(reference_values, "Substance", substance_names)

dm_examine_constraints(oft)

save("oft", file = here("data/oft.rda"), compress = "xz")
