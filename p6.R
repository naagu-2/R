library(ggplot2)
data(iris)
head(iris)
iris_data<-iris[,1:4]
iris_scaled<-scale(iris_data)
pca_result<-prcomp(iris_scaled,centre=TRUE,scale=TRUE)
summary(pca_result)
print(pca_result$rotation)
plot(pca_result,type="l",main="Scree Plot")
biplot(pca_result,scale=0)
pca_scores<-as.data.frame(pca_result$x)
pca_scores$Species<-iris$Species
ggplot(pca_scores,aes(x=PC1,y=PC2,color=Species))+geom_point(size=3)+ggtitle("PCA:Iris Dataset")+theme_minimal()