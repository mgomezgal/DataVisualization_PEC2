# Load library
#install.packages("VennDiagram")
library(readxl)
library(VennDiagram)

# Load the dataset
Bestseller_2022 <- read_excel("~/UOC/VisualizacionDatos/PEC2/VennDiagram/Bestseller_2022.xlsx") # Here you add the path to your file
#View(Bestseller_2022)

# create lists from each column
set1 <- as.list(Bestseller_2022$Europa)
set2 <- as.list(Bestseller_2022$USA)
set3 <- as.list(Bestseller_2022$Worldwide)
# remove NA values from list
set1<- set1[!is.na(set1)]
set2<- set2[!is.na(set2)]
set3<- set3[!is.na(set3)]

# Prepare a palette of 3 colors with R colorbrewer:
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")

# Chart
venn.diagram(
  x = list(set1, set2, set3),
  category.names = c("Europe" , "USA" , "Worldwide"),
  filename = '~/UOC/VisualizacionDatos/PEC2/VennDiagram/Bestseller_venn_diagramm.png',  # Here you add your path to save file
  output=TRUE,
  
  # Output features
  imagetype="png" ,
  height = 480 , 
  width = 480 , 
  resolution = 300,
  compression = "lzw",
  
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  
  # Numbers
  cex = .6,
  fontface = "bold",
  fontfamily = "sans",
  
  # Set names
  cat.cex = 0.6,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.pos = c(-27, 27, 135),
  cat.dist = c(0.055, 0.055, 0.085),
  cat.fontfamily = "sans",
  rotation = 1
)


