data("airquality")
dim(airquality)
#because the dataset is a built-in dataset in R i could call the dataset directly. In order to find the number of rows and columns i used dim() function.
#Create a new data frame "air2" using the first 15 rows and 4 columns of airquality data.
air2 <- airquality[1:15, 1:4]
air2 #call the result
#Use data "air2" to search if there is any missing value?
#i used is.na() function to determine wheter there is any missing value or not.
is.na(air2)
#For each column, calculate the arithmetic mean. Consider the missing values.
i calculated the means by using mean() function with na.rm = TRUE argument.
#i calculated the means by using mean() function with na.rm = TRUE argument.
mean_ozone <- mean(air2$Ozone, na.rm = TRUE)
mean_solar <- mean(air2$Solar.R, na.rm = TRUE)
mean_wind <- mean(air2$Wind, na.rm = TRUE)
mean_temp <- mean(air2$Temp, na.rm = TRUE)
cat("Mean Ozone:", mean_ozone, "\n")
cat("Mean Solar.R:", mean_solar, "\n")
cat("Mean Wind:", mean_wind, "\n")
cat("Mean Temp:", mean_temp, "\n")
#Construct a cross table of "Ozone" and "Month". Set the parameter "breaks=4".
airquality$Ozone_binned <- cut(airquality$Ozone, breaks = 4)
#create a cross table
ozone_month_table <- table(airquality$Ozone_binned, airquality$Month)
ozone_month_table #callin the result
#air2 data contains 5 different Months with 5,6,7,8,9, respectively. Store the Months for each group separately. Display a boxplot for several groups in one Graph.
# create separate variables for each month group
month_5 <- air2$Ozone[air2$Month == 5]
month_6 <- air2$Ozone[air2$Month == 6]
month_7 <- air2$Ozone[air2$Month == 7]
month_8 <- air2$Ozone[air2$Month == 8]
month_9 <- air2$Ozone[air2$Month == 9]
# create a data frame with the month groups
ozone_by_month <- data.frame(
Month = c(rep("May", length(month_5)),
rep("June", length(month_6)),
rep("July", length(month_7)),
rep("August", length(month_8)),
rep("September", length(month_9))),
Ozone = c(month_5, month_6, month_7, month_8, month_9)
)
# create the boxplot
ggplot(ozone_by_month, aes(x = Month, y = Ozone)) +
geom_boxplot() +
labs(x = "Month", y = "Ozone")
# load ggplot2 library
library(ggplot2)
# load air2 data frame
data(air2)
# create separate variables for each month group
month_5 <- air2$Ozone[air2$Month == 5]
month_6 <- air2$Ozone[air2$Month == 6]
month_7 <- air2$Ozone[air2$Month == 7]
month_8 <- air2$Ozone[air2$Month == 8]
month_9 <- air2$Ozone[air2$Month == 9]
# create a data frame with the month groups
ozone_by_month <- data.frame(
Month = c(rep("May", length(month_5)),
rep("June", length(month_6)),
rep("July", length(month_7)),
rep("August", length(month_8)),
rep("September", length(month_9))),
Ozone = c(month_5, month_6, month_7, month_8, month_9)
)
# create the boxplot
ggplot(ozone_by_month, aes(x = Month, y = Ozone)) +
geom_boxplot() +
labs(x = "Month", y = "Ozone")
#Use a statistical test to compare the means in any of the two variables that you prefer.
# load air2 data frame
data(air2)
# conduct a two-sample t-test
t.test(air2$Ozone, air2$Solar.R, var.equal = TRUE)
