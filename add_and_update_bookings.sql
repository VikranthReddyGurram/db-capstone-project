-- Create SQL queries to add and update bookings
-- Task 1: AddBooking
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking (IN booking_id INT, IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
	INSERT INTO bookings
    (BookingID, BookingDate, TableNumber, CustomerID) VALUES
    (booking_id, booking_date, table_number, customer_id);
END//
DELIMITER ;

CALL AddBooking(7, "2022-12-30", 3, 1);

-- Task 2: UpdateBooking
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATE)
BEGIN
UPDATE bookings
SET BookingDate=booking_date
WHERE BookingID=booking_id;
END//
DELIMITER ;

CALL UpdateBooking(6, "2022-12-18");

-- Task 3: CancelBooking
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
	DELETE FROM bookings
	WHERE BookingID=booking_id;
END//
DELIMITER ;

CALL CancelBooking(7);
