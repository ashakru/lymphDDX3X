\name{HummelData}
\alias{HummelData}
\docType{data}
\title{
	Data GSE4475
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("HummelData")}
\format{
  The format is:
List of 6
 $ GeneID: chr [1:22283] "NA" "RFC2" "HSPA6" "PAX8" ...
 $ Exprs : num [1:22283, 1:221] 8.74 8.72 7.23 9.78 4.92 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:22283] "1007_s_at" "1053_at" "117_at" "121_at" ...
  .. ..$ : chr [1:221] "GSM100454.CEL" "GSM100455.CEL" "GSM100456.CEL" "GSM100457.CEL" ...
 $ Strict: chr [1:221] "BL" "BL" "BL" "BL" ...
 $ Wide  : Factor w/ 2 levels "BL","DLBCL": 1 1 1 1 1 1 2 2 2 1 ...
 $ BLprob: num [1:221] 1 1 1 1 1 0.88 0 0 0 0.84 ...
 $ Actual: chr [1:221] "mBL" "mBL" "mBL" "mBL" ...
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(HummelData)
## maybe str(HummelData) ; plot(HummelData) ...
}
\keyword{datasets}
