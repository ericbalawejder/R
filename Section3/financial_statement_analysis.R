# You are a data scientist working for a consulting firm. One of your colleagues
# from the Auditing department has asked you to help them assess the 
# financial statement from organization X.

# You have been supplied with two vectors of data: monthly revenue and
# monthly expenses for the financial year in question. Your task is to 
# calculate the following financial metrics:

# Profit for each month
# Profit after tax for each month (the tax rate is 30%)
# Profit margin for each month - equals to profit after tax divided by revenue
# Good months - where the profit after tax was greater than the mean for the year
# Bad months - where the profit after tax was less than the mean for the year
# The best month - where the profit after tax was the max for the year
# The worst month - where the profit after tax was the min for the year

# All results need to be presented as vectors. Results for dollar values
# need to be calculated with $0.01 precision but need to be presented in
# units of $1000 (i.e. lk) with no decimal points. Results for the profit
# margin ratio need to be presented in units of % with no decimal points.
# It is ok for tax to be negative. Negative tax translates to a deferred
# tax asset.

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28,
             9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73,
              5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profit <- revenue - expenses
profit_after_tax <- round(0.7*profit, digits=2)
profit_margin <- round(profit_after_tax / revenue, digits=2) * 100
profit_after_tax_mean <- mean(profit_after_tax, na.rm=TRUE)

# Creates a vector of booleans
good_months <- profit_after_tax > profit_after_tax_mean
bad_months <- !good_months
  
best_month <- profit_after_tax == max(profit_after_tax, na.rm=TRUE)
worst_month <- profit_after_tax == min(profit_after_tax, na.rm=TRUE)

# Units for display
revenue_1000 <- round(revenue / 1000)
expenses_1000 <- round(expenses / 1000)
profit_1000 <- round(profit / 1000)
profit_after_tax_1000 <- round(profit_after_tax / 1000)

# Display
revenue_1000
expenses_1000
profit_1000
profit_after_tax_1000
profit_margin
good_months
bad_months
best_month
worst_month


# Matrices
statement_matrix <- rbind(
  revenue_1000,
  expenses_1000,
  profit_1000,
  profit_after_tax_1000,
  profit_margin,
  good_months,
  bad_months,
  best_month,
  worst_month
)

statement_matrix
