\name{setTrainTh}
\alias{setTrainTh}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	Training set option
}
\description{
	Training set option
}
\usage{
setTrainTh(trainingSetTh)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{trainingSetTh}{
%%     ~~Describe \code{trainingSetTh} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
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
function (trainingSetTh) 
{
    cat("trainingset...\n")
    if (trainingSetTh == "Dave") {
        sub = c(1:303)
    }
    else if (trainingSetTh == "0.5" | trainingSetTh == "strict") {
        sub = c(1:221)
    }
    else if (trainingSetTh == "0.8") {
        sub = c(1:221)[HummelData$BLprob > 0.8 | HummelData$BLprob < 
            0.2]
    }
    else if (trainingSetTh == "0.9") {
        sub = c(1:221)[HummelData$BLprob > 0.9 | HummelData$BLprob < 
            0.1]
    }
    else {
        sub = c(1:221)[HummelData$BLprob > 0.95 | HummelData$BLprob < 
            0.05]
    }
    sub
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
