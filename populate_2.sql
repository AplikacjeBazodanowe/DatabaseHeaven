USE `databaseheaven`;

INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(4, 'AssA', 'Administrator systemu', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(5, 'Port', 'Administrator portu', '062d8a9dec0fa507d19f3b3481b4980ca139455f', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(6, 'Cargo', 'Administrator ladunkow', 'e0d6ae5cf2a2d0c1075943593a36cc5377382a05', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(7, 'Duty', 'Inspektor celny', 'd1f30ba13f7633d895b69320b94ad2bac77f4b2c', NULL);

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

INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(1, 'Kontenerowiec', 'Kontenery', 'Kontenerowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(2, 'Tankowiec', 'Przetwory naftowe', 'Naftowy', 't', 'l');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(3, 'Masowiec (surowcowy)', 'Surowiec', 'Masowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(4, 'Masowiec (rolny)', 'Masa rolna', 'Mas rolnych', 't', 'm^3');
INSERT INTO `Typ_Ladunku` (`id_Typ_Ladunku`, `typ_Statku`, `nazwa_Typu_Ladunku`, `typ_Terminala`, `jednostka_Masy`, `jednostka_Objetosci`) VALUES(5, 'Drobnicowiec', 'Drobnica', 'Drobnicowy', 't', 'm^3');

INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(1, 'iPad', 100, 2000, 1, 1, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(2, 'Honda Civic', 10000, 200000, 1, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(3, 'Ropa', 10, 100, 1, 1000, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(4, 'Benzyna', 40, 400, 1, 1000, 2);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(5, 'Ruda żelaza', 20, 200, 5, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(6, 'Wegiel', 30, 10, 6, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(7, 'Miedź', 50, 30000, 8000, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(11, 'iPhone 4S', 100, 2000, 5, 10, 1);

INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(1, 'Euromax', 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(2, 'Delta', 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(3, 'City', 3);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(4, 'APMT', 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(5, 'RST', 2);

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

INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(1, 'ghsgh', 'hghghg', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(2, 'UPS', 'LA', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(3, 'Maersk', 'Copenhagen', 11, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(4, 'aaa', 'aaa', 1, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(5, 'Qai Chan', 'Seoul', 12, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(6, 'KGHM', 'Lubin, Miedziana 123', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(7, 'Bogdanka', 'Lublin, Węglowa 10', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(8, 'Compagnie Maritime Belge', 'Haga', 14, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(9, 'Hapag-Lloyd', 'Hamburg', 6, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(10, 'H. Vogemann', 'Berlin, Ludwigsstrasse 122', 6, 'Armator');

INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(1, 'Pilateus', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(2, 'Pilateus2', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(3, 'Nautilius', 300, 300, 0, 300, 0, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(4, 'Alabama', 200, 200, 11, 200, 2, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(5, 'Tytanik', 200, 1000, 0, 1000, 0, 100, 100, 20, 'Aaaa Bbbbb', '2000-10-10', 4, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(6, 'Concordia', 3000, 2000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1990-01-01', 9, 2);

INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(1, 100, 100, 100, 1000, 1);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(2, 10000, 10000, 10000, 10000, 1);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(4, 500, 500, 500, 12000, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(5, 500, 200, 100, 1600, 2);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(6, 500, 100, 100, 15000, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(7, 1000, 500, 200, 50000, 4);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(9, 200, 200, 200, 2000, 2);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(101, 100, 100, 100, 10, 3);
INSERT INTO `Dok` (`id_Dok`, `maks_dlugosc_statku`, `maks_szerokosc_statku`, `maks_wysokosc_statku`, `cena_za_pobyt`, `id_Terminal`) VALUES(56565, 1000, 1000, 1000, 100, 2);

INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(1, 100, 11, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(2, 1, 5, 0);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(3, 1, 6, 0);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(4, 2, 2, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(5, 10, 11, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(6, 1, 3, 0);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(7, 1, 4, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(8, 5, 1, 0);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(9, 5, 11, 0);

INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(1, 'chcesz iPhona to płać', 1, '2012-04-19 20:01:13', 7, 1);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(2, '', 1, '2012-04-19 20:04:46', 7, 5);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(3, '', 0, '2012-04-19 20:12:06', 7, 4);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(4, 'Zabieramy paliwko', 0, '2012-04-21 12:56:16', 7, 7);

INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(1, 'Magazyn', 1000, 100, 100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(2, 'Inny magazyn', 3000, 1000, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(3, 'Duży magazyn', 50000, 0, 5000, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(4, 'CCCP', 100, 0, 56, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(5, 'AAA', 1300, 0, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(6, 'BBB', 1500, 0, 5200, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(7, 'CCC', 1100, 0, 1100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(8, 'DDDE', 200, 0, 100, 4);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(9, 'EEE', 1500, 1000, 1500, 4);

INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(1, '2012-04-19 19:51:25', 2, 1);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(6, '2012-04-19 19:53:42', 6, 2);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(7, '2012-04-19 19:53:46', 6, 3);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(9, '2012-04-19 20:04:26', 2, 4);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(10, '2012-04-19 20:04:26', 2, 5);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(12, '2012-04-21 12:40:24', 6, 6);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(13, '2012-04-21 12:40:49', 6, 7);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(14, '2012-04-21 12:50:37', 1, 8);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(15, '2012-04-21 12:50:37', 1, 9);

INSERT INTO `Odbior_Ladunku` (`id_Odbior_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(1, '2012-04-21 12:52:32', 6, 9);
INSERT INTO `Odbior_Ladunku` (`id_Odbior_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(2, '2012-04-21 12:52:32', 7, 8);

INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(1, '2012-04-16 19:50:35',  5, 4, 4);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(2, '2011-04-10 19:50:41',  5, 7, 2);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(3, '2012-04-21 12:13:14',  5, 2, 2);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(4, '2012-04-21 12:13:26',  5, 1, 1);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(5, '2012-04-21 12:13:34',  5, 5, 6);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(6, '2012-04-21 12:13:45',  5, 56565, 3);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`,  `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(7, '2012-04-21 12:54:48',  5, 7, 1);

INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`,  `id_Zadokowany`, `id_Uzytkownik`) VALUES(1, '2012-04-19 20:00:17',  1, 5);
INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`,  `id_Zadokowany`, `id_Uzytkownik`) VALUES(2, '2012-04-21 12:13:14',  2, 5);
INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`,  `id_Zadokowany`, `id_Uzytkownik`) VALUES(3, '2012-04-21 12:54:44',  3, 5);
INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`,  `id_Zadokowany`, `id_Uzytkownik`) VALUES(4, '2012-04-21 12:54:48',  4, 5);
INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`,  `id_Zadokowany`, `id_Uzytkownik`) VALUES(5, '2012-04-21 12:56:34',  5, 5);

INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(1, 'Portowa (za dok)', 48000, 0, '2012-04-19 20:00:17', 1, 5);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(2, 'Celna (Cło)', 10000, 0, '2012-04-19 20:01:13', 2, NULL);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(3, 'Celna (Inna)', 200, 0, '2012-04-19 20:01:13', 2, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(4, 'Celna (Cło)', 1000, 1, '2012-04-19 20:04:46', 2, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(5, 'Celna (Inna)', 1000, 0, '2012-04-19 20:12:06', 2, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(6, 'Portowa (za dok)', 18900000, 1, '2012-04-21 12:13:14', 1, 5);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(8, 'Portowa (za dok)', 10000, 0, '2012-04-21 12:54:44', 1, 5);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(9, 'Portowa (za dok)', 1000, 0, '2012-04-21 12:54:48', 1, 5);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(10, 'Celna (Kara)', 1000000, 0, '2012-04-21 12:56:16', 6, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(11, 'Portowa (za dok)', 1600, 0, '2012-04-21 12:56:34', 9, 5);


INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(1, '2012-04-19 19:51:25', 'Ile iPhonów!', 0, NULL, 2, NULL, NULL, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(2, '2012-04-19 19:53:42', '', 1, NULL, 4, NULL, NULL, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(3, '2012-04-19 19:53:46', '', 1, NULL, 4, NULL, NULL, 6, 3);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(4, '2012-04-19 20:04:09', '', 1, 2, NULL, NULL, 9, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(5, '2012-04-19 20:04:26', '', 0, NULL, 2, NULL, NULL, 6, 4);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(6, '2012-04-19 20:04:27', '', 0, NULL, 2, NULL, NULL, 6, 5);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(7, '2012-04-19 20:12:06', NULL, 1, 2, NULL, NULL, NULL, 7, 4);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(8, '2012-04-21 12:32:32', '', 1, 2, NULL, NULL, 1, 6, 5);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(9, '2012-04-21 12:40:24', '', 0, NULL, 6, NULL, NULL, 6, 6);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(10, '2012-04-21 12:40:49', '', 0, NULL, 6, NULL, NULL, 6, 7);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(11, '2012-04-21 12:50:37', '', 0, NULL, 1, NULL, NULL, 6, 8);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(12, '2012-04-21 12:50:37', '', 0, NULL, 1, NULL, NULL, 6, 9);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(13, '2012-04-21 12:50:59', 'Żeśmy sobie przeładowali', 0, 1, NULL, NULL, 4, 6, 8);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(14, '2012-04-21 12:52:06', 'I z powrotem', 0, NULL, 1, 4, NULL, 6, 8);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(15, '2012-04-21 12:52:32', NULL, 1, 1, NULL, NULL, NULL, 6, 9);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(16, '2012-04-21 12:52:32', NULL, 1, 1, NULL, NULL, NULL, 6, 8);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(17, '2012-04-21 12:54:11', '', 1, 6, NULL, NULL, 2, 6, 6);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(18, '2012-04-21 12:56:16', NULL, 1, 6, NULL, NULL, NULL, 7, 7);
