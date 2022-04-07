-- 1
CREATE DATABASE firma;


--2
CREATE SCHEMA rozliczenia;

--3
CREATE TABLE rozliczenia.pracownicy(
	id_pracownika INT PRIMARY KEY, 
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(20)  NOT NULL,
	adres VARCHAR(50) NOT NULL, 
	telefon VARCHAR(11) NOT NULL
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY NOT NULL,
    data_ date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL
);


CREATE TABLE rozliczenia.pensje (
    id_pensji INT PRIMARY KEY  NOT NULL,
    stanowisko varchar(60)  NOT NULL,
    kwota int NOT NULL,
    id_premii int  NOT NULL
);

CREATE TABLE rozliczenia.premie (
    id_premii INT PRIMARY KEY NOT NULL,
	rodzaj varchar(60),
    kwota int,
);


ALTER TABLE rozliczenia.godziny
    ADD FOREIGN KEY (id_pracownika)
    REFERENCES rozliczenia.pracownicy (id_pracownika);



ALTER TABLE rozliczenia.pensje
    ADD FOREIGN KEY (id_premii)
    REFERENCES rozliczenia.premie (id_premii);

-- 4
	
INSERT INTO rozliczenia.pracownicy VALUES
	(1, 'Kazimierz', 'Kowalski', 'ul. Jagodowa 6', '444 222 333'),
	(2, 'Tomasz', 'Nowak', 'ul. Porzeczkowa 14', '681 555 767'),
	(3, 'Mieczys³aw', 'Zieliñski', 'ul. Jab³kowa 9', '150 819 209'),
	(4, 'Andrzej', 'Urbañski', 'ul. Malinowa 29', '150 714 105'),
	(5, 'Franciszek', 'Adamczyk', 'ul. Brzoskwiniowa 2', '656 878 989'),
	(6, 'Agata', 'D³ugosz', 'ul. Agrestowa 5', '313 746 231'),
	(7, 'Maria', 'Sikorska', 'ul. Ananasowa 4', '987 213 451'),
	(8, 'Ma³gorzata', 'Szczêsna', 'ul. Gruszkowa 9', '203 512 832'),
	(9, 'Agnieszka', 'Mazowiecka', 'ul. Œliwkowa 86', '618 294 615'),
	(10, 'Kamila', 'Kozio³', 'ul. Wiœniowa 1', '812 957 125');


INSERT INTO rozliczenia.godziny VALUES
	(1, '2022-04-07', 175, 1),
	(2, '2022-03-25', 160, 2),
	(3, '2022-02-14', 154, 3),
	(4, '2022-03-15', 159, 4),
	(5, '2022-04-11', 172, 5),
	(6, '2022-01-07', 169, 6),
	(7, '2022-02-22', 180, 7),
	(8, '2021-12-10', 173, 8),
	(9, '2021-11-14', 171, 9),
	(10, '2022-01-31', 149, 10);



INSERT INTO rozliczenia.premie VALUES
	(1, NULL, NULL),
	(2, NULL, NULL),
	(3, 'Uznaniowa', 1000),
	(4, 'Regulaminowa', 1500),
	(5, NULL, NULL),
	(6, 'Motywacyjna', 500),
	(7, Null, Null),
	(8, 'Regulaminowa', 1200),
	(9, 'Uznaniowa', 1350),
	(10, NULL, NULL);

INSERT INTO rozliczenia.pensje VALUES
	(1, 'Ksiegowy', 4100, 1),
	(2, 'Ochroniarz', 3500, 2),
	(3, 'Admistrator', 7400, 3),
	(4, 'Dyrektor', 10500, 4),
	(5, 'Sprzatacz', 3000, 5),
	(6, 'Programista', 6200, 6),
	(7, 'Kucharz', 4500, 7),
	(8, 'Kierownik', 7500, 8),
	(9, 'Analityk', 6400, 9),
	(10, 'Programista', 6000, 10);


	-- 5
SELECT nazwisko, adres from rozliczenia.pracownicy;

	-- 6

SELECT DATEPART(weekday, data_), DATEPART(month, data_) from rozliczenia.godziny;


	-- 7

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN'; -- zmiana nazwy

SELECT id_pensji, stanowisko, id_premii, kwota_brutto, kwota_brutto*0.81 AS kwota_netto from rozliczenia.pensje;

