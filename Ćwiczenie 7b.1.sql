
CREATE OR REPLACE FUNCTION ciag_Fibonacciego(n INT) RETURNS VOID AS 
$$
DECLARE
	pierwszy_skladnik INT = 0;
	drugi_skladnik INT = 1;
	i INT = 0;
	wynik INT = 0;

BEGIN
		WHILE i < n LOOP
			RAISE NOTICE 'Liczba numer: %, wynik: %', i+1, pierwszy_skladnik;
			wynik = pierwszy_skladnik + drugi_skladnik;
			pierwszy_skladnik = drugi_skladnik;
			drugi_skladnik = wynik;
			i = i + 1;
		END LOOP;
END
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE wypisz_ciag_Fibonacciego(n INT)
LANGUAGE SQL
BEGIN ATOMIC
	SELECT ciag_Fibonacciego(35);
END;
CALL wypisz_ciag_Fibonacciego(35);