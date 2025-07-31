library(arules)
library(arulesViz)

# Step 2: Load dataset
# Use built-in dataset or load from CSV
data("Groceries") # sample transactional dataset from arules package

# Step 3: Explore the dataset
summary(Groceries)
inspect(Groceries[1:5])

# Step 4: Apply Apriori Algorithm
rules <- apriori(Groceries,
                 parameter = list(supp = 0.01, conf = 0.5, target = "rules"))

# Step 5: View the rules
inspect(rules[1:10])

# Step 6: Sort rules by lift and inspect top rules
rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)
inspect(rules_sorted[1:10])

# Step 7: Visualize the rules
plot(rules_sorted[1:10], method = "graph", engine = "htmlwidget")
plot(rules_sorted[1:10], method = "grouped")
