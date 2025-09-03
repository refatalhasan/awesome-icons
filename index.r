library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)
library(caret)

Shape <- setRefClass(
  "Shape",
  fields = list(),
  methods = list(
    area = function() {
      return(0)
    }
  )
)

Circle <- setRefClass(
  "Circle",
  fields = list(radius = "numeric"),
  methods = list(
    area = function() {
      return(pi * radius^2)
    }
  ),
  contains = "Shape"
)

Rectangle <- setRefClass(
  "Rectangle",
  fields = list(width = "numeric", height = "numeric"),
  methods = list(
    area = function() {
      return(width * height)
    }
  ),
  contains = "Shape"
)

generateRandomNumbers <- function(count, max = 100) {
  return(sample(1:max, count, replace = TRUE))
}

quickSort <- function(arr) {
  if (length(arr) <= 1) return(arr)
  
  pivot <- arr[length(arr) %/% 2]
  left <- arr[arr < pivot]
  middle <- arr[arr == pivot]
  right <- arr[arr > pivot]
  
  return(c(quickSort(left), middle, quickSort(right)))
}

set.seed(123)
df <- data.frame(
  date = seq(as.Date("2023-01-01"), by = "day", length.out = 100),
  value = rnorm(100, mean = 50, sd = 10),
  category = sample(LETTERS[1:5], 100, replace = TRUE)
)

summarizeData <- function(data) {
  return(data %>%
    group_by(category) %>%
    summarize(
      count = n(),
      mean_value = mean(value),
      sd_value = sd(value)
    ))
}

plotTimeSeries <- function(data) {
  ggplot(data, aes(x = date, y = value, color = category)) +
    geom_line() +
    theme_minimal() +
    labs(title = "Time Series Plot",
         x = "Date",
         y = "Value",
         color = "Category")
}

plotBoxplot <- function(data) {
  ggplot(data, aes(x = category, y = value, fill = category)) +
    geom_boxplot() +
    theme_minimal() +
    labs(title = "Value Distribution by Category",
         x = "Category",
         y = "Value")
}

plotHistogram <- function(data) {
  ggplot(data, aes(x = value, fill = category)) +
    geom_histogram(alpha = 0.5, position = "identity") +
    theme_minimal() +
    labs(title = "Value Distribution",
         x = "Value",
         y = "Count")
}

calculateCorrelation <- function(x, y) {
  return(cor(x, y, use = "complete.obs"))
}

performLinearRegression <- function(data, x_var, y_var) {
  formula <- as.formula(paste(y_var, "~", x_var))
  model <- lm(formula, data = data)
  return(list(
    coefficients = coef(model),
    r_squared = summary(model)$r.squared,
    p_value = summary(model)$coefficients[,4][2]
  ))
}

main <- function() {
  print("R Data Analysis Demo Started")
  
  circle <- Circle$new(radius = 5)
  rectangle <- Rectangle$new(width = 4, height = 6)
  
  print(paste("Circle area:", circle$area()))
  print(paste("Rectangle area:", rectangle$area()))
  
  numbers <- generateRandomNumbers(10)
  print(paste("Random numbers:", paste(numbers, collapse = ", ")))
  
  sorted_numbers <- quickSort(numbers)
  print(paste("Sorted numbers:", paste(sorted_numbers, collapse = ", ")))
  
  print("Data Summary:")
  print(summarizeData(df))
  
  pdf("plots.pdf")
  print(plotTimeSeries(df))
  print(plotBoxplot(df))
  print(plotHistogram(df))
  dev.off()
  
  model_results <- performLinearRegression(df, "date", "value")
  print("Linear Regression Results:")
  print(model_results)
  
  tryCatch({
    stop("This is a test error")
  }, error = function(e) {
    print(paste("Caught error:", e$message))
  }, finally = {
    print("Finally block executed")
  })
  
  print("Demo completed successfully!")
}

main()