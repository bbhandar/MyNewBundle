/*
	Scenario 3:
	Steve is a warehouse supervisor with a staff of four to pick the orders. 
	Before the beginning of each shift, Steve splits all of the orders for the day into four lists, 
	one for each of his staff. 
	Tonight (2008-05-01), Bob called in sick. Write a query to split the orders into three equal lists.
*/

USE Kata;
GO

SELECT SOH.SalesOrderID,SODS.OrderQty,SODS.CarrierTrackingNumber, 
NTILE(3) OVER (ORDER BY SOH.OrderDate) AS [NTILE]
FROM [Sales].[SalesOrderDetail] SOD
INNER JOIN [Sales].[SalesOrderDetailStaging]SODS
ON SOD.SalesOrderDetailID=SODS.SalesOrderDetailID
INNER JOIN [Sales].[SalesOrderHeader] SOH
ON SODS.SalesOrderID=SOH.SalesOrderID
INNER JOIN [Sales].[SalesOrderHeaderStaging] SOHS
ON SOHS.SalesOrderID=SOH.SalesOrderID
WHERE SOHS.OrderDate='2008-05-01'