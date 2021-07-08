\name{print.gepclass}
\alias{print.gepclass}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	Print the summary of prediction result
}
\description{
	Print the summary of prediction result
}
\usage{
print.gepclass(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (x, ...) 
{
    cat("\nNormalization Method:", x$norm.method, "\n")
    cat("\nClassifier Gene Number:", length(x$classifierGene), 
        "\n")
    cat("\nTraining set GSE4475 threshold:", x$trainSetTh, "\n")
    cat("\nprediction:\nBL", sum(x$prediction$class == "BL"), 
        "\nDLBCL", sum(x$prediction$class == "DLBCL"), "\n")
    cat("\nBL probability interval:\n")
    cat("[0-0.2]:", sum(x$prediction$BLprobability > 0 & x$prediction$BLprobability <= 
        0.2), "\n")
    cat("[0.2-0.5]:", sum(x$prediction$BLprobability > 0.2 & 
        x$prediction$BLprobability <= 0.5), "\n")
    cat("[0.5-0.8]:", sum(x$prediction$BLprobability > 0.5 & 
        x$prediction$BLprobability <= 0.8), "\n")
    cat("[0.8-1]:", sum(x$prediction$BLprobability > 0.8 & x$prediction$BLprobability <= 
        1), "\n")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
