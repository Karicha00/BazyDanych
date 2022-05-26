CREATE TRIGGER taxRateMonitoring
ON AdventureWorks2019.Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
	DECLARE @stary_podatek FLOAT;
	DECLARE @nowy_podatek FLOAT;

	SELECT @stary_podatek = TaxRate FROM deleted
	SELECT @nowy_podatek = TaxRate FROM inserted

	IF  (((@nowy_podatek*100)/@stary_podatek)-100)>30
		print 'BLAD!!!, Za duza wartosc!';
END


UPDATE Sales.SalesTaxRate
SET TaxRate = 50
WHERE SalesTaxRateID = 1

SELECT * FROM Sales.SalesTaxRate
