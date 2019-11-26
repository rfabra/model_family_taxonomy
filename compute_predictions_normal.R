options( java.parameters = "-Xmx6g" )
options(warn=1)

.lib<- c("RWeka", "farff", "e1071","caret","mlbench", "MASS", "R.utils", "plyr")
.inst <- .lib %in% installed.packages()
lapply(.lib, require, character.only=TRUE)


# Load source code
source("src/RunMethods_v4_preproc.R")
source("src/save_load.R")

# Load datasets
datasets <- list.files("datasets/clean/", pattern=".csv")
datasets <- datasets[!grepl("coltypes", datasets)]

nds = length(datasets)

# Load models
source("src/models_dendrogram_v3.R")
nmodels <- length(models)

listares<-list()
listarestotals<-list()

ids <- 1

for(ds in datasets) {
  datos <- load_dataset(sprintf("datasets/clean/%s",ds))
  Train<-datos
  
  set.seed(3)
  
  GridTest<-generateNormalTest(Train, nrow(Train) * (ncol(datos)-1))
  GridTest <- GridTest[,!(colnames(GridTest) %in% c("X0"))]
  GridTest <- rbind(GridTest, Train[,1:ncol(Train)-1])
  
  save(GridTest, file=sprintf("files/surrogate_datasets_normal/%s_seed3.RData", ds))
  iim <- 0
  for (im in models)
  {
    iim <- iim + 1
    print("---------------------")
    print(paste("Dataset:", "(", ids, "/", nds, "):", ds))
    print(paste("Model (", iim, "/", nmodels, "):", im))
	  print("---------------------")
    
	  path <- sprintf("files/predictions/%s_%s.RData", ds, im)
    m_lock  <- sprintf("files/locks/%s_%s", ds, im)
    if (!file.exists(path)) {
      if (!file.exists(m_lock)) {
        file.create(m_lock)
          
        set.seed(3)
	      listares[[im]] <- runmethods(im, Train, GridTest);
	      
        preds <- listares[[im]]
        print(preds)
			  save(preds, file=path)
        
        state <- "OK"
        if (length(unique(listares[[im]])) == 1) {
          state <- "SINGLE PREDICTION"
        }
        if (any(is.na(listares[[im]]))) {
          state <- "ERROR"
        }
        else if (all(listares[[im]] == FALSE)) {
          state <- "ERROR"
        }
        else if ("TIMEOUT" %in% listares[[im]]) {
          state <- "TIMEOUT"
        }
        print(state)
        
        if (file.exists(m_lock)) {file.remove(m_lock)}
      }
      else {
        print("LOCKED MODEL")
      }
	  }
    else {
      load(path)
      listares[[im]] <- preds
    }
  }
  
  listarestotals[[ds]]<-listares
  ids <- ids + 1
}
