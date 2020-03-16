library("ridge")

tol <- 0.0001

context("Basic tests")
test_that("test linearRidge agrees with lm when lambda = 0", {
  model1 <- lm(mpg ~ wt + cyl, data = mtcars)
  model2 <- linearRidge(mpg ~ wt + cyl, data = mtcars, lambda = 0)
  
  expect_equal(coef(model1), coef(model2),
               tolerance = tol, label = "wt")
})
test_that("test linearRidge near lm when lambda = 0.01", {
  model1 <- lm(mpg ~ wt + cyl, data = mtcars)
  model2 <- linearRidge(mpg ~ wt + cyl, data = mtcars, lambda = 0.01)
  
  # at least one coefficient is greater than 0.01 different:
  expect(any(abs(coef(model1) - coef(model2)) > 0.01),
         "coefficients agree too strongly")
  # all coefficients are less than 0.11 different:
  expect(all(abs(coef(model1) - coef(model2)) < 0.11),
         "coefficients too different")
})
