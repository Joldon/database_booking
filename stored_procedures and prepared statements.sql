DELIMITER //


-- a procedure that displays the maximum ordered quantity in the Orders table. 
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS max_ordered_quantity FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity(); 


-- create a prepared statement called GetOrderDetail. This prepared statement will help to reduce 
-- the parsing time of queries. It will also help to secure the database from SQL injections.
-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table. 

PREPARE GetOrderDetails FROM
'SELECT C.customer_id, O.order_id, O.quantity, O.total_cost
FROM Customers AS C
JOIN Orders AS O ON C.customer_id = O.order_id
WHERE C.customer_id = ?';

SET @inputCustomerID = 1;
EXECUTE GetOrderDetails USING @inputCustomerID;

DELIMITER //

-- to cancel any order by specifying the order id value in the procedure parameter 
-- without typing the entire SQL delete statement.   
-- If you invoke the CancelOrder procedure, the output result should output 'Order 5 is cancelled', for example.

CREATE PROCEDURE CancelOrder(IN inputOrderID INT)
BEGIN
    DELETE FROM Orders WHERE order_id = inputOrderID;
    SELECT CONCAT('Order ', inputOrderID, ' is cancelled') AS Result;
END //

DELIMITER ;

CALL CancelOrder(5);