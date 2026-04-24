create database qlrapphim;
use qlrapphim;
CREATE TABLE Movies (
    movie_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    duration INT NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE Showtimes (
    show_id VARCHAR(5) PRIMARY KEY,
    movie_id VARCHAR(5),
    room_name VARCHAR(50) NOT NULL,
    start_time DATETIME NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Customers (
    customer_id VARCHAR(5) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id VARCHAR(5),
    customer_id VARCHAR(5),
    seat_number VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (show_id) REFERENCES Showtimes(show_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    UNIQUE(show_id, seat_number) 
);
INSERT INTO Movies VALUES 
('M01', 'Avatar 2', 190, 'Hành động'),
('M02', 'Joker', 120, 'Tâm lý'),
('M03', 'Toy Story 4', 100, 'Hoạt hình'),
('M04', 'Interstellar', 169, 'Khoa học');

INSERT INTO Showtimes VALUES 
('S01', 'M01', 'Cinema 01', '2025-10-01 19:00:00', 120000.00),
('S02', 'M02', 'Cinema 02', '2025-10-01 20:00:00', 90000.00),
('S03', 'M03', 'Cinema 01', '2025-10-02 09:00:00', 80000.00),
('S04', 'M04', 'Cinema 03', '2025-10-02 14:00:00', 150000.00);

INSERT INTO Customers VALUES 
('C01', 'Nguyễn Văn An', 'an.nv@gmail.com', '0911111111'),
('C02', 'Nguyễn Thị Mai', 'mai.nt@gmail.com', '0922222222'),
('C03', 'Trần Quang Hải', 'hai.tq@gmail.com', '0933333333');

INSERT INTO Tickets (show_id, customer_id, seat_number, status) VALUES 
('S01', 'C01', 'A01', 'Booked'),
('S02', 'C02', 'B05', 'Booked'),
('S01', 'C03', 'A02', 'Cancelled'),
('S04', 'C01', 'C10', 'Booked'),
('S03', 'C02', 'D01', 'Booked');

-- CAU 3
UPDATE Showtimes 
SET ticket_price = ticket_price * 1.10 
WHERE show_id = 'S01';

-- CAU 4
UPDATE Customers 
SET phone = '0988888888' 
WHERE full_name = 'Nguyễn Văn An';

-- CAU 5
DELETE FROM Tickets 
WHERE status = 'Cancelled';

-- CAU 6
SELECT * FROM Movies 
WHERE duration > 120;

-- CAU 7
SELECT full_name, email 
FROM Customers 
WHERE full_name LIKE '%Mai%';

-- CAU 8 
SELECT show_id, room_name, start_time 
FROM Showtimes 
ORDER BY start_time DESC;

-- CAU 9
SELECT * FROM Showtimes 
ORDER BY ticket_price 
DESC LIMIT 3;

-- CAU 10
SELECT title, duration 
FROM Movies 
LIMIT 2 OFFSET 1;

-- CAU 11
SELECT T.ticket_id, C.full_name, M.title, T.seat_number
FROM Tickets T
JOIN Customers C ON T.customer_id = C.customer_id
JOIN Showtimes S ON T.show_id = S.show_id
JOIN Movies M ON S.movie_id = M.movie_id
WHERE T.status = 'Booked'; 

-- cau  12.
SELECT M.title, S.start_time
FROM Movies M
LEFT JOIN Showtimes S ON M.movie_id = S.movie_id;

-- cau 13. 
SELECT status, COUNT(*) AS Total_Tickets
FROM Tickets
GROUP BY status;
-- cau 14 

-- cau 15. 
SELECT show_id, room_name, ticket_price
FROM Showtimes
WHERE ticket_price < (SELECT AVG(ticket_price) FROM Showtimes);

-- cau 16 Hiển thị full_name và phone của những khách hàng đã từng mua vé xem phim 'Avatar 2'.




 











