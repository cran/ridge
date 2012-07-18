AC_INIT([src/Makevars.in])

## Set the variable HAVE_GSL
AC_CHECK_LIB(gsl, gsl_matrix_alloc,
            [HAVE_GSL=TRUE], 
            [HAVE_GSL=FALSE])
## Set the header variable HAVE_GSL_HEADER
AC_CHECK_LIB(gsl, gsl_matrix_alloc,
            [AC_CONFIG_HEADERS(src/config.h:src/config.h.in,	
       	    [AC_DEFINE([HAVE_GSL_HEADER], [1])])], 
            [HAVE_GSL=FALSE])
## AC_CHECK_HEADER([gsl/gsl_version.h], ,
#             [AC_MSG_ERROR([Cannot find GSL headers.])])
## AC_CONFIG_HEADERS(src/config.h:src/config.h.in)

## Following lines kindly supplied by Dirk Eddelbuettel
## (Taken from R package gsl)
## Use gsl-config to find arguments for compiler and linker flags
##
## Check for non-standard programs: gsl-config(1)
AC_PATH_PROG([GSL_CONFIG], [gsl-config])
## If gsl-config was found, let's use it
if test "${GSL_CONFIG}" != ""; then
   # Use gsl-config for header and linker arguments
   GSL_CFLAGS=`${GSL_CONFIG} --cflags`
   GSL_LIBS=`${GSL_CONFIG} --libs`
## else	
##     AC_MSG_ERROR([gsl-config not found, is GSL installed?])
fi

AC_MSG_CHECKING([if GSL version >= 1.14])
AC_RUN_IFELSE([AC_LANG_SOURCE([[
#include <string.h>
#include <gsl/gsl_version.h>
int main() {
#ifdef GSL_VERSION
   int major, minor;
   char *gslv = GSL_VERSION;
   if ((sscanf(gslv, "%d.%d", &major, &minor)) != 2) {
     exit (1);
   }
   exit (minor < 14);
#else
  exit(1);
#endif
}
]])],
[HAVE_GSL=TRUE],
[HAVE_GSL=FALSE],
[HAVE_GSL=TRUE])
dnl if test "${gsl_version_ok}" = no; then
dnl 	HAVE_GSL=FALSE
dnl else
dnl   AC_MSG_RESULT([yes])
dnl fi

## Substitute HAVE_GSL in the functions R/l*Genotypes*.R.in 
AC_SUBST(HAVE_GSL)
AC_CONFIG_FILES([R/l*Genotypes*.R])
AC_OUTPUT

dnl Check whether libopenblas is available
AC_CHECK_LIB(openblas, 
	gettimeofday, 
	HAVE_OPENBLAS=TRUE,
	HAVE_OPENBLAS=FALSE)

if test "${HAVE_OPENBLAS}" = TRUE; then
   GSL_CBLAS_LIB=-lopenblas
   GSL_CFLAGS=`${GSL_CONFIG} --cflags`
   GSL_LIBS="`${GSL_CONFIG} --libs-without-cblas` -lopenblas"
fi

# Now substitute these variables in src/Makevars.in to create src/Makevars

if test "${HAVE_GSL}" = TRUE; then
      AC_SUBST(GSL_CFLAGS) 
      AC_SUBST(GSL_LIBS)
      AC_OUTPUT(src/Makevars)
fi
	
