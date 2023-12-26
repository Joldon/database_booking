


-- Insert modified dummy data into Customers
INSERT INTO db_booking.Customers (customer_id, customer_name, contact_details)
VALUES
(1, 'Giovanni Romano', 'giovanni.romano@lemon.com'),
(2, 'Elif Kaya', 'elif.kaya@lemon.com'),
(3, 'Dimitris Papadopoulos', 'dimitris.papadopoulos@lemon.com'),
(4, 'Fatima Yılmaz', 'fatima.yilmaz@lemon.com'),
(5, 'Nikos Vlachos', 'nikos.vlachos@lemon.com'),
(6, 'Alessia Ferrari', 'alessia.ferrari@lemon.com'),
(7, 'Liam Johnson', 'liam.johnson@lemon.com'),
(8, 'Priya Patel', 'priya.patel@lemon.com'),
(9, 'Chen Wei', 'chen.wei@lemon.com'),
(10, 'Aditya Rao', 'aditya.rao@lemon.com');

-- Insert modified dummy data into Staff
INSERT INTO db_booking.Staff (staff_id, role, salary)
VALUES
(1, 'Executive Chef', 55000),
(2, 'Sous Chef', 40000),
(3, 'Waiter', 30000),
(4, 'Bartender', 32000),
(5, 'Host/Hostess', 28000),
(6, 'Server', 30000),
(7, 'Manager', 60000),
(8, 'Line Cook', 35000),
(9, 'Dishwasher', 25000),
(10, 'Busser', 26000);

-- Insert modified dummy data into Menu
INSERT INTO db_booking.Menu (item_id, item_name, item_type, price)
VALUES
(1, 'Pizza Margherita', 'Main', 12),
(2, 'Köfte', 'Main', 15),
(3, 'Tzatziki', 'Side', 5),
(4, 'Risotto ai Funghi', 'Main', 14),
(5, 'Souvlaki', 'Main', 11),
(6, 'Baklava', 'Dessert', 8),
(7, 'Spaghetti Carbonara', 'Main', 13),
(8, 'Karnıyarık', 'Main', 16),
(9, 'Gemista', 'Side', 7),
(10, 'Tiramisu', 'Dessert', 9);

-- Insert modified dummy data into Bookings
INSERT INTO db_booking.Orders (order_id, order_date, quantity, total_cost, item_id, staff_id)
VALUES
(1, '2023-09-01 12:00:00', 2, 24.00, 1, 1),
(2, '2023-09-01 12:30:00', 1, 15.00, 2, 2),
(3, '2023-09-02 13:00:00', 3, 45.00, 3, 3),
(4, '2023-09-02 14:00:00', 1, 14.00, 4, 4),
(5, '2023-09-03 15:00:00', 4, 44.00, 5, 5),
(6, '2023-09-03 16:00:00', 2, 32.00, 6, 6),
(7, '2023-09-04 17:00:00', 1, 13.00, 7, 7),
(8, '2023-09-04 18:00:00', 2, 26.00, 8, 8),
(9, '2023-09-05 19:00:00', 3, 27.00, 9, 9),
(10, '2023-09-05 20:00:00', 1, 9.00, 10, 10);



INSERT INTO db_booking.Orders (order_id, order_date, quantity, total_cost, item_id, staff_id)
VALUES
(1, '2023-09-01 12:00:00', 2, 24.00, 1, 1),
(2, '2023-09-01 12:30:00', 1, 15.00, 2, 2),
(3, '2023-09-02 13:00:00', 3, 45.00, 3, 3),
(4, '2023-09-02 14:00:00', 1, 14.00, 4, 4),
(5, '2023-09-03 15:00:00', 4, 44.00, 5, 5),
(6, '2023-09-03 16:00:00', 2, 32.00, 6, 6),
(7, '2023-09-04 17:00:00', 1, 13.00, 7, 7),
(8, '2023-09-04 18:00:00', 2, 26.00, 8, 8),
(9, '2023-09-05 19:00:00', 3, 27.00, 9, 9),
(10, '2023-09-05 20:00:00', 1, 9.00, 10, 10);


-- Insert modified dummy data into OrderStatus
INSERT INTO db_booking.OrderStatus (status_id, delivery_date, status, order_id)
VALUES
(1, '2023-09-01 12:15:00', 'Delivered', 1),
(2, '2023-09-01 12:45:00', 'Preparing', 2),
(3, '2023-09-02 13:15:00', 'Preparing', 3),
(4, '2023-09-02 14:15:00', 'Out for delivery', 4),
(5, '2023-09-03 15:15:00', 'Out for delivery', 5),
(6, '2023-09-03 16:15:00', 'Delivered', 6),
(7, '2023-09-04 17:15:00', 'Preparing', 7),
(8, '2023-09-04 18:15:00', 'Delivered', 8),
(9, '2023-09-05 19:15:00', 'Delivered', 9),
(10, '2023-09-05 20:15:00', 'Delivered', 10);

-- Insert modified dummy data into Bookings
INSERT INTO db_booking.Bookings (booking_id, booking_date, table_number, customer_id)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);

