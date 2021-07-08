\name{BDC-package}
\alias{BDC-package}
\alias{BDC}
\docType{package}
\title{
What the package does (short line)
Classify Burkitt's lymphoma and Diffuse large B cell lymphoma
}
\description{
Classifier of Burkitt's lymphoma and Diffuse large B cell lymphoma based on gene expression, the classifier options contain genes and training samples to train the classifier, as well as cross-platform normalization methods.  
}
\details{
\tabular{ll}{
Package: \tab BDC\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-12-01\cr
License: \tab GPL-2 \cr
}
Prepare the test expression data in a matrix or dataframe, with rows represent expression values and columns represent samples.
main function is: Classify (testData, testDataGene, normalize = "Zscore", classifierGene = "28genes", trainingSetTh = "0.95") 
}
\author{
Chulin Sha

Maintainer: Chulin Sha <bscs@leeds.ac.uk>
~~ The author and/or maintainer of the package ~~
}
\references{
~~ Literature or other references for background information ~~
}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
~~ the R documentation directory ~~
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{

data(DaveData)
testData = DaveData$Exprs
testDataGene = DaveData$GeneID

pred = Classify(testData, testDataGene)
print (pred)

}
