-- ============================================================
-- Sample Queries — Bookstore Database System
-- ============================================================

-- ── 1. View all products with their category ──────────────────
SELECT
    p.Product_ID,
    p.Name,
    p.Price,
    p.Stock_Quantity,
    c.Category_Name
FROM Products p
JOIN Categories c ON p.Category_ID = c.Category_ID
ORDER BY c.Category_Name, p.Name;

-- ── 2. View all orders with customer name and status ──────────
SELECT
    o.Order_ID,
    u.User_FName || ' ' || u.User_LName AS Customer_Name,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Orders o
JOIN Users u ON o.User_ID = u.User_ID
ORDER BY o.Order_Date DESC;

-- ── 3. View order details (items per order) ───────────────────
SELECT
    od.Order_ID,
    p.Name        AS Product_Name,
    od.Quantity,
    od.Unit_Price,
    (od.Quantity * od.Unit_Price) AS Subtotal
FROM OrderDetails od
JOIN Products p ON od.Product_ID = p.Product_ID
ORDER BY od.Order_ID;

-- ── 4. Products below low stock threshold (alert) ────────────
SELECT
    Product_ID,
    Name,
    Stock_Quantity,
    Low_Stock_Threshold
FROM Products
WHERE Stock_Quantity <= Low_Stock_Threshold
ORDER BY Stock_Quantity ASC;

-- ── 5. Total revenue per customer ─────────────────────────────
SELECT
    u.User_FName || ' ' || u.User_LName AS Customer_Name,
    COUNT(o.Order_ID)                   AS Total_Orders,
    SUM(o.Total_Amount)                 AS Total_Spent
FROM Users u
JOIN Orders o ON u.User_ID = o.User_ID
GROUP BY u.User_ID, Customer_Name
ORDER BY Total_Spent DESC;

-- ── 6. Most ordered products ──────────────────────────────────
SELECT
    p.Name,
    SUM(od.Quantity) AS Total_Units_Sold
FROM OrderDetails od
JOIN Products p ON od.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Name
ORDER BY Total_Units_Sold DESC
LIMIT 10;

-- ── 7. Orders summary by status ───────────────────────────────
SELECT
    Order_Status,
    COUNT(*)        AS Number_of_Orders,
    SUM(Total_Amount) AS Total_Revenue
FROM Orders
GROUP BY Order_Status
ORDER BY Number_of_Orders DESC;

-- ── 8. Unread notifications per user ─────────────────────────
SELECT
    u.User_FName || ' ' || u.User_LName AS Customer_Name,
    COUNT(n.Notification_ID)            AS Unread_Notifications
FROM Notifications n
JOIN Users u ON n.User_ID = u.User_ID
WHERE n.Status = 'unread'
GROUP BY u.User_ID, Customer_Name;

-- ── 9. Full order history for a specific customer ─────────────
-- Replace $1 with the target User_ID
SELECT
    o.Order_ID,
    o.Order_Date,
    p.Name          AS Product,
    od.Quantity,
    od.Unit_Price,
    o.Order_Status
FROM Orders o
JOIN OrderDetails od ON o.Order_ID = od.Order_ID
JOIN Products p      ON od.Product_ID = p.Product_ID
WHERE o.User_ID = 2
ORDER BY o.Order_Date DESC;

-- ── 10. Revenue by category ───────────────────────────────────
SELECT
    c.Category_Name,
    SUM(od.Quantity * od.Unit_Price) AS Revenue
FROM OrderDetails od
JOIN Products p   ON od.Product_ID = p.Product_ID
JOIN Categories c ON p.Category_ID = c.Category_ID
GROUP BY c.Category_Name
ORDER BY Revenue DESC;
