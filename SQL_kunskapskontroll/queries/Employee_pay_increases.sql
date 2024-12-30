SELECT
	e.BusinessEntityID,
	e.JobTitle,
	e.HireDate,	
	MIN(h.Rate) AS "Starting rate",
	MAX(h.Rate) AS "Current rate",
	COUNT(h.RateChangeDate) AS "Number of pay increases",
	MAX(h.RateChangeDate) AS "Last pay increase"

FROM HumanResources.Employee AS e LEFT JOIN HumanResources.EmployeePayHistory AS h
	ON e.BusinessEntityID = h.BusinessEntityID


GROUP BY e.BusinessEntityID, e.JobTitle, e.Gender, e.HireDate
HAVING COUNT(h.RateChangeDate) > 1
ORDER BY "Current Rate" DESC
;