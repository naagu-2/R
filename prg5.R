library(ggplot2)
data<-rnorm(1000,mean=50,sd=10)
head(data)
hist(data,main="Histogram of normally distributed data",xlab="values",col="lightblue",border="black")
plot(density(data),main="density plot of data",xlab="values",col="blue")
df<-data.frame(values=data)
ggplot(df,aes(x=values))+geom_histogram(aes(y=..density..),bins=30,fill="skyblue",color="black")+geom_density(color="red",size=1.2)+labs(title="histogram with density curves",x="values",y="density")

