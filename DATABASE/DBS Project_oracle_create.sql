--TABLES FOR MANIPAL AIRLINES WITH STRICT INTEGRITY CONSTRAINTS
  ---AUTHORS-----
---AVI SOLANKI---
---SOURAV AGRAWAL--


SET AUTOCOMMIT OFF;
DELETE TABLE Users;
DELETE TABLE Airport;
DELETE TABLE Flight;
DELETE TABLE Flight_Schedules;
DELETE TABLE Leg_instance;
DELETE TABLE Itinerary_Reservation;
DELETE TABLE Payment;
DELETE TABLE Reservation Payment; 



CREATE TABLE `Users` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(20) NOT NULL,
	`email` varchar(30) NOT NULL,
	`ph_no` varchar(10) NOT NULL,
	`password` varchar(15) NOT NULL,
	`access` INT(11) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `Airport` (
	`code` varchar(5) NOT NULL,
	`name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`state` varchar(30) NOT NULL,
	PRIMARY KEY (`code`)
);

CREATE TABLE `Flight` (
	`flight_id` INT(11) NOT NULL,
	`company_name` varchar(30) NOT NULL,
	`type` varchar(10) NOT NULL,
	`Total seats` INT(11) NOT NULL,
	PRIMARY KEY (`flight_id`)
);

CREATE TABLE `Flight_Schedules` (
	`flight_id` INT(11) NOT NULL,
	`ETD` TIMESTAMP NOT NULL,
	`ETA` TIMESTAMP NOT NULL,
	`dep_airport_code` varchar(5) NOT NULL,
	`arr_airport_code` varchar(5) NOT NULL,
	`date` DATE NOT NULL,
	`leg_id` INT(11) NOT NULL
);

CREATE TABLE `Leg_instance` (
	`leg_id` INT(11) NOT NULL,
	`ETA` TIMESTAMP NOT NULL,
	`ETD` TIMESTAMP NOT NULL,
	`flight_id` INT(11) NOT NULL,
	`Available Seats ` INT(11) NOT NULL,
	`Amount` FLOAT(11) NOT NULL
);

CREATE TABLE `Itinerary_Reservation` (
	`user_id` INT NOT NULL,
	`flight_id` INT NOT NULL,
	`ETA` TIMESTAMP NOT NULL,
	`ETD` TIMESTAMP NOT NULL,
	`dep_airport_code` varchar(5) NOT NULL,
	`arr_airport_code` varchar(5) NOT NULL,
	`res_id` INT(11) NOT NULL AUTO_INCREMENT,
	`leg_id` INT(11) NOT NULL,
	PRIMARY KEY (`res_id`)
);

CREATE TABLE `Payment` (
	`payment_id` INT(11) NOT NULL AUTO_INCREMENT,
	`Amount` INT(11) NOT NULL,
	PRIMARY KEY (`payment_id`)
);

CREATE TABLE `Reservation_payment` (
	`res_id` INT(11) NOT NULL,
	`payment_id` INT(11) NOT NULL
);

ALTER TABLE `Flight_Schedules` ADD CONSTRAINT `Flight_Schedules_fk0` FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`);

ALTER TABLE `Flight_Schedules` ADD CONSTRAINT `Flight_Schedules_fk1` FOREIGN KEY (`dep_airport_code`) REFERENCES `Airport`(`code`);

ALTER TABLE `Flight_Schedules` ADD CONSTRAINT `Flight_Schedules_fk2` FOREIGN KEY (`arr_airport_code`) REFERENCES `Airport`(`code`);

ALTER TABLE `Leg_instance` ADD CONSTRAINT `Leg_instance_fk0` FOREIGN KEY (`leg_id`) REFERENCES `Flight_Schedules`(`leg_id`);

ALTER TABLE `Leg_instance` ADD CONSTRAINT `Leg_instance_fk1` FOREIGN KEY (`flight_id`) REFERENCES `Flight_Schedules`(`flight_id`);

ALTER TABLE `Itinerary_Reservation` ADD CONSTRAINT `Itinerary_Reservation_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`);

ALTER TABLE `Itinerary_Reservation` ADD CONSTRAINT `Itinerary_Reservation_fk1` FOREIGN KEY (`flight_id`) REFERENCES `Flight_Schedules`(`flight_id`);

ALTER TABLE `Itinerary_Reservation` ADD CONSTRAINT `Itinerary_Reservation_fk2` FOREIGN KEY (`dep_airport_code`) REFERENCES `Flight_Schedules`(`dep_airport_code`);

ALTER TABLE `Itinerary_Reservation` ADD CONSTRAINT `Itinerary_Reservation_fk3` FOREIGN KEY (`arr_airport_code`) REFERENCES `Flight_Schedules`(`arr_airport_code`);

ALTER TABLE `Itinerary_Reservation` ADD CONSTRAINT `Itinerary_Reservation_fk4` FOREIGN KEY (`leg_id`) REFERENCES `Leg_instance`(`leg_id`);

ALTER TABLE `Reservation_payment` ADD CONSTRAINT `Reservation_payment_fk0` FOREIGN KEY (`res_id`) REFERENCES `Itinerary_Reservation`(`res_id`);

ALTER TABLE `Reservation_payment` ADD CONSTRAINT `Reservation_payment_fk1` FOREIGN KEY (`payment_id`) REFERENCES `Payment`(`payment_id`);

