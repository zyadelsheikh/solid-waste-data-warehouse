-- =====================================
-- Sample Queries for Analysis
-- =====================================

-- Preview Fact Table
SELECT * FROM dmd.Fact_Trips;

-- Preview Dimension Tables
SELECT * FROM dmd.Dim_Truck;
SELECT * FROM dmd.Dim_Date;
SELECT * FROM dmd.Dim_Station;

-- Example Analytical Query
-- Total waste collected per city and truck type
SELECT 
    S.City,
    T.TruckType,
    SUM(F.WasteCollected) AS Total_Waste
FROM dmd.Fact_Trips F
JOIN dmd.Dim_Station S ON F.StationId = S.StationId
JOIN dmd.Dim_Truck T ON F.TruckId = T.TruckId
GROUP BY S.City, T.TruckType
ORDER BY Total_Waste DESC;