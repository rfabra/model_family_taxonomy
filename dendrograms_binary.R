# multiclass, binary, all
dend_dss <- "bin"

if (dend_dss == "all") {
  source("src/datasets_dendrogram_all_v3.R")
} else if(dend_dss == "binary") {
  source("src/datasets_dendrogram_bin_v3.R")
} else if(dend_dss == "multiclass") {
  source("src/datasets_dendrogram_mul_v3.R")
}

source("src/models_dendrogram_v3.R")
source("src/family_names.R")
load("files/predictions/normal_predictions_v4.RData")

options(warn=1)

listarestotals_aux <- list()
for (ds in dss) {
  listarestotals_aux[[ds]] <- list()
  for (im in models) {
    listarestotals_aux[[ds]][[im]] <- listarestotals[[ds]][[im]]
  }
}

listarestotals <- listarestotals_aux

l1<-listarestotals
listarestotals<-c(l1,listarestotals)

library(caret)

lenmet<-length(listarestotals[[1]])

matres<-matrix(0,lenmet,lenmet)
acumres<-matrix(0,lenmet,lenmet)
k<-1

for (ds in listarestotals)
{
  print(paste("Dataset: ", names(listarestotals[k])))
  i<-1
  for (res in ds)
  {
    if (i<lenmet)
    {
      for (j in ((i+1):lenmet))
      {
        if(sum(is.na(ds[[i]]))<1 && sum(is.na(ds[[j]]))<1)
        {
          if ((sum(ds[[i]]==FALSE)+sum(ds[[j]]==FALSE))==0)
          {
            if (length (ds[[j]])==length (ds[[i]]))
            {
              kk<-caret::confusionMatrix(ds[[i]], ds[[j]], mode="everything")

              if (!is.nan(kk$overall["Kappa"])) 
              {
                matres[i,j]<-kk$overall["Kappa"]+ matres[i,j]
                acumres[i,j]<-acumres[i,j]+1
              }
            }
          }
        }
        
      }
    }
    i<-i+1
  }
  k<-k+1
  
}

hc<-hclust(as.dist(t(1-(matres/acumres))))

names <- model_names(models)

rm(listarestotals_aux)

plot(hc,labels=names)
for (k in 2:25)
{
  library(factoextra)
  library(dendextend)
  
  tr <- t(1-(matres/acumres))
  colnames(tr) <- paste("(",1:length(names), ")", " ", names, sep="")
  
  hc<-hclust(as.dist(tr))
  
  
  
  dnd <- fviz_dend(hc, k, #k = 20, # Cut in K groups
                   cex = 0.2, # label size
                   #k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
                   show_labels = TRUE,
                   color_labels_by_k = T, # color labels by groups
                   rect = T, # Add rectangle around groups
                   #rect_border = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"), 
                   rect_fill = F,
                   horiz = TRUE,
                   main = "",
                   labels_track_height = 0.4, rect_lty = 2, lwd = 0.3
  )
  
  dnd
  
  openPDFEPS <- function(file, height= PDFheight, width= PDFwidth, PDFEPS = 1) {
    if (PDFEPS == 1) {
      pdf(paste(file, ".pdf", sep=""), width, height)
    } else if (PDFEPS == 2) {
      postscript(paste(file, ".eps", sep=""), width, height, horizontal=FALSE)
    }
    else if (PDFEPS == 3) {
      png(paste(file, ".png", sep=""), width, height)
    }
  }
  path <- sprintf("files/dendrograms/bin/dend_normal_%s_%s", dend_dss, k)
  openPDFEPS(path, height = 4, width = 6)
  plot(dnd)
  dev.off()
}