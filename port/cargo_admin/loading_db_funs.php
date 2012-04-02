<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/port_admin/ships/ships_db_funs.php");

	//pobieramy dobre magazyny = te, które są dobrego typu w całym porcie
	function select_warehouses_to_load($cargo_id)
	{
		$sql = "SELECT Magazyn.id_Magazyn AS id, Magazyn.nazwa AS name
					FROM Magazyn INNER JOIN Terminal USING(id_Terminal)
							INNER JOIN Towar USING(id_Typ_Ladunku)
							INNER JOIN Ladunek USING(id_Towar)
					WHERE id_Ladunek=$cargo_id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $warehouses[$i]=$result->fetch_object();                          
      return $warehouses;						
	}
	
	//pobieramy dobre statki = te, które są w tym samym terminalu
	function select_ships_to_load($cargo_id)
	{
		//sql1 pobieramy terminal
		//sql2 pobieramy statki z terminala
		$sql = "SELECT Terminal.id_Terminal AS id
					FROM Przeladunek INNER JOIN  Ladunek USING(id_Ladunek)
							INNER JOIN Zadokowany ON Zadokowany.id_Statek=Przeladunek.id_statek2							 
							INNER JOIN Dok USING(id_Dok)
							INNER JOIN Terminal USING(id_Terminal)
					WHERE id_Ladunek=$cargo_id AND czy_aktualne_polozenie=TRUE";
		$result=DB::query($sql);
		$terminal=$result->fetch_object()->id;
		select_docked_ships('','',$terminal);
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $ships[$i]=$result->fetch_object();                          
      return $ships;
	}
	
	function passed_control($cargo_id)
	{
		$sql="SELECT id_Kontrola_Celna 
				FROM Kontrola_Celna LEFT OUTER JOIN Ladunek USING(id_Ladunek)
				WHERE czy_kontrola_celna=FALSE OR czy_pozytywna=TRUE"
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return false;
      else 
      	 return true;
	}
?>