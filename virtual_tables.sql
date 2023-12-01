-- Task 1: Create OrdersView
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost 
FROM orders
WHERE Quantity > 2;

-- Task 2: JOIN clause
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Cost, me.Cuisine, mi.Course, mi.Starter
FROM customers AS c
INNER JOIN orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN menus AS me ON o.MenuID = me.MenuID
INNER JOIN menuItems AS mi ON me.MenuItemsID = mi.MenuItemsID
WHERE o.Cost > 150
ORDER BY o.Cost ASC;

-- Task 3: Subquery ANY clause
SELECT Cuisine 
FROM menus
WHERE MenuID = ANY (
SELECT MenuID
FROM orders
WHERE Quantity > 2 );
