USE databaseheaven;
/* Poprawiona populacja bazy danych - tzn. usunięte ręczne inserty przeładunków, nadań, dokowań etc."*/

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

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(11, 'blad przeladowania - ladunek nie zmiesci sie na statku');

INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(12, 'blad przeladowania - ladunek nie zmiesci sie w magazynie');
    
INSERT INTO Kody_Bledow(kod_bledu, opis) 
    VALUES(13, 'blad przeladowania - zrodlo i cel nie sa rozne lub proba dwukrotnego przeladowania w to samo miejsce');            


INSERT INTO Uzytkownik(nazwa, funkcja, haslo, url_Obrazka)
    VALUES('Zygfryd Cietoglowy', 'Administrator portu', '123123213213',
    'http://c.wrzuta.pl/wi19796/b6060a09002c38ea4cfd424e/mega_face_palm');
    
INSERT INTO Uzytkownik(nazwa, funkcja, haslo, url_Obrazka)
    VALUES('Jurand Spychowicz', 'Administrator ladunkow',  '112666623213213',
    'http://www.nowaautorska.com/files/Jurand_1123.jpg');
    
INSERT INTO Uzytkownik(nazwa, funkcja, haslo, url_Obrazka)
    VALUES('Johny Cash', 'Inspektor Celny', '112666623219999',
    'http://www.ted.com');
    
INSERT INTO Kraj(nazwa) VALUES ('Stany Zjednoczone');
INSERT INTO Kraj(nazwa) VALUES ('Polska');
INSERT INTO Kraj(nazwa) VALUES ('Wielka Brytania');
INSERT INTO Kraj(nazwa) VALUES ('Singapur');
INSERT INTO Kraj(nazwa) VALUES ('Czechy');
INSERT INTO Kraj(nazwa) VALUES ('Niemcy');
INSERT INTO Kraj(nazwa) VALUES ('Rosja');
INSERT INTO Kraj(nazwa) VALUES ('Slowacja');
INSERT INTO Kraj(nazwa) VALUES ('Holandia');
INSERT INTO Kraj(nazwa) VALUES ('Grecja');
INSERT INTO Kraj(nazwa) VALUES ('Dania');
INSERT INTO Kraj(nazwa) VALUES ('Chiny');
INSERT INTO Kraj(nazwa) VALUES ('Izreal');
INSERT INTO Kraj(nazwa) VALUES ('Belgia');

INSERT INTO Kontrahent(nazwa, adres, id_kraj, typ) VALUES ('FedEx', 'NY', 1, 'Wlasciciel ladunku');
INSERT INTO Kontrahent(nazwa, adres, id_kraj, typ) VALUES ('UPS', 'LA', 1, 'Wlasciciel ladunku');
INSERT INTO Kontrahent(nazwa, adres, id_kraj, typ) VALUES ('Maersk', 'Copenhagen', 11, 'Armator');

INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Kontenerowiec', 'Kontenery', 'Kontenerowy', 'tona', 'm^3');

INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Tankowiec', 'Przetwory naftowe', 'Naftowy', 't', 'l');
            
INSERT INTO Typ_Ladunku(typ_Statku, nazwa_Typu_Ladunku, typ_Terminala,
                        jednostka_Masy, jednostka_Objetosci)
            VALUES ('Masowiec', 'Surowiec', 'Masowy', 'tona', 'm^3');

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
            VALUES (1200, 400, 400, 5000, 2);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (500, 500, 500, 12000, 3);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (500, 200, 100, 1600, 2);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (500, 100, 100, 15000, 3);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (1000, 500, 200, 50000, 4);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (500, 500, 500, 4000, 4);                        
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (200, 200, 200, 2000, 2);
            
INSERT INTO Dok(maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal)
            VALUES (100, 50, 50, 1000, 3);            


INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('Magazyn', 1000, 100, 1);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('Inny magazyn', 3000, 300, 2);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('Duży magazyn', 50000, 5000, 3);
            
INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('Mały magazyn', 100, 100, 1);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('AAA', 1300, 300, 2);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('BBB', 1500, 5200, 3);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('CCC', 1100, 1100, 1);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('DDD', 1300, 30, 4);

INSERT INTO Magazyn(nazwa, pojemnosc, cena_za_przechowanie, id_Terminal)
            VALUES ('EEE', 1500, 1500, 4);                        

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('iPad', 100, 2000, 1, 1, 1);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Honda Civic', 10000, 200000, 1, 10, 1);
            
INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Ropa', 10, 100, 1000, 100, 2);
            
INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Benzyna', 40, 400, 1000, 100, 2);            

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Ruda zelaza', 20, 200, 1000, 100, 3);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Wegiel', 30, 10, 1000, 100, 3);

INSERT INTO Towar(nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku)
            VALUES ('Miedz', 50, 30000, 1000, 100, 3);
