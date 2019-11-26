f = open("common/RunMethods_v4_preproc.R")
lines = f.readlines()
f.close()

lines = [l for l in lines if "load_install(\"" in l]
model_libs = [l.split("\"")[1] for l in lines]


libs=['ggplot2','plyr','dplyr','RWeka','sampling','gbm','rpart','e1071','randomForest','foreach','MASS','mlbench','rrlda','C50','MASS','RSNNS','class','kernlab','party','sda','rrcov','robustbase','mda','ada','caTools','adabag','ipred','bst','randomForest','RRF','pls','KODAMA','caret','party','factoextra','dendextend', 'R.utils', 'DMwR']

all_libs = sorted(list(set(libs+model_libs)))

f = open("install_libraries.R", "w")
for lib in all_libs: 
    f.write("install.packages(\"{}\")\n".format(lib))
f.close()

