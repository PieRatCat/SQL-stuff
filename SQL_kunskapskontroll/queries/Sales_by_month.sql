WITH SalesMonth AS
	(SELECT	
			FORMAT(OrderDate, 'yyyy-MM') AS SalesMonth,
			TotalDue
		FROM Sales.SalesOrderHeader
	)
, TotalSales AS
	(SELECT	
		SalesMonth,
		SUM(TotalDue) AS TotalSales
	FROM SalesMonth
	GROUP BY SalesMonth	
	)
SELECT
		SalesMonth,
		TotalSales,
		AVG(TotalSales) OVER (ORDER BY SalesMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS '3 month average'
	FROM TotalSales
;