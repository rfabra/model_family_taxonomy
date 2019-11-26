#models <- c(
#"avNNet_decay1e02",
#"avNNet_decay1e04",
#"bagFDA_prune4",
#"bagFDA_prune8",
#"c5.0",
#"c5.0_winnow",
#"cforest_mtry16",
#"cforest_mtry64",
#"ctree_c0.01",
#"ctree_c0.05",
#"earth",
#"fda_prune17",
#"fda_prune9",
#"gbm_2_100",
#"gbm_3_50",
#"hdrda",
#"Ibk_k3",
#"Ibk_k5",
#"J48",
#"J48Unp",
#"JRip",
#"JRip_Unp",
#"knn_k3",
#"knn_k5",
#"LMT",
#"LR",
#"lvq_3",
#"lvq_5",
#"mlp_3",
#"mlp_5",
#"mlp_7",
#"mlpML_2",
#"mlpWeightDecay_1e05",
#"mlpWeightDecayML_2_1e05",
#"multinom",
#"NB",
#"NB_laplace",
#"parRF_mtry16",
#"parRF_mtry64",
#"PART",
#"pda",
#"protoclass",
#"rbf",
#"rda",
#"rf_mtry16",
#"rf_mtry64",
#"rfRules_mtry16",
#"rfRules_mtry64",
#"rrf_mtry16",
#"rrf_mtry64",
#"sda_L1.0",
#"simpls_ncomp2",
#"simpls_ncomp3",
#"simpls_ncomp4",
#"svmLinear_C1",
#"svmLinear_C2",
#"svmPoly_d_1_s_0.1",
#"svmPoly_d_2_s_0.1",
#"svmPoly_d_3_s_0.1",
#"svmRadialCost_C2_11",
#"svmRadialCost_C2_5",
#"W_NB",
#"Bagging",
#"rpart",
#"rbfDDA"
#)

model_names <- function(models) {

	m_names <- rep(NA, length(models))
	i <- 0

	for (m in models) {
		i <- i + 1

		if (m == "avNNet_decay1e02")
			m_names[i] <- "Model Averaged Neural Network (decay = 1e02)"
		if (m == "avNNet_decay1e04")
			m_names[i] <- "Model Averaged Neural Network (decay = 1e04)"
		if (m == "bagFDA_prune4")
			m_names[i] <- "Bagged Flexible Discriminant Analysis (degree = 2, nprune = 4)"
		if (m == "bagFDA_prune8")
			m_names[i] <- "Bagged Flexible Discriminant Analysis (degree = 2, nprune = 8)"
		if (m == "c5.0")
			m_names[i] <- "C5.0"
		if (m == "c5.0_winnow")
			m_names[i] <- "C5.0 (with winnowing)"
		if (m == "cforest_mtry16")
			m_names[i] <- "Conditional Inference Random Forest (mtry = 16)"
		if (m == "cforest_mtry64")
			m_names[i] <- "Conditional Inference Random Forest (mtry = 64)"
		if (m == "ctree_c0.01")
			m_names[i] <- "Conditional Inference Tree (mincriterion = 0.01)"
		if (m == "ctree_c0.05")
			m_names[i] <- "Conditional Inference Tree (mincriterion = 0.05)"
		if (m == "earth")
			m_names[i] <- "Multivariate Adaptive Regression Spline"
		if (m == "fda_prune17")
			m_names[i] <- "Flexible Discriminant Analysis (degree = 1, nprune = 17)"
		if (m == "fda_prune9")
			m_names[i] <- "Flexible Discriminant Analysis (degree = 1, nprune = 9)"
		if (m == "gbm_2_100")
			m_names[i] <- "Stochastic Gradient Boosting (interaction.depth = 2, n.trees = 100)"
		if (m == "gbm_3_50")
			m_names[i] <- "Stochastic Gradient Boosting (interaction.depth = 3, n.trees = 50)"
		if (m == "hdrda")
			m_names[i] <- "High-Dimensional Regularized Discriminant Analysis"
		if (m == "Ibk_k3")
			m_names[i] <- "IBK (k = 3)"
		if (m == "Ibk_k5")
			m_names[i] <- "IBK (k = 5)"
		if (m == "J48")
			m_names[i] <- "J48"
		if (m == "J48Unp")
			m_names[i] <- "J48 (unpruned)"
		if (m == "JRip")
			m_names[i] <- "JRip"
		if (m == "JRip_Unp")
			m_names[i] <- "JRip (unpruned)"
		if (m == "knn_k3")
			m_names[i] <- "k-Nearest Neighbour (k = 3)"
		if (m == "knn_k5")
			m_names[i] <- "k-Nearest Neighbour (k = 5)"
		if (m == "LMT")
			m_names[i] <- "Logistic Model Trees"
		if (m == "LR")
			m_names[i] <- "Logistic Regression (from RWeka)"
		if (m == "lvq_3")
			m_names[i] <- "Learning Vector Quantization (size = 50, k = 3)"
		if (m == "lvq_5")
			m_names[i] <- "Learning Vector Quantization (size = 50, k = 5)"
		if (m == "mlp_3")
			m_names[i] <- "Multi-Layer Perceptron (1 hidden layer, 3 units)"
		if (m == "mlp_5")
			m_names[i] <- "Multi-Layer Perceptron (1 hidden layer, 5 units)"
		if (m == "mlp_7")
			m_names[i] <- "Multi-Layer Perceptron (1 hidden layer, 7 units)"
		if (m == "mlpML_2")
			m_names[i] <- "Multi-Layer Perceptron (2 hidden layers, 3 units each)"
		if (m == "mlpWeightDecay_1e05")
			m_names[i] <- "Multi-Layer Perceptron (1 hidden layer, 5 neurons, weight decay = 1e05)"
		if (m == "mlpWeightDecayML_2_1e05")
			m_names[i] <- "Multi-Layer Perceptron (2 hidden layers, 3 neurons each, weight decay = 1e05)"
		if (m == "multinom")
			m_names[i] <- "Penalized Multinomial Regression"
		if (m == "NB")
			m_names[i] <- "Naive Bayes"
		if (m == "NB_laplace")
			m_names[i] <- "Naive Bayes with Lapace Smoothing = 3"
		if (m == "parRF_mtry16")
			m_names[i] <- "Parallel Random Forest (mtry = 16)"
		if (m == "parRF_mtry64")
			m_names[i] <- "Parallel Random Forest (mtry = 64)"
		if (m == "PART")
			m_names[i] <- "PART (Rule-Based Classifier)"
		if (m == "pda")
			m_names[i] <- "Penalized Discriminant Analysis"
		if (m == "protoclass")
			m_names[i] <- "Greedy Prototype Selection"
		if (m == "rbf")
			m_names[i] <- "Radial Basis Function Network (rbf)"
		if (m == "rda")
			m_names[i] <- "Regularized Discriminant Analysis"
		if (m == "rf_mtry16")
			m_names[i] <- "Random Forest (mtry = 16)"
		if (m == "rf_mtry64")
			m_names[i] <- "Random Forest (mtry = 64)"
		if (m == "rfRules_mtry16")
			m_names[i] <- "Random Forest Rule-Based Model (mtry = 16)"
		if (m == "rfRules_mtry64")
			m_names[i] <- "Random Forest Rule-Based Model (mtry = 64)"
		if (m == "rrf_mtry16")
			m_names[i] <- "Regularized Random Forest (mtry = 16)"
		if (m == "rrf_mtry64")
			m_names[i] <- "Regularized Random Forest (mtry = 64)"
		if (m == "sda_L1.0")
			m_names[i] <- "Shrinkage Discriminant Analysis (lambda = 1)"
		if (m == "simpls_ncomp2")
			m_names[i] <- "Partial Least Squares (ncomp = 2)"
		if (m == "simpls_ncomp3")
			m_names[i] <- "Partial Least Squares (ncomp = 3)"
		if (m == "simpls_ncomp4")
			m_names[i] <- "Partial Least Squares (ncomp = 4)"
		if (m == "svmLinear_C1")
			m_names[i] <- "SVM (linear kernel, C = 1)"
		if (m == "svmLinear_C2")
			m_names[i] <- "SVM (linear kernel, C = 2)"
		if (m == "svmPoly_d_1_s_0.1")
			m_names[i] <- "SVM (polynomial kernel, degree = 1, scale = 0.1)"
		if (m == "svmPoly_d_2_s_0.1")
			m_names[i] <- "SVM (polynomial kernel, degree = 2, scale = 0.1)"
		if (m == "svmPoly_d_3_s_0.1")
			m_names[i] <- "SVM (polynomial kernel, degree = 3, scale = 0.1)"
		if (m == "svmRadialCost_C2_11")
			m_names[i] <- "SVM (Radial Basis Function Kernel, C = 2^11)"
		if (m == "svmRadialCost_C2_5")
			m_names[i] <- "SVM (Radial Basis Function Kernel, C = 2^5)"
		if (m == "W_NB")
			m_names[i] <- "Naive Bayes (RWeka)"
		if (m == "Bagging")
			m_names[i] <- "Bagging"
		if (m == "rpart")
			m_names[i] <- "CART"
		if (m == "rbfDDA")
			m_names[i] <- "Radial Basis Function Network (rbfDDA)"
	}
	m_names
}
