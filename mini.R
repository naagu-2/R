# Load libraries
library(nycflights13)
library(dplyr)
library(rpart)
library(rpart.plot)
library(caret)

# Step 1: Load and preprocess the data
data <- flights

# Create a binary target variable: Delayed (TRUE if arrival delay > 15 minutes)
data <- data %>%
  filter(!is.na(arr_delay), !is.na(dep_delay), !is.na(air_time)) %>%
  mutate(Delayed = ifelse(arr_delay > 15, "Yes", "No")) %>%
  select(Delayed, month, day, dep_time, dep_delay, air_time, distance, carrier, origin, dest)

# Convert to factors where needed
data$Delayed <- as.factor(data$Delayed)
data$carrier <- as.factor(data$carrier)
data$origin <- as.factor(data$origin)
data$dest <- as.factor(data$dest)

# Step 2: Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$Delayed, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Step 3: Build decision tree model
tree_model <- rpart(Delayed ~ ., data = trainData, method = "class", cp = 0.01)

# Step 4: Plot the decision tree
rpart.plot(tree_model, extra = 104, main = "Decision Tree for Flight Delays")

# Step 5: Make predictions
predictions <- predict(tree_model, testData, type = "class")

# Step 6: Evaluate model performance
conf_matrix <- confusionMatrix(predictions, testData$Delayed)
print(conf_matrix)
