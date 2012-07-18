/* computeLinearRidge.h is the header file for the source file computeLinearRidge.c */

/* This file defines the function computeLinearRidge, computeLinearGeneralizedRidge, computeLinGenExpRidge */

/* includes */
#include <gsl/gsl_blas.h>
#include <gsl/gsl_cdf.h>
#include <gsl/gsl_eigen.h>
#include <gsl/gsl_linalg.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_randist.h>
#include <gsl/gsl_permutation.h>
#include <gsl/gsl_statistics_double.h>
#include <gsl/gsl_vector.h>

#include <math.h>
#include <stdio.h>

/* SVD of any matrix */
int svdAnyMat(gsl_matrix * X, 
		 gsl_matrix * U, 
		 gsl_matrix * V, 
		 gsl_vector * D);

/* Prepare the lambdas */
int prepareLambdas(gsl_vector * y, 
		   gsl_matrix * U, 
		   gsl_vector * D2, 
		   gsl_vector * lambdaVeckHKB, 
		   char * skhkbfilename, 
		   char * sklwfilename, 
		   gsl_vector * lambdaVeckLW, 
		   int randomized, 
		   int s);

/* compute pvals linear ridge regression */
void computeLinearPvalsApprox(gsl_matrix * X, 
			      gsl_vector * B, 
			      gsl_vector * y, 
			      double lambda, 
			      char * pvalsfilename);

/* compute pvals linear ridge regression - Malo's method */
void computeLinearPvaslMalo(gsl_matrix * X, 
			    gsl_vector * B, 
			    gsl_vector * y, 
			    double lambda, 
			    char * pvalsfilename);

/* compute pvals linear ridge regression - our method */
void computeLinearPvalsOurs(gsl_matrix * X, 
			    gsl_vector * B, 
			    gsl_vector * y, 
			    double lambda, 
			    char * pvalsfilename);

