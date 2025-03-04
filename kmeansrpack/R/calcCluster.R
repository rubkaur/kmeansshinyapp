#' Calculating K-Means Clusters
#'
#' @param data A dataframe with numbers.
#' @param clusters The number of clusters.
#'
#' @return A calculation of clusters.
#' @export
calcCluster <- function(data, clusters) {
  if (!is.data.frame(data)) stop("Data must be a dataframe")
  if (!is.numeric(clusters) || clusters < 1) stop("Clusters must be a positive number")
  
  kmeans(data, clusters)
}

#' Plot K-Means Clustering Results
#'
#' @param data A dataframe with numbers.
#' @param clusters A k-means clustering object.
#'
#' @return A scatter plot with clusters.
#' @export
plotClusters <- function(data, clusters) {
  if (!is.data.frame(data)) stop("Data must be a dataframe")
  
  palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
            "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
  
  par(mar = c(5.1, 4.1, 0, 1))
  plot(data, col = clusters$cluster, pch = 20, cex = 3)
  points(clusters$centers, pch = 4, cex = 4, lwd = 4)
}