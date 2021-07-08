\name{extractClassifierGene}
\alias{extractClassifierGene}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	extract the expression value of classifier genes
}
\description{
	extract the expression value of classifier genes
}
\usage{
extractClassifierGene(classifierGene, normalize.data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{classifierGene}{
%%     ~~Describe \code{classifierGene} here~~
}
  \item{normalize.data}{
%%     ~~Describe \code{normalize.data} here~~
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
function (classifierGene, normalize.data) 
{
    data("classifierGene.rda", envir =.GlobalEnv)
    cat("extracting gene...\n")
    if (classifierGene == "10genes") {
        classifierGene = geneCheck(Gene$Gene10)
    }
    else if (classifierGene == "21genes") {
        classifierGene = geneCheck(Gene$Gene21)
    }
    else if (classifierGene == "60genes") {
        classifierGene = geneCheck(Gene$Gene60)
    }
    else {
        classifierGene = geneCheck(Gene$Gene28)
    }
    pos = match(classifierGene, rownames(normalize.data$test.normal))
    if (sum(is.na(pos))) {
        cat("Can't locate", sum(is.na(pos)), "gene:", classifierGene[is.na(pos)], 
            "in testset\n")
    }
    pos1 = pos[!is.na(pos)]
    test.expr = normalize.data$test.normal[pos1, ]
    train.expr = normalize.data$train.normal[match(classifierGene[!is.na(pos)], 
        rownames(normalize.data$train.normal)), ]
    list(train.expr = train.expr, test.expr = test.expr)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
