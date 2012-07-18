\name{linearRidgeGenotypesPredict}
\alias{linearRidgeGenotypesPredict}

\title{
  Predict phenotypes from genome-wide SNP data based on a file of coefficients
}
\description{
  Predict phenotypes from genome-wide SNP data based on a file of
  coefficients. Genotypes and fitted coefficients are provided as
  filenames, allowing the computation of fitted probabilities when SNP
  data are too large to be read into R.
}
\usage{
linearRidgeGenotypesPredict(genotypesfilename, betafilename, phenotypesfilename = NULL, verbose = FALSE)
}

\arguments{
  \item{genotypesfilename}{
    character string: path to file containing SNP genotypes coded 0, 1,
  2. (see \code{details}).
}
  \item{betafilename}{
    character string: path to file containing fitted coefficients. For
  formatting, see \code{details}.
}
  \item{phenotypesfilename}{
    (optional) character string: path to file in which to write out the
  predicted phenotypes. See \code{details}. Whether or not this argument
  is supplied, the fitted coefficients are also returned by the function.
}
  \item{verbose}{
    Logical: If \code{TRUE}, additional information is printed to the R
  outupt as the code runs. Defaults to \code{FALSE}.
}
}
\details{
  The file in \code{genofilename} must be formatted as a header row
  consisting of SNP names followed by SNP genotypes one row per
  individual. SNPs must be coded as 0, 1, 2 for minor allele
  count. Missing values are not accommodated. 
  The file in \code{betafilename} must be formatted as two columns. The
  first column should contain the names of the predictors as a single
  column. If an intercept coefficient is provided this should have the
  name \code{Intercept} and be the first row. The rest of the first column
  should contain the same names as the SNPs in the first row of
  \code{genofilename}, in the same order. The second column should be
  the corresponding coefficients. The format of \code{betafilename} is
  that of the output of \code{\link{linearRidgeGenotypes}}, meaning
  \code{linearRidgeGenotypesPredict} can be used to predict using
  coefficients fitted using \code{\link{linearRidgeGenotypes}} (see the example).
}
\value{
  A vector of fitted values, the same length as the number of
  individuals whose data are in \code{genotypesfilename}. If
  \code{phenotypesfilename} is supplied, the fitted values are also
  written there.
}
\references{
A semi-automatic method to guide the choice of ridge parameter in ridge regression. Cule, E. and De Iorio, M. (2012) arXiv:1205.0686v1 [stat.AP] 
}
\author{
  Erika Cule
}
\seealso{
\code{\link{linearRidgeGenotypes}} for model
  fitting. \code{\link{logisticRidgeGenotypes}} and
  \code{\link{logisticRidgeGenotypesPredict}} for corresponding functions
  to fit and predict on SNP data with binary outcomes.
}
\examples{
\dontrun{
genotypesfile <- paste0(path.package("ridge"), "/data/GenCont_genotypes.txt")
phenotypesfile <- paste0(path.package("ridge"), "/data/GenCont_phenotypes.txt")
betafile <- tempfile(pattern = "beta", fileext = ".dat")
beta_linearRidgeGenotypes <- linearRidgeGenotypes(genotypesfilename = genotypesfile,
                                                      phenotypesfilename = phenotypesfile,
                                                      betafilename = betafile)
pred_phen_geno <- linearRidgeGenotypesPredict(genotypesfilename = genotypesfile,
                                                    betafilename = betafile)
## compare to output of linearRidge
data(GenCont) ## Same data as in GenCont_genotypes.txt and GenCont_phenotypes.txt
beta_linearRidge <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
pred_phen <- predict(beta_linearRidge)
print(cbind(pred_phen_geno, pred_phen))
## Delete the temporary betafile
unlink(betafile)
}
}
