#!/bin/bash
libs='ggplot2 plyr dplyr RWeka  sampling gbm  rpart  e1071 randomForest foreach MASS mlbench rrlda C50  MASS RSNNS  class  kernlab party  sda  rrcov  robustbase  mda  ada  caTools  adabag ipred  bst  randomForest  RRF  pls  KODAMA caret  party factoextra dendextend farff'

modellibs=$(grep load_install\(\" common/RunMethods_v4_preproc.R | cut -d '"' -f 2)


all_libs=$modellibs$libs | sort

echo $all_libs

#for i in $libs$modellibs; do 
	#echo "install.packages(\"$i\")"; 
#done #> install_libraries.R
