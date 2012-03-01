CREATE DATABASE `databaseheaven`;

CREATE  TABLE `databaseheaven`.`TypLadunku` (

  `id_TypLadunku` INT NOT NULL AUTO_INCREMENT ,

  `nazwa` VARCHAR(100) NOT NULL ,

  PRIMARY KEY (`id_TypLadunku`) );


CREATE  TABLE `databaseheaven`.`Kontrahent` (

  `id_Kontrahent` INT NOT NULL AUTO_INCREMENT ,

  `nazwa` VARCHAR(255) NOT NULL ,

  `adres` VARCHAR(255) NOT NULL ,

  `kraj` VARCHAR(255) NOT NULL ,

  `typ` ENUM('Armator','Właściciel ładunku','Inny') NOT NULL ,

  PRIMARY KEY (`id_Kontrahent`) );
  
  
  CREATE  TABLE `databaseheaven`.`Statek` (

  `id_Statek` INT NOT NULL AUTO_INCREMENT ,

  `nazwa` VARCHAR(255) NOT NULL ,

  `id_TypLadunku` INT NOT NULL ,

  `wypornosc` INT NOT NULL ,

  `ladownosc` INT NOT NULL ,

  `dlugosc` INT NOT NULL ,

  `szerokosc` INT NOT NULL ,

  `wysokosc` INT NOT NULL ,

  `kapitan` VARCHAR(255) NOT NULL ,

  `data_produkcji` DATE NOT NULL ,

  `id_Kontrahent` INT NULL ,

  PRIMARY KEY (`id_Statek`) ,
  FOREIGN KEY (`id_Kontrahent`) REFERENCES Kontrahent(`id_Kontrahent`),
  FOREIGN KEY (`id_TypLadunku`) REFERENCES TypLadunku(`id_TypLadunku`) );
  
  
  
  CREATE  TABLE `databaseheaven`.`Nadanie_Ladunku` (

  `id_Nadanie_Ladunku` INT NOT NULL AUTO_INCREMENT ,

  `data` DATETIME NOT NULL ,

  `uwagi` LONGTEXT NULL ,

  `id_Kontrahent` INT NULL ,

  PRIMARY KEY (`id_Nadanie_Ladunku`) ,

  FOREIGN KEY (`id_Kontrahent`) REFERENCES Kontrahent(`id_Kontrahent`) );
  
  
  CREATE  TABLE `databaseheaven`.`Odbior_Ladunku` (

  `id_Odbior_Ladunku` INT NOT NULL AUTO_INCREMENT ,

  `data` DATETIME NOT NULL ,

  `uwagi` LONGTEXT NULL ,

  `id_Kontrahent` INT NOT NULL ,

  PRIMARY KEY (`id_Odbior_Ladunku`) ,

  FOREIGN KEY (`id_Kontrahent`) REFERENCES Kontrahent(`id_Kontrahent`) );
  
  
   CREATE  TABLE `databaseheaven`.`Towar` (

  `id_Towar` INT NOT NULL AUTO_INCREMENT ,
  
  `wartosc_jednostkowa` INT NOT NULL ,

  `clo_jednostkowe` INT NOT NULL ,
  
  `masa_jadnostkowa` INT NOT NULL ,
  
  `objetosc_jadnostkowa` INT NOT NULL ,

  `id_TypLadunku` INT NOT NULL ,  

  PRIMARY KEY (`id_Towar`),
  FOREIGN KEY (`id_TypLadunku`) REFERENCES TypLadunku(`id_TypLadunku`));
  
  
  
  CREATE  TABLE `databaseheaven`.`Ladunek` (

  `id_Ladunek` INT NOT NULL AUTO_INCREMENT ,

  `ilosc` INT NOT NULL ,

  `uwagi` LONGTEXT NULL ,

  `id_Towar` INT NOT NULL ,
  
  `czy_kontrola_celna` BOOLEAN NOT NULL ,
  
  PRIMARY KEY (`id_Ladunek`),
  FOREIGN KEY (`id_Towar`) REFERENCES Towar(`id_Towar`)
  );
  
  
  CREATE  TABLE `databaseheaven`.`Terminal` (

  `id_Terminal` INT NOT NULL AUTO_INCREMENT ,

  `nazwa` VARCHAR(255) NOT NULL ,

  `id_TypLadunku` INT NOT NULL ,  

  PRIMARY KEY (`id_Terminal`) ,
  
  FOREIGN KEY (`id_TypLadunku`) REFERENCES TypLadunku(`id_TypLadunku`),

  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa` ASC) );
 
 
 CREATE  TABLE `databaseheaven`.`Magazyn` (

  `id_Magazyn` INT NOT NULL ,

  `nazwa` VARCHAR(255) NOT NULL ,

  `pojemnosc` INT NOT NULL ,

  `cenaZaPrzechowanie` INT NULL ,

  `id_Terminal` INT NOT NULL ,

  PRIMARY KEY (`id_Magazyn`) ,

  FOREIGN KEY (`id_Terminal`) REFERENCES Terminal(`id_Terminal`) );
  
  
  
  CREATE  TABLE `databaseheaven`.`Przeladunek` (

  `id_Przeladunek` INT NOT NULL AUTO_INCREMENT ,

  `data` DATETIME NOT NULL ,

  `uwagi` LONGTEXT NULL ,

  `czy_aktualne_polozenie` BOOLEAN NOT NULL ,

  `id_statek1` INT NULL ,

  `id_statek2` INT NULL ,

  `id_magazyn1` INT NULL ,

  `id_magazyn2` INT NULL ,

  `id_Uzytkownik` INT NOT NULL ,
  
  `id_Ladunek` INT NOT NULL, 
  
  PRIMARY KEY (`id_Przeladunek`), 
  FOREIGN KEY (`id_Ladunek`) REFERENCES Ladunek(`id_Ladunek`),
  FOREIGN KEY (`id_Statek1`) REFERENCES Statek(`id_Statek`),
  FOREIGN KEY (`id_Statek2`) REFERENCES Statek(`id_Statek`),
  FOREIGN KEY (`id_Magazyn1`) REFERENCES Magazyn(`id_Magazyn`),  
  FOREIGN KEY (`id_Magazyn2`) REFERENCES Magazyn(`id_Magazyn`) );
  
  
CREATE  TABLE `databaseheaven`.`Dok` (

  `id_Dok` INT NOT NULL AUTO_INCREMENT ,

  `maks_dlugosc_statku` INT NOT NULL ,

  `maks_szerokosc_statku` INT NOT NULL ,

  `maks_wysokosc_statku` INT NOT NULL ,

  `cena_za_pobyt` INT NOT NULL ,

  `id_Terminal` INT NOT NULL ,

  PRIMARY KEY (`id_Dok`),
    
  FOREIGN  KEY (`id_Terminal`) REFERENCES Terminal(`id_Terminal`) );
  
  
    CREATE  TABLE `databaseheaven`.`Uzytkownik` (

  `id_Uzytkownik` INT NOT NULL AUTO_INCREMENT ,

  `nazwa` VARCHAR(255) NOT NULL ,

  `funkcja` ENUM('sys_admin','port_admin','cargo_admin','customs_officer') NOT NULL ,

  PRIMARY KEY (`id_Uzytkownik`) );
  
  
  
  CREATE  TABLE `databaseheaven`.`Zadokowany` (

  `id_Zadokowany` INT NOT NULL AUTO_INCREMENT ,

  `data` DATETIME NOT NULL ,

  `uwagi` LONGTEXT NULL ,
  
  `id_Uzytkownik` INT NOT NULL, 
    
  `id_Dok` INT NOT NULL,
  
  `id_Statek` INT NOT NULL, 

  PRIMARY KEY (`id_Zadokowany`),
    
  FOREIGN KEY (`id_Dok`) REFERENCES Dok(`id_Dok`),
  
  FOREIGN KEY (`id_Statek`) REFERENCES Statek(`id_Statek`),
  
  
  FOREIGN KEY (`id_Uzytkownik`) REFERENCES Uzytkownik(`id_Uzytkownik`) );
  
  
  CREATE  TABLE `databaseheaven`.`Oddokowany` (

  `id_Oddokowany` INT NOT NULL AUTO_INCREMENT ,

  `data` DATETIME NOT NULL ,

  `uwagi` LONGTEXT NULL ,

  `id_Zadokowany` INT NOT NULL ,

  `id_Uzytkownik` INT NOT NULL,
  
  `id_Statek` INT NOT NULL, 

  PRIMARY KEY (`id_Oddokowany`), 
  
  FOREIGN KEY (`id_Zadokowany`) REFERENCES Zadokowany(`id_Zadokowany`),
  
  FOREIGN KEY (`id_Statek`) REFERENCES Statek(`id_Statek`),
    
  FOREIGN KEY (`id_Uzytkownik`) REFERENCES Uzytkownik(`id_Uzytkownik`) );
  
  

CREATE  TABLE `databaseheaven`.`Oplata` (

  `id_oplata` INT NOT NULL AUTO_INCREMENT ,

  `typ` ENUM('Celna',  'Portowa') NOT NULL ,

  `kwota` INT NOT NULL ,

  `czy_oplacona` TINYINT NOT NULL ,

  `data_naliczenia` DATETIME NOT NULL ,

  `id_kontrahent` INT NOT NULL ,
  
  `id_Uzytkownik` INT NOT NULL, 

  PRIMARY KEY (`id_oplata`) ,
  
  FOREIGN KEY (`id_Kontrahent`) REFERENCES Kontrahent(`id_Kontrahent`),
  
  FOREIGN KEY (`id_Uzytkownik`) REFERENCES Uzytkownik(`id_Uzytkownik`),
  
  INDEX `id_Kontrahent` (`id_kontrahent` ASC) );
  
  

CREATE  TABLE `databaseheaven`.`KontrolaCelna` (

  `id_KontrolaCelna` INT NOT NULL AUTO_INCREMENT ,

  `uwagi` LONGTEXT NULL ,

  `czy_pozytywna` BOOLEAN NOT NULL ,

  `data` DATETIME NOT NULL ,

  `id_Uzytkownik` INT NOT NULL ,

  `id_Ladunek` INT NOT NULL ,

  PRIMARY KEY (`id_KontrolaCelna`) ,
  
  FOREIGN KEY (`id_Uzytkownik`) REFERENCES Uzytkownik(`id_Uzytkownik`),
  
  FOREIGN KEY (`id_Ladunek`) REFERENCES Ladunek(`id_Ladunek`),
  
  INDEX `id_Uzytkownik` (`id_Uzytkownik` ASC) ,

  INDEX `id_Ladunek` (`id_Ladunek` ASC) );



  
  
