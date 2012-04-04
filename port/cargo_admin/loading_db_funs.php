<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/port_admin/ships/ships_db_funs.php");
	include_once($root."/system_admin/warehouses/warehouses_db_funs.php");
	include_once($root."/port_admin/ships/ships_db_funs.php");
	include_once('../contractors/contractors_db_funs.php');

	//pobieramy dobre magazyny = te, które są dobrego typu w całym porcie
	//do przeładowywania między magazynami
	function select_warehouses_of_type($cargo_type)
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
	
	function passed_control($cargo_id)
	{
		$sql="SELECT id_Kontrola_Celna 
				FROM Kontrola_Celna RIGHT OUTER JOIN Ladunek USING(id_Ladunek)
				WHERE czy_kontrola_celna=FALSE OR czy_pozytywna=TRUE AND id_Ladunek=$cargo_id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return false;
      else 
      	 return true;
	}
?>