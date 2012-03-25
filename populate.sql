/* Populacja bazy danych */

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(1, 'blad dokowania - nie wszystkie ladunki przeszly pozytywna kontrole celna');
    
INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(2, 'blad dokowania - typ ladunkow na statku nie zgodny z typem terminala');
    
INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(3, 'blad dokowania - statek nie miesci sie w doku');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(4, 'blad dokowania - juz oddokowano');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(5, 'blad dokowania - nie mozna oddokowac, bo statek nie jest zadokowany');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(6, 'blad dokowania - nie mozna zadokowac, bo dok nie jest pusty');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(7, 'blad dokowania - juz zadokowano');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(8, 'blad przeladowania - ladunek nie przeszedl pozytywnej kontroli celnej');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(9, 'blad przeladowania - typ ladunku niezgodny z typem statku');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(10, 'blad przeladowania - typ ladunku niezgodny z typem magazynu');



INSERT INTO Uzytkownik(nazwa, funkcja, haslo, sha1_Haslo, url_Obrazka)
    VALUES('Zygfryd Cietoglowy', 'Admin portu', 'dupa.8', '123123213213',
    'http://c.wrzuta.pl/wi19796/b6060a09002c38ea4cfd424e/mega_face_palm');
    
INSERT INTO Uzytkownik(nazwa, funkcja, haslo, sha1_Haslo, url_Obrazka)
    VALUES('Jurand Spychowicz', 'Admin ladunkow', 'dupa.9', '112666623213213',
    'http://www.nowaautorska.com/files/Jurand_1123.jpg');
    
INSERT INTO Uzytkownik(nazwa, funkcja, haslo, sha1_Haslo, url_Obrazka)
    VALUES('Johny Cash', 'Inspektor Celny', 'dupa.10', '112666623219999',
    'http://www.ted.com');

/* CREATE USER 'admin2'@'localhost' IDENTIFIED BY PASSWORD 'hash z hasla'; */
DROP USER 'admin2'@'localhost';
CREATE USER 'admin2'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON databaseheaven.* TO 'admin2'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
    
INSERT INTO Kontrahent(nazwa, adres, kraj, typ) VALUES ('FedEx', 'NY', 'USA', 'Nadawca');
INSERT INTO Kontrahent(nazwa, adres, kraj, typ) VALUES ('UPS', 'LA', 'USA', 'Odbiorca');
INSERT INTO Kontrahent(nazwa, adres, kraj, typ) VALUES ('Maersk', 'Copenhagen', 'Denmark', 'Armator');



INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Kontenerowiec', 'Kontenery', 'Kontenerowy', 'tona', 'metr szescienny');

INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Tankowiec', 'Przetwory naftowe', 'Naftowy', 'tona', 'litr');
            
INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Masowiec', 'Surowiec', 'Masowy', 'tona', 'metr szescienny');

INSERT INTO Terminal(nazwa, id_typ_ladunku) VALUES ('Euromax', 1);
INSERT INTO Terminal(nazwa, id_typ_ladunku) VALUES ('Delta', 2);
INSERT INTO Terminal(nazwa, id_typ_ladunku) VALUES ('City', 3);
INSERT INTO Terminal(nazwa, id_typ_ladunku) VALUES ('APMT', 1);
INSERT INTO Terminal(nazwa, id_typ_ladunku) VALUES ('RST', 2);

INSERT INTO Statek(nazwa, wypornosc, ladownosc_masowa, ladownosc_objetosciowa,
                   dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku)
            VALUES ('Pilateus', 100, 100, 100, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
                   
INSERT INTO Statek(nazwa, wypornosc, ladownosc_masowa, ladownosc_objetosciowa,
                   dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku)
            VALUES ('Pilateus2', 1000, 1000, 1000, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);

INSERT INTO Statek(nazwa, wypornosc, ladownosc_masowa, ladownosc_objetosciowa,
                   dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku)
            VALUES ('Nautilius', 300, 300, 300, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
            
INSERT INTO Statek(nazwa, wypornosc, ladownosc_masowa, ladownosc_objetosciowa,
                   dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku)
            VALUES ('Alabama', 200, 200, 200, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);


            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (100, 100, 100, 1000, 1);

INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (10000, 10000, 10000, 10000, 1);


INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (200, 200, 200, 5000, 2);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (500, 500, 500, 50000, 3);


INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('AAA', 100, 100, 1);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('BBB', 300, 300, 2);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('CCC', 500, 500, 3);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('iPad', 100, 2000, 1, 1, 1);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Honda Civic', 10000, 200000, 1000, 100, 1);
            
INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Ropa', 10, 100, 1000, 100, 2);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Ruda zelaza', 20, 200, 1000, 100, 3);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Wegiel', 30, 10, 1000, 100, 3);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Miedz', 50, 30000, 1000, 100, 3);
            
INSERT INTO Ladunek(ilosc, uwagi, id_Towar, czy_Kontrola_celna)
            VALUES(100000, '', 1, 1);

INSERT INTO Ladunek(ilosc, uwagi, id_Towar, czy_Kontrola_celna)
            VALUES(2000, '', 2, 1);

INSERT INTO Ladunek(ilosc, uwagi, id_Towar, czy_Kontrola_celna)
            VALUES(1000, '', 2, 0);
            
INSERT INTO Ladunek(ilosc, uwagi, id_Towar, czy_Kontrola_celna)
            VALUES(1000, '', 4, 0);

INSERT INTO Ladunek(ilosc, uwagi, id_Towar, czy_Kontrola_celna)
            VALUES(100000, '', 3, 1);
            
INSERT INTO Kontrola_Celna(uwagi, czy_Pozytywna, data, id_Uzytkownik, id_Ladunek)
            VALUES('', 1, '2012-12-12', 3, 1);

INSERT INTO Kontrola_Celna(uwagi, czy_Pozytywna, data, id_Uzytkownik, id_Ladunek)
            VALUES('', 1, '2012-12-12', 3, 2);

INSERT INTO Kontrola_Celna(uwagi, czy_Pozytywna, data, id_Uzytkownik, id_Ladunek)
            VALUES('', 0, '2012-12-12', 3, 4);

INSERT INTO Nadanie_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2010-01-01', '', 1, 1);

INSERT INTO Nadanie_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2011-01-01', '', 1, 2);

INSERT INTO Nadanie_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2012-01-01', '', 1, 3);

INSERT INTO Nadanie_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2012-01-01', '', 1, 4);

 /*           
INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2010-01-01', '', 2, 1);
    
INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2010-01-01', '', 2, 2);

INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2010-01-01', '', 2, 3);

INSERT INTO Odbior_Ladunku(data, uwagi, id_Kontrahent, id_Ladunek)
            VALUES ('2010-01-01', '', 2, 4); */

INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Statek1,
                        id_Statek2, id_Magazyn1, id_Magazyn2, id_Uzytkownik, id_Ladunek)
            VALUES('2012-01-02', '', 1, NULL, 1, NULL, NULL, 1, 1);

INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Statek1,
                        id_Statek2, id_Magazyn1, id_Magazyn2, id_Uzytkownik, id_Ladunek)
            VALUES('2012-01-02', '', 1, NULL, 1, NULL, NULL, 1, 2);
            

INSERT INTO Przeladunek(data, uwagi, czy_aktualne_polozenie, id_Statek1,
                        id_Statek2, id_Magazyn1, id_Magazyn2, id_Uzytkownik, id_Ladunek)
            VALUES('2012-01-02', '', 1, NULL, 2, NULL, NULL, 1, 4);



INSERT INTO Zadokowany(data, uwagi, id_Uzytkownik, id_Dok, id_Statek)
            VALUES('2013-01-24', '', 1, 1, 1);


/* To ma dzialac */
CALL zadokuj(2, 2, '2013-01-24', 1);
/*INSERT INTO Zadokowany(data, uwagi, id_Uzytkownik, id_Dok, id_Statek)
            VALUES('2013-01-24', '', 1, 2, 2); */

/* To ma nie zadzialac bo juz zadokowano */
CALL zadokuj(2, 2, '2013-01-24', 1);

/* To ma nie zadzialac bo sie typy nie zgadzaja */
CALL zadokuj(3, 1, '2013-01-24', 1);


/* To ma dzialac */
CALL oddokuj(1, '2014-01-01', 1);
/* To ma pokazac, ze juz dodano */
CALL oddokuj(1, '2014-01-01', 1);
/* To ma nie dzialac bo brak kontroli celnej */
CALL oddokuj(2, '2014-01-01', 1);