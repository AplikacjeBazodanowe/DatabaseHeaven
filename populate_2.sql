INSERT INTO `Kody_Bledow` VALUES(1, 1, 'blad dokowania - nie wszystkie ladunki przeszly pozytywna kontrole celna');
INSERT INTO `Kody_Bledow` VALUES(2, 2, 'blad dokowania - typ ladunkow na statku nie zgodny z typem terminala');
INSERT INTO `Kody_Bledow` VALUES(3, 3, 'blad dokowania - statek nie miesci sie w doku');
INSERT INTO `Kody_Bledow` VALUES(4, 4, 'blad dokowania - juz oddokowano');
INSERT INTO `Kody_Bledow` VALUES(5, 5, 'blad dokowania - nie mozna oddokowac, bo statek nie jest zadokowany');
INSERT INTO `Kody_Bledow` VALUES(6, 6, 'blad dokowania - nie mozna zadokowac, bo dok nie jest pusty');
INSERT INTO `Kody_Bledow` VALUES(7, 7, 'blad dokowania - juz zadokowano');
INSERT INTO `Kody_Bledow` VALUES(8, 8, 'blad przeladowania - ladunek nie przeszedl pozytywnej kontroli celnej');
INSERT INTO `Kody_Bledow` VALUES(9, 9, 'blad przeladowania - typ ladunku niezgodny z typem statku');
INSERT INTO `Kody_Bledow` VALUES(10, 10, 'blad przeladowania - typ ladunku niezgodny z typem magazynu');
INSERT INTO `Kody_Bledow` VALUES(11, 11, 'blad przeladowania - ladunek nie zmiesci sie na statku');
INSERT INTO `Kody_Bledow` VALUES(12, 12, 'blad przeladowania - ladunek nie zmiesci sie w magazynie');
INSERT INTO `Kody_Bledow` VALUES(13, 13, 'blad przeladowania - zrodlo i cel nie sa rozne lub proba dwukrotnego przeladowania w to samo miejsce');

INSERT INTO `Typ_Ladunku` VALUES(1, 'Kontenerowiec', 'Kontenery', 'Kontenerowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` VALUES(2, 'Tankowiec', 'Przetwory naftowe', 'Naftowy', 't', 'l');
INSERT INTO `Typ_Ladunku` VALUES(3, 'Masowiec (surowcowy)', 'Surowiec', 'Masowy', 't', 'm^3');
INSERT INTO `Typ_Ladunku` VALUES(4, 'Masowiec (rolny)', 'Masa rolna', 'Mas rolnych', 't', 'm^3');
INSERT INTO `Typ_Ladunku` VALUES(5, 'Drobnicowiec', 'Drobnica', 'Drobnicowy', 't', 'm^3');

INSERT INTO `Terminal` VALUES(1, 'Euromax', 1);
INSERT INTO `Terminal` VALUES(2, 'Delta', 2);
INSERT INTO `Terminal` VALUES(3, 'City', 3);
INSERT INTO `Terminal` VALUES(4, 'APMT', 1);
INSERT INTO `Terminal` VALUES(5, 'RST', 2);

INSERT INTO `Kraj` VALUES(1, 'Stany Zjednoczone');
INSERT INTO `Kraj` VALUES(2, 'Polska');
INSERT INTO `Kraj` VALUES(3, 'Wielka Brytania');
INSERT INTO `Kraj` VALUES(4, 'Singapur');
INSERT INTO `Kraj` VALUES(5, 'Czechy');
INSERT INTO `Kraj` VALUES(6, 'Niemcy');
INSERT INTO `Kraj` VALUES(7, 'Rosja');
INSERT INTO `Kraj` VALUES(8, 'Slowacja');
INSERT INTO `Kraj` VALUES(9, 'Holandia');
INSERT INTO `Kraj` VALUES(10, 'Grecja');
INSERT INTO `Kraj` VALUES(11, 'Dania');
INSERT INTO `Kraj` VALUES(12, 'Chiny');
INSERT INTO `Kraj` VALUES(13, 'Izreal');
INSERT INTO `Kraj` VALUES(14, 'Belgia');

INSERT INTO `Kontrahent` VALUES(1, 'ghsgh', 'hghghg', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` VALUES(2, 'UPS', 'LA', 1, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` VALUES(3, 'Maersk', 'Copenhagen', 11, 'Armator');
INSERT INTO `Kontrahent` VALUES(4, 'aaa', 'aaa', 1, 'Armator');
INSERT INTO `Kontrahent` VALUES(5, 'Qai Chan', 'Seoul', 12, 'Armator');
INSERT INTO `Kontrahent` VALUES(6, 'KGHM', 'Lubin, Miedziana 123', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` VALUES(7, 'Bogdanka', 'Lublin, Węglowa 10', 2, 'Wlasciciel ladunku');
INSERT INTO `Kontrahent` VALUES(8, 'Compagnie Maritime Belge', 'Haga', 14, 'Armator');
INSERT INTO `Kontrahent` VALUES(9, 'Hapag-Lloyd', 'Hamburg', 6, 'Armator');
INSERT INTO `Kontrahent` VALUES(10, 'H. Vogemann', 'Berlin, Ludwigsstrasse 122', 6, 'Armator');

INSERT INTO `Magazyn` VALUES(1, 'Magazyn', 1000, 0, 100, 1);
INSERT INTO `Magazyn` VALUES(2, 'Inny magazyn', 3000, 0, 300, 2);
INSERT INTO `Magazyn` VALUES(3, 'Duży magazyn', 50000, 0, 5000, 3);
INSERT INTO `Magazyn` VALUES(4, 'CCCP', 100, 0, 56, 1);
INSERT INTO `Magazyn` VALUES(5, 'AAA', 1300, 0, 300, 2);
INSERT INTO `Magazyn` VALUES(6, 'BBB', 1500, 0, 5200, 3);
INSERT INTO `Magazyn` VALUES(7, 'CCC', 1100, 0, 1100, 1);
INSERT INTO `Magazyn` VALUES(8, 'DDDE', 200, 0, 100, 4);
INSERT INTO `Magazyn` VALUES(9, 'EEE', 1500, 0, 1500, 4);

INSERT INTO `Statek` VALUES(1, 'Pilateus', 100, 100, 0, 100, 0, 100, 100, 100, 'Jack Sparrow', '1998-01-29', 1, 1);
INSERT INTO `Statek` VALUES(2, 'Pilateus2', 1000, 1000, 0, 1000, 0, 1000, 100, 100, 'Micheal Platini', '1498-01-29', 1, 1);
INSERT INTO `Statek` VALUES(3, 'Nautilius', 300, 300, 0, 300, 0, 300, 300, 300, ' Richard Phillips', '1968-01-29', 1, 2);
INSERT INTO `Statek` VALUES(4, 'Alabama', 200, 200, 0, 200, 0, 200, 200, 200, ' John Corn', '1968-01-29', 1, 3);
INSERT INTO `Statek` VALUES(5, 'Tytanik', 200, 1000, 0, 1000, 0, 100, 100, 20, 'Aaaa Bbbbb', '2000-10-10', 4, 1);
INSERT INTO `Statek` VALUES(6, 'Concordia', 3000, 2000, 0, 2500, 0, 300, 67, 40, 'Schettino', '1990-01-01', 9, 2);

INSERT INTO `Towar` VALUES(1, 'iPad', 100, 2000, 1, 1, 1);
INSERT INTO `Towar` VALUES(2, 'Honda Civic', 10000, 200000, 1, 10, 1);
INSERT INTO `Towar` VALUES(3, 'Ropa', 10, 100, 1, 1000, 2);
INSERT INTO `Towar` VALUES(4, 'Benzyna', 40, 400, 1, 1000, 2);
INSERT INTO `Towar` VALUES(5, 'Ruda żelaza', 20, 200, 5, 1, 3);
INSERT INTO `Towar` VALUES(6, 'Wegiel', 30, 10, 6, 1, 3);
INSERT INTO `Towar` VALUES(7, 'Miedź', 50, 30000, 8, 1, 3);
INSERT INTO `Towar` VALUES(11, 'iPhone 4S', 100, 2000, 5, 10, 1);

INSERT INTO `Dok` VALUES(1, 100, 100, 100, 1000, 1);
INSERT INTO `Dok` VALUES(2, 10000, 10000, 10000, 10000, 1);
INSERT INTO `Dok` VALUES(4, 500, 500, 500, 12000, 3);
INSERT INTO `Dok` VALUES(5, 500, 200, 100, 1600, 2);
INSERT INTO `Dok` VALUES(6, 500, 100, 100, 15000, 3);
INSERT INTO `Dok` VALUES(7, 1000, 500, 200, 50000, 4);
INSERT INTO `Dok` VALUES(9, 200, 200, 200, 2000, 2);
INSERT INTO `Dok` VALUES(101, 100, 100, 100, 10, 3);
INSERT INTO `Dok` VALUES(56565, 1000, 1000, 1000, 100, 2);

INSERT INTO `Uzytkownik` VALUES(4, 'AssA', 'Administrator systemu', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', '');
INSERT INTO `Uzytkownik` VALUES(5, 'Port', 'Administrator portu', '062d8a9dec0fa507d19f3b3481b4980ca139455f', NULL);
INSERT INTO `Uzytkownik` VALUES(6, 'Cargo', 'Administrator ladunkow', 'e0d6ae5cf2a2d0c1075943593a36cc5377382a05', NULL);
INSERT INTO `Uzytkownik` VALUES(7, 'Duty', 'Inspektor celny', 'd1f30ba13f7633d895b69320b94ad2bac77f4b2c', NULL);
INSERT INTO `Uzytkownik` VALUES(8, 'asas', 'Administrator portu', 'b620b8b2a3b4937670eb1252b8dc1b3a3d6e5111', '2012-03-05 15.50.47.jpg');

