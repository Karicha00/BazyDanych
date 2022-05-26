CREATE TRIGGER 
	Nazwisko_duzymi_literami
ON 
	Person.Person
AFTER INSERT
AS
BEGIN
    UPDATE  Person.Person
    SET     LastName = UPPER(LastName)
	WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM inserted)
END;


-- ¿eby dodaæ do tabeli person.person now¹ osobê, trzeba by³o dodaæ najpierw dane do tabeli BusinessEntity
INSERT INTO person.BusinessEntity ( rowguid)
VALUES (NEWID());
--NEWID to funkcja, której u¿ywam do wygenerowania rowguid

INSERT INTO person.person (businessentityid, PersonType, firstname, lastname)
VALUES (20778, 'IN', 'Jan', 'Kowalski' );
--dodajê now¹ osobê do tabeli Person


SELECT * FROM person.person
ORDER BY BusinessEntityID DESC

