# Retail Sales & Profitability Analysis using SQL

## 📌 Business Problem
Retail companies often struggle to identify which products, customers, or regions are most profitable and which orders are causing losses.  
They also need to understand how discounts, shipping speed, and customer segments impact profitability.  
The business problem addressed in this project is:

**"How can a retail company optimize profitability and reduce losses by analyzing sales, profit, discounts, and operational data?"**

---

## 📌 Project Overview
This project focuses on analyzing retail sales data to evaluate profitability, customer behavior, discount impact, and operational efficiency using SQL.  
The goal is to extract meaningful business insights that can help improve pricing strategies, reduce losses, and optimize regional and product performance.

---

## 🗂️ Dataset Description
The dataset contains order-level retail transaction data with the following key attributes:

- Order details: order_id, order_date, order_priority
- Customer details: customer_id, segment, region
- Product details: product_id, category, sub_category
- Financial metrics: sales, cost, profit, discount_pct, discount_amount
- Logistics: shipping_days, shipping_cost

---

## 🎯 Key Business Questions Answered
- Which regions generate the highest sales and profits?
- Which categories and sub-categories are most profitable?
- Who are the top customers by profit contribution?
- Which products generate the highest profits?
- How do discounts impact profitability?
- Which regions and categories incur losses?
- Does faster shipping improve profitability?
- How does customer segment affect average profit?

---

## 📊 Analysis Performed
- Exploratory analysis (row count, date range, negative profit check)
- Region-wise sales, profit, and discount analysis
- Category and sub-category performance analysis
- Customer-level profitability and ranking
- Product-level sales and profit analysis
- Loss-making order identification
- Discount impact analysis using CASE statements
- Shipping speed vs profitability analysis
- Profit margin calculation by category

---

## 🧠 Key Insights
- High discounts often reduce average profit, especially beyond certain thresholds.
- A small group of customers contributes significantly to total profit.
- Some regions generate high sales but low or negative profit margins.
- Certain sub-categories consistently underperform and contribute to losses.
- Faster shipping does not always result in higher profitability.

---

## 🛠️ SQL Skills Demonstrated
- Table creation and schema design
- Data aggregation using SUM, AVG, COUNT
- GROUP BY and ORDER BY for business analysis
- CASE statements for discount segmentation
- Profit margin and KPI calculations
- Filtering and loss analysis using WHERE clause

---

## 📌 Tools Used
- SQL (PostgreSQL)

---

## 📎 Project Files
- `retail_profit_analysis.sql` – SQL script containing table creation and analysis queries

---

## ✅ Conclusion
This project demonstrates strong SQL analytical skills by translating raw retail data into actionable business insights. It reflects real-world data analyst responsibilities, including profitability analysis, customer segmentation, and operational performance evaluation.

