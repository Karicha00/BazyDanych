-- Database: firma

-- DROP DATABASE IF EXISTS firma;

CREATE DATABASE firma

CREATE SCHEMA ksiegowosc;


CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika INT PRIMARY KEY, 
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(20)  NOT NULL,
	adres VARCHAR(50) NOT NULL, 
	telefon VARCHAR(11) NOT NULL
);


CREATE TABLE ksiegowosc.godziny (
    id_godziny INT PRIMARY KEY NOT NULL,
    data_ date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL
);


CREATE TABLE ksiegowosc.pensje (
    id_pensji INT PRIMARY KEY  NOT NULL,
    stanowisko varchar(60)  NOT NULL,
    kwota int NOT NULL
);

CREATE TABLE ksiegowosc.premie (
    id_premii INT PRIMARY KEY NOT NULL,
	rodzaj varchar(60),
    kwota int
);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INT PRIMARY KEY NOT NULL,
	data_ date NOT NULL,
	id_pracownika INT NOT NULL,
	id_godziny INT NOT NULL,
	id_pensji INT NOT NULL,
	id_premii INT NOT NULL
	);

ALTER TABLE ksiegowosc.godziny
	ADD FOREIGN KEY (id_pracownika)
		REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
    ADD FOREIGN KEY (id_pracownika)
		REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_godziny)
		REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_pensji)
		REFERENCES ksiegowosc.pensje(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_premii)
		REFERENCES ksiegowosc.premie(id_premii);
		
		
		
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela zawierająca listę pracowników firmy.';
COMMENT ON TABLE ksiegowosc.godziny IS 'Liczba przepracowanych godzin w miesiącu';
COMMENT ON TABLE ksiegowosc.pensje IS 'Wielkość pensji';
COMMENT ON TABLE ksiegowosc.premie IS 'Wielkość premii przyznanych pracownikom';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Informacje na temat wypłat';



	
INSERT INTO ksiegowosc.pracownicy VALUES
	(1, 'Kazimierz', 'Kowalski', 'ul. Jagodowa 6', '444 222 333'),
	(2, 'Tomasz', 'Nowak', 'ul. Porzeczkowa 14', '681 555 767'),
	(3, 'Mieczysław', 'Zieliński', 'ul. Jabłkowa 9', '150 819 209'),
	(4, 'Andrzej', 'Urbański', 'ul. Malinowa 29', '150 714 105'),
	(5, 'Franciszek', 'Adamczyk', 'ul. Brzoskwiniowa 2', '656 878 989'),
	(6, 'Agata', 'Długosz', 'ul. Agrestowa 5', '313 746 231'),
	(7, 'Maria', 'Sikorska', 'ul. Ananasowa 4', '987 213 451'),
	(8, 'Małgorzata', 'Szczęsna', 'ul. Gruszkowa 9', '203 512 832'),
	(9, 'Agnieszka', 'Mazowiecka', 'ul. Śliwkowa 86', '618 294 615'),
	(10, 'Kamila', 'Kozioł', 'ul. Wiśniowa 1', '812 957 125');


INSERT INTO ksiegowosc.godziny VALUES
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



INSERT INTO ksiegowosc.premie VALUES
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

INSERT INTO ksiegowosc.pensje VALUES
	(1, 'Ksiegowy', 4100),
	(2, 'Ochroniarz', 3500),
	(3, 'Admistrator', 7400),
	(4, 'Dyrektor', 10500),
	(5, 'Sprzatacz', 3000),
	(6, 'Programista', 6200),
	(7, 'Kucharz', 4500),
	(8, 'Kierownik', 7500),
	(9, 'Analityk', 6400),
	(10, 'Programista', 6000);


INSERT INTO ksiegowosc.wynagrodzenie VALUES
	(1, '2020-04-21', 1, 1, 1, 1),
	(2, '2020-04-20', 2, 2, 2, 2),
	(3, '2020-04-19', 3, 3, 3, 3),
	(4, '2020-04-18', 4, 4, 4, 4),
	(5, '2020-04-17', 5, 5, 5, 5),
	(6, '2020-04-17', 6, 6, 6, 6),
	(7, '2020-04-15', 7, 7, 7, 7),
	(8, '2020-04-14', 8, 8, 8, 8),
	(9, '2020-04-13', 9, 9, 9, 9),
	(10, '2020-04-12', 10, 10, 10, 10);

-- 6b
-- a

ALTER TABLE firma.ksiegowosc.pracownicy
ADD COLUMN telefon_dla_polski VARCHAR(18);

UPDATE firma.ksiegowosc.pracownicy
SET telefon_dla_polski = concat('(+48) ', telefon)
WHERE telefon is not NULL


--b

UPDATE firma.ksiegowosc.pracownicy
SET telefon_dla_polski = concat(
substring(telefon_dla_polski from 1 for 9), '-',
substring(telefon_dla_polski from 11 for 3), '-',
substring(telefon_dla_polski from 15 for 3))



WHERE telefon_dla_polski is not NULL

--c

SELECT (id_pracownika, upper(imie), upper(nazwisko), upper(adres), telefon_dla_polski)
FROM firma.ksiegowosc.pracownicy
ORDER BY length(nazwisko) DESC LIMIT 1;

--d

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

SELECT imie, nazwisko, adres,
       md5(cast(kwota as varchar))
FROM firma.ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;


--f
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS kwota_pensje, premie.kwota as kwota_premie
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii

--g
ALTER TABLE ksiegowosc.godziny
ADD COLUMN nadgodziny INTEGER;

UPDATE  ksiegowosc.godziny
SET nadgodziny = liczba_godzin - 160
WHERE liczba_godzin > 160;



SELECT ksiegowosc.pracownicy.id_pracownika,
       concat(
           'Pracownik ', imie, ' ', nazwisko,
           ' w dniu ', godziny.data_, ' otrzymał pensję całkowitą na kwotę ',
          	ROUND(pensje.kwota + coalesce(premie.kwota, 0) + coalesce(godziny.nadgodziny, 0) * 1.5 * pensje.kwota/160, 2), ' zł, gdzie wynagrodzenie zasadnicze wyniosło: ',
           	pensje.kwota, ' zł, premia: ', coalesce(premie.kwota, 0), ' zł, nadgodziny: ', ROUND(coalesce(godziny.nadgodziny, 0) * 1.5 * pensje.kwota/160, 2), 'zł')
--pensje.kwota/160 to w przybliżeniu zarobki na godzinę
--pomnożone przez 1.5, ze względu na to że nadgodziny są więcej płacone
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
LEFT JOIN ksiegowosc.godziny ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.godziny.id_godziny

















