-- a stored procedure called CheckBooking to check whether a table in the restaurant is already booked.
-- The procedure has two input parameters in the form of booking date and table number.
-- Created a variable (isBooked) in the procedure to check the status of each table.

DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE isBooked INT;

    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE booking_date = bookingDate AND table_number = tableNumber;

    IF isBooked > 0 THEN
        SELECT CONCAT('Table ', tableNumber, ' is already booked') AS OutputMessage;
    ELSE
        SELECT 'Table is available for booking' AS OutputMessage;
    END IF;
END//

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);


-- a stored procedure to verify a booking, and decline any reservations for tables that are already booked under another name. 
-- it uses a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  
-- The procedure should include two input parameters in the form of booking date and table number.
-- It also requires at least one variable and should begin with a START TRANSACTION statement.
-- Your INSERT statement must add a new booking record using the input parameter's values.
-- Use an IF ELSE statement to check if a table is already booked on the given date. 
-- If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 



DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE isBooked INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE booking_date = bookingDate AND table_number = tableNumber;

    IF isBooked > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS OutputMessage;
    ELSE
        INSERT INTO Bookings (booking_date, table_number)
        VALUES (bookingDate, tableNumber);
        COMMIT;
        SELECT 'Booking added successfully' AS OutputMessage;
    END IF;
END//

DELIMITER ;

CALL AddValidBooking('2022-11-14', 2);




DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `AddBooking`(
	IN booking_id_param INT,
    IN booking_date_param DATE,
    IN table_number_param INT,
	IN customer_id_param INT
)
BEGIN
	INSERT INTO Bookings (booking_id, booking_date, table_number, customer_id)
    VALUES (booking_id_param, booking_date_param, table_number_param, customer_id_param);
    
    SELECT 'New booking added' AS OutputMessage;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `AddValidBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE isBooked INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE booking_date = bookingDate AND table_number = tableNumber;

    IF isBooked > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS OutputMessage;
    ELSE
        INSERT INTO Bookings (booking_date, table_number)
        VALUES (bookingDate, tableNumber);
        COMMIT;
        SELECT 'Booking added successfully' AS OutputMessage;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `CancelOrder`(IN inputOrderID INT)
BEGIN
    DELETE FROM Orders WHERE order_id = inputOrderID;
    SELECT CONCAT('Order ', inputOrderID, ' is cancelled') AS Result;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `CheckBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE isBooked INT;

    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE booking_date = bookingDate AND table_number = tableNumber;

    IF isBooked > 0 THEN
        SELECT CONCAT('Table ', tableNumber, ' is already booked') AS OutputMessage;
    ELSE
        SELECT 'Table is available for booking' AS OutputMessage;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(quantity) AS max_ordered_quantity FROM Orders;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`db_admin`@`%` PROCEDURE `AddValidBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE isBooked INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE booking_date = bookingDate AND table_number = tableNumber;

    IF isBooked > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS OutputMessage;
    ELSE
        INSERT INTO Bookings (booking_date, table_number)
        VALUES (bookingDate, tableNumber);
        COMMIT;
        SELECT 'Booking added successfully' AS OutputMessage;
    END IF;
END$$
DELIMITER ;


-- create a new procedure called AddBooking to add a new table booking record.
-- The procedure should include four input parameters in the form of the following bookings parameters:
-- booking id, customer id, booking date, and table number.

DELIMITER //
CREATE PROCEDURE AddBooking(
	IN booking_id_param INT,
    IN booking_date_param DATE,
    IN table_number_param INT,
	IN customer_id_param INT
)
BEGIN
	INSERT INTO Bookings (booking_id, booking_date, table_number, customer_id)
    VALUES (booking_id_param, booking_date_param, table_number_param, customer_id_param);
    
    SELECT 'New booking added' AS OutputMessage;
END //

DELIMITER ;

CALL AddBooking(9, '2022-11-14', 3, 4);


DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id_param INT, IN booking_date_param DATE)
BEGIN
	UPDATE Bookings
    SET booking_date = booking_date_param
    WHERE booking_id = booking_id_param;
    
    SELECT CONCAT('Booking ', booking_id_param, ' updated') AS OutputMessage;
END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');


DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id_param INT)
BEGIN
	DELETE FROM Bookings
    WHERE booking_id = booking_id_param;
    
    SELECT CONCAT('Booking ', booking_id_param, ' cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);



