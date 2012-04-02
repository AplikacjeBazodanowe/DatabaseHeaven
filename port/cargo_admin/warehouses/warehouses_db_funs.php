<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	function get_warehouse_cargo($warehouse_id) 
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
					INNER JOIN Uzytkownik USING(id_Uzytkownik)						 
				WHERE Przeladunek.id_magazyn2 = $warehouse_id AND czy_aktualne_polozenie=TRUE ";		
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $cargo[$i]=$result->fetch_object();                          
      return $cargo;                               	
	}
?>