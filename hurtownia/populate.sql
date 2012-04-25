USE databaseheaven;

DELETE FROM Oplata;
DELETE FROM Oddokowany;
DELETE FROM Zadokowany;
DELETE FROM Nadanie_Ladunku;
DELETE FROM Odbior_Ladunku;
DELETE FROM Ladunek;
DELETE FROM Kontrola_Celna;
DELETE FROM Przeladunek;
DELETE FROM Statek;
DELETE FROM Towar;
DELETE FROM Magazyn;
DELETE FROM Dok;
DELETE FROM Terminal;
DELETE FROM Typ_Ladunku;
DELETE FROM Port;
DELETE FROM Kontrahent;
DELETE FROM Kraj;
DELETE FROM Bledy_Operacji;
DELETE FROM Kody_Bledow;
DELETE FROM Uzytkownik;



SET IDENTITY_INSERT Kody_Bledow ON;
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(1, 1, 'blad dokowania - nie wszystkie ladunki przeszly pozytywna kontrole celna');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(2, 2, 'blad dokowania - typ ladunkow na statku nie zgodny z typem terminala');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(3, 3, 'blad dokowania - statek nie miesci sie w doku');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(4, 4, 'blad dokowania - juz oddokowano');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(5, 5, 'blad dokowania - nie mozna oddokowac, bo statek nie jest zadokowany');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(6, 6, 'blad dokowania - nie mozna zadokowac, bo dok nie jest pusty');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(7, 7, 'blad dokowania - juz zadokowano');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(8, 8, 'blad przeladowania - ladunek nie przeszedl pozytywnej kontroli celnej');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(9, 9, 'blad przeladowania - typ ladunku niezgodny z typem statku');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(10, 10, 'blad przeladowania - typ ladunku niezgodny z typem magazynu');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(11, 11, 'blad przeladowania - ladunek nie zmiesci sie na statku');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(12, 12, 'blad przeladowania - ladunek nie zmiesci sie w magazynie');
INSERT INTO Kody_Bledow (id_Kod_Bledu, kod_bledu, opis) VALUES(13, 13, 'blad przeladowania - zrodlo i cel nie sa rozne lub proba dwukrotnego przeladowania w to samo miejsce');
SET IDENTITY_INSERT Kody_Bledow OFF;

SET IDENTITY_INSERT Uzytkownik ON;
INSERT INTO Uzytkownik (id_Uzytkownik, nazwa, funkcja, haslo) VALUES(4, 'AssA', 1, '4347d0f8ba661234a8eadc005e2e1d1b646c9682');
INSERT INTO Uzytkownik (id_Uzytkownik, nazwa, funkcja, haslo) VALUES(5, 'Port', 2, '062d8a9dec0fa507d19f3b3481b4980ca139455f');
INSERT INTO Uzytkownik (id_Uzytkownik, nazwa, funkcja, haslo) VALUES(6, 'Cargo', 3, 'e0d6ae5cf2a2d0c1075943593a36cc5377382a05');
INSERT INTO Uzytkownik (id_Uzytkownik, nazwa, funkcja, haslo) VALUES(7, 'Duty', 4, 'd1f30ba13f7633d895b69320b94ad2bac77f4b2c');
SET IDENTITY_INSERT Uzytkownik OFF;

SET IDENTITY_INSERT Typ_Ladunku ON;
INSERT INTO Typ_Ladunku (id_Typ_Ladunku, typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci) VALUES(1, 'Kontenerowiec', 'Kontenery', 'Kontenerowy', 't', 'm^3');
INSERT INTO Typ_Ladunku (id_Typ_Ladunku, typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci) VALUES(2, 'Tankowiec', 'Przetwory naftowe', 'Naftowy', 't', 'l');
INSERT INTO Typ_Ladunku (id_Typ_Ladunku, typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci) VALUES(3, 'Masowiec (surowcowy)', 'Surowiec', 'Masowy', 't', 'm^3');
INSERT INTO Typ_Ladunku (id_Typ_Ladunku, typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci) VALUES(4, 'Masowiec (rolny)', 'Masa rolna', 'Mas rolnych', 't', 'm^3');
INSERT INTO Typ_Ladunku (id_Typ_Ladunku, typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci) VALUES(5, 'Drobnicowiec', 'Drobnica', 'Drobnicowy', 't', 'm^3');
SET IDENTITY_INSERT Typ_Ladunku OFF;

SET IDENTITY_INSERT Towar ON;
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(1, 'iPad', 100, 2000, 0.5, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(2, 'Honda Civic', 10000, 200000, 1.5, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(3, 'Ropa', 10, 100, 0.07, 100, 2);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(4, 'Benzyna', 40, 400, 0.06, 100, 2);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(5, 'Ruda żelaza', 20, 200, 5, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(6, 'Wegiel kamienny', 30, 10, 6, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(7, 'Miedź', 50, 30000, 8, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(8, 'iPhone 4S', 100, 2000, 0.25, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(9, 'Traktor Ursus', 150, 3000, 2, 15, 5);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(10, 'Honda Civic', 10000, 200000, 1.2, 8.5, 5);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(11, 'Pszenica', 250, 4000, 1.6, 1, 4);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(12, 'Cukier', 550, 9000, 2, 1, 4);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(13, 'iPad 2', 1000, 5000, 0.5, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(14, 'VW Golf', 15000, 250000, 1.5, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(15, 'Skroplony gaz ziemny', 100, 1000, 0.1, 100, 2);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(16, 'Nafta', 500, 4000, 0.05, 100, 2);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(17, 'Platyna', 2000, 300000, 10, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(18, 'Wegiel brunatny', 100, 1000, 4, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(19, 'Ruda cynku', 500, 30000, 8.5, 1, 3);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(20, 'Samsung Galaxy S2', 150, 2800, 0.4, 10, 1);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(21, 'Kombajn Bizon', 1460, 80000, 2, 30, 5);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(22, 'Honda Accord', 18000, 170000, 1.7, 10.5, 5);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(23, 'Żyto', 280, 4000, 1.9, 1, 4);
INSERT INTO Towar (id_Towar, nazwa, clo_jednostkowe, wartosc_jednostkowa, masa_jednostkowa, objetosc_jednostkowa, id_Typ_Ladunku) VALUES(24, 'Kakao', 890, 9000, 4.6, 1, 4);
SET IDENTITY_INSERT Towar OFF;

SET IDENTITY_INSERT Port ON;
INSERT INTO Port(id_Port, nazwa, adres) VALUES (1,'Port Wschodni','Portowa 10, Szczecin');
INSERT INTO Port(id_Port, nazwa, adres) VALUES (2,'Port Zachodni','Nadbrzeżna 13, Gdynia');
INSERT INTO Port(id_Port, nazwa, adres) VALUES (3,'Port Południowy','Morska 3, Świnoujście');
INSERT INTO Port(id_Port, nazwa, adres) VALUES (4,'Port Północny','Wodna 131, Gdańsk');
SET IDENTITY_INSERT Port OFF;

SET IDENTITY_INSERT Terminal ON;
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(1, 'Euromax', 1, 1);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(2, 'Delta', 2, 1);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(3, 'City', 3, 1);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(4, 'APMT', 1, 1);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(5, 'RST', 2, 2);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(6, 'Agro', 4, 2);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(7, 'DRBB', 5, 2);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(8, 'Euromax1', 1, 3);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(9, 'Delta1', 2, 3);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(10, 'City1', 3, 3);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(11, 'APMT1', 1, 4);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(12, 'RST1', 2, 4);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(13, 'Agro1', 4, 4);
INSERT INTO Terminal (id_Terminal, nazwa, id_Typ_Ladunku, id_Port) VALUES(14, 'DRBB1', 5, 4);
SET IDENTITY_INSERT Terminal OFF;

SET IDENTITY_INSERT Dok ON;
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(1, 100, 100, 100, 1000, 1);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(2, 10000, 10000, 10000, 10000, 1);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(4, 500, 500, 500, 12000, 3);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(5, 500, 200, 100, 1600, 2);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(6, 400, 200, 200, 200, 3);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(7, 1000, 500, 200, 50000, 4);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(9, 200, 200, 200, 2000, 2);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(100, 1000, 300, 200, 200, 6);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(101, 100, 100, 100, 10, 3);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(105, 400, 200, 30, 300, 6);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(110, 60, 20, 10, 1000, 6);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(200, 200, 80, 40, 500, 7);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(205, 400, 70, 50, 100, 7);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(56565, 1000, 1000, 1000, 100, 2);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(501, 100, 100, 100, 1000, 8);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(502, 1000, 1000, 10000, 10000, 8);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(504, 500, 5200, 500, 12000, 10);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(505, 5600, 2020, 100, 1600, 9);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(506, 4200, 2200, 210, 200, 10);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(507, 1000, 500, 2000, 500, 11);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(509, 2020, 200, 200, 2000, 9);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(510, 12000, 300, 200, 200, 13);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(511, 1200, 100, 100, 10, 10);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(515, 400, 200, 30, 300, 13);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(516, 610, 220, 10, 1000, 13);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(517, 2100, 820, 402, 50, 14);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(518, 4100, 720, 501, 10, 14);
INSERT INTO Dok (id_Dok, maks_dlugosc_statku, maks_szerokosc_statku, maks_wysokosc_statku, cena_za_pobyt, id_Terminal) VALUES(519, 1000, 1000, 1000, 10, 9);
SET IDENTITY_INSERT Dok OFF;

SET IDENTITY_INSERT Magazyn ON;
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(1, 'Magazyn', 1000, 0, 100, 1);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(2, 'Inny magazyn', 3000, 0, 300, 2);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(3, 'Duży magazyn', 50000, 0, 5000, 3);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(4, 'CCCP', 160, 0, 500, 1);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(5, 'AAA', 1300, 0, 300, 2);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(6, 'BBB', 1500, 0, 5200, 3);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(7, 'CCC', 1100, 0, 1100, 1);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(8, 'DDDE', 1200, 0, 100, 4);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(9, 'EEE', 1500, 0, 1500, 4);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(10, 'AgroMag1', 6000, 0, 100, 6);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(11, 'AgroMag2', 3400, 0, 160, 6);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(12, 'DrobMag1', 10000, 0, 100, 7);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(13, 'DrobMag2', 8000, 0, 860, 7);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(14, 'Magazyn1', 1000, 0, 100, 8);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(15, 'Inny magazyn1', 3000, 0, 300, 9);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(16, 'Duży magazyn1', 50000, 0, 5000, 10);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(17, 'CCCP1', 100, 0, 56, 8);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(18, 'AAA1', 1300, 0, 300, 9);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(19, 'BBB1', 1500, 0, 50, 10);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(20, 'CCC1', 1100, 0, 1100, 8);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(21, 'DDDE1', 200, 0, 100, 11);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(22, 'EEE1', 1500, 0, 1500, 11);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(23, 'AgroMag11', 100000, 0, 1600, 13);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(24, 'AgroMag21', 30000, 0, 100, 13);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(25, 'DrobMag11', 12000, 0, 170, 14);
INSERT INTO Magazyn (id_Magazyn, nazwa, pojemnosc, aktualna_objetosc_ladunkow, cena_Za_Przechowanie, id_Terminal) VALUES(26, 'DrobMag21', 7000, 0, 80, 14);
SET IDENTITY_INSERT Magazyn OFF;

SET IDENTITY_INSERT Kraj ON;
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(1, 'Stany Zjednoczone');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(2, 'Polska');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(3, 'Wielka Brytania');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(4, 'Singapur');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(5, 'Czechy');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(6, 'Niemcy');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(7, 'Rosja');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(8, 'Slowacja');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(9, 'Holandia');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(10, 'Grecja');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(11, 'Dania');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(12, 'Chiny');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(13, 'Izreal');
INSERT INTO Kraj (id_Kraj, nazwa) VALUES(14, 'Belgia');
SET IDENTITY_INSERT Kraj OFF;

SET IDENTITY_INSERT Kontrahent ON;
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(1, 'FedEx', 'Lincoln Avenue 12, New York', 1, 2);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(2, 'UPS', 'LA', 1, 2);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(3, 'Maersk', 'Copenhagen', 11, 1);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(4, 'Jan Kulczyk', 'Warszawa', 2, 1);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(5, 'Qai Chan', 'Seoul', 12, 1);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(6, 'KGHM', 'Lubin, Miedziana 123', 2, 2);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(7, 'Bogdanka', 'Lublin, Węglowa 16', 2, 2);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(8, 'Compagnie Maritime Belge', 'Haga', 14, 1);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(9, 'Hapag-Lloyd', 'Hamburg', 6, 1);
INSERT INTO Kontrahent (id_Kontrahent, nazwa, adres, id_Kraj, typ) VALUES(10, 'H. Vogemann', 'Berlin, Ludwigsstrasse 122', 6, 1);
SET IDENTITY_INSERT Kontrahent OFF;

SET IDENTITY_INSERT Statek ON;
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(1, 'Pilateus', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(2, 'Pilateus2', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(3, 'Nautilius', 300, 300, 0, 300, 0, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(4, 'Alabama', 200, 300, 0, 400, 0, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(5, 'Tytanik', 200, 1200, 0, 1600, 0, 100, 100, 20, 'Aaaa Bbbbb', '2000-10-10', 4, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(6, 'Concordia', 3000, 2000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1990-01-01', 9, 2);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(7, 'Jan Heweliusz', 3000, 1500, 0, 1000, 0, 250, 45, 56, 'Zbigniew Holdys', '1990-01-01', 4, 4);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(8, 'Atlas', 50000, 20000, 0, 10000, 0, 180, 34, 44, 'Johnny Bravo', '1980-02-01', 8, 5);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(9, 'Santa Maria', 2500, 2000, 0, 100000, 0, 300, 100, 100, 'Krzysztof Kolumb', '1490-11-06', 5, 2);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(11, 'Queen Mary', 2000, 1000, 0, 1000, 0, 50, 20, 10, 'Rysio Lubicz', '1890-01-01', 9, 4);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(12, 'Pilateus3', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(13, 'Pilateus4', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(14, 'Nautilius2', 3000, 2200, 0, 3000, 0, 300, 300, 300, ' Richard Phillips', '1989-01-29', 1, 2);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(15, 'Alabama2', 200, 400, 0, 250, 0, 200, 200, 200, ' John Corn', '1998-01-29', 1, 3);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(16, 'Tytanik2', 200, 1000, 0, 1000, 0, 100, 100, 20, 'Aaaa Bbbbb', '2010-10-10', 4, 1);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(17, 'Concordia2', 3000, 4000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1996-01-01', 9, 2);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(18, 'Jan Heweliusz2', 30000, 1500, 0, 1000, 0, 250, 45, 56, 'Zbigniew Holdys', '1980-01-01', 9, 4);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(19, 'Atlas2', 50000, 2000, 0, 10000, 0, 180, 34, 44, 'Johnny Bravo', '1981-02-01', 9, 5);
INSERT INTO Statek (id_Statek, nazwa, wypornosc, ladownosc_masowa, aktualna_masa_ladunkow, ladownosc_objetosciowa, aktualna_objetosc_ladunkow, dlugosc, szerokosc, wysokosc, kapitan, data_produkcji, id_Kontrahent, id_Typ_Ladunku) VALUES(20, 'Santa Maria2', 2500, 2000, 0, 1000000, 0, 300, 100, 100, 'Krzysztof Kolumb', '1800-11-06', 5, 2);
SET IDENTITY_INSERT Statek OFF;