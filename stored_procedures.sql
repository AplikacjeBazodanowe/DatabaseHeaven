USE databaseheaven;
/* Oddokowanie */
DROP PROCEDURE IF EXISTS oddokuj;

DELIMITER //
CREATE PROCEDURE oddokuj(zadok INT, data DATETIME, user INT)
root:BEGIN
    DECLARE kontrh, oplataZaDokowanie, statk,
            iloscPozytywnychKontroliCelnych, iloscLadunkow, czyJuzIstnieje, czyZadokowano INTEGER;
    
    SET czyJuzIstnieje = 0;
    SET czyZadokowano = 0;
    
    SELECT z.id_Statek FROM Zadokowany z
    WHERE z.id_zadokowany = zadok
    INTO statk;
    
    SELECT k.id_Kontrahent FROM Statek s
    INNER JOIN Kontrahent k ON (k.id_Kontrahent = s.id_Kontrahent)
    WHERE s.id_Statek = statk INTO kontrh;
    
    
    SELECT COUNT(*) FROM Zadokowany z WHERE z.id_Zadokowany = zadok INTO czyZadokowano;
    
    IF czyZadokowano = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(5);
        SELECT "Blad! Nie zadokowano";
        LEAVE root;
    END IF;
    
    SELECT COUNT(*) FROM Oddokowany o WHERE o.data = data
        AND o.id_zadokowany = zadok AND o.id_Uzytkownik = user
        INTO czyJuzIstnieje;
        
    IF czyJuzIstnieje = 1 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(4);
        SELECT "Blad! Juz oddokowano";
        LEAVE root;
    END IF;
    
    
    SELECT DATEDIFF(z.data, data)*d.cena_Za_Pobyt FROM Zadokowany z
    INNER JOIN Dok d ON (z.id_Dok = d.id_Dok)
    WHERE z.id_Zadokowany = zadok INTO oplataZaDokowanie;
    
   
    
    SELECT COUNT(kc.czy_Pozytywna) FROM Ladunek l
    	INNER JOIN Przeladunek p ON (p.id_Ladunek = l.id_Ladunek)
	    INNER JOIN Statek s ON (p.id_Statek2 = statk) 
    	INNER JOIN Kontrola_Celna kc ON (kc.id_Ladunek = l.id_Ladunek)
    WHERE kc.czy_Pozytywna = 1 
    	AND p.czy_aktualne_polozenie = 1 
    	AND l.czy_kontrola_celna = 1
    INTO iloscPozytywnychKontroliCelnych;
    
    SELECT COUNT(l.id_Ladunek) FROM Ladunek l
    INNER JOIN Przeladunek p ON (p.id_Ladunek = l.id_Ladunek)
    INNER JOIN Statek s ON (p.id_Statek2 = statk)
    WHERE p.czy_aktualne_polozenie = 1 INTO iloscLadunkow;
    
    /* OK jesli wszystkie ladunki na statku przeszly pozytywna kontrole celna*/
    IF iloscLadunkow = iloscPozytywnychKontroliCelnych THEN
       START TRANSACTION;
       IF oplataZaDokowanie > 0 THEN
		   INSERT INTO Oplata(typ, kwota, czy_Oplacona, data_naliczenia, id_kontrahent, id_Uzytkownik) 
				VALUES ("Portowa(za dok)", oplataZaDokowanie, 0, data, kontrh, user);
		END IF;
       INSERT INTO Oddokowany(data, uwagi, id_zadokowany, id_Uzytkownik)
            VALUES(data, "Brak uwag", zadok, user); 
        select "Wszystko ok";
	   TRUNCATE TABLE Bledy_Operacji;        
       COMMIT;
    ELSE
       TRUNCATE TABLE Bledy_Operacji;
       INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(1);
       SELECT "nie ok";
    END IF;
 END
 //
DELIMITER ;
/* Zadokowanie */
DROP PROCEDURE IF EXISTS zadokuj;

DELIMITER //
CREATE PROCEDURE zadokuj(docNr INT, ship INT, data DATETIME, user INT)
root:BEGIN
    DECLARE maxLength, maxWidth, maxHeight, shipLength, shipWidth,
            shipHeight, typeMatches, nrOfDocked, nrOfUndocked, alreadyExists INT;
    
    SET typeMatches = 0;
    SET alreadyExists = 1;
    
    SELECT COUNT(*) 
		FROM Zadokowany z
		LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)				
	WHERE id_Oddokowany IS NULL
    	AND z.id_Statek = ship     
    INTO alreadyExists;    
    
    IF alreadyExists >= 1 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(7);
        SELECT "BLAD!: juz zadokowano";
        LEAVE root;
    END IF;
    
    SELECT maks_dlugosc_statku FROM Dok WHERE id_Dok = docNr INTO maxLength;
    SELECT dlugosc FROM Statek WHERE id_Statek = ship INTO shipLength;
    
    SELECT maks_szerokosc_statku FROM Dok WHERE id_Dok = docNr INTO maxWidth;
    SELECT szerokosc FROM Statek WHERE id_Statek = ship INTO shipWidth;
    
    SELECT maks_wysokosc_statku FROM Dok WHERE id_Dok = docNr INTO maxHeight;
    SELECT wysokosc FROM Statek WHERE id_Statek = ship INTO shipHeight;
    
    SELECT COUNT(*) FROM Zadokowany WHERE id_Dok = docNr INTO nrOfDocked;
    SELECT COUNT(*) FROM Zadokowany z
    INNER JOIN Oddokowany o ON (z.id_zadokowany = o.id_zadokowany)
    WHERE z.id_Dok = docNr INTO nrOfUndocked;
    
    IF nrOfDocked > nrOfUndocked THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(6);
        SELECT "BLAD!: dok nie jest pusty";
        LEAVE root;
    END IF;
    
    IF shipLength > maxLength OR shipHeight > maxHeight OR shipWidth > maxWidth THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(3);
        SELECT "BLAD!: statek sie nie zmiesci w doku";
        LEAVE root;
    END IF;
    
    SELECT COUNT(*) FROM Dok d
    INNER JOIN Terminal t ON (t.id_terminal = d.id_terminal)
    INNER JOIN Typ_Ladunku tl ON (tl.id_Typ_Ladunku = t.id_Typ_Ladunku)
    INNER JOIN Statek s ON (s.id_Typ_Ladunku = t.id_Typ_Ladunku)
    WHERE id_Dok = docNr AND s.id_Statek = ship INTO typeMatches;
    
    IF typeMatches = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(2);
        SELECT "BLAD!: statek ma inny typ niz terminal";
        LEAVE root;
    END IF;
    
    INSERT INTO Zadokowany(data, uwagi, id_Uzytkownik, id_Dok, id_Statek)
            VALUES(data, "Brak uwag", user, docNr, ship); 
    TRUNCATE TABLE Bledy_Operacji;
    SELECT "Wszystko ok!";
END
 //
DELIMITER ;

/* Odbior towaru */
DROP PROCEDURE IF EXISTS odbior;
DELIMITER //
CREATE PROCEDURE odbior(cargo INT, recipient INT, data DATETIME, user INT)
root:BEGIN
    DECLARE loadID, storeID, cost, tempCost, volume, storePrice INT;
    DECLARE data1, data2 DATETIME;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur1 CURSOR FOR SELECT p.id_Magazyn2, p.data FROM Przeladunek p
                                    WHERE p.id_Ladunek = cargo AND p.id_Magazyn2 IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SELECT p.id_Przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;
    
    SELECT p.id_Magazyn2 FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO storeID;

    SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
    INNER JOIN Towar t ON t.id_Towar = l.id_Towar
    WHERE l.id_Ladunek = cargo INTO volume;    

    START TRANSACTION;
    UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
    INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Magazyn1, id_Uzytkownik, id_Ladunek)
            VALUES (data, '', 1, storeID, user, cargo);
    
    INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES(data, '', recipient, cargo);
    OPEN cur1;
    read_loop: LOOP
        FETCH cur1 INTO storeID, data2;
        
        IF data1 IS NOT NULL THEN
            SELECT DATEDIFF(data1, data2)*volume*storePrice INTO tempCost;
            SET cost = cost + tempCost;
        END IF;

        SELECT cena_za_Przechowanie FROM Magazyn WHERE id_Magazyn = storeID INTO storePrice;
        SET data1 = data2;
        IF done THEN
          LEAVE read_loop;
        END IF;
     
    END LOOP;
    CLOSE cur1;

    INSERT INTO Oplata(typ, kwota, czy_oplacona, data_naliczenia, id_kontrahent, id_Uzytkownik)
                VALUES('portowa', cost, 0, date, recipient, user);
    
    COMMIT;
END
//
DELIMITER ;

/* Przeladunek, na statek - store = null, do mag - ship = nul */
DROP PROCEDURE IF EXISTS przeladuj;
DELIMITER //
CREATE PROCEDURE przeladuj(cargo INT, ship INT, store INT, data DATETIME, user INT)
root:BEGIN
    DECLARE loadID, taxChecked, typesMatch,
            sumVol, sumWeight, destMaxVol, destMaxWeight, destVol, destWeight,
            customer, cost INT;
    SET taxChecked = 0;
    SET typesMatch = 0;
    SET sumVol = 1;
    SET sumWeight = 1;
    SET destVol = 0;
    SET destWeight = 0;
    
    SELECT p.id_Przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;
    
    SELECT COUNT(kc.czy_Pozytywna) FROM Ladunek l
    INNER JOIN Kontrola_Celna kc ON (kc.id_Ladunek = l.id_Ladunek)
    WHERE kc.czy_Pozytywna = 1 AND l.id_Ladunek = cargo
    INTO taxChecked;
        
    SELECT n.id_Kontrahent FROM Nadanie_Ladunku n
    INNER JOIN Ladunek l on n.id_Ladunek = l.id_Ladunek
    WHERE l.id_Ladunek = cargo INTO customer;

    IF taxChecked = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(8);
        SELECT "BLAD!: ladunek nie przeszedl pozytywnej kontroli celnej";
        LEAVE root;
    END IF;
    
    SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
    INNER JOIN Towar t ON t.id_Towar = l.id_Towar
    WHERE l.id_Ladunek = cargo INTO sumVol;
    
    SELECT id_Magazyn2 FROM Przeladunek WHERE id_Przeladunek = loadId INTO sourceStore;
   
    IF ship IS NOT NULL THEN
        SELECT COUNT(*) FROM typ_Ladunku tl
        INNER JOIN Statek s ON (s.id_Typ_Ladunku = tl.id_Typ_Ladunku)
        INNER JOIN Towar t ON (t.id_Typ_Ladunku = tl.id_Typ_Ladunku)
        INNER JOIN Ladunek l ON (l.id_Towar = t.id_Towar)
        WHERE s.id_Statek = ship AND l.id_Ladunek = cargo
        INTO typesMatch;
        
        IF typesMatch = 0 THEN
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(9);
            SELECT "BLAD!: niezgodnosc typow statek - ladunek";
            LEAVE root;
        END IF;

        SELECT (t.masa_jednostkowa *l.ilosc) FROM Ladunek l
        INNER JOIN Towar t ON t.id_Towar = l.id_Towar
        WHERE l.id_Ladunek = cargo INTO sumWeight;

        SELECT ladownosc_masowa FROM Statek
        WHERE id_Statek = ship INTO destMaxWeight;

        SELECT aktualna_masa_ladunkow FROM Statek
        WHERE id_Statek = ship INTO destWeight;

        SELECT ladownosc_objetosciowa FROM Statek
        WHERE id_Statek = ship INTO destMaxVol;

        SELECT aktualna_objetosc_ladunkow FROM Statek
        WHERE id_Statek = ship INTO destVol;

        
        /* Jesli ladunek sie zmiesci na statku */
        IF sumVol < destMaxVol - destVol AND sumWeight < destMaxWeight - destWeight THEN
            START TRANSACTION;
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
            INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Statek2, id_Uzytkownik, id_Ladunek)
            VALUES (data, '', 1, ship, user, cargo);
            UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow + sumWeight WHERE id_Statek = ship;
            UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow + sumVol WHERE id_Statek = ship;
            COMMIT;
        ELSE 
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(11);
            SELECT "BLAD!: ladunek nie zmiesci sie na statku";
            LEAVE root;
        END IF;
        
    ELSEIF store IS NOT NULL THEN
        SELECT COUNT(*) FROM Magazyn m
        INNER JOIN Terminal ter ON (m.id_Terminal = ter.id_Terminal)
        INNER JOIN Towar t ON (t.id_Typ_Ladunku = ter.id_Typ_Ladunku)
        INNER JOIN Ladunek l ON (l.id_Towar = t.id_Towar)
        WHERE m.id_Magazyn = cargo AND l.id_Ladunek = cargo
        INTO typesMatch;
        
        IF typesMatch = 0 THEN
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(10);
            SELECT "BLAD!: niezgodnosc typow magazyn - ladunek";
            LEAVE root;
        END IF;

        SELECT pojemnosc FROM Magazyn
        WHERE id_Magazyn = store INTO destMaxVol;

        SELECT aktualna_objetosc_ladunkow FROM Magazyn
        WHERE id_Magazyn = store INTO destVol;
        
        IF sumVol < destMaxVol - destVol THEN
            START TRANSACTION;
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
            INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Magazyn2, id_Uzytkownik, id_Ladunek)
                VALUES (data, '', 1, store, user, cargo);
            UPDATE Magazyn SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow + sumVol WHERE id_Magazyn = store;
            COMMIT;
        ELSE 
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(12);
            SELECT "BLAD!: ladunek nie zmiesci sie w magazynie";
            LEAVE root;
        END IF;
    END IF;
END
//
DELIMITER ;
/* Pozytywna kontrola celna */
DROP TRIGGER IF EXISTS pozytywnaKontrolaCelna;
delimiter |

CREATE TRIGGER pozytywnaKontrolaCelna
AFTER INSERT ON Kontrola_Celna
FOR EACH ROW
root:BEGIN
    DECLARE user, cust, cost, positiv INT;
    
    SET positiv = NEW.czy_pozytywna;
    
    IF positiv = 0 THEN
        LEAVE root;
    END IF;
    
    SELECT user FROM Kontrola_Celna
    WHERE id_Kontrola_Celna = NEW.id_Kontrola_Celna
    INTO user;
    
    SELECT SUM(l.ilosc * t.clo_jednostkowe) FROM Kontrola_Celna k
    INNER JOIN Ladunek l ON (l.id_Ladunek = NEW.id_Ladunek)
    INNER JOIN Towar t ON (l.id_Towar = t.id_Towar)
    WHERE k.id_Kontrola_Celna = NEW.id_Kontrola_Celna
    INTO cost;
    
    SELECT nl.id_kontrahent FROM  Kontrola_Celna k
    INNER JOIN Ladunek l ON (l.id_Ladunek = NEW.id_Ladunek)
    INNER JOIN Nadanie_Ladunku nl ON (nl.id_Ladunek = NEW.id_Ladunek)
    WHERE k.id_Kontrola_Celna = NEW.id_Kontrola_Celna
    INTO cust;
    
    INSERT INTO Oplata(typ, kwota, czy_oplacona, data_naliczenia, id_kontrahent, id_Uzytkownik)
                VALUES('celna', cost, 0, CURRENT_DATE(), cust, user);
END;
|
delimiter ;


DROP PROCEDURE IF EXISTS przesunStatek;

delimiter |
CREATE PROCEDURE przesunStatek(dok1 INT, dok2 INT, ship INT, user INT, data DATETIME)
BEGIN
    START TRANSACTION;
        CALL oddokuj(dok1, data , user);
        CALL zadokuj(dok2, ship, data, user);
    COMMIT;    
END
|
delimiter ;

