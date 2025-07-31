
library(ggplot2)


data(iris)


iris_scaled <- scale(iris[, 1:4])


set.seed(123)


kmeans_result <- kmeans(iris_scaled, centers = 3, nstart = 25)
print(kmeans_result)


iris$cluster <- as.factor(kmeans_result$cluster)


pca_result <- prcomp(iris_scaled)


pca_data <- data.frame(
  pc1 = pca_result$x[, 1],
  pc2 = pca_result$x[, 2],
  cluster = iris$cluster,
  species = iris$Species
)


ggplot(pca_data, aes(x = pc1, y = pc2, color = cluster, shape = species)) +
  geom_point(size = 3) +
  labs(
    title = "K-Means Clustering on Iris Dataset (Visualized with PCA)",
    x = "Principal Component 1",
    y = "Principal Component 2"
  ) +
  theme_minimal()
 