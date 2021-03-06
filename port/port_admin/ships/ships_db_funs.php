<?php

$root = $_SERVER['DOCUMENT_ROOT'];
include_once($root . "/DB.php");
//potrzebne bo używamy select_terminals w GUI
include_once($root . "/system_admin/terminals/terminals_db_funs.php");
include_once($root . "/system_admin/docks/docks_db_funs.php");

function register_ship($name, $displacement, $capMass, $capVol, $length, $width, $height, $captain, $prodDate, $ownerId, $typeId)
{
    $sql = "INSERT INTO Statek VALUES
						(NULL,'$name',$displacement,$capMass,0,$capVol,0,
						$length,$width,$height,'$captain','$prodDate',$ownerId,$typeId)";
    DB::query($sql);
}

function undock_ship($docked_id)
{
    $user_id = $_SESSION['user']; //będzie pobierane z sesji
    $sql = "CALL oddokuj($docked_id, NOW(), $user_id)";
    DB::query($sql)->close();
    $sql = "SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object()->opis;
}

function move_ship($ship_id, $docked_id, $newDock)
{
    $user_id = $_SESSION['user']; //będzie pobierane z sesji
    $sql = "CALL przesunStatek($docked_id,$newDock,$ship_id, $user_id, NOW())";
    DB::call($sql);
    $sql = "SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object()->opis;
}

//wartość zwracana=NULL jeśli wszystko ok lub komunikat błędu jeśli nie ok
function dock_ship($ship_id, $dock)
{
    $user_id = $_SESSION['user']; //będzie pobierane z sesji
    $sql = "CALL zadokuj($dock,$ship_id, NOW(), $user_id)";
    DB::query($sql)->close();
    $sql = "SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object()->opis;
}

function select_all_ships($name='')
{
    $sql = "SELECT id_Statek AS id, 
                    nazwa AS name						 
            FROM Statek 								
            WHERE nazwa LIKE '%$name%' ";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $ships[$i] = $result->fetch_object();
    return $ships;
}

function select_undocked_ships($name='')
{
    $sql = "SELECT DISTINCT id_Statek AS id, nazwa AS name						 
                FROM Statek s LEFT OUTER JOIN Zadokowany z USING(id_Statek)               
            WHERE nazwa LIKE '%$name%' AND (id_Zadokowany IS NULL OR NOT EXISTS 
            (
               SELECT id_Statek
               FROM 
               Statek INNER JOIN Zadokowany z1 USING(id_Statek)
               LEFT OUTER JOIN Oddokowany o USING(id_Zadokowany)
               WHERE s.id_Statek=id_Statek AND id_Oddokowany IS NULL
            ))
            ";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $ships[$i] = $result->fetch_object();
    return $ships;
}

function select_history_ships($name='', $typeId='', $termId='', $dockdateMin='', $dockdateMax='', $undockdateMin='', $undockdateMax='')
{
    $sql = "SELECT id_Zadokowany AS docked_id, 
                        nazwa AS name,
                        Zadokowany.data AS dock_date,
                        Dok.id_Dok as dock_id,
                        Oddokowany.data AS undock_date 
                FROM Statek NATURAL JOIN Zadokowany
                INNER JOIN Dok ON Dok.id_Dok=Zadokowany.id_Dok
                LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)				
                WHERE nazwa LIKE '%$name%' ";
    if (!empty($typeId))
        $sql.="AND id_Typ_Ladunku = $typeId ";
    if (!empty($termId))
        $sql.="AND id_Terminal = $termId ";
    if (!empty($dockdateMin))
        $sql.="AND Zadokowany.data >= '$dockdateMin' ";
    if (!empty($dockdateMax))
        $sql.="AND Zadokowany.data <= '$dockdateMax' ";
    if (!empty($undockdateMin))
        $sql.="AND Oddokowany.data >= '$undockdateMin' ";
    if (!empty($undockdateMax))
        $sql.="AND Oddokowany.data <= '$undockdateMax' ";
    $sql.=" ORDER BY Zadokowany.data DESC";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $ships[$i] = $result->fetch_object();
    return $ships;
}

function select_docked_ships($name='', $typeId='', $termId='', $capacityVolMin='', $capacityVolMax='', $capacityMassMin='', $capacityMassMax='', $lengthMin='', $lengthMax='', $widthMin='', $widthMax='', $heightMin='', $heightMax='')
{
    $sql = "SELECT Statek.id_Statek AS id, 
						 nazwa AS name, 
						 id_Dok AS dock_id, 
						 Zadokowany.id_Zadokowany AS docked_id
				FROM Statek 
				NATURAL JOIN Zadokowany 
				LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)				
				INNER JOIN Dok USING(id_Dok)
				WHERE id_Oddokowany IS NULL ";
    if (!empty($name))
        $sql.="AND nazwa LIKE '%$name%' ";
    if (!empty($typeId))
        $sql.="AND id_Typ_Ladunku = $typeId ";
    if (!empty($termId))
        $sql.="AND id_Terminal = $termId ";
    if (!empty($capacityVolMin))
        $sql.="AND ladownosc_objetosciowa >= $capacityVolMin ";
    if (!empty($capacityVolMax))
        $sql.="AND ladownosc_objetosciowa <= $capacityVolMax ";
    if (!empty($capacityMassMin))
        $sql.="AND ladownosc_masowa >= $capacityMassMin ";
    if (!empty($capacityMassMax))
        $sql.="AND ladownosc_masowa <= $capacityMassMax ";
    if (!empty($lengthMin))
        $sql.="AND dlugosc >= $lengthMin ";
    if (!empty($lengthMax))
        $sql.="AND dlugosc <= $lengthMax ";
    if (!empty($widthMin))
        $sql.="AND szerokosc >= $widthMin ";
    if (!empty($widthMax))
        $sql.="AND szerokosc <= $widthMax ";
    if (!empty($heightMin))
        $sql.="AND wysokosc >= $heightMin ";
    if (!empty($heightMax))
        $sql.="AND wysokosc <= $heightMax ";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $ships[$i] = $result->fetch_object();
    return $ships;
}

function get_ship_by_id($id)
{
    $sql = "SELECT id_Statek AS id,
						id_Typ_Ladunku AS type, 
						nazwa AS name,
						dlugosc AS length,
						szerokosc AS width,
						wysokosc AS height																		 
				FROM Statek 								
				WHERE id_Statek=$id ";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object();
}

function get_docked_ship_by_id($id)
{
    $sql = "SELECT id_Statek AS id, 
                    Statek.nazwa AS name, 
                    CONCAT(wypornosc,' t') AS displacement,
                    CONCAT(ladownosc_masowa, ' ' ,Typ_Ladunku.jednostka_Masy) AS capMass,
                    CONCAT(ladownosc_objetosciowa, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS capVol,
                    CONCAT(aktualna_masa_ladunkow, ' ' ,Typ_Ladunku.jednostka_Masy) AS curMass,
                    CONCAT(aktualna_objetosc_ladunkow, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS curVol,                                          
                    kapitan AS captain,
                    data_produkcji AS production_date,
                    typ_Statku AS type,
                    id_Typ_Ladunku AS type_id,
                    CONCAT(dlugosc,' m') AS length,
                    CONCAT(szerokosc,' m') AS width,
                    CONCAT(wysokosc,' m') AS height,						
                    Uzytkownik.nazwa AS docked_by,
                    Zadokowany.id_Dok AS dock_id,
                    Zadokowany.id_Zadokowany AS docked_id,
                    Zadokowany.data AS dock_date,
                    Dok.id_Terminal AS term_id,
                    Kontrahent.nazwa AS owner
            FROM Statek NATURAL JOIN Typ_Ladunku
                    NATURAL JOIN Zadokowany 
                    LEFT OUTER JOIN Uzytkownik USING(id_Uzytkownik)
                    LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
                    INNER JOIN Kontrahent USING(id_Kontrahent)
                    INNER JOIN Dok USING(id_Dok)						 
            WHERE id_Statek = $id AND id_Oddokowany IS NULL";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object();
}

function get_history_ship_by_id($docked_id)
{
    $sql = "SELECT id_Statek AS id, 
                    Statek.nazwa AS name, 
                    CONCAT(wypornosc, ' t') AS displacement,                    
                    CONCAT(ladownosc_masowa, ' ' ,Typ_Ladunku.jednostka_Masy) AS capMass,
                    CONCAT(ladownosc_objetosciowa, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS capVol,                    
                    kapitan AS captain,
                    data_produkcji AS production_date,
                    typ_Statku AS type,
                    CONCAT(dlugosc, ' m') AS length,
                    CONCAT(szerokosc, ' m') AS width,
                    CONCAT(wysokosc, ' m') AS height,
                    U1.nazwa AS docked_by,
                    Zadokowany.data AS dock_date,						
                    U2.nazwa AS undocked_by,
                    Kontrahent.nazwa AS owner,
                    Oddokowany.data AS undock_date
            FROM Statek NATURAL JOIN Typ_Ladunku
                    NATURAL JOIN Zadokowany 
                    LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
                    LEFT OUTER JOIN Uzytkownik U1 ON Zadokowany.id_Uzytkownik=U1.id_Uzytkownik					
                    LEFT OUTER JOIN Uzytkownik U2 ON Oddokowany.id_Uzytkownik=U2.id_Uzytkownik	
                    INNER JOIN Kontrahent USING(id_Kontrahent)															 
            WHERE id_Zadokowany = $docked_id";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object();
}

function get_ship_owner($ship_id)
{
    $sql = "SELECT nazwa AS name 						 
				FROM Kontrahent NATURAL JOIN Statek						 
				WHERE id_Statek = $ship_id";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    else
        return $result->fetch_object();
}

function get_ship_cargo($ship_id, $from='', $to='')
{
    $sql = "SELECT  Ladunek.id_Ladunek AS id, 
                    Towar.nazwa AS name,
                    Typ_Ladunku.nazwa_Typu_Ladunku AS type,
                    Przeladunek.data AS date,
                    Uzytkownik.nazwa AS loaded_by,
                    Ladunek.ilosc AS amount,						
                    CONCAT(ROUND(Towar.masa_jednostkowa*Ladunek.ilosc,2), ' ' ,Typ_Ladunku.jednostka_Masy) AS mass,
                    CONCAT(ROUND(Towar.objetosc_jednostkowa*Ladunek.ilosc,2), ' ' ,Typ_Ladunku.jednostka_Objetosci) AS volume,
                    CONCAT(Towar.wartosc_jednostkowa*Ladunek.ilosc, ' ' ,'$') AS value,												
                    Kontrahent.nazwa AS owner,
                    czy_pozytywna AS control_positive,
                    czy_kontrola_celna AS control_required						
            FROM Ladunek
                    INNER JOIN Towar USING ( id_Towar )
                    INNER JOIN Typ_Ladunku	USING (id_Typ_Ladunku)									
                    INNER JOIN Przeladunek USING ( id_Ladunek )
                    INNER JOIN Nadanie_Ladunku USING ( id_Ladunek )
                    INNER JOIN Kontrahent USING ( id_Kontrahent )				 					
                    LEFT OUTER JOIN Uzytkownik USING(id_Uzytkownik)						 
                    LEFT OUTER JOIN Kontrola_Celna USING(id_Ladunek)
            WHERE Przeladunek.id_statek2 = $ship_id ";            
    if ($from === '' AND $to === '')
        $sql.="AND czy_aktualne_polozenie=TRUE ";
    else
    {
        if ($from !== '')
            $sql.="AND Przeladunek.data>='$from' ";
        if ($to !== '')
            $sql.="AND Przeladunek.data<='$to' ";
    }
    $sql.=" GROUP BY Ladunek.id_Ladunek";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $cargo[$i] = $result->fetch_object();
    return $cargo;
}

//pobieramy wartości, które może przyjmować typ statku
function get_ship_types()
{
    $sql = "SELECT id_Typ_Ladunku AS id, typ_Statku AS name 
				FROM  Typ_Ladunku ";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $types[$i] = $result->fetch_object();
    return $types;
}

//pobiera doki, które są wolne i pomieszczą dany statek
function get_valid_docks($ship_id, $terminal_id)
{
    $ship = get_ship_by_id($ship_id);
    $sql = "SELECT id_Dok AS id 
				FROM  Dok d1
					INNER JOIN Terminal USING(id_Terminal)					
				WHERE id_Terminal=$terminal_id 
				AND maks_szerokosc_statku>= $ship->width 
				AND maks_dlugosc_statku>= $ship->length 
				AND maks_wysokosc_statku>= $ship->height 
				AND NOT EXISTS
				(SELECT id_Zadokowany 
				FROM Zadokowany LEFT OUTER JOIN Oddokowany USING (id_Zadokowany)
									 RIGHT OUTER JOIN Dok d2 USING (id_Dok)
				WHERE id_Zadokowany IS NOT NULL AND id_Oddokowany IS NULL AND d1.id_Dok=d2.id_Dok)";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $docks[$i] = $result->fetch_object();
    return $docks;
}

function get_ship_owners()
{
    $sql = "SELECT id_Kontrahent AS id, nazwa AS name FROM Kontrahent WHERE typ='Armator'";
    $result = DB::query($sql);
    $count = $result->num_rows;
    if ($count == 0)
        return NULL;
    for ($i = 0; $i < $count; $i++)
        $contractors[$i] = $result->fetch_object();
    return $contractors;
}

?>
