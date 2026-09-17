-- ============================================================
-- SUPERSTORE SALES & PROFITABILITY ANALYSIS
-- ============================================================
-- SQL dialect: SQLite
-- Purpose: Analyze sales performance and profitability
-- ============================================================


-- 1. OVERALL BUSINESS PERFORMANCE

SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT "Order ID") AS total_orders,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore;
-- 2. SALES AND PROFITABILITY BY CATEGORY

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;
-- 3. FURNITURE PROFITABILITY BY SUB-CATEGORY

SELECT
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY total_profit ASC;
-- 4. DISCOUNT LEVEL AND PROFITABILITY

SELECT
    Discount,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Profit), 2) AS avg_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;
-- 5. FURNITURE DISCOUNT AND PROFITABILITY ANALYSIS

SELECT
    "Sub-Category",
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY total_profit ASC;
-- 6. TOP 10 LOSS-MAKING PRODUCTS

SELECT
    "Product Name",
    Category,
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY "Product Name", Category, "Sub-Category"
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 10;
-- 7. REGIONAL SALES AND PROFITABILITY

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;