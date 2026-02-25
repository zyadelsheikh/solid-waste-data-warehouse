USE [dwh];
GO

/****** Object:  Schema [dmd] ******/
ALTER SCHEMA [dmd];
GO


-- Dimensions Tables


-- Truck dimension
CREATE TABLE Dim_Truck (
    TruckId INT PRIMARY KEY,
    TruckType VARCHAR(50)
);

-- Station dimension 
CREATE TABLE Dim_Station (
    StationId INT PRIMARY KEY,
    City VARCHAR(100)
);

-- Date dimension 
CREATE TABLE Dim_Date (
    DateKey INT PRIMARY KEY,        
    FullDate DATE,
    Day TINYINT,
    Month TINYINT,
    MonthName VARCHAR(20),
    Quarter TINYINT,
    Year SMALLINT
);

-- Fact Table

CREATE TABLE Fact_Trips (
    TripId INT PRIMARY KEY,
    StationId INT,
    TruckId INT,
    DateKey INT,
    WasteCollected DECIMAL(10,2),

    FOREIGN KEY (StationId) REFERENCES dmd.Dim_Station(StationId),
    FOREIGN KEY (TruckId) REFERENCES dmd.Dim_Truck(TruckId),
    FOREIGN KEY (DateKey) REFERENCES dmd.Dim_Date(DateKey)
);