data <- c(10, 12, 14, 13, 12, 13, 15, 14, 100, 12, 13)

cat("Original data:\n")
print(data)

# Correct function name: 'quantile', not 'quqntile'
Q1 <- quantile(data, 0.25)
Q3 <- quantile(data, 0.75)

# IQR calculation
IQR_value <- Q3 - Q1

# Lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# Correct logical condition and object names
Outliers <- data[data < lower_bound | data > upper_bound]
cat("\nDetected Outliers:\n")
print(Outliers)

# Filter data to remove outliers
cleaned_data <- data[data >= lower_bound & data <= upper_bound]
cat("\nData after removing outliers:\n")
print(cleaned_data)