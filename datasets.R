library(tmap)
library(dplyr)
library(sf)
library(viridis)
library(paletteer)
source("helper_functions.R")

# make sure i make good use of shiny
# data analysis
# clean code
# clean repo

################# Mapping #################
# shapefile
barbados <- st_read("./shapefile/bb.shp")
barbados <- barbados |> rename(Parish = name,
                               ID = id, 
                               Source = source,
                               Geometry = geometry)
barbados <- barbados |> arrange(ID)

# plotting
map <- tm_shape(barbados) + 
  tm_polygons(fill = "Parish", 
              fill.scale = tm_scale(values = paletteer_d("ggsci::category20_d3")[1:11]))
map






################# Datasets #################

####### WHO Data #######
# data dictionary
dict <- read.csv("data/data_dictionary.csv")

# vaccination access
vaccines <- read.csv("data/Access to affordable medicines and vaccines/dataset.csv")

# tobacco usage
tobacco <- read.csv("data/Age-standardized prevalence of tobacco use/dataset.csv")

# alcohol usage
alcohol <- read.csv("data/Alcohol/dataset.csv")

# attended births
births <- read.csv("data/Births attended by skilled health personnel/dataset.csv")

# diseases
diseases <- read.csv("data/cardiovascular disease, cancer, diabetes or chronic respiratory disease/dataset.csv")

# clean fuels
fuels <- read.csv("data/Clean fuels/dataset.csv")

# road traffic deaths
traffic_deaths <- read.csv("data/Deaths due to road traffic injuries/dataset.csv")

# doctor density and distribution
doctors <- read.csv("data/Doctor density and distribution/dataset.csv")

# fine particulate matter
matter <- read.csv("data/Fine particulate matter/dataset.csv")

# government spending on essential services
gov_spending <- read.csv("data/Government spending essential services/dataset.csv")

# hepatitis b
hep_b <- read.csv("data/Hepatitis B/dataset.csv")

# HIV infections
hiv <- read.csv("data/HIV infections/dataset.csv")

# air pollution
pollution <- read.csv("data/Household and ambient air pollution/dataset.csv")

# hypertension
hypertension <- read.csv("data/Hypertension/dataset.csv")

# homicide
homicide <- read.csv("data/Intentional homicide/dataset.csv")

# malnutrition
malnutrition <- read.csv("data/Malnutrition/dataset.csv")

# maternal mortality rates
maternal <- read.csv('./data/Maternal mortality ratio/dataset.csv')

# neglected tropical diseases
trop_diseases <- read.csv("data/Neglected tropical diseases/dataset.csv")

# neonatal mortality rates
infant <- read.csv("./data/Neonatal mortality rate/dataset.csv")

# nurses and midwives density
nurse_midwife <- read.csv("data/Nurses and midwives density and distribution/dataset.csv")

# obesity in adults
obesity_adult <- read.csv("data/Obesity in adults/dataset.csv")

# obesity in children
obesity_child <- read.csv("data/Obesity in children/dataset.csv")

# pharmacists density
pharms <- read.csv("data/Pharmacists density and distribution/dataset.csv")

# sanitation and hand-washing
sanitation <- read.csv("data/Safely managed sanitation & hand-washing/dataset.csv")

# stunting
stunting <- read.csv("data/Stunting/dataset.csv")

# suicide
suicide <- read.csv("data/Suicide/dataset.csv")

# tuberculosis
tb <- read.csv("data/Tuberculosis/dataset.csv")

# under-5 mortality rate
under5_mortality <- read.csv("data/Under-five mortality rate/dataset.csv")

# unintentional poisoning
poisoning <- read.csv("data/Unintentional poisoning/dataset.csv")

# unsafe water
unsafe_water <- read.csv("data/Unsafe water, unsafe sanitation and lack of hygiene/dataset.csv")

# women satisfied with modern methods
women_methods <- read.csv("data/Women satisfied with modern methods/dataset.csv")



####### UN Data #######

# demographics, contains all UN country data
demographics <- read.csv("data/WPP2024_Demographic_Indicators_Medium.csv.gz")

# filtering to get all Barbados information
demographics <- demographics |> filter(Location == "Barbados")
demographics <- demographics |> drop_one_value_col()
