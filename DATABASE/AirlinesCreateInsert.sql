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
					duration number(2),
					fare numeric(6,2) check(fare > 0),
					foreign key (from_id) references Airports(S_id),
					foreign key (to_id) references Airports(S_id));

CREATE TABLE Tickets(Ticket_no varchar(10) primary key,
					 Flight_no char(5),
					 passenger_name varchar(50) not null,
					 sex char(1) check (sex in ('M', 'F')),
					 age number(3) check (age > 5),
					 aadhar_no char(12) check (aadhar_no > 99999999999),
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

INSERT INTO Flights VALUES ('18513', 'RNC', 'DEL', 20, 'A380','0100100', 33, 2225.00);
INSERT INTO Flights VALUES ('14166', 'DEL', 'BOM', 20, 'ATR','1001010', 29, 1850.00);
INSERT INTO Flights VALUES ('12984', 'DEL', 'BOM', 20, 'A380','0100100', 30, 1950.00);
INSERT INTO Flights VALUES ('13984', 'DEL', 'BOM', 20, 'PAS', '0010001', 28, 1745.00);
INSERT INTO Flights VALUES ('17832', 'PUN', 'BHO', 20, 'MINI', '1010010', 22, 1155.00);
INSERT INTO Flights VALUES ('19872', 'BLR', 'KER', 20, 'ATR', '0100100', 37, 875.00);
INSERT INTO Flights VALUES ('16024', 'JAI', 'PAT', 20, 'PAS', '0010101', 13, 1900.00);
INSERT INTO Flights VALUES ('12324', 'PUR', 'ROU', 20, 'MINI', '1000100', 40, 735.00);
INSERT INTO Flights VALUES ('19876', 'SRI', 'KER', 20, 'PAS', '0010000', 52, 4220.00);
INSERT INTO Flights VALUES ('13278', 'RNC', 'KOL', 20, 'BOE', '0101010', 21, 1185.00);
INSERT INTO Flights VALUES ('15335', 'DEL', 'KOL', 20, 'A380','0010010', 27, 2500.00);
INSERT INTO Flights VALUES ('14393', 'DEL', 'KOL', 20, 'BOE', '1001000', 28, 2775.00);
INSERT INTO Flights VALUES ('15938', 'DEL', 'KOL', 20, 'ATR', '0100010', 28, 2400.00);
INSERT INTO Flights VALUES ('13673', 'KOL', 'BOM', 20, 'BOE', '1000100', 29, 2375.00);
INSERT INTO Flights VALUES ('17048', 'CHE', 'DEL', 20, 'ATR', '1001000', 28, 3150.00);
INSERT INTO Flights VALUES ('18976', 'CHE', 'KOL', 20, 'ATR', '0001000', 42, 2225.00);
INSERT INTO Flights VALUES ('12345', 'RNC', 'BLR', 20, 'ATR', '0100100', 34, 1975.00);
INSERT INTO Flights VALUES ('17654', 'UDP', 'BOM', 20, 'PAS', '1010100', 13, 675.00);
INSERT INTO Flights VALUES ('13930', 'MNG', 'UDP', 20, 'MINI', '1111111', 3, 300.00);
INSERT INTO Flights VALUES ('14296', 'BLR', 'DEL', 20, 'A380','1001000', 25, 1675.00);
INSERT INTO Flights VALUES ('13020', 'KOL', 'BLR', 20, 'BOE', '0100100', 34, 2145.00);
INSERT INTO Flights VALUES ('18743', 'BLR', 'BOM', 20, 'ATR', '1010100', 12, 1365.00);
INSERT INTO Flights VALUES ('19732', 'PAT', 'BLR', 20, 'PAS', '0010010', 32, 2465.00);
INSERT INTO Flights VALUES ('19898', 'DEL', 'GUH', 20, 'ATR', '0001000', 27, 2425.00);
INSERT INTO Flights VALUES ('13567', 'BOM', 'BHO', 20, 'A380','1000100', 19, 1965.00);
INSERT INTO Flights VALUES ('19712', 'SRI', 'DEL', 20, 'ATR', '0010000', 39, 3395.00);
INSERT INTO Flights VALUES ('17564', 'MAN', 'DEL', 20, 'ATR', '0100100', 37, 2995.00);
INSERT INTO Flights VALUES ('19345', 'JAM', 'DEL', 20, 'ATR', '0010010', 15, 1455.00);
INSERT INTO Flights VALUES ('19855', 'MNG', 'DEL', 20, 'ATR', '1000100', 26, 2335.00);

INSERT INTO Tickets VALUES ('1234567890', '18513', 'Hello world', 'M', 21, '653409860706', '8674916754', '05-APR-19');
INSERT INTO Tickets VALUES ('1234567891', '19855', 'C++ python', 'F', 24, '653409860707', '9835720835', '07-APR-19');
INSERT INTO Tickets VALUES ('1234567892', '18743', 'Narendra Modi', 'M', 68, '653409860708', '8252484331', '09-APR-19');
INSERT INTO Tickets VALUES ('1234567893', '13020', 'Avi Solanki', 'M', 19, '653409860709', '9929078141', '11-APR-19');
INSERT INTO Tickets VALUES ('1234567894', '17654', 'Sourav Agrawal', 'M', 20, '653409860710', '9929038141','10-APR-19');
INSERT INTO Tickets VALUES ('1234567895', '13567', 'Atika Tantiya', 'F', 19, '653409860711', '9929098141', '09-APR-19');
INSERT INTO Tickets VALUES ('1234567896', '15938', 'Kriti Jaggi', 'F', 19, '653409860712', '9929058141', '07-APR-19');
INSERT INTO Tickets VALUES ('1234567897', '15335', 'Gururaj', 'M', 49, '653409860713', '9929068141', '13-APR-19');


INSERT INTO Booked VALUES ('18513', '05-APR-19', 19);
INSERT INTO Booked VALUES ('19855', '07-APR-19', 19);
INSERT INTO Booked VALUES ('18743', '09-APR-19', 19);
INSERT INTO Booked VALUES ('17654', '10-APR-19', 10);
INSERT INTO Booked VALUES ('13020', '11-APR-19', 2);
INSERT INTO Booked VALUES ('13567', '09-APR-19', 3);
INSERT INTO Booked VALUES ('15938', '09-APR-19' ,9);
INSERT INTO Booked VALUES ('15335', '13-APR-19', 20);
INSERT INTO Booked VALUES ('15938', '07-APR-19' ,8);

INSERT INTO Payment VALUES ('1234567890', '1234567890', '017500345273');
INSERT INTO Payment VALUES ('1234567891', '1234567891', '524237738992');
INSERT INTO Payment VALUES ('1234567892', '1234567892', '010029876256');
INSERT INTO Payment VALUES ('1234567893', '1234567893', '099988882222');
INSERT INTO Payment VALUES ('1234567894', '1234567894', '111122223333');
INSERT INTO Payment VALUES ('1234567895', '1234567895', '111822223333');
INSERT INTO Payment VALUES ('1234567896', '1234567896', '111022223333');
INSERT INTO Payment VALUES ('1234567897', '1234567897', '118122223333');


