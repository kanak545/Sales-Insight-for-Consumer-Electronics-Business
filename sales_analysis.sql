-- Sales Insights Data Analysis: SQL queries
-- Database: MySQL (import db_dump.sql first)
-- Tables used: customers, transactions, date
-- Market code for Chennai: Mark001

-- 1. Show all customer records
SELECT * FROM customers;

-- 2. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 3. Transactions for the Chennai market
SELECT * FROM transactions WHERE market_code = 'Mark001';

-- 4. Distinct product codes sold in Chennai
SELECT DISTINCT product_code FROM transactions WHERE market_code = 'Mark001';

-- 5. Transactions where currency is USD
SELECT * FROM transactions WHERE TRIM(currency) = 'USD';

-- 6. Transactions in 2020, joined with the date table
SELECT t.*, d.*
FROM transactions t
INNER JOIN date d ON t.order_date = d.date
WHERE d.year = 2020;

-- 7. Total revenue in 2020
SELECT SUM(t.sales_amount) AS revenue_2020
FROM transactions t
INNER JOIN date d ON t.order_date = d.date
WHERE d.year = 2020
  AND TRIM(t.currency) IN ('INR', 'USD');

-- 8. Total revenue in January 2020
SELECT SUM(t.sales_amount) AS revenue_jan_2020
FROM transactions t
INNER JOIN date d ON t.order_date = d.date
WHERE d.year = 2020
  AND d.month_name = 'January'
  AND TRIM(t.currency) IN ('INR', 'USD');

-- 9. Total revenue in 2020 in Chennai
SELECT SUM(t.sales_amount) AS revenue_2020_chennai
FROM transactions t
INNER JOIN date d ON t.order_date = d.date
WHERE d.year = 2020
  AND t.market_code = 'Mark001';
