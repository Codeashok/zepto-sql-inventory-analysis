-- Zepto Inventory SQL Analysis Project

-- 1. View table structure
DESCRIBE zepto_v2;

-- 2. Total number of products
SELECT COUNT(*) AS total_products
FROM zepto_v2;

-- 3. Check missing product names
SELECT COUNT(*) AS missing_product_names
FROM zepto_v2
WHERE name IS NULL OR name = '';

-- 4. Check invalid MRP values
SELECT COUNT(*) AS invalid_mrp
FROM zepto_v2
WHERE mrp <= 0;

-- 5. Check invalid discounted prices
SELECT COUNT(*) AS invalid_discounted_price
FROM zepto_v2
WHERE discountedSellingPrice <= 0;

-- 6. Products with zero quantity (out of stock)
SELECT name, Category
FROM zepto_v2
WHERE quantity = 0;

-- 7. Products marked out of stock using flag
SELECT name, Category
FROM zepto_v2
WHERE outOfStock = 'TRUE';

-- 8. Category-wise product count
SELECT Category, COUNT(*) AS total_products
FROM zepto_v2
GROUP BY Category
ORDER BY total_products DESC;

-- 9. Average MRP per category
SELECT Category, ROUND(AVG(mrp), 2) AS avg_mrp
FROM zepto_v2
GROUP BY Category;

-- 10. Average discount percentage per category
SELECT Category, ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_v2
GROUP BY Category;

-- 11. Top 10 highest discounted products
SELECT name, Category, mrp, discountedSellingPrice, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- 12. High-priced products with low discount
SELECT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC;

-- 13. Stock availability summary
SELECT 
  CASE 
    WHEN quantity = 0 THEN 'Out of Stock'
    ELSE 'In Stock'
  END AS stock_status,
  COUNT(*) AS product_count
FROM zepto_v2
GROUP BY stock_status;

-- 14. Heavy-weight products
SELECT name, weightInGms
FROM zepto_v2
WHERE weightInGms > 1000
ORDER BY weightInGms DESC;

-- 15. Final sample view
SELECT *
FROM zepto_v2
LIMIT 10;
