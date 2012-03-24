DELIMITER //
CREATE PROCEDURE oddokuj(OUT zadokowany INT, OUT data DATE)
BEGIN
    DECLARE kontrh, oplataZaDokowanie, statk INTEGER;
    SELECT DATEDIFF(z.data, data)*d.cenaZaPobyt FROM Zadokowany z
    INNER JOIN d Dok ON (z.id_Dok = d.id_Dok)
    WHERE z.id_Zadokowany = zadokowany INTO oplataZaDokowanie;
    
    SELECT z.id_Statek FROM Zadokowany z
    INTO statk;
    
    SELECT k.id_Kontrahent FROM Zadokowany z
    INNER JOIN Statek s ON (z.id_Statek = s.id_Statek)
    INNER JOIN Kontrahent k ON (k.id_Kontrahent = s.id_Kontrahent)
    INTO kontrh;
    
    SELECT * 
    
END
 //

DELIMITER ;
