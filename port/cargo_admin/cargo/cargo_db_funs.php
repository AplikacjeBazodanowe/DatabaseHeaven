<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	function select_cargo( $name, $typeId='', $current=false)
	{
		$sql="SELECT Ladunek.id_Ladunek AS id, 
						 ilosc AS amount,
						 nazwa as commodity						 						  
				FROM Ladunek NATURAL JOIN Towar
								 LEFT OUTER JOIN Odbior_Ladunku USING(id_Ladunek)  
				WHERE nazwa LIKE '%$name%' ";
		if($typeId!=='')
			$sql.="AND id_Typ_Ladunku=$typeId ";
		if($current)
			$sql.="AND id_Odbior_Ladunku IS NULL";					
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $cargo[$i]=$result->fetch_object();                          
      return $cargo;
	}
	
	function get_cargo_by_id($id)
	{		
		$sql="SELECT Ladunek.id_Ladunek AS id, 
						Towar.nazwa AS commodity,
						Typ_Ladunku.nazwa_Typu_Ladunku AS type,																		
						Ladunek.ilosc AS amount,						
						CONCAT(Towar.masa_jednostkowa*Ladunek.ilosc, ' ' ,Typ_Ladunku.jednostka_Masy) AS mass,
						CONCAT(Towar.objetosc_jednostkowa*Ladunek.ilosc, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS volume,
						CONCAT(Towar.wartosc_jednostkowa*Ladunek.ilosc, ' ' ,'$') AS value,
						k1.nazwa AS sender,
						k2.nazwa AS receiver,
						Ladunek.uwagi AS remarks  						 
				FROM Ladunek
					INNER JOIN Towar USING ( id_Towar )
					INNER JOIN Typ_Ladunku	USING (id_Typ_Ladunku)														
					INNER JOIN Nadanie_Ladunku nl USING ( id_Ladunek )
					LEFT OUTER JOIN Odbior_Ladunku ol USING ( id_Ladunek )
					INNER JOIN Kontrahent k1 ON nl.id_Kontrahent=k1.id_Kontrahent				 																 
					LEFT OUTER JOIN Kontrahent k2 ON ol.id_Kontrahent=k2.id_Kontrahent
				WHERE id_Ladunek = $id ";		
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}								
	
	function get_cargo_history( $id )
	{
		$sql="SELECT Ladunek.id_Ladunek AS id, 						 
						 m1.nazwa AS fromWarehouse,
						 m2.nazwa AS toWarehouse,						 						  
						 s1.nazwa AS fromShip,
						 s2.nazwa AS toShip,
						 data AS date,
						 Uzytkownik.nazwa AS loadedBy,
						 p.uwagi AS remarks						 
				FROM Przeladunek p INNER JOIN Ladunek USING(id_Ladunek)
				LEFT OUTER JOIN Magazyn m1 ON m1.id_Magazyn=p.id_magazyn1
				LEFT OUTER JOIN Magazyn m2 ON m2.id_Magazyn=p.id_magazyn2
				LEFT OUTER JOIN Statek s1 ON s1.id_Statek=p.id_statek1
				LEFT OUTER JOIN Statek s2 ON s2.id_Statek=p.id_statek2
				LEFT OUTER JOIN Uzytkownik USING(id_Uzytkownik)								   
				WHERE id_Ladunek=$id ";							
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $history[$i]=$result->fetch_object();                          
      return $history;
	}	
	
	function get_cargo_types()
	{
		$sql="SELECT id_Typ_Ladunku AS id, 
						 nazwa_Typu_Ladunku AS name						  
				FROM Typ_Ladunku";		
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $types[$i]=$result->fetch_object();                          
      return $types;
	}
?>