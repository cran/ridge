\name{Gorman}
\alias{Gorman}
\docType{data}
\title{
The Ten-Factor data first described by Gorman and Toman (1966).
}
\description{
A Ten-Factor data set first described by Gornam and Toman (1966) and used by Hoerl and Kennary (1970) (and others) to 
investigate regression problems.
}
\usage{data(Gorman)}
\format{
  The format is:
 num [1:36, 1:11] 1.82 2.08 2.47 1.54 2.2 ...
 - attr(*, "dimnames")=List of 2
  ..$ : NULL
  ..$ : chr [1:11] "logY" "X1" "X2" "X3" ...
}
\details{
The first column is the response on the log scale, the remaining columns are the predictors.
}
\source{
Selection of variables for fitting equations to data. Gorman, J. W. and Toman, R. J. (1966) Technometrics, 8:27.
}
\references{
Selection of variables for fitting equations to data. Gorman, J. W. and Toman, R. J. (1966) Technometrics, 8:27.
Ridge Regression: Biased estimators for nonorthogonal problems. Hoerl, A. E. and Kennard, R. W. (1970) Technometrics, 
12:55.
}
\examples{
data(Gorman)
## maybe str(Gorman) ; plot(Gorman) ...
}
\keyword{datasets}
