#classification
rainfall <-c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071) 
rainfall.timeseries <- ts(rainfall,start = c(2012,1),frequency = 12) 
print(rainfall.timeseries) 
png(file = "rainfall.png") 
plot(rainfall.timeseries) 
dev.off()

#clustering
library(party) 
print(head(readingSkills)) 
input.dat <- readingSkills[c(1:105),] 
png(file = "decision_tree.png") 
output.tree <- ctree(nativeSpeaker ~ age + shoeSize + score,data = input.dat) 
plot(output.tree) 
dev.off()

#linear
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48) 
relation <- lm(y ~ x) 
print(summary(relation)) 
a <- data.frame(x = 170) 
result <- predict(relation, a) 
print(result) 
png(file = "linearregression.png") 
plot(x, y, col = "blue", main = "Height & Weight Regression", 
     xlab = "Height in cm", ylab = "Weight in Kg", pch = 16) 
abline(relation, col = "red") 
dev.off()

#logistic

library(dplyr) 
library(titanic) 
library(pROC) 

data("titanic_train") 

head(titanic_train) 

titanic_clean <- titanic_train %>% 
  filter(!is.na(Age), !is.na(Embarked), !is.na(Sex), !is.na(Pclass)) 

titanic_clean$Survived <- as.factor(titanic_clean$Survived) 
titanic_clean$Pclass <- as.factor(titanic_clean$Pclass) 
titanic_clean$Sex <- as.factor(titanic_clean$Sex) 
titanic_clean$Embarked <- as.factor(titanic_clean$Embarked) 

model <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,  
             data = titanic_clean, family = binomial) 

summary(model) 


predictions <- predict(model, type = "response") 

predictions_class <- ifelse(predictions > 0.5, 1, 0) 

confusion_matrix <- table(Predicted = predictions_class, Actual = 
                            titanic_clean$Survived) 
print(confusion_matrix) 

accuracy <- mean(predictions_class == as.numeric(titanic_clean$Survived) - 1) 
print(paste("Accuracy:", accuracy)) 

roc_curve <- roc(as.numeric(titanic_clean$Survived) - 1, predictions) 
plot(roc_curve, main = "ROC Curve")
