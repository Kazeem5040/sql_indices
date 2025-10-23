-- car_rental.sql
-- Create tables
CREATE TABLE Cars (
    CarID INTEGER PRIMARY KEY,
    Make TEXT,
    Model TEXT,
    Year INTEGER,
    Status TEXT -- Available, Rented, Maintenance
);

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Phone TEXT,
    Email TEXT
);

CREATE TABLE Rentals (
    RentalID INTEGER PRIMARY KEY,
    CarID INTEGER,
    CustomerID INTEGER,
    StartDate DATE,
    EndDate DATE,
    TotalPrice REAL,
    FOREIGN KEY(CarID) REFERENCES Cars(CarID),
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Maintenance (
    MaintenanceID INTEGER PRIMARY KEY,
    CarID INTEGER,
    Date DATE,
    Description TEXT,
    FOREIGN KEY(CarID) REFERENCES Cars(CarID)
);

-- Indexes for faster queries
CREATE INDEX idx_rentals_car ON Rentals(CarID);
CREATE INDEX idx_rentals_customer ON Rentals(CustomerID);
CREATE INDEX idx_cars_status ON Cars(Status);

-- Mock data
INSERT INTO Cars VALUES
(1, 'Toyota', 'Camry', 2022, 'Available'),
(2, 'Honda', 'Civic', 2021, 'Rented'),
(3, 'Ford', 'Mustang', 2020, 'Maintenance');

INSERT INTO Customers VALUES
(1, 'Alice', '123-456-7890', 'alice@email.com'),
(2, 'Bob', '234-567-8901', 'bob@email.com');

INSERT INTO Rentals VALUES
(1, 2, 1, '2025-10-01', '2025-10-05', 300.0);

INSERT INTO Maintenance VALUES
(1, 3, '2025-10-10', 'Oil change');

-- Example queries
-- 1. Find all available cars
SELECT * FROM Cars WHERE Status='Available';

-- 2. Find rental history of a customer
SELECT * FROM Rentals WHERE CustomerID=1;

-- 3. Find maintenance schedule for a car
SELECT * FROM Maintenance WHERE CarID=3;
