-- Task 1 : MaxQuantity
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS 'Max Quantity In Order'
FROM orders;

CALL GetMaxQuantity();

-- Task 2: Prepared Statement
PREPARE GetOrderDetail
FROM 'SELECT OrderID, Quantity, Cost FROM orders
		WHERE CustomerID=?';
        
-- Task 3: Stored Procedure
DELIMITER //
CREATE PROCEDURE CancelOrder(ID INT)
BEGIN
DELETE FROM orders
WHERE OrderID=ID;
SELECT CONCAT("Order ",OrderID,"is cancelled") AS Confirmation;
END//
DELIMITER ;