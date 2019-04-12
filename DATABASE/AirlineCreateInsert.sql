SET AUTOCOMMIT ON;

DROP TABLE Booked;
DROP Table Payment;
DROP TABLE Tickets;
DROP TABLE Flights;
DROP TABLE Airports;

CREATE TABLE Airports(S_id varchar(4) primary key,
					  S_name varchar(30));

CREATE TABLE Flights(Flight_no char(5) primary key,
					from_id varchar(4),
					to_id varchar(4),
					num_seats number(4) check (num_seats > 0),
					type1 char(5) check (type1 IN ('PAS', 'AIR', 'BOE', 'MINI', 'A380', 'ATR')),
					runs_on char(7),
					duration varchar(30),
					fare numeric(8,2) check(fare > 0),
					foreign key (from_id) references Airports(S_id),
					foreign key (to_id) references Airports(S_id));

CREATE TABLE Tickets(Ticket_no varchar(10) primary key,
					 Flight_no char(5),
					 passenger_name varchar(50) not null,
					 sex char(1) check (sex in ('M', 'F')),
					 age number(3) check (age > 3),
					 email varchar(101),
					 mobile_no char(10) not null,
					 book_date date,
					 foreign key (Flight_no) references Flights(Flight_no));

CREATE TABLE Booked(Flight_no char(5),
					book_date date,
					seats_left number(4),
					primary key (Flight_no, book_date),
					foreign key (Flight_no) references Flights(Flight_no));

CREATE TABLE Payment(Payment_no varchar(10) primary key,
					 Ticket_no varchar(10),
					 acc_no varchar(20));

INSERT INTO Airports VALUES ('RNC', 'Ranchi');
INSERT INTO Airports VALUES ('DEL', 'Delhi');
INSERT INTO Airports VALUES ('BOM', 'Bombay');
INSERT INTO Airports VALUES ('KOL', 'Kolkata');
INSERT INTO Airports VALUES ('SRI', 'Srinagar');
INSERT INTO Airports VALUES ('UDP', 'Udupi');
INSERT INTO Airports VALUES ('MNG', 'Mangalore');
INSERT INTO Airports VALUES ('BLR', 'Bangalore');
INSERT INTO Airports VALUES ('PUN', 'Pune');
INSERT INTO Airports VALUES ('PAT', 'Patna');
INSERT INTO Airports VALUES ('GUH', 'Guwhati');
INSERT INTO Airports VALUES ('ROU', 'Rourkela');
INSERT INTO Airports VALUES ('PUR', 'Puri');
INSERT INTO Airports VALUES ('KER', 'Kerela');
INSERT INTO Airports VALUES ('JAI', 'Jaipur');
INSERT INTO Airports VALUES ('BHO', 'Bhopal');
INSERT INTO Airports VALUES ('MAN', 'Manipur');
INSERT INTO Airports VALUES ('JAM', 'Jamnagar');
INSERT INTO Airports VALUES ('CHE', 'Chennai');
INSERT INTO Airports VALUES ('')

INSERT INTO Flights VALUES ('18513', 'RNC', 'DEL', 50, 'A380','1111111', 3, 2225.00);
INSERT INTO Flights VALUES ('14166', 'DEL', 'BOM', 60, 'ATR','1111111', 2,  1850.00);
INSERT INTO Flights VALUES ('12222', 'BOM','DEL',100,  'A380','1111101',2,  4444.00);
INSERT INTO Flights VALUES ('12984', 'DEL', 'BOM', 50, 'A380','1111111', 3, 1950.00);
INSERT INTO Flights VALUES ('13984', 'DEL', 'BOM', 33, 'PAS', '1111111', 2, 1745.00);
INSERT INTO Flights VALUES ('17832', 'PUN', 'BHO', 22, 'MINI', '1111111',6, 11155.00);
INSERT INTO Flights VALUES ('19872', 'BLR', 'KER', 98, 'ATR', '1111111', 2, 8750.00);
INSERT INTO Flights VALUES ('16024', 'JAI', 'PAT', 21, 'PAS', '1111111', 1, 3400.00);
INSERT INTO Flights VALUES ('12324', 'PUR', 'ROU', 43, 'MINI', '1111111',4, 3735.00);
INSERT INTO Flights VALUES ('19876', 'SRI', 'KER', 34, 'PAS', '1111111', 5, 4220.00);
INSERT INTO Flights VALUES ('13278', 'RNC', 'KOL', 56, 'BOE', '1111111', 2, 6185.00);
INSERT INTO Flights VALUES ('15335', 'DEL', 'KOL', 198, 'A380','1111111',7, 5500.00);
INSERT INTO Flights VALUES ('14393', 'DEL', 'KOL', 30, 'BOE', '1111111', 2, 7775.00);
INSERT INTO Flights VALUES ('15938', 'DEL', 'KOL', 45, 'ATR', '1111111', 2, 1400.00);
INSERT INTO Flights VALUES ('13673', 'KOL', 'BOM', 100, 'BOE', '1111111', 2,3375.00);
INSERT INTO Flights VALUES ('17048', 'CHE', 'DEL', 20, 'ATR', '1111111', 3, 3150.00);
INSERT INTO Flights VALUES ('18976', 'CHE', 'KOL', 20, 'ATR', '1111111', 2, 2225.00);
INSERT INTO Flights VALUES ('12345', 'RNC', 'BLR', 22, 'ATR', '1111111', 3, 1975.00);
INSERT INTO Flights VALUES ('17654', 'UDP', 'BOM', 20, 'PAS', '1111111', 3, 4675.00);
INSERT INTO Flights VALUES ('13930', 'MNG', 'UDP', 25, 'MINI', '1111111',3, 3000.00);
INSERT INTO Flights VALUES ('14296', 'BLR', 'DEL', 123, 'A380','1111111', 5,1675.00);
INSERT INTO Flights VALUES ('13020', 'KOL', 'BLR', 34, 'BOE', '1111111', 4, 2145.00);
INSERT INTO Flights VALUES ('18743', 'BLR', 'BOM', 55, 'ATR', '1111111', 2, 1365.00);
INSERT INTO Flights VALUES ('19732', 'PAT', 'BLR', 44, 'PAS', '1111111', 2, 2465.00);
INSERT INTO Flights VALUES ('19898', 'DEL', 'GUH', 76, 'ATR', '1111111', 7, 2425.00);
INSERT INTO Flights VALUES ('13567', 'BOM', 'BHO', 24, 'A380','1111111', 9, 1965.00);
INSERT INTO Flights VALUES ('19712', 'SRI', 'DEL', 20, 'ATR', '1111111', 3, 3395.00);
INSERT INTO Flights VALUES ('17564', 'MAN', 'DEL', 60, 'ATR', '1111111', 3, 2995.00);
INSERT INTO Flights VALUES ('19345', 'JAM', 'DEL', 82, 'ATR', '1111111', 1, 1455.00);
INSERT INTO Flights VALUES ('19855', 'MNG', 'DEL', 28, 'ATR', '1111111', 5, 2335.00);

INSERT INTO Tickets VALUES ('1234567890', '18513', 'Hello world', 'M', 21, 'hello@gmail.com', '8674916754', '05-APR-19');
INSERT INTO Tickets VALUES ('1234567891', '19855', 'C++ python', 'F', 24, 'cpp@live.com', '9835720835', '07-APR-19');
INSERT INTO Tickets VALUES ('1234567892', '18743', 'Narendra Modi', 'M', 68, 'chowkidar@gmail.com', '8252484331', '09-APR-19');
INSERT INTO Tickets VALUES ('1234567893', '13020', 'Avi Solanki', 'M', 19, 'avi27.999@gmail.com', '9929078141', '11-APR-19');
INSERT INTO Tickets VALUES ('1234567894', '17654', 'Sourav Agrawal', 'M', 20, 'sourav123@gmail.com', '9929038141','10-APR-19');
INSERT INTO Tickets VALUES ('1234567895', '13567', 'Atika Tantiya', 'F', 19, 'atika@gmail.com', '9929098141', '09-APR-19');
INSERT INTO Tickets VALUES ('1234567896', '15938', 'Kriti Jaggi', 'F', 19, 'juggi@yahoo.com', '9929058141', '17-APR-19');
INSERT INTO Tickets VALUES ('3213123222', '19712', 'RSS', 'M', 99, 'RSS@raj.com', '9929058141', '15-APR-19');
INSERT INTO Tickets VALUES ('1234567898', '17564', 'Rahul Gandhi', 'M', 51, 'juggi@yahoo.com', '9929058141', '14-APR-19');
INSERT INTO Tickets VALUES ('8872381231', '13930', 'Ojasvi', 'F', 19, 'ojasvi@yahoo.com', '9929058141', '15-APR-19');
INSERT INTO Tickets VALUES ('1323991123', '18743', 'Amit shah', 'M', 65, 'hitman@yahoo.com', '9929058141', '16-APR-19');
INSERT INTO Tickets VALUES ('8893299912', '19872', 'Kriti Jaggi', 'F', 19, 'juggi@yahoo.com', '9929058141', '19-APR-19');



INSERT INTO Booked VALUES ('18513', '05-APR-19', 11);
INSERT INTO Booked VALUES ('19855', '07-APR-19', 19);
INSERT INTO Booked VALUES ('18743', '09-APR-19', 19);
INSERT INTO Booked VALUES ('17654', '10-APR-19', 10);
INSERT INTO Booked VALUES ('13020', '11-APR-19', 2);
INSERT INTO Booked VALUES ('13567', '09-APR-19', 3);
INSERT INTO Booked VALUES ('15938', '09-APR-19' ,9);
INSERT INTO Booked VALUES ('15335', '13-APR-19', 20);
INSERT INTO Booked VALUES ('15938', '07-APR-19' ,8);
INSERT INTO Booked VALUES ('19712', '15-APR-19',20);
INSERT INTO Booked VALUES ('17564','14-APR-19' ,19);
INSERT INTO Booked VALUES ('13930','15-APR-19' ,13);
INSERT INTO Booked VALUES ('18743','16-APR-19' ,34);
INSERT INTO Booked VALUES ('19872','19-APR-19' ,77);



INSERT INTO Payment VALUES ('1234567890', '1234567890', '017500345273');
INSERT INTO Payment VALUES ('1234567891', '1234567891', '524237738992');
INSERT INTO Payment VALUES ('1234567892', '1234567892', '010029876256');
INSERT INTO Payment VALUES ('1234567893', '1234567893', '099988882222');
INSERT INTO Payment VALUES ('1234567894', '1234567894', '111122223333');
INSERT INTO Payment VALUES ('1234567895', '1234567895', '111822223333');
INSERT INTO Payment VALUES ('1234567896', '1234567896', '111022223333');
INSERT INTO Payment VALUES ('3213123222', '3213123222', '118122223333');
INSERT INTO Payment VALUES ('1234567898', '1234567898', '12345AA11223');
INSERT INTO Payment VALUES ('8872381231', '8872381231', '121333112331');
INSERT INTO Payment VALUES ('1323991123', '1323991123', '121332212331');
INSERT INTO Payment VALUES ('8893299912', '8893299912', '12132ddsff11');





-- CREATE OR REPLACE TRIGGER TicketBooking1
-- BEFORE INSERT ON Tickets
-- FOR EACH ROW
-- DECLARE
-- 	s_left Booked.seats_left%TYPE;
-- 	t_seat Flights.num_seats%TYPE;
-- 	rowCount number(10);
-- BEGIN
-- 	SELECT num_seats INTO t_seat FROM Flights WHERE Flight_no = :NEW.Flight_no;
-- 	SELECT seats_left, count(Flight_no) INTO s_left, rowCount FROM Booked WHERE Flight_no = :NEW.Flight_no AND book_date = :NEW.book_date;
-- 	IF (rowCount > 0) THEN
-- 		IF (s_left > 1) THEN
-- 			s_left := s_left - 1;
-- 			UPDATE Booked SET seats_left = s_left WHERE Flight_no = :NEW.Flight_no AND book_date = :NEW.book_date;
-- 		END IF;
-- 	ELSE
-- 		s_left := t_seat - 1;
-- 		INSERT INTO Booked VALUES (:NEW.Flight_no, :NEW.book_date, s_left);
-- 	END IF;
-- END;
-- /

-- CREATE OR REPLACE TRIGGER TicketBooking2
-- BEFORE DELETE ON Tickets
-- FOR EACH ROW
-- DECLARE
-- 	s_left Booked.seats_left%TYPE;
-- BEGIN
-- 	SELECT seats_left INTO s_left FROM Booked WHERE Flight_no = :NEW.Flight_no AND book_date = :NEW.book_date;
-- 	s_left := s_left + 1;
-- 	UPDATE Booked SET seats_left = s_left WHERE Flight_no = :NEW.Flight_no AND book_date = :NEW.book_date;
-- END;
-- /
