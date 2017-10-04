/*
	Scenario 2:
	New orders came into the staging area for (2008-05-01). 
	Merge these orders with the existing orders for the same date.
*/

USE Kata;
GO



MERGE [Sales].[SalesOrderHeader] AS T
USING [Sales].[SalesOrderHeaderStaging] S
ON T.SalesOrderID=S.SalesOrderID
WHEN MATCHED AND S.OrderDate='2008-05-01' THEN UPDATE
SET T.OrderDate=S.OrderDate
WHEN NOT MATCHED BY TARGET THEN 
INSERT  (SalesOrderId,OrderDate) VALUES(S.SalesOrderId,S.OrderDate);



