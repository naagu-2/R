library(class)
library(caret)
library(gmodels)
data(iris)
head(iris)
normalize &lt;- function(x) {
return((x - min(x)) / (max(x) - min(x)))
}
iris_norm &lt;- as.data.frame(lapply(iris[1:4], normalize))

iris_norm$Species &lt;- iris$Species
set.seed(123)
index &lt;- sample(1:nrow(iris_norm), size = 0.8 * nrow(iris_norm))
train_data &lt;- iris_norm[index, 1:4]
test_data &lt;- iris_norm[-index, 1:4]
train_labels &lt;- iris_norm[index, 5]
test_labels &lt;- iris_norm[-index, 5]

k &lt;- 3 # Choose value of k
knn_pred &lt;- knn(train = train_data, test = test_data, cl = train_labels, k = k)

confusionMatrix(knn_pred, test_labels)

CrossTable(x = test_labels, y = knn_pred, prop.chisq = FALSE)