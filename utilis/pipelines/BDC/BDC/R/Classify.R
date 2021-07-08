Classify <-
function(testData, testDataGene, normalize="Zscore", classifierGene="28genes", trainingSetTh="0.95"){
	data(HummelData, envir = .GlobalEnv)
	data(classifierGene, envir = .GlobalEnv)
	gene.update = geneCheck(testDataGene)
	test.merge = avereps(testData, ID=gene.update)
	normalize.data = CPNormalize(test.merge, method=normalize, trainingSetTh)
	classifier.data = extractClassifierGene(classifierGene, normalize.data)

	train.data = as.data.frame(t(classifier.data$train.expr))
	if(trainingSetTh == "Dave"){
		train.data$Class = DaveData$Class}
        else if(trainingSetTh == "strict") {
		train.data$Class = HummelData$Strict}
	else{
		train.data$Class = HummelData$Wide}
	test.data = as.data.frame(t(classifier.data$test.expr))
	test.data$Class = as.factor(sample(c("BL", "DLBCL"), size=ncol(classifier.data$test.expr), replace=T))
	
	sub = setTrainTh(trainingSetTh)
	model = svm(Class ~., data=train.data, probability=T, subset=sub)

	p = predict(model, test.data, probability=T)
        prediction=list(class = rep("DLBCL", length(p)), BLprobability=rep(0, length(p)))
	prediction$BLprobability = attributes(p)[4][[1]][,1]
	prediction$class[ prediction$BLprobability>0.5]="BL"
	test.data$Class = as.factor(prediction$class)
	
result=list(prediction=prediction, norm.method=normalize, classifierGene=rownames(classifier.data$train.expr), trainSetTh=trainingSetTh, svmModel=model, classifier.data=list(train=train.data, test=test.data))
	class(result) = "gepclass"
result
}
