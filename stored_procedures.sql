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
    WHERE s.id_statek = statk INTO kontrh;
    
    
    SELECT COUNT(*) FROM Zadokowany z WHERE z.id_Zadokowany = zadok INTO czyZadokowano;
    
    IF czyZadokowano = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(5);
        SELECT "Blad! Nie zadokowano";
        LEAVE root;
    END IF;
    
    SELECT COUNT(*) FROM Oddokowany o WHERE o.data = data
        AND o.id_zadokowany = zadok AND o.id_uzytkownik = user
        AND o.id_statek = statk INTO czyJuzIstnieje;
        
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
    WHERE kc.czy_Pozytywna = 1 AND p.czy_aktualne_polozenie = 1
    INTO iloscPozytywnychKontroliCelnych;
    
    SELECT COUNT(l.id_Ladunek) FROM Ladunek l
    INNER JOIN Przeladunek p ON (p.id_Ladunek = l.id_Ladunek)
    INNER JOIN Statek s ON (p.id_Statek2 = statk)
    WHERE p.czy_aktualne_polozenie = 1 INTO iloscLadunkow;
    
    /* OK jesli wszystkie ladunki na statku przeszly pozytywna kontrole celna*/
    IF iloscLadunkow = iloscPozytywnychKontroliCelnych THEN
       INSERT INTO Oplata(typ, kwota, czy_Oplacona, data_naliczenia, id_kontrahent, id_uzytkownik) 
            VALUES ("Portowa", oplataZaDokowanie, 0, data, kontrh, user);
       INSERT INTO Oddokowany(data, uwagi, id_zadokowany, id_uzytkownik, id_statek)
            VALUES(data, "Brak uwag", zadok, user, statk); 
        select "Wszystko ok";
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
    
    SELECT COUNT(*) FROM Zadokowany z 
    WHERE z.data = data AND z.id_Statek = ship 
    AND z.id_uzytkownik = user AND z.id_Dok = docNr
    INTO alreadyExists;
    
    IF alreadyExists = 1 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(7);
        SELECT "BLAD!: juz zadokowano";
        LEAVE root;
    END IF;
    
    SELECT maks_dlugosc_statku FROM Dok WHERE id_dok = docNr INTO maxLength;
    SELECT dlugosc FROM Statek WHERE id_Statek = ship INTO shipLength;
    
    SELECT maks_szerokosc_statku FROM Dok WHERE id_dok = docNr INTO maxWidth;
    SELECT szerokosc FROM Statek WHERE id_Statek = ship INTO shipWidth;
    
    SELECT maks_wysokosc_statku FROM Dok WHERE id_dok = docNr INTO maxHeight;
    SELECT wysokosc FROM Statek WHERE id_Statek = ship INTO shipHeight;
    
    SELECT COUNT(*) FROM Zadokowany WHERE id_dok = docNr INTO nrOfDocked;
    SELECT COUNT(*) FROM Zadokowany z
    INNER JOIN Oddokowany o ON (z.id_zadokowany = o.id_zadokowany)
    WHERE z.id_dok = docNr INTO nrOfUndocked;
    
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
    INNER JOIN Typ_Ladunku tl ON (tl.id_typ_ladunku = t.id_typ_Ladunku)
    INNER JOIN Statek s ON (s.id_typ_ladunku = t.id_typ_ladunku)
    WHERE id_dok = docNr AND s.id_statek = ship INTO typeMatches;
    
    IF typeMatches = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(2);
        SELECT "BLAD!: statek ma inny typ niz terminal";
        LEAVE root;
    END IF;
    
    INSERT INTO Zadokowany(data, uwagi, id_uzytkownik, id_dok, id_statek)
            VALUES(data, "Brak uwag", user, docNr, ship); 
    SELECT "Wszystko ok!";
END
 //
DELIMITER ;

/* Odbior towaru */
DROP PROCEDURE IF EXISTS odbior;
DELIMITER //
CREATE PROCEDURE odbior(cargo INT, recipient INT, data DATETIME, user INT)
root:BEGIN
    DECLARE loadID, storeID INT;
    
    SELECT p.id_przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;
    
    SELECT p.id_magazyn2 FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO storeID;
    
    UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_przeladunek = loadID;
    INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_magazyn1, id_uzytkownik, id_ladunek)
            VALUES (data, '', 1, storeID, user, cargo);
    
    INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES(data, '', recipient, cargo);
END
//
DELIMITER ;

/* Przeladunek, na statek - store = null, do mag - ship = nul, brakuje sprawdzania czy sie zmiesci ladunek */
DROP PROCEDURE IF EXISTS przeladuj;
DELIMITER //
CREATE PROCEDURE przeladuj(cargo INT, ship INT, store INT, data DATETIME, user INT)
root:BEGIN
    DECLARE loadID, taxChecked, typesMatch INT;
    SET taxChecked = 0;
    SET typesMatch = 0;
    
    SELECT p.id_przeladunek FROM Przeladunek p
    WHERE p.id_Ladunek = cargo AND p.czy_aktualne_polozenie = 1
    INTO loadID;
    
    SELECT COUNT(kc.czy_Pozytywna) FROM Ladunek l
    INNER JOIN Kontrola_Celna kc ON (kc.id_Ladunek = l.id_Ladunek)
    WHERE kc.czy_Pozytywna = 1 AND l.id_Ladunek = cargo
    INTO taxChecked;
    
    IF taxChecked = 0 THEN
        TRUNCATE TABLE Bledy_Operacji;
        INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(8);
        SELECT "BLAD!: ladunek nie przeszedl pozytywnej kontroli celnej";
        LEAVE root;
    END IF;
    
    
    IF ship IS NOT NULL THEN
        SELECT COUNT(*) FROM typ_Ladunku tl
        INNER JOIN Statek s ON (s.id_typ_ladunku = tl.id_typ_ladunku)
        INNER JOIN Towar t ON (t.id_typ_ladunku = tl.id_typ_ladunku)
        INNER JOIN Ladunek l ON (l.id_Towar = t.id_towar)
        WHERE s.id_Statek = ship AND l.id_Ladunek = cargo
        INTO typesMatch;
        
        IF typesMatch = 1 THEN
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_przeladunek = loadID;
            INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_statek2, id_uzytkownik, id_ladunek)
            VALUES (data, '', 1, ship, user, cargo);
            
        ELSE
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(9);
            SELECT "BLAD!: niezgodnosc typow statek - ladunek";
            LEAVE root;
        END IF;
        
    ELSEIF store IS NOT NULL THEN
        SELECT COUNT(*) FROM Magazyn m
        INNER JOIN Terminal ter ON (m.id_Terminal = ter.id_Terminal)
        INNER JOIN Towar t ON (t.id_typ_ladunku = ter.id_typ_ladunku)
        INNER JOIN Ladunek l ON (l.id_Towar = t.id_towar)
        WHERE m.id_Magazyn = cargo AND l.id_Ladunek = cargo
        INTO typesMatch;
        
        IF typesMatch = 1 THEN
            UPDATE Przeladunek SET czy_aktualne_polozenie = 0 WHERE id_przeladunek = loadID;
            INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_magazyn2, id_uzytkownik, id_ladunek)
                VALUES (data, '', 1, store, user, cargo);
        ELSE
            TRUNCATE TABLE Bledy_Operacji;
            INSERT INTO Bledy_Operacji(id_Kod_Bledu) VALUES(10);
            SELECT "BLAD!: niezgodnosc typow magazyn - ladunek";
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
    
    SELECT MIN(czy_Pozytywna) FROM NEW
    INTO positiv;
    
    IF positiv = 0 THEN
        LEAVE root;
    END IF;
    
    SELECT user FROM Kontrola_Celna
    WHERE id_Kontrola_Celna = NEW.id_Kontrola_Celna
    INTO user;
    
    SELECT SUM(l.ilosc * t.clo_jednostkowe) FROM NEW
    INNER JOIN Ladunek l ON (l.id_Ladunek = NEW.id_Ladunek)
    INNER JOIN Towar t ON (l.id_towar = t.id_towar)
    INTO cost;
    
    SELECT nl.id_kontrahent FROM NEW
    INNER JOIN Ladunek l ON (l.id_Ladunek = NEW.id_Ladunek)
    INNER JOIN Nadanie_Ladunku nl ON (nl.id_Ladunek = NEW.id_Ladunek)
    INTO cust;
    
    INSERT INTO Oplata(typ, kwota, czy_oplacona, data_naliczenia, id_kontrahent, id_uzytkownik)
                VALUES('celna', cost, 0, CURRENT_DATE(), cust, user);
END;
|

delimiter ;
