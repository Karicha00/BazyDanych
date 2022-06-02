--1
WITH zapisywanie_danych_do_tabeli(JobTitle, BirthDate, MaritalStatus, Gender, HireDate, Rate)
AS
( 
SELECT JobTitle, BirthDate, MaritalStatus, Gender, HireDate, Rate
FROM humanresources.Employee JOIN 
humanresources.EmployeePayHistory ON humanresources.EmployeePayHistory.BusinessEntityID = humanresources.Employee.BusinessEntityID
)
SELECT JobTitle, BirthDate, MaritalStatus, Gender, HireDate, Rate
INTO #TempEmployeeInfo
FROM zapisywanie_danych_do_tabeli  
GROUP BY Rate, JobTitle, BirthDate, MaritalStatus, Gender, HireDate

SELECT * FROM #TempEmployeeInfo -- odczyt z nowoutworzonej tymczasowej tabeli

DROP TABLE #TempEmployeeInfo -- ewentualne usuwanie tabeli

-- 2
ALTER TABLE SalesLT.Customer
ADD CompanyContact VARCHAR(70); -- dodanie nowej kolumny w tabeli

UPDATE SalesLT.Customer
SET CompanyContact = concat(CompanyName, ' (', FirstName,' ',LastName,')') -- dodanie do tabeli nazwê firmy oraz imiê i nazwisko lidera, jak w przykladzie


WITH Przychody_ze_sprzedazy (CompanyContact, TotalDue)
AS
(
SELECT CompanyContact ,TotalDue FROM SalesLT.Customer JOIN
SalesLT.SalesOrderHeader ON SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID
)
SELECT CompanyContact, TotalDue as Revenue
FROM Przychody_ze_sprzedazy  
GROUP BY CompanyContact, TotalDue
ORDER BY CompanyContact

-- 3
With Zysk_sprzedazy(Name, LineTotal, ProductCategoryID)
AS
(
Select SalesLT.ProductCategory.Name, LineTotal, SalesLT.Product.ProductCategoryID
FROM SalesLT.ProductCategory JOIN
SalesLT.Product ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID 
JOIN SalesLT.SalesOrderDetail ON SalesOrderDetail.ProductID = SalesLT.Product.ProductID--
)
Select Name AS Category, Convert(Decimal(10,2), Round(SUM(LineTotal), 2)) AS SalesValue
FROM  Zysk_sprzedazy
GROUP BY ProductCategoryID, Name
ORDER BY Name ASC
