## list of possible datasets for Barbados
## datasets gathered from WHO:
## https://data.who.int/countries
## i chose Barbados

# maternal mortality rates
maternal <- read.csv('./052_Barbados/AC597B1_3.1.1 - Maternal mortality ratio/052_AC597B1_Dataset_2023-05-11.csv')

# infant mortality rates
infant <- read.csv("./052_Barbados/A4C49D3_3.2.2- Neonatal mortality rate/052_A4C49D3_Dataset_2024-05-16.csv")



## i can find shapefiles or geojson files on the following sites
## https://www.naturalearthdata.com/
## https://www.openstreetmap.org/

## i found the shapefile here: https://simplemaps.com/gis/country/bb
library(sf)
#shapefile
barbados <- st_read("./bb_shp/bb.shp")





library(tmap)
tm_shape(barbados) + 
  tm_polygons() + 
  tm_graticules(lines=FALSE) +
  tm_fill("name", palette = "Set3")
