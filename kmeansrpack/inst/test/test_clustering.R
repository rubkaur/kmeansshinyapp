library(testthat)
library(kmeansrpack)

test_that("calcCluster works correctly", {
  data <- iris[, 1:3]
  clusters <- calcCluster(data, 4)
  
  expect_s3_class(clusters, "kmeans")
  expect_equal(length(unique(clusters$cluster)), 4)
})

test_that("plotClusters doesn't return errors", {
  data <- iris[, 1:3]
  clusters <- calcCluster(data, 4)
  
  expect_silent(plotClusters(data, clusters))
})
