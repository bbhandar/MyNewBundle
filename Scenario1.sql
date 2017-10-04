/*
	Scenario 1:
	There was an error in the order entry system that caused duplicate order lines to get entered into the database. 
	Remove the duplicate order lines.
	BONUS: Modify the database so that this error cannot happen again.
*/
USE Kata;
GO

;WITH DeDuplicate
AS
(
	SELECT *,ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY SalesOrderID ) AS ROWNUM
	FROM [Sales].[SalesOrderDetail]
)
DELETE FROM DeDuplicate WHERE ROWNUM>1

