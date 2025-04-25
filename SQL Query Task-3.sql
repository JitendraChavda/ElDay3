-- Create Table
CREATE TABLE sales(
		Segment VARCHAR(30),
		Country VARCHAR(30),
		Product VARCHAR(30),
		DiscountBand VARCHAR(30),
		UnitsSold INT,
		ManufacturingPrice NUMERIC(10,2),
		SalePrice NUMERIC(10,2),
		GrossSales NUMERIC(10,2),
		Discounts INT,
		Sales NUMERIC(10,2),
		Profit NUMERIC(10,2),
		Dates DATE,
		MonthName VARCHAR(30)
);

-- Displaying Table
SELECT * FROM sales;

-- Import data from Database
COPY
sales(Segment,Country,Product,DiscountBand,UnitsSold,ManufacturingPrice,SalePrice,GrossSales,Discounts,Sales,Profit,Dates,MonthName)
FROM 'D:\01 Yamraj\02 books\03 Internships\01 Elevate Labs\Day 3 Task 3\ecommerce.CSV'
DELIMITER','
CSV HEADER;



-- Use of WHERE, SELECT, FROM (Canada Sales)
-- CREATE VIEW V1_Canada_Sales AS
SELECT *  
FROM sales  
WHERE country = 'Canada';



-- Use of aggregate functions (SUM, AVG), Group BY (Total Spending by Segment)
CREATE VIEW V2_Total_Spending_By_Segment AS 
SELECT segment, SUM(sales) AS total_spent  
FROM sales  
GROUP BY segment  

-- (Average Sales by Country)
CREATE VIEW V3_Average_Sales_By_Country AS 
SELECT Country, AVG(Sales) AS Average_Sales  
FROM Sales  
GROUP BY Country; 



-- Use of ORDER BY,(Ordered Sales by Date)
CREATE VIEW V4_Ordered_Sales_By_Date AS
SELECT *  
FROM sales
ORDER BY dates DESC;



-- (Products with No Discounts)
CREATE VIEW V5_Countries_No_Discount AS
SELECT Country  
FROM Sales  
WHERE DiscountBand = 'None'


-- use of subqueries(Countries with Specific Segments Based on Product in DiscountBand)
CREATE VIEW V6_Countries_With_Products_No_Discount AS
SELECT country  
FROM sales  
WHERE segment IN (  
    SELECT Product  
    FROM sales  
    WHERE discountband = 'None'  
); 



-- View Query Executer
SELECT * FROM V1_Canada_Sales;
SELECT * FROM V2_Total_Spending_By_Segment;  
SELECT * FROM V3_Average_Sales_By_Country;  
SELECT * FROM V4_Ordered_Sales_By_Date;  
SELECT * FROM V5_Countries_No_Discount;  
SELECT * FROM V6_Countries_With_Products_No_Discount;

