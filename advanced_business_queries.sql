USE customer_intelligence;

-- Check total records
SELECT COUNT(*) AS total_records
FROM customer_behavior;

-- Check table structure
DESCRIBE customer_behavior;

-- Customer Segment Analysis
SELECT
    customer_segment,
    COUNT(*) AS customers,
    ROUND(AVG(clv),2) AS avg_clv
FROM customer_behavior
GROUP BY customer_segment
ORDER BY avg_clv DESC;

USE customer_intelligence;

-- Revenue by Category
SELECT
category,
SUM(purchase_amount_usd) AS revenue
FROM customer_behavior
GROUP BY category
ORDER BY revenue DESC;

-- Revenue by Payment Method
SELECT
payment_method,
SUM(purchase_amount_usd) AS revenue
FROM customer_behavior
GROUP BY payment_method
ORDER BY revenue DESC;

-- Revenue by Season
SELECT
season,
SUM(purchase_amount_usd) AS revenue
FROM customer_behavior
GROUP BY season
ORDER BY revenue DESC;

-- Top 10 Revenue Products
SELECT
item_purchased,
SUM(purchase_amount_usd) AS revenue
FROM customer_behavior
GROUP BY item_purchased
ORDER BY revenue DESC
LIMIT 10;

-- Premium Buyer Analysis
SELECT
premium_buyer,
COUNT(*) AS customers,
ROUND(AVG(purchase_amount_usd),2) AS avg_purchase
FROM customer_behavior
GROUP BY premium_buyer;

-- Persona Analysis
SELECT
persona,
COUNT(*) AS customers,
ROUND(AVG(clv),2) AS avg_clv
FROM customer_behavior
GROUP BY persona
ORDER BY avg_clv DESC;