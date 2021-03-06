\name{logisticRidge}
\alias{logisticRidge}
\alias{coef.ridgeLogistic}
\alias{plot.ridgeLogistic}
\alias{predict.ridgeLogistic}
\alias{print.ridgeLogistic}
\alias{summary.ridgeLogistic}
\alias{print.summary.ridgeLogistic}
\title{
Logistic ridge regression.
}
\description{
Fits a logistic ridge regression model. Optionally, the ridge regression parameter is chosen automatically using 
the method proposed by Cule et al (2012).
}
\usage{
logisticRidge(formula, data, lambda = "automatic", nPCs = NULL,
scaling = c("corrForm", "scale", "none"), ...)

\method{coef}{ridgeLogistic}(object, all.coef = FALSE, ...)

\method{plot}{ridgeLogistic}(x, y = NULL, ...)

\method{predict}{ridgeLogistic}(object, newdata = NULL, type = c("link", "response"), 
    na.action = na.pass, all.coef = FALSE, ...)

\method{print}{ridgeLogistic}(x, all.coef = FALSE, ...)

\method{summary}{ridgeLogistic}(object, all.coef = FALSE, ...)

\method{print}{summary.ridgeLogistic}(x, digits = max(3, getOption("digits") - 3),
signif.stars = getOption("show.signif.stars"), ...) 

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
    A ridge regression parameter. If \code{lambda} is \code{"automatic"} (the default), then the ridge parameter 
    is chosen automatically using the method of Cule et al (2012).
  }
  \item{nPCs}{
    The number of principal components to use to choose the ridge regression parameter, following the method of 
    Cule et al (2012). It is not possible to specify both \code{lambda} and \code{nPCs}.
  }
  \item{scaling}{
    The method to be used to scale the predictors. One of
    \code{"corrform"}(the default) scales the predictors to correlation form, such that the correlation matrix 
    has unit diagonal.
    \code{"scale"}Standardizes the predictors to have mean zero and unit variance.
    \code{"none"}No scaling.
  }
  \item{object}{
    A ridgeLogistic object, typically generated by a call to \code{linearRidge}.
  }
  \item{newdata}{
    An optional data frame in which to look for variables with
    which to predict.  If omitted, the fitted values are used.
  }
  \item{type}{the type of prediction required.  The default predictions are of log-odds
          (probabilities on logit scale) and \code{type = "response"} gives
          the predicted probabilities.}
  \item{na.action}{
    function determining what should be done with missing values
    in \code{newdata}.  The default is to predict \code{NA}.
  }
  \item{all.coef}{
    Logical. Should results be returned for all ridge regression penalty
    parameters (\code{all.coef = TRUE}), or only for the ridge parameter chosen automatically using the method of Cule et al?
  }
  \item{x}{An object of class \code{ridgeLogistic} (for the
    \code{print.ridgeLogistic} and \code{plot.ridgeLogistic} functions) or an object of class
    \code{summary.ridgeLogistic} (for the \code{print.summary.ridgeLogistic}
    function)}
  \item{y}{Dummy argument for compatibility with the default \code{plot} method. Ignored.}
  \item{digits}{minimum number of significant digits to be used for most numbers}
  \item{signif.stars}{logical; if \code{TRUE}, P-values are additionally encoded
    visually as \code{significance stars} in order to help scanning of
    long coefficient tables.  It defaults to the
    \code{show.signif.stars} slot of \code{options}.
  }
  \item{\dots}{
    Additional arguments to be passed to or from other methods.
  }
}
\details{
	If an intercept is present in the model, its coefficient is not penalised. If you want to penalise an 
	intercept, put in your own constant term and remove the intercept.
}
\value{
	An object of class \code{"ridgeLogistic"}, with components:
	\item{automatic}{Was \code{lambda} chosen automatically?}
	\item{call}{The matched call.}
	\item{coef}{A named vector of fitted coefficients.}
	\item{df}{A vector of degrees of freedom of the model fit and degrees of freedom for variance.}
	\item{Inter}{Was in antercept included?}
	\item{isScaled}{Were the predictors scaled before the model was fitted?}
	\item{lambda}{The ridge regression parameter.}
	\item{scales}{The scales used to standardize the predictors.}
	\item{terms}{The \code{\link{terms}} object used.}
	\item{x}{The scaled predictor matrix.}
	\item{xm}{A vector of means of the predictors.}
	\item{y}{The response.}
	And optionally the component
	\item{nPCs}{The number of principal components used to compute the ridge regression parameter.}
}
\references{
A semi-automatic method to guide the choice of ridge parameter in ridge regression. Cule, E. and De Iorio, M. (2012) arXiv:1205.0686v1 [stat.AP] 
}
\author{
Erika Cule
}
\seealso{
\code{\link{linearRidge}}
}
\examples{
data(GenBin)
mod <- logisticRidge(Phenotypes ~ ., data = as.data.frame(GenBin))
summary(mod)
}
