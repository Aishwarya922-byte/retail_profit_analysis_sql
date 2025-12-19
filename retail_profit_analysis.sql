--Table creation
CREATE TABLE retail_profit_analysis (
    order_id            INT PRIMARY KEY,
    customer_id         INT,
    segment             VARCHAR(20),
    region              VARCHAR(20),
    product_id          INT,
    category             VARCHAR(30),
    sub_category         VARCHAR(30),
    order_date           DATE,
    order_priority       VARCHAR(15),
    quantity             INT,
    sales                NUMERIC(10,2),
    discount_pct         NUMERIC(4,2),
    discount_amount      NUMERIC(10,2),
    cost                 NUMERIC(10,2),
    profit               NUMERIC(10,2),
    shipping_days        INT,
    shipping_cost        NUMERIC(10,2)
);

SELECT * FROM retail_profit_analysis

-- Row Count
SELECT COUNT(*) FROM retail_profit_analysis

-- Date Range
SELECT MAX(order_date), MIN(order_date)
FROM retail_profit_analysis

--Profit Check
SELECT COUNT(*)
FROM retail_profit_analysis
WHERE profit<0;

-- Discount distribution
SELECT discount_pct, COUNT(*)
FROM retail_profit_analysis
GROUP BY discount_pct
ORDER BY discount_pct;

--- -- Region-wise Sales, Profit, and Average Discount
SELECT 
    REGION,
    COUNT(*) AS TOTAL_ORDERS,
    ROUND(SUM(SALES),2) AS TOTAL_SALES,
    ROUND(SUM(PROFIT),2) AS TOTAL_PROFIT,
    ROUND(AVG(PROFIT),2)AS AVG_PROFIT,
    ROUND(AVG(DISCOUNT_PCT),2) AS AVG_DISCOUNT
FROM RETAIL_PROFIT_ANALYSIS
GROUP BY REGION
ORDER BY TOTAL_SALES DESC;

---- Category and Sub-Category Sales & Profit Analysis
SELECT 
    CATEGORY,
    SUB_CATEGORY,
    COUNT(*) AS TOTAL_ORDERS,
    ROUND(SUM(SALES),2) AS TOTAL_SALES,
    ROUND(SUM(PROFIT),2) AS TOTAL_PROFIT,
    ROUND(AVG(PROFIT),2) AS AVG_PROFIT,
    ROUND(AVG(DISCOUNT_PCT),2) AS AVG_DISCOUNT
FROM RETAIL_PROFIT_ANALYSIS
GROUP BY CATEGORY, SUB_CATEGORY
ORDER BY TOTAL_PROFIT DESC;

SELECT * FROM retail_profit_analysis

-- Top Customers by Total Profit
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(AVG(profit),2) AS avg_profit_per_order
FROM retail_profit_analysis
GROUP BY customer_id
ORDER BY total_profit DESC
LIMIT 10;

--Identify Loss-Making Orders
SELECT order_id,customer_id,region,category,sub_category,sales,profit,discount_pct
FROM retail_profit_analysis
WHERE profit < 0
ORDER BY profit DESC;

-- Top 10 products by Total Profit
SELECT 
    product_id,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit_per_order,
    COUNT(*) AS total_orders
FROM retail_profit_analysis
GROUP BY product_id, category, sub_category
ORDER BY total_profit DESC;


-- Average Profit per Order by Region
SELECT 
    region,
    COUNT(*) AS total_orders,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(AVG(profit),2) AS avg_profit_per_order
FROM retail_profit_analysis
GROUP BY region
ORDER BY avg_profit_per_order DESC;

-- Average discount vs average profit by category
SELECT 
    category,
    ROUND(AVG(discount_pct), 2) AS avg_discount,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY category
ORDER BY avg_profit DESC;

--- Average profit by customer segment
SELECT 
    segment,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY segment
ORDER BY avg_profit DESC;



---Average sales,cost by order_priority
SELECT 
    order_priority, 
    COUNT(*) AS total_orders,
    ROUND(AVG(cost),2) AS average_cost,
    ROUND(AVG(sales),2) AS average_sales
FROM retail_profit_analysis
GROUP BY order_priority
ORDER BY average_sales DESC;

--- shipping speed vs average profit
SELECT 
    shipping_days,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY shipping_days
ORDER BY shipping_days;

---- Discount impact on profit
SELECT 
    CASE 
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct <= 10 THEN 'Low Discount (0–10%)'
        WHEN discount_pct <= 20 THEN 'Medium Discount (10–20%)'
        ELSE 'High Discount (>20%)'
    END AS discount_range,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY discount_range
ORDER BY avg_profit DESC;

----region wise avg shipping cost and profit
SELECT 
    region,
    COUNT(*) AS total_orders,
    ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY region
ORDER BY avg_profit DESC;

--top 5 most profitable customers
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY customer_id
ORDER BY total_profit DESC
LIMIT 5;

--category wise profit margin analysis
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM retail_profit_analysis
GROUP BY category
ORDER BY profit_margin_pct DESC;

---region wise loss analysis
SELECT 
    region,
    COUNT(*) AS loss_orders,
    ROUND(SUM(profit), 2) AS total_loss,
    ROUND(AVG(profit), 2) AS avg_loss_per_order
FROM retail_profit_analysis
WHERE profit < 0
GROUP BY region
ORDER BY total_loss ASC;

---- sub category vs avg profit
SELECT 
    sub_category,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit
FROM retail_profit_analysis
GROUP BY sub_category
ORDER BY avg_profit DESC;





