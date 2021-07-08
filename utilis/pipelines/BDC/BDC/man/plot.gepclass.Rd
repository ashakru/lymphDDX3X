\name{plot.gepclass}
\alias{plot.gepclass}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	Boxplot of the expression values of classifier gene in predicted two classes
}
\description{
	Boxplot of the expression values of classifier gene in predicted two classes
}
\usage{
plot.gepclass(x, ...)
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
    y = x$classifier.data$test
    par(mfrow = c(2, 1))
    boxplot(y[y$Class == "DLBCL", 1:ncol(y) - 1], varwidth = T, 
        las = 2, main = "classifier gene in DLBCL class")
    boxplot(y[y$Class == "BL", 1:ncol(y) - 1], varwidth = T, 
        las = 2, main = "classifier gene in BL class")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
