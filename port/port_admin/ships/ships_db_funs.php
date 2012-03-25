<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	//potrzebne bo używamy select_terminals w GUI
	include_once($root."/system_admin/terminals/terminals_db_funs.php");
	include_once($root."/system_admin/docks/docks_db_funs.php");
	
	function undock_ship($ship_id)
	{				
		$user=1;
		$sql="SELECT id_Zadokowany 
				FROM LEFT OUTER JOIN Oddokowany USING(id_Zadokowany) 
				WHERE id_Oddokowany IS NULL";
		$result=DB::query($sql);							
      if($result->num_rows==0)
          return;
      else 
      	$docked_id = $result->fetch_object()->id_Zadokowany;			
		if(!get_ship_by_id($ship_id) || !get_dock_by_id($newDock))
			return;		
		$sql="INSERT INTO Oddokowany VALUES(NULL,NOW(),NULL,$dockedId,$user)";
		DB::query($sql);
	}	
		
	function move_ship($ship_id,$newDock='')
	{				
		$user=1;
		$sql="SELECT id_Zadokowany 
				FROM LEFT OUTER JOIN Oddokowany USING(id_Zadokowany) 
				WHERE id_Oddokowany IS NULL";
		$result=DB::query($sql);							
      if($result->num_rows==0)
          return;
      else 
      	$docked_id = $result->fetch_object()->id_Zadokowany;			
		if(!get_ship_by_id($ship_id) || !get_dock_by_id($newDock))
			return;		
		$sql="INSERT INTO Oddokowany VALUES(NULL,NOW(),NULL,$dockedId,$user)";
		DB::query($sql);
	}
	
	function dock_ship($ship_id,$dock)
	{		
		$user=1;
		if(!get_ship_by_id($id) || !get_dock_by_id($newDock))
			return;		
		$sql="INSERT INTO Zadokowany VALUES (NULL,NOW(),NULL,$user,$dock,$ship_id)";
		DB::query($sql);	
	}
	
	function select_history_ships($name='',$typeId='',$termId='', 
										$dockdateMin='', $dockdateMax='',
										$undockdateMin='',$undockdateMax='')
	{		
		$sql="SELECT id_Zadokowany AS docked_id, 
						nazwa AS name,
						Zadokowany.data AS dock_date,
						Oddokowany.data AS undock_date 
				FROM Statek NATURAL JOIN Zadokowany
				LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)				
				WHERE nazwa LIKE '%$name%' ";
		if(!empty($typeId)) 
			$sql.="AND id_Typ_Ladunku = $typeId ";
		if(!empty($termId)) 
			$sql.="AND id_Terminal = $termId ";
		if(!empty($capacityVolMin)) 
			$sql.="AND Zadokowany.data >= $dockdateMin ";
		if(!empty($capacityVolMax)) 
			$sql.="AND Zadokowany.data <= $dockdateMax ";
		if(!empty($capacityMassMin)) 
			$sql.="AND Oddokowany.data >= $undockdateMin ";
		if(!empty($capacityMassMax)) 
			$sql.="AND Oddokowany.data <= $undockdateMax ";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $ships[$i]=$result->fetch_object();                          
      return $ships;
	}
	
	function select_docked_ships($name='', $typeId='',$termId='', $capacityVolMin='', $capacityVolMax='',
									$capacityMassMin='', $capacityMassMax='', $lengthMin='', $lengthMax='', 
									$widthMin='', $widthMax='', $heightMin='', $heightMax='')
	{			
		$sql="SELECT Statek.id_Statek as id, nazwa AS name, id_Dok as dock_id
				FROM Statek 
				NATURAL JOIN Zadokowany 
				LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)				
				WHERE id_Oddokowany IS NULL ";
		if(!empty($name)) 
			$sql.="AND nazwa LIKE '%$name%' ";
		if(!empty($typeId)) 
			$sql.="AND id_Typ_Ladunku = $typeId ";
		if(!empty($termId)) 
			$sql.="AND id_Terminal = $termId ";
		if(!empty($capacityVolMin)) 
			$sql.="AND ladownosc_objetosciowa >= $capacityVolMin ";
		if(!empty($capacityVolMax)) 
			$sql.="AND ladownosc_objetosciowa <= $capacityVolMax ";
		if(!empty($capacityMassMin)) 
			$sql.="AND ladownosc_masowa >= $capacityMassMin ";
		if(!empty($capacityMassMax)) 
			$sql.="AND ladownosc_masowa <= $capacityMassMax ";
		if(!empty($lengthMin)) 
			$sql.="AND dlugosc >= $lengthMin ";
		if(!empty($lengthMax)) 
			$sql.="AND dlugosc <= $lengthMax ";
		if(!empty($widthMin)) 
			$sql.="AND szerokosc >= $widthMin ";
		if(!empty($widthMax)) 
			$sql.="AND szerokosc <= $widthMax ";		
		if(!empty($heightMin)) 
			$sql.="AND wysokosc >= $heightMin ";
		if(!empty($heightMax)) 
			$sql.="AND wysokosc <= $heightMax ";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $ships[$i]=$result->fetch_object();                          
      return $ships;
	}
	
	function get_docked_ship_by_id($id)
	{
		$sql="SELECT id_Statek AS id, 
						Statek.nazwa AS name, 
						wypornosc AS displacement,
						ladownosc_masowa AS capMass,
						ladownosc_objetosciowa AS capVol,
						kapitan AS captain,
						data_produkcji AS production_date,
						typ_Statku AS type,
						dlugosc AS length,
						szerokosc AS width,
						wysokosc AS height,
						Uzytkownik.nazwa AS docked_by,
						Zadokowany.data AS dock_date
				FROM Statek NATURAL JOIN Typ_Ladunku
					NATURAL JOIN Zadokowany 
					INNER JOIN Uzytkownik USING(id_Uzytkownik)
					LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)						 
				WHERE id_Statek = $id AND id_Oddokowany IS NULL";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}
	
	function get_history_ship_by_id($docked_id)
	{
		$sql="SELECT id_Statek AS id, 
						Statek.nazwa AS name, 
						wypornosc AS displacement,
						ladownosc_masowa AS capMass,
						ladownosc_objetosciowa AS capVol,
						kapitan AS captain,
						data_produkcji AS production_date,
						typ_Statku AS type,
						dlugosc AS length,
						szerokosc AS width,
						wysokosc AS height,
						U1.nazwa AS docked_by,
						Zadokowany.data AS dock_date,
						U2.nazwa AS undocked_by,
						Oddokowany.data AS undock_date
				FROM Statek NATURAL JOIN Typ_Ladunku
					NATURAL JOIN Zadokowany 
					LEFT OUTER JOIN Oddokowany USING(id_Zadokowany)
					INNER JOIN Uzytkownik U1 ON Zadokowany.id_Uzytkownik=U1.id_Uzytkownik
					LEFT OUTER JOIN Uzytkownik U2 ON Oddokowany.id_Uzytkownik=U2.id_Uzytkownik											 
				WHERE id_Zadokowany = $docked_id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}
	
	function get_ship_owner($ship_id)
	{
		$sql="SELECT nazwa AS name 						 
				FROM Kontrahent NATURAL JOIN Statek						 
				WHERE id_Statek = $ship_id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}				
	
	function get_ship_cargo($ship_id, $all=false)
	{				
		$sql="SELECT Ladunek.id_Ladunek AS id, 
						Towar.nazwa AS name,
						Typ_Ladunku.nazwa_Typu_Ladunku AS type,
						Przeladunek.data AS date,
						Uzytkownik.nazwa AS loaded_by,
						Ladunek.ilosc AS amount,						
						Towar.masa_jednostkowa*Ladunek.ilosc AS mass,
						Towar.objetosc_jednostkowa*Ladunek.ilosc AS volume,
						Towar.wartosc_jednostkowa*Ladunek.ilosc AS value,
						Kontrahent.nazwa AS owner,
						Ladunek.uwagi AS remarks  						 
				FROM Ladunek
					INNER JOIN Towar USING ( id_Towar )
					INNER JOIN Typ_Ladunku	USING (id_Typ_Ladunku)									
					INNER JOIN Przeladunek USING ( id_Ladunek )
					INNER JOIN Nadanie_Ladunku USING ( id_Ladunek )
					INNER JOIN Kontrahent USING ( id_Kontrahent )				 
					INNER JOIN Statek ON Przeladunek.id_statek2 = Statek.id_Statek
					INNER JOIN Uzytkownik USING(id_Uzytkownik)						 
				WHERE Przeladunek.id_statek2 = $ship_id ";
		if(!$all)
			$sql.="AND czy_aktualne_polozenie=TRUE";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $cargo[$i]=$result->fetch_object();                          
      return $cargo;                               
	}
	
	//pobieramy wartości, które może przyjmować typ statku
	function get_ship_types()
	{
		$sql="SELECT id_Typ_Ladunku AS id, typ_Statku AS name 
				FROM  Typ_Ladunku ";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $types[$i]=$result->fetch_object();                          
      return $types;
	}
?>
