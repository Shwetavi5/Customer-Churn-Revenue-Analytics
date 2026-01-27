-- Customer Churn & Revenue Analysis
-- Dataset: Customer-Churn-Revenue-Analytics

--------------------------------------------------
-- 1. Total number of customers
--------------------------------------------------
SELECT
    COUNT(customerID) AS total_customers
FROM customers;

--------------------------------------------------
-- 2. Overall churn rate
--------------------------------------------------
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 
ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers;

--------------------------------------------------
-- 3. Average monthly charges
--------------------------------------------------
SELECT
    ROUND(AVG(MonthlyCharges), 2) AS 
avg_monthly_charges
FROM customers;

--------------------------------------------------
-- 4. Churn by contract type
--------------------------------------------------
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS 
churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 
ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

--------------------------------------------------
-- 5. Churn by tenure group
--------------------------------------------------
SELECT
    CASE
        WHEN tenure < 12 THEN '0–11 months'
        WHEN tenure BETWEEN 12 AND 24 THEN '12–24 
months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25–48 
months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS 
churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 
ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate_percent DESC;

