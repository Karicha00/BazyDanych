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


-- �eby doda� do tabeli person.person now� osob�, trzeba by�o doda� najpierw dane do tabeli BusinessEntity
INSERT INTO person.BusinessEntity ( rowguid)
VALUES (NEWID());
--NEWID to funkcja, kt�rej u�ywam do wygenerowania rowguid

INSERT INTO person.person (businessentityid, PersonType, firstname, lastname)
VALUES (20778, 'IN', 'Jan', 'Kowalski' );
--dodaj� now� osob� do tabeli Person


SELECT * FROM person.person
ORDER BY BusinessEntityID DESC

