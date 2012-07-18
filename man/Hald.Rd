\name{Hald}
\alias{Hald}
\docType{data}
\title{
Hald data
}
\description{
The Hald data as used by Hoerl, Kennard and Baldwin (1975). 
These data are also in package \code{wle}.
}
\usage{data(Hald)}
\format{
  The format is:
 num [1:13, 1:5] 78.5 74.3 104.3 87.6 95.9 ...
 - attr(*, "dimnames")=List of 2
  ..$ : NULL
  ..$ : chr [1:5] "y" "X1" "X2" "X3" ...
}
\details{
The first column is the response and the remaining four columns are the predictors.
}
\references{
Ridge Regression: some simulations, Hoerl, A. E. et al, 1975, Comm Stat Theor Method 4:105
}
\examples{
data(Hald)
## maybe str(Hald) ; plot(Hald) ...
}
\keyword{datasets}
