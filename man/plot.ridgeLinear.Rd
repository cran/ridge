\name{plot.ridgeLinear}
\alias{plot.ridgeLinear}

\title{
  Plots the ridge trace of a linear ridge regression fit.
}

\description{
  Plots the ridge trace of a linear ridge regression fit. The fit is
  typically obtained from a call to \code{linearRidge}. 
}

\usage{
\method{plot}{ridgeLinear}(x, y = NULL, ...)
}

\arguments{
  \item{x}{
    An object of class \code{ridgeLinear}.
}
  \item{y}{
    Dummy argument for compatibility with the default \code{plot}
  method. Ignored.
}
  \item{\dots}{
    Additional arguments to be passed to or from other methods.
}
}
\details{
  If \code{linearRidge} was called with \code{lambda = "automatic"}
  the ridge trace is plotted with the number of principal components on
  the x-axis and the chosen number of components indicated by a dashed
  vertical line. If \code{linearRidge} was called with a range of
  \code{lambda} values, the ridge trace is plotted. If
  \code{linearRidge} was called with a single value of \code{lambda}
  or \code{nPCs}, coefficients for that value of \code{lambda} or
  \code{nPCs} are plotted as points.
}

\references{
  A semi-automatic method to guide the choice of ridge parameter in ridge
  regression. Cule, E. and De Iorio, M. (2012) arXiv:1205.0686v1
}
\author{
  Erika Cule
}

\seealso{
\code{\link{linearRidge}}
}
\examples{
data(GenCont)
mod <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
plot(mod)
}

