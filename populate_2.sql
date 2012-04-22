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

INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(4, 'AssA', 'Administrator systemu', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(5, 'Port', 'Administrator portu', '062d8a9dec0fa507d19f3b3481b4980ca139455f', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(6, 'Cargo', 'Administrator ladunkow', 'e0d6ae5cf2a2d0c1075943593a36cc5377382a05', NULL);
INSERT INTO `Uzytkownik` (`id_Uzytkownik`, `nazwa`, `funkcja`, `haslo`, `url_Obrazka`) VALUES(7, 'Duty', 'Inspektor celny', 'd1f30ba13f7633d895b69320b94ad2bac77f4b2c', NULL);

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
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(6, 'Wegiel', 30, 10, 6, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(7, 'Miedź', 50, 30000, 8, 1, 3);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(11, 'iPhone 4S', 100, 2000, 0.25, 10, 1);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(12, 'Traktor Ursus', 150, 3000, 2, 15, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(13, 'Honda Civic', 10000, 200000, 1.2, 8.5, 5);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(14, 'Pszenica', 250, 4000, 1.6, 1, 4);
INSERT INTO `Towar` (`id_Towar`, `nazwa`, `clo_jednostkowe`, `wartosc_jednostkowa`, `masa_jednostkowa`, `objetosc_jednostkowa`, `id_Typ_Ladunku`) VALUES(15, 'Cukier', 550, 9000, 2, 1, 4);

INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(1, 'Euromax', 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(2, 'Delta', 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(3, 'City', 3);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(4, 'APMT', 1);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(5, 'RST', 2);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(6, 'Agro', 4);
INSERT INTO `Terminal` (`id_Terminal`, `nazwa`, `id_Typ_Ladunku`) VALUES(7, 'DRBB', 5);

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

INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(1, 'Magazyn', 1000, 0, 100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(2, 'Inny magazyn', 3000, 0, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(3, 'Duży magazyn', 50000, 0, 5000, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(4, 'CCCP', 100, 0, 56, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(5, 'AAA', 1300, 0, 300, 2);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(6, 'BBB', 1500, 8, 5200, 3);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(7, 'CCC', 1100, 0, 1100, 1);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(8, 'DDDE', 200, 0, 100, 4);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(9, 'EEE', 1500, 0, 1500, 4);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(10, 'AgroMag1', 10000, 0, 1000, 6);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(11, 'AgroMag2', 3000, 0, 100, 6);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(12, 'DrobMag1', 10000, 0, 100, 7);
INSERT INTO `Magazyn` (`id_Magazyn`, `nazwa`, `pojemnosc`, `aktualna_objetosc_ladunkow`, `cena_Za_Przechowanie`, `id_Terminal`) VALUES(13, 'DrobMag2', 8000, 0, 80, 7);

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

INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(1, 'FedEx', 'Lincoln Avenue 12, New York', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(2, 'UPS', 'LA', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(3, 'Maersk', 'Copenhagen', 11, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(4, 'Jan Kulczyk', 'Warszawa', 2, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(5, 'Qai Chan', 'Seoul', 12, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(6, 'KGHM', 'Lubin, Miedziana 123', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(7, 'Bogdanka', 'Lublin, Węglowa 16', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(8, 'Compagnie Maritime Belge', 'Haga', 14, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(9, 'Hapag-Lloyd', 'Hamburg', 6, 'Armator');
INSERT INTO `Kontrahent` (`id_Kontrahent`, `nazwa`, `adres`, `id_Kraj`, `typ`) VALUES(10, 'H. Vogemann', 'Berlin, Ludwigsstrasse 122', 6, 'Armator');

INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(1, 5, 5, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(2, 3, 6, 1);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(3, 20, 6, 0);
INSERT INTO `Ladunek` (`id_Ladunek`, `ilosc`, `id_Towar`, `czy_kontrola_celna`) VALUES(4, 100, 1, 1);

INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(1, '2012-04-22 14:07:31', 6, 1);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(2, '2012-04-22 14:07:32', 6, 2);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(4, '2012-04-22 14:08:01', 7, 3);
INSERT INTO `Nadanie_Ladunku` (`id_Nadanie_Ladunku`, `data`, `id_Kontrahent`, `id_Ladunek`) VALUES(5, '2012-04-22 14:08:28', 1, 4);

INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(1, 'Portowa (za dok)', 12000, 1, '2012-04-22 14:05:23', 1, 5);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(3, 'Celna (Cło)', 90, 0, '2012-04-22 14:13:12', 6, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(4, 'Celna (Inna)', 20000, 0, '2012-04-22 14:13:12', 6, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(5, 'Celna (Kara)', 200, 0, '2012-04-22 14:13:24', 1, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(6, 'Celna (Cło)', 100, 0, '2012-04-22 14:13:48', 6, 7);
INSERT INTO `Oplata` (`id_Oplata`, `typ`, `kwota`, `czy_oplacona`, `data_naliczenia`, `id_Kontrahent`, `id_Uzytkownik`) VALUES(7, 'Celna (Inna)', 200, 0, '2012-04-22 14:13:48', 6, 7);

INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(1, 'Pilateus', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(2, 'Pilateus2', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(3, 'Nautilius', 300, 300, 0, 300, 0, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(4, 'Alabama', 200, 200, 120, 200, 20, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(5, 'Tytanik', 200, 1000, 0, 1000, 0, 100, 100, 20, 'Aaaa Bbbbb', '2000-10-10', 4, 1);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(6, 'Concordia', 3000, 2000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1990-01-01', 9, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(7, 'Jan Heweliusz', 3000, 1500, 0, 1000, 0, 250, 45, 56, 'Zbigniew Holdys', '1990-01-01', 4, 4);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(8, 'Atlas', 50000, 20000, 0, 10000, 0, 180, 34, 44, 'Johnny Bravo', '1980-02-01', 8, 5);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(9, 'Santa Maria', 2500, 2000, 0, 100000, 0, 300, 100, 100, 'Krzysztof Kolumb', '1490-11-06', 5, 2);
INSERT INTO `Statek` (`id_Statek`, `nazwa`, `wypornosc`, `ladownosc_masowa`, `aktualna_masa_ladunkow`, `ladownosc_objetosciowa`, `aktualna_objetosc_ladunkow`, `dlugosc`, `szerokosc`, `wysokosc`, `kapitan`, `data_produkcji`, `id_Kontrahent`, `id_Typ_Ladunku`) VALUES(11, 'Queen Mary', 2000, 1000, 0, 1000, 0, 50, 20, 10, 'Rysio Lubicz', '1890-01-01', 9, 4);

INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(1, '2012-04-22 14:04:39', 5, 4, 4);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(2, '2012-04-22 14:04:46', 5, 2, 2);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(3, '2012-04-22 14:04:55', 5, 1, 1);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(4, '2012-04-22 14:05:02', 5, 100, 7);
INSERT INTO `Zadokowany` (`id_Zadokowany`, `data`, `id_Uzytkownik`, `id_Dok`, `id_Statek`) VALUES(5, '2012-04-22 14:05:23', 5, 6, 4);

INSERT INTO `Oddokowany` (`id_Oddokowany`, `data`, `id_Zadokowany`, `id_Uzytkownik`) VALUES(1, '2012-04-22 14:05:23', 1, 5);

INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(1, '2012-04-22 14:07:32', '', 0, NULL, 4, NULL, NULL, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(2, '2012-04-22 14:07:32', '', 0, NULL, 4, NULL, NULL, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(3, '2012-04-22 14:08:01', '', 1, NULL, 4, NULL, NULL, 6, 3);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(4, '2012-04-22 14:08:28', '', 0, NULL, 2, NULL, NULL, 6, 4);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(5, '2012-04-22 14:13:24', NULL, 1, 2, NULL, NULL, NULL, 7, 4);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(6, '2012-04-22 14:15:15', '', 0, 4, NULL, NULL, 3, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(7, '2012-04-22 14:15:15', '', 0, 4, NULL, NULL, 3, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(8, '2012-04-22 14:15:35', '', 0, NULL, 4, 3, NULL, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(9, '2012-04-22 14:15:52', '', 0, NULL, 4, 3, NULL, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(10, '2012-04-22 14:17:42', '', 0, 4, NULL, NULL, 3, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(11, '2012-04-22 14:17:43', '', 0, 4, NULL, NULL, 3, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(12, '2012-04-22 14:18:03', '', 0, NULL, 4, 3, NULL, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(13, '2012-04-22 14:18:03', '', 0, NULL, 4, 3, NULL, 6, 2);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(14, '2012-04-22 14:25:57', '', 1, 4, NULL, NULL, 6, 6, 1);
INSERT INTO `Przeladunek` (`id_Przeladunek`, `data`, `uwagi`, `czy_aktualne_polozenie`, `id_Statek1`, `id_Statek2`, `id_Magazyn1`, `id_Magazyn2`, `id_Uzytkownik`, `id_Ladunek`) VALUES(15, '2012-04-22 14:25:57', '', 1, 4, NULL, NULL, 6, 6, 2);

INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(1, '', 0, '2012-04-22 14:12:50', 7, 1);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(2, '', 1, '2012-04-22 14:13:12', 7, 2);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(3, '', 0, '2012-04-22 14:13:24', 7, 4);
INSERT INTO `Kontrola_Celna` (`id_Kontrola_Celna`, `uwagi`, `czy_pozytywna`, `data`, `id_Uzytkownik`, `id_Ladunek`) VALUES(4, 'asasaas ', 1, '2012-04-22 14:13:48', 7, 1);
