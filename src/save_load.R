# Fix .arff load of specific datasets
# Correct class attribute, name and position
correct_load <- function (ds_name, ds_data)
{
 if (ds_name == "Click_prediction_small.arff" || 
     ds_name == "JapaneseVowels.arff" || 
     ds_name == "lung-cancer.arff" ||
     ds_name == "monks-problems-1.arff" ||
     ds_name == "monks-problems-2.arff" ||
     ds_name == "monks-problems-3.arff") {
     ds_data <- cbind(ds_data[,2:ncol(ds_data)], ds_data[,1])
     colnames(ds_data)[ncol(ds_data)]<-"Class"
 }
 if (ds_name == "splice.arff" || ds_name == "synthetic_control.arff") {
    # El primer atribut es un identificador de la instància.
    # Això probablement mareje, ja que pot prendre molts valors possibles
    ds_data <- ds_data[,2:ncol(ds_data)]
  }
  colnames(ds_data)[ncol(ds_data)]<-"Class"  
 
  ds_data
}

# Save dataset in CSV format
save_dataset <- function(dataset, filename) {
  # Extract column types and names
  col_types <- sapply(dataset, class)
  names(col_types) <- colnames(dataset)
  feat_types <- col_types[1:length(col_types)-1]
  
  # Check for integer features
  integer_feats <- sapply(dataset[,1:ncol(dataset)-1],function(x) {!is.factor(x) && all(x == as.integer(x))} )
  feat_types[integer_feats == TRUE] <- "integer"
  
  # Save results, dataset and column types
  write.table(x=dataset, file=filename, row.names = FALSE, col.names = TRUE, sep=",")
  write.table(x=feat_types, file=gsub(".csv","_coltypes.csv", filename), row.names = FALSE, col.names = FALSE, sep=",")
}

# Load dataset in CSV format
load_dataset <- function(filename) {
  # Load dataset and column type
  dataset <- read.table(filename, sep=",", header=TRUE, check.names=FALSE)
  col_types <- read.table(gsub(".csv","_coltypes.csv", filename))
  
  # Assign column types to dataset
  for (c in 1:nrow(col_types)) {
    if (col_types[c,1] == "factor") {
      dataset[,c] <- as.factor(dataset[,c])
    }
    else if (col_types[c,1] == "integer")
    {
      dataset[,c] <- as.integer(dataset[,c])
    }
    else {
      dataset[,c] <- as.numeric(dataset[,c])
    }
  }
  # Class as factor
  dataset[,ncol(dataset)] <- as.factor(dataset[,ncol(dataset)])
  
  dataset
}