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
