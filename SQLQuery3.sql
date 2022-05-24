USE Northwind
GO

-- 1 I did this in two ways. 1st query has 51% exec plan, and 2nd has 49%
SELECT DISTINCT e.City
FROM Employees as e JOIN Customers as c ON e.City = c.City

SELECT DISTINCT City
FROM Employees as e
WHERE e.City in (SELECT City FROM Customers)

-- 2
SELECT DISTINCT e.City
FROM Employees as e JOIN Customers as c ON e.City != c.City

SELECT DISTINCT City
FROM Employees as e
WHERE e.City not in (SELECT City FROM Customers)

-- 3
SELECT ProductID, [Name], Color, ListPrice
FROM Production.Product
WHERE Color IS NULL

-- 4
SELECT ProductID, [Name], Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL

-- 5
SELECT ProductID, [Name], Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0

-- 6
SELECT ProductID, [Name] + ' ' + Color NameColor, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL

-- 7
SELECT ProductID, 'NAME:'+[Name] + ' -- ' + 'COLOR: '+Color NameColor, ListPrice
FROM Production.Product
WHERE Color IN ('Black', 'Silver')
	AND ProductID < 332

-- 8
SELECT ProductID, [Name]
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500

-- 9
SELECT ProductID, [Name], Color
FROM Production.Product
WHERE Color IN ('Black', 'Blue')

-- 10
SELECT ProductID, [Name], Color
FROM Production.Product
WHERE [Name] LIKE 'S[a-z]%'

-- 11
SELECT [Name], ListPrice
FROM Production.Product
WHERE [Name] LIKE 'S[a-z]%'
ORDER BY ListPrice, [Name]

-- 12
SELECT [Name], ListPrice
FROM Production.Product
WHERE [Name] LIKE 'S[a-z]%' OR [Name] LIKE 'A[a-z]%'
ORDER BY [Name]

-- 13
SELECT [Name], ListPrice
FROM Production.Product
WHERE [Name] LIKE 'SPO[^k]%'
ORDER BY [Name]

-- 14
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color DESC

-- 15
SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID is not NULL
	AND Color is not NULL
