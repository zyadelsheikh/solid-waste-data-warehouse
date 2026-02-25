# Solid Waste Management Data Warehouse

## Project Overview

This project demonstrates the design and implementation of a Star Schema Data Warehouse using Microsoft SQL Server.  

The objective is to transform raw operational waste collection data into a structured analytical model that supports reporting and performance analysis.

---

## Architecture Overview

The project follows a structured ETL workflow:

1. Load raw CSV files into staging tables under the dbo schema  
2. Transform and clean data using T-SQL (type casting, formatting, validation)  
3. Load structured data into a dimensional model under the dmd schema  
4. Execute analytical queries for reporting and insights  

This architecture separates raw data from analytical structures to ensure data integrity and maintainability.

---

## Data Model

The warehouse is designed using a Star Schema model to optimize analytical query performance.

Fact Table:
- Fact_Trips  

Dimension Tables:
- Dim_Date  
- Dim_Station  
- Dim_Truck  

The Fact table stores measurable events (waste collected per trip), while Dimension tables provide descriptive context for analysis.

---

## Technologies Used

- Microsoft SQL Server   
- SQL Server Management Studio (SSMS)  

---

## Sample Analytical Query

```sql
SELECT 
    S.City,
    T.TruckType,
    SUM(F.WasteCollected) AS Total_Waste
FROM dmd.Fact_Trips F
JOIN dmd.Dim_Station S ON F.StationId = S.StationId
JOIN dmd.Dim_Truck T ON F.TruckId = T.TruckId
GROUP BY S.City, T.TruckType
ORDER BY Total_Waste DESC;
