library(readxl)
library(tidyverse)


# Read the Excel sheet
phillips <- read_excel("C:/Users/perer/Downloads/Phillips/Phillips.xlsx", sheet = 1)

# View data 
head(phillips) 

str(phillips)

# Rename columns for consistency
phillips <- phillips %>%rename(Year = Year,Female_Unemployment = `Female Unemployment`,Male_Unemployment = `Male Unemployment`,
                               Avg_Unemployment = `Average Unemployment`,Inflation_Rate = `Inflation rate`)

# Convert Year to integer if not already
phillips$Year <- as.integer(phillips$Year)

# Check for missing values
print("Missing values per column:")
colSums(is.na(phillips))

#Summary statistics to identify outliers
summary(phillips)

# View the cleaned dataset
head(phillips)

str(phillips)

#Checking how each variable has changed over the years

library(ggplot2)

# Line chart of female unemployment over years
ggplot(phillips, aes(x = Year, y = Female_Unemployment)) +
  geom_line(color = "steelblue", size = 1) +    # trend line
  geom_point(color = "darkred", size = 2) +     # scatter points
  labs(
    title = "Female Unemployment Rate Over the Years",
    x = "Year",
    y = "Female Unemployment Rate (%)"
  ) +
  theme_minimal()

# Line chart of Male unemployment over years
ggplot(phillips, aes(x = Year, y = Male_Unemployment)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred", size = 2) +
  labs(
    title = "Male Unemployment Rate Over the Years",
    x = "Year",
    y = "Male Unemployment Rate (%)"
  ) +
  theme_minimal()

# Line chart of Average unemployment over years
ggplot(phillips, aes(x = Year, y = Avg_Unemployment)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred", size = 2) +
  labs(
    title = "Average Unemployment Rate Over the Years",
    x = "Year",
    y = "Average Unemployment Rate (%)"
  ) +
  theme_minimal()


# Line chart of Inflation Rate over years
ggplot(phillips, aes(x = Year, y = Inflation_Rate)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred", size = 2) +
  labs(
    title = "Inflation Rate Over the Years",
    x = "Year",
    y = "Inflation Rate (%)"
  ) +
  theme_minimal()


#Comapring the variables as they change over the years

#Male vs Female Unemployment in One Graph
library(tidyr)
library(ggplot2)

# Reshape the dataset to long format
phillips_long <- phillips %>%
  pivot_longer(cols = c(Female_Unemployment, Male_Unemployment),
               names_to = "Gender",
               values_to = "Unemployment_Rate")

# Plot
ggplot(phillips_long, aes(x = Year, y = Unemployment_Rate, color = Gender)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Male vs Female Unemployment Rates Over the Years",
    x = "Year",
    y = "Unemployment Rate (%)",
    color = "Gender"
  ) +
  theme_minimal()



#Female, Male & Average Unemployment in One Graph
library(tidyr)
library(ggplot2)

# Reshape to long format including Average
phillips_long <- phillips %>%
  pivot_longer(cols = c(Female_Unemployment, Male_Unemployment, Avg_Unemployment),
               names_to = "Category",
               values_to = "Unemployment_Rate")

# Plot
ggplot(phillips_long, aes(x = Year, y = Unemployment_Rate, color = Category)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Female, Male, and Average Unemployment Rates Over the Years",
    x = "Year",
    y = "Unemployment Rate (%)",
    color = "Category"
  ) +
  theme_minimal()

#Swap Female & Average Colors
ggplot(phillips_long, aes(x = Year, y = Unemployment_Rate, color = Category)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Female, Male, and Average Unemployment Rates Over the Years",
    x = "Year",
    y = "Unemployment Rate (%)",
    color = "Category"
  ) +
  scale_color_manual(values = c(
    "Female_Unemployment" = "green",   # new color for Female
    "Male_Unemployment"   = "blue",    # keep Male blue
    "Avg_Unemployment"    = "red"      # swapped with Female
  )) +
  theme_minimal()


#Comapring how independent variables has changed over the years with the change of inflation rate

#1. Female Unemployment vs Inflation
ggplot(phillips, aes(x = Year)) +
  geom_line(aes(y = Female_Unemployment, color = "Female Unemployment"), size = 1) +
  geom_line(aes(y = Inflation_Rate, color = "Inflation Rate"), size = 1, linetype = "dashed") +
  scale_y_continuous(
    name = "Female Unemployment Rate (%)",
    sec.axis = sec_axis(~ ., name = "Inflation Rate (%)")
  ) +
  labs(title = "Female Unemployment vs Inflation Over the Years", x = "Year") +
  scale_color_manual(values = c("Female Unemployment" = "blue", "Inflation Rate" = "red")) +
  theme_minimal()


#2. Male Unemployment vs Inflation
ggplot(phillips, aes(x = Year)) +
  geom_line(aes(y = Male_Unemployment, color = "Male Unemployment"), size = 1) +
  geom_line(aes(y = Inflation_Rate, color = "Inflation Rate"), size = 1, linetype = "dashed") +
  scale_y_continuous(
    name = "Male Unemployment Rate (%)",
    sec.axis = sec_axis(~ ., name = "Inflation Rate (%)")
  ) +
  labs(title = "Male Unemployment vs Inflation Over the Years", x = "Year") +
  scale_color_manual(values = c("Male Unemployment" = "blue", "Inflation Rate" = "red")) +
  theme_minimal()


#3. Average Unemployment vs Inflation
ggplot(phillips, aes(x = Year)) +
  geom_line(aes(y = Avg_Unemployment, color = "Average Unemployment"), size = 1) +
  geom_line(aes(y = Inflation_Rate, color = "Inflation Rate"), size = 1, linetype = "dashed") +
  scale_y_continuous(
    name = "Average Unemployment Rate (%)",
    sec.axis = sec_axis(~ ., name = "Inflation Rate (%)")
  ) +
  labs(title = "Average Unemployment vs Inflation Over the Years", x = "Year") +
  scale_color_manual(values = c("Average Unemployment" = "blue", "Inflation Rate" = "red")) +
  theme_minimal()



#4. Male vs Female Unemployment vs Inflation
ggplot(phillips, aes(x = Year)) +
  geom_line(aes(y = Female_Unemployment, color = "Female Unemployment"), size = 1) +
  geom_line(aes(y = Male_Unemployment, color = "Male Unemployment"), size = 1) +
  geom_line(aes(y = Inflation_Rate, color = "Inflation Rate"), size = 1, linetype = "dashed") +
  scale_y_continuous(
    name = "Unemployment Rate (%)",
    sec.axis = sec_axis(~ ., name = "Inflation Rate (%)")
  ) +
  labs(title = "Male vs Female Unemployment and Inflation Over the Years", x = "Year") +
  scale_color_manual(values = c(
    "Female Unemployment" = "green",
    "Male Unemployment"   = "blue",
    "Inflation Rate"      = "red"
  )) +
  theme_minimal()


#5. Male vs Female vs Average Unemployment vs Inflation
ggplot(phillips, aes(x = Year)) +
  geom_line(aes(y = Female_Unemployment, color = "Female Unemployment"), size = 1) +
  geom_line(aes(y = Male_Unemployment, color = "Male Unemployment"), size = 1) +
  geom_line(aes(y = Avg_Unemployment, color = "Average Unemployment"), size = 1) +
  geom_line(aes(y = Inflation_Rate, color = "Inflation Rate"), size = 1, linetype = "dashed") +
  scale_y_continuous(
    name = "Unemployment Rates (%)",
    sec.axis = sec_axis(~ ., name = "Inflation Rate (%)")
  ) +
  labs(title = "Male, Female, Average Unemployment and Inflation Over the Years", x = "Year") +
  scale_color_manual(values = c(
    "Female Unemployment" = "green",
    "Male Unemployment"   = "blue",
    "Average Unemployment"= "purple",
    "Inflation Rate"      = "red"
  )) +
  theme_minimal()



# We want to see if inflation and unemployment have a roughly linear relationship.

library(ggplot2)

# Female unemployment vs Inflation
ggplot(phillips,aes(x = Female_Unemployment, y = Inflation_Rate)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Inflation vs Female Unemployment",
       x = "Female Unemployment (%)", y = "Inflation (%)") +
  theme_minimal()

# Male unemployment vs Inflation
ggplot(phillips, aes(x = Male_Unemployment, y = Inflation_Rate)) +
  geom_point(color = "green") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Inflation vs Male Unemployment",
       x = "Male Unemployment (%)", y = "Inflation (%)") +
  theme_minimal()

# Average unemployment vs Inflation
ggplot(phillips, aes(x = Avg_Unemployment, y = Inflation_Rate)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Inflation vs Average Unemployment",
       x = "Average Unemployment (%)", y = "Inflation (%)") +
  theme_minimal()


#Since each plot shows weaker or non linear relationship, we can confirm that insight through regression analysis.

# Perform regression analysis: Inflation_Rate ~ Avg_Unemployment
regression_model <- lm(Inflation_Rate ~ Avg_Unemployment, data = phillips)
# Summary of the regression model
summary(regression_model)

# Regression analysis: Inflation_Rate ~ Female_Unemployment
regression_female <- lm(Inflation_Rate ~ Female_Unemployment, data = phillips)
# Summary of the regression model
summary(regression_female)


# Regression analysis: Inflation_Rate ~ Male_Unemployment
regression_male <- lm(Inflation_Rate ~ Male_Unemployment, data = phillips)
# Summary of the regression model
summary(regression_male)


#Let's run all three regression analysis together

# Option 1

# Install if needed
install.packages("stargazer")


library(stargazer)

# Run the three models
reg_all    <- lm(Inflation_Rate ~ Avg_Unemployment, data = phillips)
reg_female <- lm(Inflation_Rate ~ Female_Unemployment, data = phillips)
reg_male   <- lm(Inflation_Rate ~ Male_Unemployment, data = phillips)

# Compare them side by side
stargazer(reg_all, reg_female, reg_male, type = "text", title = "Comparison of Regression Models", column.labels = c("All", "Female", "Male"))

# Option 2

install.packages("modelsummary")

library(modelsummary)

models <- list(
  "All"    = reg_all,
  "Female" = reg_female,
  "Male"   = reg_male
)

modelsummary(models, stars = TRUE, gof_omit = "AIC|BIC|Log.Lik")


# Drawing Phillips curves for each model

library(ggplot2)

# Example for Female unemployment
ggplot(phillips, aes(x = Female_Unemployment, y = Inflation_Rate)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Inflation vs Female Unemployment")

library(ggplot2)

# Example for Male unemployment
ggplot(phillips, aes(x = Male_Unemployment, y = Inflation_Rate)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Inflation vs Female Unemployment")

library(ggplot2)

# Example for Average unemployment
ggplot(phillips, aes(x = Avg_Unemployment, y = Inflation_Rate)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Inflation vs Female Unemployment")

#Summary of R squared

summary(reg_all)$r.squared      # works if you run it alone
summary(reg_female)$r.squared
summary(reg_male)$r.squared


#Since r squared values are too small we can say there is no or very small relationship.
#All the above regression analysis shows that there is no or very weak relationships.
#We need to confirm our insights through time series methods as well.

install.packages("vars")

# Load necessary libraries
library(tidyverse)
library(lmtest)       # for Granger causality
library(vars)         # for VAR models
library(urca)         # for cointegration tests
library(zoo)          # for lagged series if needed

# Convert Year, Inflation, and Unemployment to time series
inflation_ts <- ts(phillips$Inflation_Rate, start = min(phillips$Year), end = max(phillips$Year), frequency = 1)
female_unemp_ts <- ts(phillips$Female_Unemployment, start = min(phillips$Year), end = max(phillips$Year), frequency = 1)
male_unemp_ts <- ts(phillips$Male_Unemployment, start = min(phillips$Year), end = max(phillips$Year), frequency = 1)
avg_unemp_ts <- ts(phillips$Avg_Unemployment, start = min(phillips$Year), end = max(phillips$Year), frequency = 1)


#Step 1: Correlation with lags

# Install if needed
install.packages("forecast")
library(forecast)

# Female unemployment
ccf_female <- ccf(female_unemp_ts, inflation_ts, lag.max = 12, plot = TRUE, main = "Female Unemployment vs Inflation")


# Male unemployment
ccf_male <- ccf(male_unemp_ts, inflation_ts, lag.max = 12, plot = TRUE, main = "Male Unemployment vs Inflation")

# Average unemployment
ccf_avg <- ccf(avg_unemp_ts, inflation_ts, lag.max = 12, plot = TRUE, main = "Average Unemployment vs Inflation")


#Checking the stationarity before running the Granger Causauality test


# Install urca if not installed
install.packages("urca")
library(urca)

# ADF test for Inflation
adf_inflation <- ur.df(inflation_ts, type = "trend", selectlags = "AIC")
summary(adf_inflation)
#Above series is mostly non-stationary

# ADF test for Female Unemployment
adf_female <- ur.df(female_unemp_ts, type = "trend", selectlags = "AIC")
summary(adf_female)
#Above series is non-stationary

# ADF test for Male Unemployment
adf_male <- ur.df(male_unemp_ts, type = "trend", selectlags = "AIC")
summary(adf_male)
#Above series is non-stationary

# ADF test for Average Unemployment
adf_avg <- ur.df(avg_unemp_ts, type = "trend", selectlags = "AIC")
summary(adf_avg)
#Above series is non-stationary


#we need to difference the non-stationary series to make them stationary

# Difference the series
diff_inflation <- diff(inflation_ts)
diff_female    <- diff(female_unemp_ts)
diff_male      <- diff(male_unemp_ts)
diff_avg       <- diff(avg_unemp_ts)

#Let's check the stationarity again

library(urca)

# Inflation
adf_inflation_diff <- ur.df(diff_inflation, type = "drift", selectlags = "AIC")
summary(adf_inflation_diff)
#This differenced series is stationary

# Female Unemployment
adf_female_diff <- ur.df(diff_female, type = "drift", selectlags = "AIC")
summary(adf_female_diff)
#After first differencing, this series is now stationary.

# Male Unemployment
adf_male_diff <- ur.df(diff_male, type = "drift", selectlags = "AIC")
summary(adf_male_diff)
#This series is mostly stationary after first differencing.

# Average Unemployment
adf_avg_diff <- ur.df(diff_avg, type = "drift", selectlags = "AIC")
summary(adf_avg_diff)
#This series is mostly stationary after first differencing, though slightly borderline at 5% significance



# Check autocorrelation for differenced Inflation series
acf(diff_inflation, main = "ACF - Inflation (Differenced)")
#This ACF plot suggests that the differenced inflation series does not exhibit strong autocorrelation beyond the initial lag
pacf(diff_inflation, main = "PACF - Inflation (Differenced)")
#This PACF plot indicates that an AR(1) model (autoregressive model of order 1) might be appropriate for the differenced inflation data, as the significant partial autocorrelation is primarily at lag 1

# Similarly for unemployment series
acf(diff_avg, main = "ACF - Avg Unemployment (Differenced)")
##This ACF plot suggests that the differenced inflation series does not exhibit strong autocorrelation beyond the initial lag
pacf(diff_avg, main = "PACF - Avg Unemployment (Differenced)")
#no significant autocorrelation

# Check autocorrelation for differenced Inflation series
acf(diff_female, main = "ACF - Female Unemployment (Differenced)")
#This ACF plot suggests that the differenced inflation series does not exhibit strong autocorrelation beyond the initial lag
pacf(diff_female, main = "PACF - Female Unemployment (Differenced)")
#there is no significant partial autocorrelation

# Check autocorrelation for differenced Inflation series
acf(diff_male, main = "ACF - Male Unemployment (Differenced)")
#This ACF plot suggests that the differenced inflation series does not exhibit strong autocorrelation beyond the initial lag
pacf(diff_male, main = "PACF - Male Unemployment (Differenced)")
#there is no significant partial autocorrelation

#Now that we have made sure our data is stationary and does not have any significant correlation, we can run the Granger Casuality Test

library(vars)

# Combine stationary series into one data frame
ts_data <- data.frame(
  Inflation   = diff_inflation,
  AvgUnemp    = diff_avg,
  FemaleUnemp = diff_female,
  MaleUnemp   = diff_male
)

# Select optimal lag length
lag_selection <- VARselect(ts_data, lag.max = 5, type = "const")
lag_selection$selection

#Since our dataset is small (24 years), using 5 lags might be pushing it (too many parameters for the data). Using 4 lags is safer and avoids overfitting.

#Run Granger causality using 4 lags:

library(lmtest)

# Avg unemployment → Inflation
grangertest(Inflation ~ AvgUnemp, order = 4, data = ts_data)
#Average unemployment does not Granger-cause inflation in your dataset at 5% significance.
#Using lags up to 4 years, past average unemployment does not help predict inflation.
#This confirms what we saw in our correlation and regression analysis — no significant short-term predictive relationship.

# Female unemployment → Inflation
grangertest(Inflation ~ FemaleUnemp, order = 4, data = ts_data)
#Female unemployment does not Granger-cause inflation in your dataset at 5% significance.
#Past female unemployment does not improve prediction of inflation, even up to 4-year lags.

# Male unemployment → Inflation
grangertest(Inflation ~ MaleUnemp, order = 4, data = ts_data)
#Male unemployment does not Granger-cause inflation with 4 lags.
#Along with your previous results for average unemployment and female unemployment, this further confirms no strong short-term relationship between unemployment and inflation in Sri Lanka for 2001–2024.

#Conclusion from Granger Causuality Test: For Sri Lanka (2001–2024), unemployment does not seem to predict inflation, suggesting a weak or non-existent Phillips curve in this period.

#Now let's run VAR

library(vars)

var_model <- VAR(ts_data[, c("Inflation", "AvgUnemp")], 
                 p = 4,      # lag length from previous step
                 type = "const")  # include a constant term

summary(var_model)
#General insights

#Inflation is mostly affected by its own past, not by unemployment.
#Unemployment is largely independent of past inflation and past unemployment in this dataset.
#Small sample size (19) limits statistical significance.
#No strong causal interaction detected in VAR for these variables.