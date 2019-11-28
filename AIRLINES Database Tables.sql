----------USER TABLE-----------

CREATE TABLE
USER_MASTER (Email_id varchar(30)NOT NULL PRIMARY KEY,
			 title varchar(10),
			 First_name varchar(30),
			 Last_name varchar(30),
			 
			 Password varchar(30),
			 DOB date,
			 Gender varchar(20),
			 Ph_no varchar(20));
                     
					 
--------ADMIN---------------
CREATE TABLE 
ADMIN_MASTER (admin_id NUMBER(20) NOT NULL PRIMARY KEY,
			  name varchar(30),
			  email_id varchar(30),
			  password varchar(30));
			  
---------FLIGHT TABLE-------------------------
CREATE TABLE 
FLIGHT_MASTER(Flight_id varchar(30) NOT NULL PRIMARY KEY,
			  arrival_time VARCHAR(10),
			  departure_time VARCHAR(10),
			  Business_seats NUMBER(20),
			  Economy_seats NUMBER(20),
			  Route_id varchar(10)  REFERENCES ROUTE_MASTER(ROUTE_ID)),
			   Base_fare_eco NUMBER(20),
				  Base_fare_busi NUMBER(20),
				  Fuel_charge NUMBER(20),
				    Security_fee NUMBER(20),
					 Dev_fee NUMBER(20);

			  
-----------ROUTE---------
CREATE TABLE 
ROUTE_MASTER(Route_id varchar(10) NOT NULL PRIMARY KEY,
			  Source VARCHAR(30),
			  Destination varchar(30));
			  
------------------BOOKING----------------------------
CREATE TABLE 
BOOKING_MASTER(Booking_id varchar(50) NOT NULL PRIMARY KEY,
			    booking_Class VARCHAR(30),
				booking_date date,
				journey_date date,
				b_class varchar(30),
				Passenger_count number(20),
				Flight_id varchar(30)  REFERENCES FLIGHT_MASTER(FLIGHT_ID),
				email_id varchar(30)  REFERENCES USER_MASTER(email_id),
				total_fare number(20),
				status varchar(20));
				
				
				

------------------PASSENGER TABLE-------------------------------------
CREATE TABLE 
PASSENGER_MASTER (Passenger_id NUMBER(30) NOT NULL PRIMARY KEY,
                   FIRST_NAME VARCHAR(30),
					LAST_NAME VARCHAR(30),
					AGE NUMBER(30),
					GENDER VARCHAR(30),
					email_id varchar(30),
					BOOKING_ID varchar(20) REFERENCES BOOKING_MASTER(BOOKING_ID));


--------------------PAYMENT TABLE------------------------------------
CREATE TABLE PAYMENT(PAYMENT_ID NUMBER NOT NULL PRIMARY KEY,
CARD_NUMBER VARCHAR(20),
CARD_TYPE VARCHAR(20),
NAME VARCHAR(30),
BOOKING_ID VARCHAR(20) REFERENCES BOOKING_MASTER(BOOKING_ID));
					