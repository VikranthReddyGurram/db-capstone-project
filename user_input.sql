-- Task 1: INSERT into bookings
INSERT INTO bookings 
(BookingID, BookingDate, TableNumber, CustomerID) VALUES 
(1, "2022-10-10", 5, 1),
(2, "2022-11-12", 3, 3),
(3, "2022-10-11", 2, 2),
(4, "2022-10-13", 2, 1);

SELECT * FROM bookings;

-- Task 2: CheckBooking
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE booking_status INT DEFAULT 0;
	SELECT COUNT(*) INTO booking_status
	FROM bookings
	WHERE BookingDate=booking_date AND TableNumber=table_number;
    IF booking_status > 0 THEN
	SELECT CONCAT("Table ", table_number, " is already booked") AS "Booking Status";
    ELSE
	SELECT CONCAT("Table ", table_number, " is not booked") AS "Booking Status";
    END IF;
END//
DELIMITER ;

CALL CheckBooking("2022-11-12", 3);

-- Task 3: AddValidBooking
DROP PROCEDURE IF EXISTS AddValidbooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE tables_booked INT DEFAULT 0;
    DECLARE customer_id INT DEFAULT 1;
	START TRANSACTION;
		SELECT COUNT(*) INTO tables_booked
        FROM bookings
        WHERE BookingDate=booking_date AND TableNumber=table_number;
        IF tables_booked > 0 THEN
        ROLLBACK;
        SELECT CONCAT("Booking Cancelled: Table ", table_number, " is already booked") AS "Booking Status";
        ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);
        COMMIT;
        SELECT CONCAT("Booking Successful: Table ", table_number, " is booked") AS "Booking Status";
        END IF;
END//
DELIMITER ;

CALL AddValidBooking("2022-12-17", 6);