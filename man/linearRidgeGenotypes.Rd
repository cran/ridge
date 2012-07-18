\name{linearRidgeGenotypes}
\alias{linearRidgeGenotypes}

\title{
  Fits linear ridge regression models for genome-wide SNP data.
}
\description{
Fits linear ridge regression models for genome-wide SNP data. The SNP
  genotypes are not read into R but file names are passed the code
  directly, enabling the analysis of genome-wide scale SNP data sets.
}
\usage{
linearRidgeGenotypes(genotypesfilename, phenotypesfilename, lambda = -1, 
thinfilename = NULL, betafilename = NULL, approxfilename = NULL,
permfilename = NULL, intercept =
TRUE, verbose = FALSE)
}

\arguments{
  \item{genotypesfilename}{
    character string: path to file containing SNP genotypes coded 0, 1,
  2. (see \code{details})
  }
  \item{phenotypesfilename}{
    character string: path to file containing phenotypes.
  }
  \item{lambda}{
    (optional) shrinkage parameter. If not provided, the default denotes
  automatic choice of the shrinkage parameter using the method of Cule &
  De Iorio (2012). 
}
  \item{thinfilename}{
(optional) character string: path to file containing three columns: SNP name, chromosme and SNP psotion.
}
  \item{betafilename}{
(optional) character string: path to file where the output will be written.
}
\item{approxfilename}{
(optional) character string: path to fine where the approximate test p-values will be written. 
Approximate p-values are not computed unless this argument is given.
}
\item{permfilename}{
  (optional) character string: path to file where the permutation test
  p-values will be written.
  Permutation test p-values are not computed unless this argument is
  given. (See warning)
}
\item{intercept}{
  Logical: Should the ridge regression model be fitted with an
  intercept? (Defaults to \code{TRUE})
}
\item{verbose}{
  Logical: If \code{TRUE}, additional information is printed to the R
  output as the code runs. Defaults to \code{FALSE}.
}
}

\details{
  The file in \code{genofilename} must be formatted as a header row
  consisting of SNP names followed by SNP genotypes one row per
  individual. SNPs must be coded as 0, 1, 2 for minor allele
  count. Missing values are not accommodated. Invariant SNPs in the data cause an
  error, please remove these from the file before calling the function.
  The file in \code{phenofilename} must be formatted as a single column of
  phenotypes with the individuals in the same order as those in the file
  in \code{genofilename}
  If a file \code{thin} is supplied, and the shrinkage parameter
  \code{lambda} is being computed automatically based on the data, then
  this file is used to thin the SNP data by SNP position. If this file
  is not supplied, SNPs are thinned by number of SNPs.
    If the file \code{approxfilename} is supplied, approximate p-values
  are computed using the method of Cule et al (2011).

}

\value{
  The vector of fitted ridge regression coefficients.
  If \code{betafilename} is given, the fitted coefficients are written to this
  file as well as being returned.
  If \code{approxfilename} and/or \code{permfilename} are given, results of approximate
  test p-values and/or permutation test p-values are written to the files
  given in their arguments.
}

\section{Warning }{
  When data are large, the permutation test p-values
  may take a very long time to compute. It is recommended not to request
  permutation test p-values (using the argument \code{permfilename})
  when data are large.}

\references{
  Significance testing in ridge regression for genetic data. Cule, E. et
  al (2011) BMC Bioinformatics, 12:372
  A semi-automatic method to guide the choice of ridge parameter in
  ridge regression. Cule, E. and De Iorio, M. (2012) arXiv:1205.0686v1 [stat.AP]
}

\author{
  Erika Cule
}

\seealso{
  \code{\link{linearRidge}} for fitting linear ridge regression models
  when the data are small enough to be read into R.
  \code{\link{logisticRidge}} and \code{\link{logisticRidgeGenotypes}} for fitting logistic ridge
  regression models.
}

\examples{
\dontrun{
    genotypesfile <- paste0(path.package("ridge"), "/data/GenCont_genotypes.txt")
    phenotypesfile <- paste0(path.package("ridge"), "/data/GenCont_phenotypes.txt")
    beta_linearRidgeGenotypes <- linearRidgeGenotypes(genotypesfilename = genotypesfile, phenotypesfilename = phenotypesfile)
    ## compare to output of linearRidge
    data(GenCont) ## Same data as in GenCont_genotypes.txt and GenCont_phenotypes.txt
    beta_linearRidge <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
    cbind(round(coef(beta_linearRidge), 6), beta_linearRidgeGenotypes)
}
  }
