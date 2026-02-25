
-- Load Data into Fact Table

INSERT INTO dmd.Fact_Trips (TripId, StationId, TruckId, DateKey, WasteCollected)
SELECT 
    TripId,
    StationId,
    TruckId,
    Dateid, 
    WasteCollected  
FROM dbo.FactTrips;



-- Load Data into Dimension Tables

-- Load stations
INSERT INTO dmd.Dim_Station (StationId, City)
SELECT DISTINCT 
    CAST(StationId AS INT), 
    City 
FROM dbo.Dimstation;

-- Load trucks
INSERT INTO dmd.Dim_Truck (TruckId, TruckType)
SELECT  
   TruckId, 
   TruckType 
FROM dbo.DimTruck;

-- Load dates
INSERT INTO dmd.Dim_Date (DateKey, FullDate, Day, Month, MonthName, Quarter, Year)
SELECT 
    dateid,              
    date AS DATE,               
    Day,            
    Month,          
    Monthname,                        
    Quarter,        
    Year             
FROM dbo.DimDate;

