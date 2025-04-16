library(tmap)
library(dplyr)
library(sf)


# maternal mortality rates
maternal <- read.csv('./data/AC597B1_3.1.1 - Maternal mortality ratio/052_AC597B1_Dataset_2023-05-11.csv')

# infant mortality rates
infant <- read.csv("./data/A4C49D3_3.2.2- Neonatal mortality rate/052_A4C49D3_Dataset_2024-05-16.csv")

# shapefile
barbados <- st_read("./shapefile/bb.shp")
barbados <- barbados |> rename(Parish = name,
                               ID = id, 
                               Source = source,
                               Geometry = geometry)
barbados <- barbados |> arrange(ID)

# plotting
tm_shape(barbados) + 
  tm_polygons() + 
  tm_graticules(lines=FALSE) +
  tm_fill("name", palette = "rainbow")
