library(ggplot2)
library(dplyr)
library(ISLR)
library(MASS)
library(glmnet)
library(randomForest)
library(gbm)
library(rpart)
library(boot)

wine_names <- read.csv("wine.names", header = FALSE)
wine <- read.csv("wine.data", header = FALSE)
names(wine) <- c('alcohol', 'malic_acid', 'ash', 'alcalinity_of_ash',
                 'magnesium', 'total_phenols', 'flavanoids',
                 'nonflavanoid_phenols', 'proanthocyanins',
                 'color_intensity', 'hue', 'od280/od315_of_diluted_wines',
                 'proline', 'number')

iris <- read.csv("iris", header = FALSE)
glimpse(iris)
names(iris) <- c('sepal_length', 'sepla_width', 'petal_length', 'petal_width')
# this is not your position. I want to be a great person. longlong exist, stongly exist person.

# 7.2 analysis for every data
glimpse(wine)
summary(wine)
plot(wine)
pairs(wine)
head(wine)
dplyr::glimpse(iris)
plot(iris)
tbl_df(wine)

#seperate data into three 
set.seed(1710)
n_wine <- nrow(wine)
idx_wine <- 1:n_wine
training_idx_wine <- sample(idx_wine, n_wine * .60)
idx_wine <- setdiff(idx_wine, training_idx_wine)
validate_idx_wine <- sample(idx_wine, n_wine * .20)
test_idx_wine <- setdiff(idx_wine, validate_idx_wine)
length(test_idx_wine)
training_wine <- wine[training_idx_wine, ]
validate_wine <- wine[validate_idx_wine, ]
test_wine <- wine[test_idx_wine, ]

training_wine %>%
  ggplot(aes(magnesium, fill = total_phenols))
