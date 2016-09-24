attach(faithful);
plot(waiting, eruptions);
reg <- lm(eruptions ~ waiting);

summary(reg);
# coefficients: intercept -> b0, waiting -> b1
# Std. error: se(b0), se(b1)
# Tests
# Testing if there should be an intercept in the model: H-naught -> b0 = 0; Ha -> b0 != 0
# If p-value <= 0.05, reject H-naught
# To find, calculate t*: ratio of b0 to se(b0)
# Pr is the p-value
# This p-value is very low, so we reject H-naught. The regression model should have an intercept
#    (that is, b0 should not equal 0)
# Testing if there should be a coefficient in the model: H-naught -> b1 = 0; Ha -> b1 != 0
# t*: ratio of b1 to se(b1)
# This model has a very low p-value, so we reject H-naught. The regression model should have a coefficient
#    (that is, b1 should not equal 0)

# Point estimate of sigma squared is s squared
# sum((yi - yhat)^2) is called SSTotal; sum of squares due to total
# s^2 = SSTotal/(n-1)

# F-statistic p-value indicates whether regression line exists (H-naught -> b0 = b1 = 0)
# Low p-value less than 0.05 indicates that the regression line does exist

# Report adjusted R-squared since this adjusts for overfitting
# Here 81% of variability is explained by the fitted regression model
# Residual standard error is SSE: sum of squares due to error
