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
    
    
    SELECT DATEDIFF(data, z.data)*d.cena_Za_Pobyt FROM Zadokowany z
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
    WHERE p.czy_aktualne_polozenie = 1 AND l.czy_kontrola_celna = 1 INTO iloscLadunkow;
    
    /* OK jesli wszystkie ladunki na statku przeszly pozytywna kontrole celna*/
    IF iloscLadunkow <= iloscPozytywnychKontroliCelnych THEN
       START TRANSACTION;
       IF oplataZaDokowanie > 0 THEN
		   INSERT INTO Oplata(typ, kwota, czy_Oplacona, data_naliczenia, id_kontrahent, id_Uzytkownik) 
				VALUES ('Portowa (za dok)', oplataZaDokowanie, 0, data, kontrh, user);
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

/* Odbior ładunku */
DROP PROCEDURE IF EXISTS odbior;
DELIMITER //
CREATE PROCEDURE odbior(cargo INT, recipient INT, user INT, remarks TEXT)
root:BEGIN
    DECLARE loadID, storeID, oldStore, shipID, cost, tempCost, volume, mass, storePrice, taxChecked INT;
    DECLARE data1, data2 DATETIME;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur1 CURSOR FOR SELECT p.id_Magazyn2, p.data FROM Przeladunek p
                                    WHERE p.id_Ladunek = cargo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SELECT COUNT(*) FROM Ladunek l
			LEFT OUTER JOIN Kontrola_Celna kc USING(id_Ladunek)
			WHERE (kc.czy_Pozytywna = TRUE OR l.czy_kontrola_celna=FALSE) AND l.id_Ladunek = cargo
	INTO taxChecked;
    
    IF taxChecked = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(8);
        SELECT "BLAD!: ladunek nie przeszedl pozytywnej kontroli celnej";
        LEAVE root;
    END IF;
    
    SELECT p.id_Przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;
    
    SELECT p.id_Magazyn2 FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO storeID;
    
    SELECT p.id_Statek2 FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO shipID;    

    SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
    INNER JOIN Towar t ON t.id_Towar = l.id_Towar
    WHERE l.id_Ladunek = cargo INTO volume;    

    SELECT (t.masa_jednostkowa *l.ilosc) FROM Ladunek l
    INNER JOIN Towar t ON t.id_Towar = l.id_Towar
    WHERE l.id_Ladunek = cargo INTO mass;    

    START TRANSACTION;
    UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
    INSERT INTO Przeladunek VALUES (NULL, NOW(), NULL, 1, shipID, NULL, storeID, NULL, user, cargo);   
    
    IF shipID IS NOT NULL THEN
        UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow - mass WHERE id_Statek = shipID;
        UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - volume WHERE id_Statek = shipID;
    ELSEIF storeID IS NOT NULL THEN
        UPDATE Magazyn SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - volume WHERE id_Magazyn = storeID;	        
    END IF;
    
    INSERT INTO Odbior_Ladunku VALUES(NULL, NOW(), recipient, cargo);
	SET cost=0;            
	SET oldStore=NULL;            
    OPEN cur1;
    read_loop: LOOP
        FETCH cur1 INTO storeID, data2;
        
        IF oldStore IS NOT NULL THEN
	        SELECT cena_za_Przechowanie FROM Magazyn WHERE id_Magazyn = oldStore INTO storePrice;        
            SELECT DATEDIFF(data2,data1)*volume*storePrice INTO tempCost;
            SET cost = cost + tempCost;
        END IF;

        SET data1 = data2;
        SET oldStore = storeID;        
        IF done THEN
          LEAVE read_loop;
        END IF;
     
    END LOOP;
    CLOSE cur1;
	
	IF cost>0 THEN
		INSERT INTO Oplata(typ, kwota, czy_oplacona, data_naliczenia, id_kontrahent, id_Uzytkownik)
		            VALUES('Portowa (za magazyn)', cost, 0, NOW(), recipient, user);
    END IF;
    
    COMMIT;
END
//
DELIMITER ;

/* Nadanie ładunku */
/*ship, store jak w przeładunek. MySQL nie obsługuje zagnieżdżonych transakcji, więc trzeba było to
zrobić ręcznie (sprawdzamy czy wstawił się rekord do przeładunku, jak nie to usuwamy to co wstawilismy)*/
DROP PROCEDURE IF EXISTS nadanie;
DELIMITER //
CREATE PROCEDURE nadanie(commodity INT, amount INT, sender INT, dutyControl BOOLEAN , ship INT, store INT, user INT, remarks TEXT)
root:BEGIN
	DECLARE newID, cargoCount INT;
	SELECT count(*) FROM Ladunek INTO cargoCount;
	IF cargoCount=0 THEN
		SET newID=1;
	ELSE
		SELECT max(id_Ladunek)+1 FROM Ladunek INTO newID;
	END IF;
	INSERT INTO Ladunek VALUES(newID,amount,commodity,dutyControl);	
	INSERT INTO Nadanie_Ladunku VALUES(NULL,NOW(),sender,newID);	
	CALL przeladuj(newID, ship, store, user, remarks,TRUE);
	SELECT count(*) FROM Przeladunek WHERE id_Ladunek=newID INTO cargoCount;
	IF cargoCount=0 THEN
	    DELETE FROM Ladunek WHERE id_Ladunek=newID;
	    DELETE FROM Nadanie_Ladunku WHERE id_Ladunek=newID;	    
	END IF;
END
//
DELIMITER ;

/* Przeladunek, na statek - store = null, do mag - ship = nul */
DROP PROCEDURE IF EXISTS przeladuj;
DELIMITER //
CREATE PROCEDURE przeladuj(cargo INT, ship INT, store INT, user INT, remarks TEXT, ignoreDuty BOOLEAN)
root:BEGIN
    DECLARE loadID, taxChecked, typesMatch, sourceStore, sourceShip,
            sumVol, sumWeight, destMaxVol, destMaxWeight, destVol, destWeight,
			cost INT;
    SET taxChecked = 0;
    SET typesMatch = 0;
    SET sumVol = 1;
    SET sumWeight = 1;
    SET destVol = 0;
    SET destWeight = 0;
    START TRANSACTION;    
    SELECT p.id_Przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;

	IF ignoreDuty=FALSE THEN
		SELECT COUNT(*) FROM Ladunek l
			LEFT OUTER JOIN Kontrola_Celna kc USING(id_Ladunek)
			WHERE (kc.czy_Pozytywna = TRUE OR l.czy_kontrola_celna=FALSE) AND l.id_Ladunek = cargo
		INTO taxChecked;
	ELSE
		SET taxChecked = 1;
    END IF;    
    
    IF taxChecked = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(8);
        SELECT "BLAD!: ladunek nie przeszedl pozytywnej kontroli celnej";
        LEAVE root;
    END IF;    
    
    SELECT id_Magazyn2 FROM Przeladunek WHERE id_Przeladunek = loadId INTO sourceStore;
    SELECT id_Statek2 FROM Przeladunek WHERE id_Przeladunek = loadId INTO sourceShip;
    
    IF ship=sourceShip OR store=sourceStore THEN
		TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(13);
        LEAVE root;
    END IF; 
    
    SELECT (t.masa_jednostkowa *l.ilosc) FROM Ladunek l
        INNER JOIN Towar t ON t.id_Towar = l.id_Towar
        WHERE l.id_Ladunek = cargo INTO sumWeight;
    SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
        INNER JOIN Towar t ON t.id_Towar = l.id_Towar
        WHERE l.id_Ladunek = cargo INTO sumVol;   
   
    IF ship IS NOT NULL THEN
        SELECT COUNT(*) FROM Typ_Ladunku tl
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

        SELECT ladownosc_masowa FROM Statek
        WHERE id_Statek = ship INTO destMaxWeight;

        SELECT aktualna_masa_ladunkow FROM Statek
        WHERE id_Statek = ship INTO destWeight;

        SELECT ladownosc_objetosciowa FROM Statek
        WHERE id_Statek = ship INTO destMaxVol;

        SELECT aktualna_objetosc_ladunkow FROM Statek
        WHERE id_Statek = ship INTO destVol;
        
        SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
    	INNER JOIN Towar t ON t.id_Towar = l.id_Towar
	    WHERE l.id_Ladunek = cargo INTO sumVol;
        
        /* Jesli ladunek sie zmiesci na statku */
        IF sumVol <= destMaxVol - destVol AND sumWeight <= destMaxWeight - destWeight THEN
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
	        INSERT INTO Przeladunek	VALUES (NULL, NOW(), remarks, 1, sourceShip, ship, sourceStore, NULL, user, cargo);
	        IF sourceShip IS NOT NULL THEN
                UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow - sumWeight WHERE id_Statek = sourceShip;
	            UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - sumVol WHERE id_Statek = sourceShip;
	        ELSEIF sourceStore IS NOT NULL THEN
	            UPDATE Magazyn SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - sumVol WHERE id_Magazyn = sourceStore;	        
	        END IF;
            UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow + sumWeight WHERE id_Statek = ship;
            UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow + sumVol WHERE id_Statek = ship;
            TRUNCATE TABLE Bledy_Operacji;            
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
        WHERE m.id_Magazyn = store AND l.id_Ladunek = cargo
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
        
        IF sumVol <= destMaxVol - destVol THEN
            START TRANSACTION;
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_Przeladunek = loadID;
	        INSERT INTO Przeladunek	VALUES (NULL, NOW(), remarks, 1, sourceShip, NULL, sourceStore, store, user, cargo);
            UPDATE Magazyn SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow + sumVol WHERE id_Magazyn = store;
	        IF sourceShip IS NOT NULL THEN
                UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow - sumWeight WHERE id_Statek = sourceShip;
	            UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - sumVol WHERE id_Statek = sourceShip;
	        ELSEIF sourceStore IS NOT NULL THEN
	            UPDATE Magazyn SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - sumVol WHERE id_Magazyn = sourceStore;	        
	        END IF;
            TRUNCATE TABLE Bledy_Operacji;            
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

DROP PROCEDURE IF EXISTS przesunStatek;

delimiter |
CREATE PROCEDURE przesunStatek(dok1 INT, dok2 INT, ship INT, user INT, data DATETIME)
BEGIN
	DECLARE error INT; 	
    CALL oddokuj(dok1, data , user);
    SELECT count(*) FROM Bledy_Operacji INTO error;
    IF error=0 THEN
        CALL zadokuj(dok2, ship, data, user);        
	END IF;	           
END
|
delimiter ;

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
    
    SELECT l.ilosc * t.clo_jednostkowe FROM Kontrola_Celna k
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
                VALUES('Celna (cło)', cost, 0, NOW(), cust, user);
END
|
delimiter ;

DROP PROCEDURE IF EXISTS konfiskata;

delimiter |
CREATE PROCEDURE konfiskata(cargo INT, remarks TEXT, user INT)
BEGIN
	DECLARE ship_id, sumWeight, sumVol INT;
	START TRANSACTION;
	SELECT id_Statek2 
		FROM Przeladunek 
			INNER JOIN Ladunek USING(id_Ladunek) 
		WHERE id_Ladunek=cargo AND czy_aktualne_polozenie=TRUE
	INTO ship_id;
	SELECT (t.masa_jednostkowa *l.ilosc) FROM Ladunek l
        INNER JOIN Towar t ON t.id_Towar = l.id_Towar
        WHERE l.id_Ladunek = cargo INTO sumWeight;
    SELECT (t.objetosc_jednostkowa *l.ilosc) FROM Ladunek l
        INNER JOIN Towar t ON t.id_Towar = l.id_Towar
        WHERE l.id_Ladunek = cargo INTO sumVol;   
	INSERT INTO Kontrola_Celna VALUES(NULL,remarks,FALSE,NOW(),user,cargo);
	UPDATE Statek SET aktualna_masa_ladunkow = aktualna_masa_ladunkow - sumWeight WHERE id_Statek = ship_id;
    UPDATE Statek SET aktualna_objetosc_ladunkow = aktualna_objetosc_ladunkow - sumVol WHERE id_Statek = ship_id;
    UPDATE Przeladunek SET czy_aktualne_polozenie = FALSE WHERE id_Ladunek = cargo AND czy_aktualne_polozenie = TRUE;		
	INSERT INTO Przeladunek VALUES(NULL,NOW(),NULL,TRUE,ship_id,NULL,NULL,NULL,user,cargo);	
	COMMIT; 
END
|
delimiter ;
