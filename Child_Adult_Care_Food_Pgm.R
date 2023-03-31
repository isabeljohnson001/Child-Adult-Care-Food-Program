#install and load needed packages
install.packages('arules')
install.packages('arulesViz')

#Loading libraries
library(ggplot2)
library(dplyr)
library(janitor)
library(tidyr)
library(RColorBrewer)
library(car)
library(psych)
library(imputeTS)
library(corrplot)
library(MASS)
library(leaps)
library(readr)
library(plotly)
library(kableExtra)
library(plotly)
library(rjson)
knitr::opts_chunk$set(echo = TRUE)
library("knitr")
library(rpart,quietly = TRUE)
library(caret,quietly = TRUE)
library(rpart.plot,quietly = TRUE)
library(rattle)
library(readxl)

library(corrplot)
library(arules)
library(arulesViz)
library(igraph)
library(cluster)
library(ggplot2)



#Reading the data from excel
Child_and_Adult_Care_Food_Programs<- read_csv("Child_and_Adult_Care_Food_Programs__CACFP____Adult_Day_Care___Meal_Reimbursement___Program_Year_2022_-_2023.csv")
df=Child_and_Adult_Care_Food_Programs


# Data Cleaning

## Handling NA's
# Count of records
nrow(df)

# Columns in Raw Data
names(df)

# Structure of Dataset
str(df)
summary(df)

#Data cleaning
# Converting empty values in character columns to NA
df$	RedcEligQty	[is.na(df$	RedcEligQty	)]  <- 0
df$	PaidEligQty	[is.na(df$	PaidEligQty	)]  <- 0
df$	BreakfastDays	[is.na(df$	BreakfastDays	)]  <- 0
df$	BreakfastTotal	[is.na(df$	BreakfastTotal	)]  <- 0
df$	BreakfastADP	[is.na(df$	BreakfastADP	)]  <- 0
df$	BreakfastServedFree	[is.na(df$	BreakfastServedFree	)]  <- 0
df$	BreakfastServedRedc	[is.na(df$	BreakfastServedRedc	)]  <- 0
df$	BreakfastServedPaid	[is.na(df$	BreakfastServedPaid	)]  <- 0
df$	AMSnackDays	[is.na(df$	AMSnackDays	)]  <- 0
df$	AMSnackTotal	[is.na(df$	AMSnackTotal	)]  <- 0
df$	AMSnackADP	[is.na(df$	AMSnackADP	)]  <- 0
df$	AMSnackServedFree	[is.na(df$	AMSnackServedFree	)]  <- 0
df$	AMSnackServedRedc	[is.na(df$	AMSnackServedRedc	)]  <- 0
df$	AMSnackServedPaid	[is.na(df$	AMSnackServedPaid	)]  <- 0
df$	LunchDays	[is.na(df$	LunchDays	)]  <- 0
df$	LunchTotal	[is.na(df$	LunchTotal	)]  <- 0
df$	LunchADP	[is.na(df$	LunchADP	)]  <- 0
df$	LunchServedFree	[is.na(df$	LunchServedFree	)]  <- 0
df$	LunchServedRedc	[is.na(df$	LunchServedRedc	)]  <- 0
df$	LunchServedPaid	[is.na(df$	LunchServedPaid	)]  <- 0
df$	PMSnackDays	[is.na(df$	PMSnackDays	)]  <- 0
df$	PMSnackTotal	[is.na(df$	PMSnackTotal	)]  <- 0
df$	PMSnackADP	[is.na(df$	PMSnackADP	)]  <- 0
df$	PMSnackServedFree	[is.na(df$	PMSnackServedFree	)]  <- 0
df$	PMSnackServedRedc	[is.na(df$	PMSnackServedRedc	)]  <- 0
df$	PMSnackServedPaid	[is.na(df$	PMSnackServedPaid	)]  <- 0
df$	SupperDays	[is.na(df$	SupperDays	)]  <- 0
df$	SupperTotal	[is.na(df$	SupperTotal	)]  <- 0
df$	SupperADP	[is.na(df$	SupperADP	)]  <- 0
df$	SupperServedFree	[is.na(df$	SupperServedFree	)]  <- 0
df$	SupperServedRedc	[is.na(df$	SupperServedRedc	)]  <- 0
df$	SupperServedPaid	[is.na(df$	SupperServedPaid	)]  <- 0
df$	NTSnackDays	[is.na(df$	NTSnackDays	)]  <- 0
df$	NTSnackTotal	[is.na(df$	NTSnackTotal	)]  <- 0
df$	NTSnackADP	[is.na(df$	NTSnackADP	)]  <- 0
df$	NTSnackServedFree	[is.na(df$	NTSnackServedFree	)]  <- 0
df$	NTSnackServedRedc	[is.na(df$	NTSnackServedRedc	)]  <- 0
df$	NTSnackServedPaid	[is.na(df$	NTSnackServedPaid	)]  <- 0
df$	TotalSnacks	[is.na(df$	TotalSnacks	)]  <- 0
df$	TotalMeals_Snacks	[is.na(df$	TotalMeals_Snacks	)]  <- 0
df$	BreakfastReimbursement	[is.na(df$	BreakfastReimbursement	)]  <- 0
df$	AMSnackReimbursement	[is.na(df$	AMSnackReimbursement	)]  <- 0
df$	LunchReimbursement	[is.na(df$	LunchReimbursement	)]  <- 0
df$	PMSnackReimbursement	[is.na(df$	PMSnackReimbursement	)]  <- 0
df$	SupperReimbursement	[is.na(df$	SupperReimbursement	)]  <- 0
df$	NTSnackReimbursement	[is.na(df$	NTSnackReimbursement	)]  <- 0
df$	TotalReimbursement	[is.na(df$	TotalReimbursement	)]  <- 0
df$CountyDistrictCode <-gsub("-", "", df$CountyDistrictCode)
df$CountyDistrictCode <- as.numeric(df$CountyDistrictCode)

# Check for NA's in entire dataset columnwise
na_count <- colSums(is.na(df))
na_count


#dataset is clean now

## Data visualisations
#What is the average daily attendance for each type of meal (breakfast, AM snack, lunch, PM snack, supper, and evening snack) across all sites? 
# Calculate ADP for each meal type
adp_breakfast <- mean(df$BreakfastADP)
adp_am_snack<-mean(df$AMSnackADP)
adp_nt_snack<-mean(df$NTSnackADP)
adp_lunch<-mean(df$LunchADP)
adp_pm_snack<-mean(df$PMSnackADP)
adp_supper<-mean(df$SupperADP)

# Print results
# Calculate the average daily attendance (ADP) for each meals offered
cat("ADP for Breakfast:", adp_breakfast, "\n")
cat("ADP for AM Snack:", adp_am_snack, "\n")
cat("ADP for NT Snack:", adp_nt_snack, "\n")
cat("ADP for Lunch:", adp_lunch, "\n")
cat("ADP for PM Snack:", adp_pm_snack, "\n")
cat("ADP for Supper:", adp_supper, "\n")

adp <- data.frame(
  Meal = c("Breakfast", "AM Snack", "NT Snack", "Lunch", "PM Snack", "Supper"),
  ADP = c(adp_breakfast, adp_am_snack, adp_nt_snack, adp_lunch, adp_pm_snack, adp_supper)
)
print(adp)

# Calculate the average daily attendance (ADP) for breakfast by site country
breakfast_adp_by_country <- aggregate(df$BreakfastADP, by=list(df$SiteCounty), FUN=mean)

# Rename the columns for clarity
colnames(breakfast_adp_by_country) <- c("Site Country", "Average ADP for Breakfast")

# Sort the data frame by the average ADP for breakfast in descending order
breakfast_adp_by_country <- breakfast_adp_by_country[order(-breakfast_adp_by_country$`Average ADP for Breakfast`),]

# Show the top 5 site country with highest average ADP for breakfast
top_5_sites=head(breakfast_adp_by_country, 5)
lowest_5_sites=tail(breakfast_adp_by_country,5)

# Create a Plotly bar graph
plot_ly(top_5_sites, x = ~top_5_sites$`Site Country`, y = ~top_5_sites$`Average ADP for Breakfast`, type = "bar",color = ~top_5_sites$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Highest Average ADP for Breakfast",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 

# Create a Plotly bar graph
plot_ly(lowest_5_sites, x = ~lowest_5_sites$`Site Country`, y = ~lowest_5_sites$`Average ADP for Breakfast`, type = "bar",color = ~lowest_5_sites$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Lowest Average ADP for Breakfast",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 


# Calculate the average daily attendance (ADP) for lunch by site country
lunch_adp_by_country <- aggregate(df$LunchADP, by=list(df$SiteCounty), FUN=mean)

# Rename the columns for clarity
colnames(lunch_adp_by_country) <- c("Site Country", "Average ADP for Lunch")

# Sort the data frame by the average ADP for lunch in descending order
lunch_adp_by_country <- lunch_adp_by_country[order(-lunch_adp_by_country$`Average ADP for Lunch`),]

# Show the top 5 site country with highest average ADP for Lunch
top_5_sites_lunch=head(lunch_adp_by_country, 5)
lowest_5_sites_lunch=tail(lunch_adp_by_country,5)
# Create a Plotly bar graph
plot_ly(top_5_sites_lunch, x = ~top_5_sites_lunch$`Site Country`, y = ~top_5_sites_lunch$`Average ADP for Lunch`, type = "bar",color = ~top_5_sites_lunch$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Highest Average ADP for Lunch",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 


# Create a Plotly bar graph
plot_ly(lowest_5_sites_lunch, x = ~lowest_5_sites_lunch$`Site Country`, y = ~lowest_5_sites_lunch$`Average ADP for Lunch`, type = "bar",color = ~lowest_5_sites_lunch$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Lowest Average ADP for Lunch",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 


# Calculate the average daily attendance (ADP) for PM Snack by site country
PM_Snack_adp_by_country <- aggregate(df$PMSnackADP, by=list(df$SiteCounty), FUN=mean)

# Rename the columns for clarity
colnames(PM_Snack_adp_by_country) <- c("Site Country", "Average ADP for PM Snack")

# Sort the data frame by the average ADP for PM_Snack in descending order
PM_Snack_adp_by_country <- PM_Snack_adp_by_country[order(-PM_Snack_adp_by_country$`Average ADP for PM Snack`),]

# Show the top 5 site country with highest average ADP for PM_Snack
top_5_sites_PM_Snack=head(PM_Snack_adp_by_country, 5)
lowest_5_sites_PM_Snack=tail(PM_Snack_adp_by_country,5)


# Create a Plotly bar graph
plot_ly(top_5_sites_PM_Snack, x = ~top_5_sites_PM_Snack$`Site Country`, y = ~top_5_sites_PM_Snack$`Average ADP for PM Snack`, type = "bar",color = ~top_5_sites_PM_Snack$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Highest Average ADP for PM Snack",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 


# Create a Plotly bar graph
plot_ly(lowest_5_sites_PM_Snack, x = ~lowest_5_sites_PM_Snack$`Site Country`, y = ~lowest_5_sites_PM_Snack$`Average ADP for PM Snack`, type = "bar",color = ~lowest_5_sites_PM_Snack$`Site Country`, colors = "Set1") %>%
  layout(title = "Top 5 Sites with Lowest Average ADP for PM Snack",
         xaxis = list(title = "Site Country"),
         yaxis = list(title = "Average Daily Attendance")) 

#Which county or region has the highest participation in the CACFP Adult Day Care Meals program?  =LUBBOCK


#Are there any trends or patterns in the number of meals served or the reimbursement amounts over time? 
# convert date column to Date type
df$date <- as.Date(df$ClaimDate, format = "%m/%d/%Y")
df$month <- format(df$date, "%b-%Y")

# Calculate the total number of meals and reimbursement amounts by month
df_sum <- aggregate(cbind(df$BreakfastTotal,df$LunchTotal,df$PMSnackTotal,df$BreakfastReimbursement,df$LunchReimbursement,df$PMSnackReimbursement) ~ df$month, df, sum)
#Days properly organized, starts from Sunday and ends on Saturday
df_sum$`df$month`<- ordered(df_sum$`df$month`, levels=c("Oct-2022", "Nov-2022", "Dec-2022", "Jan-2023", "Feb-2023"))
colnames(df_sum) <- c("Month", "Breakfast Meals Served", "Lunch Meals Served","PM Snacks Served","Breakfast Reimbursement","Lunch Reimbursement","PM Snack Reimbursement")

# Create plots
# Create the plot using plotly
plot <- plot_ly(df_sum, x = ~df_sum$Month) %>%
  add_lines(y = ~df_sum$`Breakfast Meals Served`, name = "Breakfast Meals") %>%
  add_lines(y = ~df_sum$`Lunch Meals Served`, name = "Lunch Meals") %>%
  add_lines(y = ~df_sum$`PM Snacks Served`, name = "PM Snack Meals") %>%
  layout(title = "Trends in Total Meals Served by Month and Year",
         xaxis = list(title = "Month and Year"),
         yaxis = list(title = "Total Meals"))
plot


plot <- plot_ly(df_sum, x = ~df_sum$Month) %>%
  add_lines(y = ~df_sum$`Breakfast Reimbursement`, name = "Breakfast Reimbursement") %>%
  add_lines(y = ~df_sum$`Lunch Reimbursement`, name = "Lunch Reimbursement") %>%
  add_lines(y = ~df_sum$`PM Snack Reimbursement`, name = "PM Snack Reimbursement") %>%
  layout(title = "Trends in Total Reimbursement Amounts by Month and Year",
         xaxis = list(title = "Month and Year"),
         yaxis = list(title = "Reimbursement Amount"))
plot


# Are there any differences in meal participation rates or reimbursement amounts between private non-profit organizations and for-profit organizations? 

# Subset the data into non-profit and for-profit organizations
non_profit <- filter(df, TypeOfAgency == "Private Non Profit Organization")
for_profit <- filter(df, TypeOfAgency == "For Profit Organization")

# Calculate mean meal participation rates and reimbursement amounts for each group
non_profit_participation <- mean(non_profit$TotalMeals_Snacks)
for_profit_participation <- mean(for_profit$TotalMeals_Snacks)
non_profit_reimbursement <- mean(non_profit$TotalReimbursement)
for_profit_reimbursement <- mean(for_profit$TotalReimbursement)

# Print the results
cat("Non-Profit Mean Meal Participation Rate:", non_profit_participation, "\n")
cat("For-Profit Mean Meal Participation Rate:", for_profit_participation, "\n")
cat("Non-Profit Mean Reimbursement Amount:", non_profit_reimbursement, "\n")
cat("For-Profit Mean Reimbursement Amount:", for_profit_reimbursement, "\n")

# Predictive modeling
# Create a time series object with the Total Reimbursement variable
adult_ts <- ts(df$TotalReimbursement, start = c(2010, 1), frequency = 12)

# Split the data into training and test sets
train_size <- floor(length(adult_ts) * 0.8)
train <- window(adult_ts, end = c(2018, 12))
test <- window(adult_ts, start = c(2019, 1))

# Fit a time series model to the training data
library(forecast)
fit <- auto.arima(train)

# Generate predictions for the test data
predictions <- forecast(fit, h = length(test))

# Visualize the predicted values and compare them to the actual values
par(mfrow=c(1,1))
plot(predictions, main = "Forecasted Total Reimbursement", xlab = "Year", ylab = "Total Reimbursement ($)")
lines(test, col = "blue")
legend("topleft", legend = c("Actual", "Predicted"), col = c("blue", "red"), lty = 1)


#Decision Tree for Total Reimbursement Amount

data=df
new_df <- data[, !names(data) %in% "TotalReimbursement"]
number.perfect.splits <- apply(X=new_df , MARGIN = 2, FUN = function(col){
  t <- table(data$TotalReimbursement,col)
  sum(t == 0)
})


# Descending order of perfect splits
order <- order(number.perfect.splits,decreasing = TRUE)
number.perfect.splits <- number.perfect.splits[order]

# Plot graph
par(mar=c(10,2,2,2))
barplot(number.perfect.splits,
        main="Number of perfect splits vs feature",
        xlab="",ylab="Feature",las=2,col="wheat")

# Set the target variable
target <- "TotalReimbursement"

data=df
numeric_data <- data %>% select_if(is.numeric)
data=numeric_data
#data splicing
set.seed(12345)
# Split the data into training and testing sets
trainIndex <- sample(nrow(data), round(0.7 * nrow(data)))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Fit multiple linear regression model
model1 <- lm(TotalReimbursement ~ ., data = trainData)
summary(model1)



model2<-lm(TotalReimbursement~TDARegion+ESC+BreakfastTotal+BreakfastServedFree+BreakfastServedRedc+AMSnackTotal+AMSnackServedFree+AMSnackServedRedc+LunchTotal+LunchServedFree+LunchServedRedc+PMSnackDays+PMSnackServedFree+PMSnackServedRedc+SupperTotal+SupperServedFree+SupperServedRedc, data = trainData)
summary(model2)


# Select the predictor variables
predictors <- c("BreakfastTotal","BreakfastServedFree","BreakfastServedRedc","AMSnackTotal","AMSnackServedFree","AMSnackServedRedc","LunchTotal","LunchServedFree","LunchServedRedc","PMSnackServedFree","PMSnackServedRedc","SupperTotal","SupperServedFree","SupperServedRedc")

# Fit the decision tree model
tree <- rpart(formula = as.formula(paste(target, "~", paste(predictors, collapse = "+"))),
              data = trainData)
# Visualize the decision tree with rpart.plot
rpart.plot(tree, nn=TRUE,
           main = "Decision Tree for Total Reimbursement Amount")

# Make predictions on the testing data
predictions <- predict(tree, newdata = testData)

# Calculate the accuracy of the model
accuracy <- cor(predictions, testData$TotalReimbursement)

# Print the accuracy
cat("Accuracy:", round(accuracy, 4))

#Decision Tree for Meal Participation Rates

data=df
data$Meal_Participation_Rate=data$BreakfastADP+data$LunchADP+data$SupperADP

new_df <- data[, !names(data) %in% "Meal_Participation_Rate"]
number.perfect.splits <- apply(X=new_df , MARGIN = 2, FUN = function(col){
  t <- table(data$Meal_Participation_Rate,col)
  sum(t == 0)
})


# Descending order of perfect splits
order <- order(number.perfect.splits,decreasing = TRUE)
number.perfect.splits <- number.perfect.splits[order]

# Plot graph
par(mar=c(10,2,2,2))
barplot(number.perfect.splits,
        main="Number of perfect splits vs feature",
        xlab="",ylab="Feature",las=2,col="wheat")

#data splicing
set.seed(12345)


numeric_data <- data %>% select_if(is.numeric)
data=numeric_data
# Split the data into training and testing sets
trainIndex <- sample(nrow(data), round(0.7 * nrow(data)))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]
target="Meal_Participation_Rate"


# Fit multiple linear regression model
model1 <- lm(Meal_Participation_Rate ~ ., data = trainData)
summary(model1)

model2<-lm(Meal_Participation_Rate~TDARegion+CountyDistrictCode+BreakfastADP+LunchADP+AMSnackServedFree+SupperADP, data = trainData)
summary(model2)


require(ggplot2)
ggplot(data,aes(y=Meal_Participation_Rate,x=BreakfastADP+LunchADP+SupperADP+TDARegion))+geom_point()+geom_smooth(method="lm")

predictors <- c("BreakfastADP","LunchADP","SupperADP","TDARegion")


tree <- rpart(formula = as.formula(paste(target, "~", paste(predictors, collapse = "+"))),
              data = trainData)
# Visualize the decision tree with rpart.plot
rpart.plot(tree, nn=TRUE,
           main = "Decision Tree for Meal Participation Rates")

# Make predictions on the testing data
predictions <- predict(tree, newdata = testData)


# Calculate the accuracy of the model
accuracy <- cor(predictions, testData$Meal_Participation_Rate)

# Print the accuracy
cat("Accuracy:", round(accuracy, 4))


