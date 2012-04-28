USE `databaseheaven`;

INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(1, 1, 'blad dokowania - nie wszystkie ladunki przeszly pozytywna kontrole celna');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(2, 2, 'blad dokowania - typ ladunkow na statku nie zgodny z typem terminala');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(3, 3, 'blad dokowania - statek nie miesci sie w doku');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(4, 4, 'blad dokowania - juz oddokowano');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(5, 5, 'blad dokowania - nie mozna oddokowac, bo statek nie jest zadokowany');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(6, 6, 'blad dokowania - nie mozna zadokowac, bo dok nie jest pusty');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(7, 7, 'blad dokowania - juz zadokowano');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(8, 8, 'blad przeladowania - ladunek nie przeszedl pozytywnej kontroli celnej');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(9, 9, 'blad przeladowania - typ ladunku niezgodny z typem statku');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(10, 10, 'blad przeladowania - typ ladunku niezgodny z typem magazynu');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(11, 11, 'blad przeladowania - ladunek nie zmiesci sie na statku');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(12, 12, 'blad przeladowania - ladunek nie zmiesci sie w magazynie');
INSERT INTO `Kody_Bledow` (`id_Kod_Bledu`, `kod_bledu`, `opis`) VALUES(13, 13, 'blad przeladowania - zrodlo i cel nie sa rozne lub proba dwukrotnego przeladowania w to samo miejsce');

INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`) VALUES(1, 'AssA', 1, '4347d0f8ba661234a8eadc005e2e1d1b646c9682');
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`) VALUES(2, 'Port', 2, '062d8a9dec0fa507d19f3b3481b4980ca139455f');
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`) VALUES(3, 'Cargo', 3, 'e0d6ae5cf2a2d0c1075943593a36cc5377382a05');
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`) VALUES(4, 'Duty', 4, 'd1f30ba13f7633d895b69320b94ad2bac77f4b2c');

INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(1, 'Kontenerowiec', 'Kontenery', 'Kontenerowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(2, 'Tankowiec', 'Przetwory naftowe', 'Naftowy', 't', 'l');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(3, 'Masowiec (surowcowy)', 'Surowiec', 'Masowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(4, 'Masowiec (rolny)', 'Masa rolna', 'Mas rolnych', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(5, 'Drobnicowiec', 'Drobnica', 'Drobnicowy', 't', 'm^3');

INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(1, 'iPad', 100, 2000, 0.5, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(2, 'Honda Civic', 10000, 200000, 1.5, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(3, 'Ropa', 10, 100, 0.07, 100, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(4, 'Benzyna', 40, 400, 0.06, 100, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(5, 'Ruda żelaza', 20, 200, 5, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(6, 'Wegiel kamienny', 30, 10, 6, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(7, 'Miedź', 50, 30000, 8, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(8, 'iPhone 4S', 100, 2000, 0.25, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(9, 'Traktor Ursus', 150, 3000, 2, 15, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(10, 'Honda Civic', 10000, 200000, 1.2, 8.5, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(11, 'Pszenica', 250, 4000, 1.6, 1, 4);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(12, 'Cukier', 550, 9000, 2, 1, 4);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(13, 'iPad 2', 1000, 5000, 0.5, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(14, 'VW Golf', 15000, 250000, 1.5, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(15, 'Skroplony gaz ziemny', 100, 1000, 0.1, 100, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(16, 'Nafta', 500, 4000, 0.05, 100, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(17, 'Platyna', 2000, 300000, 10, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(18, 'Wegiel brunatny', 100, 1000, 4, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(19, 'Ruda cynku', 500, 30000, 8.5, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(20, 'Samsung Galaxy S2', 150, 2800, 0.4, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(21, 'Kombajn Bizon', 1460, 80000, 2, 30, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(22, 'Honda Accord', 18000, 170000, 1.7, 10.5, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(23, 'Żyto', 280, 4000, 1.9, 1, 4);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(24, 'Kakao', 890, 9000, 4.6, 1, 4);

INSERT INTO `Port`(`id_Port`, `nazwa`, `adres`) VALUES (1,'Port Wschodni','Portowa 10, Szczecin');
INSERT INTO `Port`(`id_Port`, `nazwa`, `adres`) VALUES (2,'Port Zachodni','Nadbrzeżna 13, Gdynia');
INSERT INTO `Port`(`id_Port`, `nazwa`, `adres`) VALUES (3,'Port Południowy','Morska 3, Świnoujście');
INSERT INTO `Port`(`id_Port`, `nazwa`, `adres`) VALUES (4,'Port Północny','Wodna 131, Gdańsk');


INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(1, 'Euromax', 1, 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(2, 'Delta', 2, 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(3, 'City', 3, 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(4, 'APMT', 1, 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(5, 'RST', 2, 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(6, 'Agro', 4, 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(7, 'DRBB', 5, 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(8, 'Euromax1', 1, 3);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(9, 'Delta1', 2, 3);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(10, 'City1', 3, 3);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(11, 'APMT1', 1, 4);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(12, 'RST1', 2, 4);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(13, 'Agro1', 4, 4);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`, `id_Port`) VALUES(14, 'DRBB1', 5, 4);


INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(1, 100, 100, 100, 1000, 1);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(2, 10000, 10000, 10000, 10000, 1);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(4, 500, 500, 500, 12000, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(5, 500, 200, 100, 1600, 2);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(6, 400, 200, 200, 200, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(7, 1000, 500, 200, 50000, 4);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(9, 200, 200, 200, 2000, 2);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(100, 1000, 300, 200, 200, 6);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(101, 100, 100, 100, 10, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(105, 400, 200, 30, 300, 6);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(110, 60, 20, 10, 1000, 6);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(200, 200, 80, 40, 500, 7);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(205, 400, 70, 50, 100, 7);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(56565, 1000, 1000, 1000, 100, 2);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(501, 100, 100, 100, 1000, 8);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(502, 1000, 1000, 10000, 10000, 8);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(504, 500, 5200, 500, 12000, 10);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(505, 5600, 2020, 100, 1600, 9);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(506, 4200, 2200, 210, 200, 10);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(507, 1000, 500, 2000, 500, 11);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(509, 2020, 200, 200, 2000, 9);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(510, 12000, 300, 200, 200, 13);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(511, 1200, 100, 100, 10, 10);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(515, 400, 200, 30, 300, 13);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(516, 610, 220, 10, 1000, 13);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(517, 2100, 820, 402, 50, 14);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(518, 4100, 720, 501, 10, 14);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(519, 1000, 1000, 1000, 10, 9);


INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(1, 'Magazyn', 1000, 0, 100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(2, 'Inny magazyn', 3000, 0, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(3, 'Duży magazyn', 50000, 0, 5000, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(4, 'CCCP', 160, 0, 500, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(5, 'AAA', 1300, 0, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(6, 'BBB', 1500, 0, 5200, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(7, 'CCC', 1100, 0, 1100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(8, 'DDDE', 1200, 0, 100, 4);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(9, 'EEE', 1500, 0, 1500, 4);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(10, 'AgroMag1', 6000, 0, 100, 6);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(11, 'AgroMag2', 3400, 0, 160, 6);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(12, 'DrobMag1', 10000, 0, 100, 7);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(13, 'DrobMag2', 8000, 0, 860, 7);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(14, 'Magazyn1', 1000, 0, 100, 8);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(15, 'Inny magazyn1', 3000, 0, 300, 9);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(16, 'Duży magazyn1', 50000, 0, 5000, 10);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(17, 'CCCP1', 100, 0, 56, 8);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(18, 'AAA1', 1300, 0, 300, 9);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(19, 'BBB1', 1500, 0, 50, 10);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(20, 'CCC1', 1100, 0, 1100, 8);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(21, 'DDDE1', 200, 0, 100, 11);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(22, 'EEE1', 1500, 0, 1500, 11);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(23, 'AgroMag11', 100000, 0, 1600, 13);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(24, 'AgroMag21', 30000, 0, 100, 13);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(25, 'DrobMag11', 12000, 0, 170, 14);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(26, 'DrobMag21', 7000, 0, 80, 14);


INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(1, 'Stany Zjednoczone');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(2, 'Polska');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(3, 'Wielka Brytania');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(4, 'Singapur');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(5, 'Czechy');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(6, 'Niemcy');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(7, 'Rosja');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(8, 'Slowacja');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(9, 'Holandia');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(10, 'Grecja');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(11, 'Dania');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(12, 'Chiny');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(13, 'Izreal');
INSERT INTO `Kraj` (`id_Kraj`, `nazwa`) VALUES(14, 'Belgia');

INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(1, 'FedEx', 'Lincoln Avenue 12, New York', 1, 2);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(2, 'UPS', 'LA', 1, 2);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(3, 'Maersk', 'Copenhagen', 11, 1);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(4, 'Jan Kulczyk', 'Warszawa', 2, 1);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(5, 'Qai Chan', 'Seoul', 12, 1);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(6, 'KGHM', 'Lubin, Miedziana 123', 2, 2);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(7, 'Bogdanka', 'Lublin, Węglowa 16', 2, 2);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(8, 'Compagnie Maritime Belge', 'Haga', 14, 1);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(9, 'Hapag-Lloyd', 'Hamburg', 6, 1);
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(10, 'H. Vogemann', 'Berlin, Ludwigsstrasse 122', 6, 1);

INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(1, 'Pilateus', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(2, 'Pilateus2', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(3, 'Nautilius', 300, 300, 0, 300, 0, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(4, 'Alabama', 200, 300, 0, 400, 0, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(5, 'Tytanik', 200, 1200, 0, 1600, 0, 100, 100, 20, 'Aaaa Bbbbb', '2000-10-10', 4, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(6, 'Concordia', 3000, 2000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1990-01-01', 9, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(7, 'Jan Heweliusz', 3000, 1500, 0, 1000, 0, 250, 45, 56, 'Zbigniew Holdys', '1990-01-01', 4, 4);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(8, 'Atlas', 50000, 20000, 0, 10000, 0, 180, 34, 44, 'Johnny Bravo', '1980-02-01', 8, 5);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(9, 'Santa Maria', 2500, 2000, 0, 100000, 0, 300, 100, 100, 'Krzysztof Kolumb', '1490-11-06', 5, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(11, 'Queen Mary', 2000, 1000, 0, 1000, 0, 50, 20, 10, 'Rysio Lubicz', '1890-01-01', 9, 4);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(12, 'Pilateus3', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(13, 'Pilateus4', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(14, 'Nautilius2', 3000, 2200, 0, 3000, 0, 300, 300, 300, ' Richard Phillips', '1989-01-29', 1, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(15, 'Alabama2', 200, 400, 0, 250, 0, 200, 200, 200, ' John Corn', '1998-01-29', 1, 3);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(16, 'Tytanik2', 200, 1000, 0, 1000, 0, 100, 100, 20, 'Aaaa Bbbbb', '2010-10-10', 4, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(17, 'Concordia2', 3000, 4000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1996-01-01', 9, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(18, 'Jan Heweliusz2', 30000, 1500, 0, 1000, 0, 250, 45, 56, 'Zbigniew Holdys', '1980-01-01', 9, 4);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(19, 'Atlas2', 50000, 2000, 0, 10000, 0, 180, 34, 44, 'Johnny Bravo', '1981-02-01', 9, 5);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(20, 'Santa Maria2', 2500, 2000, 0, 1000000, 0, 300, 100, 100, 'Krzysztof Kolumb', '1800-11-06', 5, 2);

/* Zadokowania/oddokowania */
DROP PROCEDURE IF EXISTS popul1;

DELIMITER //
CREATE PROCEDURE popul1()
BEGIN
	DECLARE counter INT DEFAULT 500;
	DECLARE dock, ship, docked INT;
	DECLARE time DATETIME DEFAULT '1990-01-01';
	DECLARE rnd FLOAT;
	WHILE counter > 0 DO
		SET rnd=RAND();
		IF rnd<0.5 THEN
			#dokujemy (50%)
			SELECT DISTINCT id_Statek						 
                FROM Statek s LEFT OUTER JOIN Zadokowany z USING(id_Statek)               
		        WHERE id_Zadokowany IS NULL OR NOT EXISTS 
				    (
				       SELECT id_Statek
				       FROM 
				       Statek INNER JOIN Zadokowany z1 USING(id_Statek)
				       LEFT OUTER JOIN Oddokowany o USING(id_Zadokowany)
				       WHERE s.id_Statek=id_Statek AND id_Oddokowany IS NULL
				    )
		        ORDER BY RAND() LIMIT 1
            INTO ship;
            
            SELECT id_Dok
		        FROM  Dok d1
		            INNER JOIN Terminal USING(id_Terminal)
		            INNER JOIN Typ_Ladunku USING(id_Typ_Ladunku)					
		            INNER JOIN Statek USING(id_Typ_Ladunku)
		        WHERE id_Statek=ship
				    AND maks_szerokosc_statku>= szerokosc 
				    AND maks_dlugosc_statku>= dlugosc
				    AND maks_wysokosc_statku>= wysokosc		
				ORDER BY RAND() LIMIT 1
		    INTO dock;                
			CALL zadokuj(dock, ship, time, 1);
		ELSE
			#oddokowujemy (50%)
			SELECT Zadokowany.id_Zadokowany                   
		        FROM Statek 
		                NATURAL JOIN Zadokowany                     
		                LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
		                INNER JOIN Dok USING(id_Dok)						 
		        WHERE id_Oddokowany IS NULL
		        ORDER BY RAND() LIMIT 1
            INTO docked;
			CALL oddokuj(docked, time, 1);
		END IF;
		SET counter=counter-1;
		SET time=ADDTIME(time,'02:00:00.000000');
		SELECT counter;
	END WHILE;
END
//
delimiter ;

/* Przeładunki, nadania, odbiory, kontrole celne */
DROP PROCEDURE IF EXISTS popul2;
DELIMITER //
CREATE PROCEDURE popul2()
BEGIN
	DECLARE counter INT DEFAULT 100;
	DECLARE time DATETIME DEFAULT '1990-01-01';	
	DECLARE cargo, commodity, type, amount, sender, receiver, dutyControl, ship, store, terminal, num INT;
	DECLARE rnd FLOAT;
	# 1-sza iteracja - generujemy 100 nadań ładunków
	WHILE counter > 0 DO
		SELECT id_Towar, id_Typ_Ladunku
			FROM Towar 
			ORDER BY RAND() LIMIT 1 
		INTO commodity, type;
		SELECT id_Kontrahent FROM Kontrahent 
			WHERE typ=2 
			ORDER BY RAND() LIMIT 1
		INTO sender;
		SET amount=CEIL(RAND()*10);
		IF RAND() < 0.6 THEN
			SET dutyControl=1;
		ELSE
			SET dutyControl=0;
		END IF;
		SET rnd=RAND();
		IF rnd<0.5 THEN
		#na statek (50%)
			SELECT id_Statek, count(*) 
				FROM Statek 
					INNER JOIN Zadokowany USING(id_Statek)
					LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
				WHERE id_Typ_Ladunku=type
					AND Zadokowany.data<=time
					AND (Oddokowany.data IS NULL OR Oddokowany.data>time)
				ORDER BY RAND() LIMIT 1 		
			INTO ship, num;
			SET store=NULL;
		ELSE
		#do maga (50%)
			SELECT id_Magazyn, count(*) 
				FROM Magazyn
					INNER JOIN Terminal USING(id_Terminal)					
				WHERE id_Typ_Ladunku=type
				ORDER BY RAND() LIMIT 1 		
			INTO store, num;
			SET ship=NULL;
		END IF;
		IF num>0 THEN
			CALL nadanie(commodity, amount, sender, dutyControl , ship, store, 1, time, NULL);
		END IF;		
		SET counter=counter-1;
		SET time=ADDTIME(time,'01:00:00.000000');			
	END WHILE;		
				
	SET counter=1000;
	# 2-ga iteracja - generujemy 1000 przeładunków, nadań, odbiorów i kontrol
	WHILE counter > 0 DO
		SET rnd=RAND();
		IF rnd<0.4 THEN
		#przeładunek 40%
			SELECT id_Ladunek, id_Typ_Ladunku, count(*)
				FROM Ladunek INNER JOIN Towar 
				LEFT OUTER JOIN Kontrola_Celna USING(id_Ladunek)
				WHERE czy_kontrola_celna=FALSE OR czy_pozytywna=TRUE
				ORDER BY RAND() LIMIT 1 
			INTO cargo, type, num;
			IF num>0 THEN
				SET rnd=RAND();
				IF rnd<0.5 THEN
				#na statek (50%)
					SELECT id_Statek, count(*) 
						FROM Statek 
							INNER JOIN Zadokowany USING(id_Statek)
							LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
						WHERE id_Typ_Ladunku=type
							AND Zadokowany.data<=time
							AND (Oddokowany.data IS NULL OR Oddokowany.data>time)
						ORDER BY RAND() LIMIT 1 		
					INTO ship, num;
					SET store=NULL;
				ELSE
				#do maga (50%)
					SELECT id_Magazyn, count(*) 
						FROM Magazyn
							INNER JOIN Terminal USING(id_Terminal)					
						WHERE id_Typ_Ladunku=type
						ORDER BY RAND() LIMIT 1 		
					INTO store, num;
					SET ship=NULL;
				END IF;
				IF num>0 THEN
					CALL przeladuj(cargo, ship, store, 1, time, NULL, FALSE);
					SET counter=counter-1;
					SET time=ADDTIME(time,'01:00:00.000000');
				END IF;
			END IF;
		ELSEIF rnd<0.7 THEN
		#kontrola celna 30%
			SELECT temp.*, count(*) FROM ((SELECT id_Ladunek, id_Statek 
		        FROM Ladunek
		            INNER JOIN Towar USING (id_Towar)
		            LEFT OUTER JOIN Kontrola_Celna USING(id_Ladunek)                
		            INNER JOIN Przeladunek USING (id_Ladunek)
		            INNER JOIN Statek ON Statek.id_Statek = Przeladunek.id_Statek2
		        WHERE czy_kontrola_celna=TRUE 
		        	AND Przeladunek.id_Statek2 IS NOT NULL
		            AND id_Kontrola_Celna IS NULL 
		            AND czy_aktualne_polozenie=TRUE)		            
			UNION		            
			(SELECT id_Ladunek, id_Statek
	          FROM Ladunek l1
	            INNER JOIN Kontrola_Celna kc1 USING(id_Ladunek)
	            INNER JOIN Przeladunek USING (id_Ladunek)
	            INNER JOIN Statek ON Statek.id_Statek = Przeladunek.id_Statek2
	          WHERE czy_kontrola_celna=TRUE AND czy_pozytywna=FALSE AND czy_aktualne_polozenie=TRUE
	           AND NOT EXISTS 
	                        (
	                                SELECT id_Przeladunek 
	                                FROM Przeladunek NATURAL JOIN Ladunek l2
	                                WHERE id_statek2 IS NULL AND id_magazyn2 IS NULL 
	                                    AND l2.id_Ladunek=l1.id_Ladunek
	                        ) 
	           AND NOT EXISTS 
	                        (
	                                SELECT id_Kontrola_Celna
	                                FROM Kontrola_Celna kc2
	                                WHERE kc2.id_Ladunek = kc1.id_Ladunek
	                                    AND kc2.czy_pozytywna=TRUE
                    		)))AS temp ORDER BY RAND() LIMIT 1 
                INTO cargo, ship, num;                	        
	        IF num >0 THEN
		        SELECT cargo;            
				SELECT id_Terminal 
					FROM Zadokowany 
						INNER JOIN Dok 
					WHERE id_Statek=ship			
					ORDER BY RAND() LIMIT 1
				INTO terminal;
				SET rnd=RAND();
				IF rnd<0.8 THEN
				#poztywna 80%
					INSERT INTO Kontrola_Celna VALUES (NULL,NULL,TRUE,time,1,cargo,terminal);
				ELSEIF rnd<0.9 THEN
				#suspend 10%
					INSERT INTO Kontrola_Celna VALUES (NULL,NULL,FALSE,time,1,cargo,terminal);
				ELSE
				#confiscate 10%
					CALL konfiskata(cargo, NULL, 1, time);
				END IF;
				SET counter=counter-1;
				SET time=ADDTIME(time,'01:00:00.000000');
			END IF;
		ELSEIF rnd<0.9 THEN		
		#odbiór ładunku 20%
			SELECT id_Ladunek, count(*)
				FROM Ladunek
					LEFT OUTER JOIN Odbior_Ladunku USING(id_Ladunek) 
					LEFT OUTER JOIN Kontrola_Celna USING(id_Ladunek)
					WHERE (czy_kontrola_celna=FALSE OR czy_pozytywna=TRUE)
					AND id_Odbior_Ladunku IS NULL
				ORDER BY RAND() LIMIT 1 
			INTO cargo, num;
			IF num>0 THEN
				SELECT id_Kontrahent FROM Kontrahent 
					WHERE typ=2 
					ORDER BY RAND() LIMIT 1
				INTO receiver;
				CALL odbior(cargo,receiver,1,time,NULL);
				SET counter=counter-1;
				SET time=ADDTIME(time,'01:00:00.000000');
			END IF;
		ELSE			
		#nadanie ładunku 10%
			SELECT id_Towar, id_Typ_Ladunku
				FROM Towar 
				ORDER BY RAND() LIMIT 1 
			INTO commodity, type;
			SELECT id_Kontrahent FROM Kontrahent 
				WHERE typ=2 
				ORDER BY RAND() LIMIT 1
			INTO sender;
			SET amount=CEIL(RAND()*10);
			IF RAND() < 0.6 THEN
				SET dutyControl=1;
			ELSE
				SET dutyControl=0;
			END IF;
			SET rnd=RAND();
			IF rnd<0.5 THEN
			#na statek (50%)
				SELECT id_Statek, count(*) 
					FROM Statek 
						INNER JOIN Zadokowany USING(id_Statek)
						LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
					WHERE id_Typ_Ladunku=type
						AND Zadokowany.data<=time
						AND (Oddokowany.data IS NULL OR Oddokowany.data>time)
					ORDER BY RAND() LIMIT 1 		
				INTO ship, num;
				SET store=NULL;
			ELSE
			#do maga (50%)
				SELECT id_Magazyn, count(*)
					FROM Magazyn
						INNER JOIN Terminal USING(id_Terminal)					
					WHERE id_Typ_Ladunku=type
					ORDER BY RAND() LIMIT 1 		
				INTO store, num;
				SET ship=NULL;
			END IF;
			IF num>0 THEN
				CALL nadanie(commodity, amount, sender, dutyControl , ship, store, 1, time, NULL);
				SET counter=counter-1;
				SET time=ADDTIME(time,'01:00:00.000000');
			END IF;			
		END IF;					
	END WHILE;
END
//
delimiter ;
