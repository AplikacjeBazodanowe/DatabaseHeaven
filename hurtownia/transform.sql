/*Transformacja danych z bazy danych aplikacji do bazy danych hurtowni*/


DELETE FROM warehouseheaven.dbo.Kontrola_Celna;
DELETE FROM warehouseheaven.dbo.Obsluga_Ladunku;
DELETE FROM warehouseheaven.dbo.Pobyt_Statku;
DELETE FROM warehouseheaven.dbo.Statek;
DELETE FROM warehouseheaven.dbo.Towar;
DELETE FROM warehouseheaven.dbo.Dok;
DELETE FROM warehouseheaven.dbo.Terminal;
DELETE FROM warehouseheaven.dbo.Typ_Ladunku;
DELETE FROM warehouseheaven.dbo.Port;
DELETE FROM warehouseheaven.dbo.Kontrahent;
DELETE FROM warehouseheaven.dbo.Kraj;

SET IDENTITY_INSERT warehouseheaven.dbo.Kraj ON
INSERT INTO warehouseheaven.dbo.Kraj(id_Kraj,nazwa)
SELECT id_Kraj, nazwa FROM databaseheaven.dbo.Kraj;
SET IDENTITY_INSERT warehouseheaven.dbo.Kraj OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Kontrahent ON
INSERT INTO warehouseheaven.dbo.Kontrahent(id_Kontrahent,nazwa, adres,typ,id_Kraj)
SELECT id_Kontrahent,nazwa,adres,typ,id_Kraj FROM databaseheaven.dbo.Kontrahent;
SET IDENTITY_INSERT warehouseheaven.dbo.Kontrahent OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Typ_Ladunku ON
INSERT INTO warehouseheaven.dbo.Typ_Ladunku
(id_Typ_Ladunku,typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci)
SELECT id_Typ_Ladunku,typ_Statku, nazwa_Typu_Ladunku, typ_Terminala, jednostka_Masy, jednostka_Objetosci
FROM databaseheaven.dbo.Typ_Ladunku;
SET IDENTITY_INSERT warehouseheaven.dbo.Typ_Ladunku OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Towar ON
INSERT INTO warehouseheaven.dbo.Towar (id_Towar, nazwa, id_Typ_Ladunku)
SELECT id_Towar ,nazwa, id_Typ_Ladunku FROM databaseheaven.dbo.Towar;
SET IDENTITY_INSERT warehouseheaven.dbo.Towar OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Statek ON
INSERT INTO warehouseheaven.dbo.Statek 
(id_Statek, nazwa,wypornosc,ladownosc_masowa,ladownosc_objetosciowa,
dlugosc,szerokosc,wysokosc,kapitan,data_produkcji,id_Kontrahent,id_Typ_Ladunku)
SELECT id_Statek, nazwa,wypornosc,ladownosc_masowa,ladownosc_objetosciowa,
dlugosc,szerokosc,wysokosc,kapitan,data_produkcji,id_Kontrahent,id_Typ_Ladunku
FROM databaseheaven.dbo.Statek;
SET IDENTITY_INSERT warehouseheaven.dbo.Statek OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Port ON
INSERT INTO warehouseheaven.dbo.Port (id_Port, nazwa, adres)
SELECT id_Port, nazwa, adres FROM databaseheaven.dbo.Port;
SET IDENTITY_INSERT warehouseheaven.dbo.Port OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Terminal ON
INSERT INTO warehouseheaven.dbo.Terminal(id_Terminal, nazwa, id_Typ_Ladunku, id_Port)
SELECT id_Terminal, nazwa, id_Typ_Ladunku, id_Port FROM databaseheaven.dbo.Terminal;
SET IDENTITY_INSERT warehouseheaven.dbo.Terminal OFF

SET IDENTITY_INSERT warehouseheaven.dbo.Dok ON
INSERT INTO warehouseheaven.dbo.Dok 	
(id_Dok, maks_dlugosc_statku,maks_szerokosc_statku,maks_wysokosc_statku,cena_za_pobyt,id_Terminal)
SELECT id_Dok, maks_dlugosc_statku,maks_szerokosc_statku,maks_wysokosc_statku,cena_za_pobyt,id_Terminal FROM databaseheaven.dbo.Dok;
SET IDENTITY_INSERT warehouseheaven.dbo.Dok OFF

INSERT INTO warehouseheaven.dbo.Kontrola_Celna(data, czy_pozytywna, oplata, id_Towar, id_Terminal)
SELECT K.data, K.czy_pozytywna, O.kwota, L.id_Towar, K.id_Terminal
FROM databaseheaven.dbo.Kontrola_Celna K
	INNER JOIN databaseheaven.dbo.Ladunek L ON L.id_Ladunek=K.id_Ladunek
	INNER JOIN databaseheaven.dbo.Towar T ON L.id_Towar=T.id_Towar
	INNER JOIN databaseheaven.dbo.Oplata O ON K.id_Ladunek=O.id_Ladunek
WHERE O.typ=2;
	
INSERT INTO warehouseheaven.dbo.Obsluga_Ladunku
(data_nadania,data_odbioru,ilosc,wartosc,masa,objetosc,oplata,id_Towar)
SELECT N.data, O.data, L.ilosc, T.wartosc_jednostkowa*L.ilosc, T.masa_jednostkowa*L.ilosc
, T.objetosc_jednostkowa*L.ilosc, Op.kwota, L.id_Towar
FROM databaseheaven.dbo.Ladunek L
	INNER JOIN databaseheaven.dbo.Towar T ON L.id_Towar=T.id_Towar
	INNER JOIN databaseheaven.dbo.Nadanie_Ladunku N ON L.id_Ladunek=N.id_Ladunek
	INNER JOIN databaseheaven.dbo.Odbior_Ladunku O ON L.id_Ladunek=O.id_Ladunek
	INNER JOIN databaseheaven.dbo.Oplata Op ON L.id_Ladunek=Op.id_Ladunek
WHERE Op.typ=1;


INSERT INTO warehouseheaven.dbo.Pobyt_Statku
(data_zadokowania,data_oddokowania,oplata,id_Statek,id_Dok,id_Kontrahent)
SELECT Z.data, O.data, Op.kwota, Z.id_Statek, Z.id_Dok, Op.id_Kontrahent
FROM databaseheaven.dbo.Zadokowany Z
	INNER JOIN databaseheaven.dbo.Oddokowany O ON O.id_Zadokowany=Z.id_Zadokowany
	INNER JOIN databaseheaven.dbo.Oplata Op ON Op.id_Zadokowany=Z.id_Zadokowany;	







