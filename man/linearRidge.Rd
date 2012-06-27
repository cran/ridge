\name{linearRidge}
\alias{linearRidge}
\alias{print.ridgeLinear}
\title{
Linear ridge regression.
}
\description{
  Fits a linear ridge regression model. Optionally, the ridge regression parameter is chosen automatically using 
  the method proposed by Cule and De Iorio (2012).
}
\usage{
linearRidge(formula, data, lambda = "automatic", nPCs = NULL,
    scaling = c("corrForm", "scale", "none"), ...)

\method{print}{ridgeLinear}(x, all.coef = FALSE, ...)
}
\arguments{
  \item{formula}{
    a formula expression as for regression models, of the form \code{response ~ predictors}. See the 
    documentation of \code{formula} for other details.
  }
  \item{data}{
    an optional data frame in which to interpret the variables occuring in \code{formula}.
  }
  \item{lambda}{
    A ridge regression parameter. May be a vector. If \code{lambda} is \code{"automatic"} (the default), then the ridge parameter 
    is chosen automatically.
  }
  \item{nPCs}{
    The number of principal components to use to choose the ridge regression parameter, following the method of 
    Cule and De Iorio (2012). It is not possible to specify both
    \code{lambda} (as other than \code{lambda = "automatic"}) and
    \code{nPCs} at the same time.
  }
  \item{scaling}{
    The method to be used to scale the predictors. If \code{lambda} is
    \code{"automatic"} then \code{scaling} must be \code{"corrForm"}
    (the default), and attempts to set it to another option will be
    overruled, with a warning.

    One of

    \code{"corrform"}(the default) scales the predictors to correlation form, such that the correlation matrix 
    has unit diagonal.

    \code{"scale"}Standardizes the predictors to have mean zero and unit variance.

    \code{"none"}No scaling.
  }

  \item{all.coef}{
    Logical. Should results be printed for all ridge regression penalty
    parameters (\code{all.coef = TRUE}), or only for the ridge parameter
  chosen automatically.
  }
  \item{x}{An object of class \code{ridgeLinear}}
  \item{\dots}{
    Additional arguments to be passed to or from other methods.
  }

}
\details{
	If an intercept is present in the model, its coefficient is not penalised. If you want to penalise an 
	intercept, put in your own constant term and remove the intercept.
}
\value{
  For the \code{linearRidge} function, an object of class
  \code{"ridgeLinear"}, with components:
  \item{automatic}{Logical. Was \code{lambda} chosen automatically?}
  \item{call}{The matched call.}
  \item{coef}{A named vector of fitted coefficients.}
  \item{df}{A vector of degrees of freedom of the model fit, degrees of freedom for variance, and residual 
    degrees of freedom of the fitted model.}
  \item{Inter}{Was an intercept included?}
  \item{isScaled}{Were the predictors scaled before the model was fitted?}
  \item{lambda}{The ridge regression parameter(s).}
  \item{scales}{The scales used to standardize the predictors.}
  \item{terms}{The \code{terms} object used.}
  \item{x}{The scaled predictor matrix.}
  \item{xm}{A vector of means of the predictors.}
  \item{y}{The response.}
  \item{ym}{The mean of the response.}
  
  And optionally the components
  
  \item{max.nPCs}{The maximum number of principal components for which a ridge regression parameter was computed.}
  \item{chosen.nPCs}{The number of principal components used to compute
    the ridge parameter.}
  The \code{print.ridgeLinear} function returns, invisibly, the object
  \code{x} in the function call.
}
\references{
A semi-automatic method to guide the choice of ridge parameter in ridge regression. Cule, E. and De Iorio, M. 
(2012) arXiv:1205.0686v1
}
\author{
Erika Cule
}

\seealso{
\code{\link{logisticRidge}}
}
\examples{
data(GenCont)
mod <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
summary(mod)
}
