CREATE DATABASE bus_ticketing_db;
USE bus_ticketing_db;

-- TABLE 1: Operator

CREATE TABLE Operator (
    operator_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(15) NOT NULL UNIQUE,
    license_no VARCHAR(20) NOT NULL UNIQUE
);
 

-- TABLE 2: Bus

CREATE TABLE Bus (
    bus_id VARCHAR(10) PRIMARY KEY,
    bus_no VARCHAR(10) NOT NULL UNIQUE,
    type VARCHAR(20) NOT NULL CHECK (type IN ('AC' , 'Non-AC', 'Sleeper', 'Double Decker')),
    total_seats INT NOT NULL CHECK (total_seats > 0),
    operator_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (operator_id)
        REFERENCES Operator (operator_id)
        ON DELETE CASCADE
);

ALTER TABLE Bus 
MODIFY bus_no VARCHAR(20) NOT NULL UNIQUE; 


-- TABLE 3: Route

CREATE TABLE Route (
    route_id VARCHAR(10) PRIMARY KEY,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    distance_km DECIMAL(8 , 2 ) NOT NULL CHECK (distance_km > 0)
);
 

-- TABLE 4: Passenger

CREATE TABLE Passenger (
    passenger_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    nid VARCHAR(20) NOT NULL UNIQUE
);
 

-- TABLE 5: Schedule

CREATE TABLE Schedule (
    schedule_id VARCHAR(10) PRIMARY KEY,
    bus_id VARCHAR(10) NOT NULL,
    route_id VARCHAR(10) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    fare DECIMAL(8 , 2 ) NOT NULL CHECK (fare > 0),
    available_seats INT NOT NULL CHECK (available_seats >= 0),
    FOREIGN KEY (bus_id)
        REFERENCES Bus (bus_id)
        ON DELETE CASCADE,
    FOREIGN KEY (route_id)
        REFERENCES Route (route_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_times CHECK (arrival_time > departure_time)
);
 

-- TABLE 6: Ticket

CREATE TABLE Ticket (
    ticket_id VARCHAR(10) PRIMARY KEY,
    passenger_id VARCHAR(10) NOT NULL,
    schedule_id VARCHAR(10) NOT NULL,
    seat_no VARCHAR(5) NOT NULL,
    booking_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    status VARCHAR(15)  NOT NULL DEFAULT 'Pending'
                               CHECK (status IN ('Confirmed', 'Cancelled', 'Pending')),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id)  REFERENCES Schedule(schedule_id)   ON DELETE CASCADE,
    UNIQUE (schedule_id, seat_no)   -- prevent double-booking same seat on same schedule
);
 

-- TABLE 7: Payment

CREATE TABLE Payment (
    payment_id VARCHAR(10)  PRIMARY KEY,
    ticket_id VARCHAR(10)  NOT NULL UNIQUE,
    amount DECIMAL(8,2) NOT NULL CHECK (amount >= 0),
    method VARCHAR(20)  NOT NULL CHECK (method IN ('Cash', 'bKash', 'Nagad', 'Card', 'Refunded')),
    payment_date  DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE
);
