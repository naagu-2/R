data<-data.frame(id=1:5,age=c(25,NA,30,22,NA),income=c(50000,60000,NA,55000,65000))
print("Original data\n")
print(data)
cleaned_data<-na.omit(data)
print("data after removing rows with missing values")
print(cleaned_data)
data$age[is.na(data$age)]<-mean(data$age,na.rm=TRUE)
data$income[is.na(data$income)]<-mean(data$income,na.rm=TRUE)
print("data after mean imputation")
print(data)
min_max_normalize<-function(x)
{
return((x-min(x))/(max(x)-min(x)))
}
data$age<-min_max_normalize(data$income)
print("normalized data")
print(data)

