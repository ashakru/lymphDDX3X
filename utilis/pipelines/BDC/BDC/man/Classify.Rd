\name{Classify}
\alias{Classify}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Classify Burkitt's lymphoma and Diffuse large B cell lymphoma
}
\description{
Classifier of Burkitt's lymphoma and Diffuse large B cell lymphoma based on gene expression, 
the classifier options contain genes and training samples to train the classifier, as well as cross-platform normalization methods.  
}
\usage{
Classify(testData, testDataGene, normalize = "Zscore", classifierGene = "28genes", trainingSetTh = "0.95")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{testData}{
	The self normalized expression value of the samples wants to classify, matrix or data.frame object, probes by rows and samples by columns
}
  \item{testDataGene}{

	The gene symbols of each probes in the data, allow replicate gene symbols
}
  \item{normalize}{
	Cross-platform normalization method, default value is Zscore
}
  \item{classifierGene}{
	Gene set to build the classifier, default is 28 genes in the relative paper
}
  \item{trainingSetTh}{

	Training set choice, default is the subset of the data in Hummel group's classifier consits of 177 samples 
}
}
\details{
	More details in the paper
}
\value{
%%  ~Describe the value returned
Return a list of gepclass data, basicly contains elements below
%%  If it is a LIST, use
%%  \item{prediction}{The predction result of the test data, has two values, class and BL probability}
%%  \item{norm.method}{Indicates the chosen normalization method}
    \item{classfierGene}{Indicates the geneset chosen to build the classifier}
    \item{trainSetTh}{Indicates the training dataset chosen to build the classifier}
    \item{svmModel}{Detail svm model in the classification}
    \item{classfier.data}{Contains two values, train and test, are the value of both training set and test set used in the classification}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
	Chulin Sha
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (testData, testDataGene, normalize = "Zscore", classifierGene = "28genes", 
    trainingSetTh = "0.95") 
{
   # load("../data/HummelData.rda", .GlobalEnv)
    data(HummelData, envir = .GlobalEnv)
    gene.update = geneCheck(testDataGene)
    test.merge = avereps(testData, ID = gene.update)
    normalize.data = CPNormalize(test.merge, method = normalize, 
        trainingSetTh)
    classifier.data = extractClassifierGene(classifierGene, normalize.data)
    train.data = as.data.frame(t(classifier.data$train.expr))
    if (trainingSetTh == "Dave") {
        train.data$Class = DaveData$Class
    }
    else if (trainingSetTh == "strict") {
        train.data$Class = HummelData$Strict
    }
    else {
        train.data$Class = HummelData$Wide
    }
    test.data = as.data.frame(t(classifier.data$test.expr))
    test.data$Class = as.factor(sample(c("BL", "DLBCL"), size = ncol(classifier.data$test.expr), 
        replace = T))
    sub = setTrainTh(trainingSetTh)
    model = svm(Class ~ ., data = train.data, probability = T, 
        subset = sub)
    p = predict(model, test.data, probability = T)
    prediction = list(class = rep("DLBCL", length(p)), BLprobability = rep(0, 
        length(p)))
    prediction$BLprobability = attributes(p)[4][[1]][, 1]
    prediction$class[prediction$BLprobability > 0.5] = "BL"
    test.data$Class = as.factor(prediction$class)
    result = list(prediction = prediction, norm.method = normalize, 
        classifierGene = rownames(classifier.data$train.expr), 
        trainSetTh = trainingSetTh, svmModel = model, classifier.data = list(train = train.data, 
            test = test.data))
    class(result) = "gepclass"
    result
}

data(DaveData)
testData = DaveData$Exprs
testDataGene = DaveData$GeneID

pred = Classify(testData, testDataGene)
print (pred)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
