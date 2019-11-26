options(java.parameters = "-Xmx6g")
options(warn=1)

.lib<- c("RWeka", "farff", "e1071","caret","mlbench", "MASS", "R.utils")
.inst <- .lib %in% installed.packages()
lapply(.lib, require, character.only=TRUE)

# load the library
library(mlbench)
library(caret)
library(MASS)

# Load source code
source("src/RunMethods_v4_preproc.R")
source("src/save_load.R")
source("src/models_dendrogram_v3.R")

# Load datasets
datasets <- list.files("datasets/clean/", pattern=".csv")
datasets <- datasets[!grepl("coltypes", datasets)]

nmodels <- length(models)

listares <-list()
listarestotals <-list()

nds = length(datasets)

ids <- 1
for(ds in datasets){
  
  iim <- 0
  for (im in models)
  {
    
    iim <- iim + 1
    print("---------------------")
    print(paste("Dataset:", "(", ids, "/", nds, "):", ds))
    print(paste("Model (", iim, "/", nmodels, "):", im))
    print("---------------------")
    
    
    inpath <- sprintf("files/predictions/%s_%s.RData", ds, im)
    print(paste("IN PATH:", inpath))
    
    if (file.exists(inpath)) {
      load(inpath)
      listares[[im]] <- preds
    }
  }
  
  listarestotals[[ds]]<-listares
  
  ids <- ids + 1
}

outpath <- sprintf("files/predictions/normal_predictions_v4.RData")
save(listarestotals, file = outpath)
