\name{CPNormalize}
\alias{CPNormalize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	cross-platform normalization
}
\description{
	A function to do cross-platform normalization with selected methods
}
\usage{
CPNormalize(test.merge, method = "Zscore", trainSet)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{test.merge}{
	Expression values per gene of the test data
}
  \item{method}{
	Chosen method
}
  \item{trainSet}{
	Training set to perform the normalization
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
	A list of normalize training and test dataset
 \item{train.normal }{Description of 'comp1'}
 \item{test.normal }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
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
function (test.merge, method = "Zscore", trainSet) 
{
    data("DaveData.rda", envir =.GlobalEnv)
    data("HummelData.rda", envir =.GlobalEnv)
    if (trainSet == "Dave") {
        trainSet = DaveData
    }
    else {
        trainSet = HummelData
    }
    cat("Normalizing...\n")
    geneUpdate = geneCheck(trainSet$GeneID)
    train.merge = avereps(trainSet$Exprs, ID = geneUpdate)
    if (method == "Zscore" | method == "zscore") {
        trainNormal = zscoreTransfer(train.merge)
        testNormal = zscoreTransfer(test.merge)
    }
    else if (method == "Rank" | method == "rank") {
        trainNormal = rankTransfer(train.merge)
        testNormal = rankTransfer(test.merge)
    }
    else if (method == "DWD" | method == "dwd") {
        nordwd = dwd(train.merge, test.merge)
        trainNormal = nordwd$x
        testNormal = nordwd$y
    }
    else if (method == "XPN" | method == "xpn") {
        norxpn = xpn(train.merge, test.merge)
        trainNormal = norxpn$x
        testNormal = norxpn$y
    }
    list(train.normal = trainNormal, test.normal = testNormal)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
