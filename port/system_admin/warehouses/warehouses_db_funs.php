<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/system_admin/terminals/terminals_db_funs.php");

	function delete_warehouse($id) 
	{
		if(!get_warehouse_by_id($id))
			return;
		$sql="DELETE FROM Magazyn WHERE id_Magazyn=$id";
		DB::query($sql);	
	}
	
	function update_warehouse($id,$name,$capacity, $fee)
	{		
		//jakaś walidacja					
		if(empty($id) || empty($name) || empty($capacity) || empty($fee))
			return "Błąd: Podano niekompletne lub błędne dane.";				
                if(get_warehouse_by_name($name) && get_warehouse_by_name($name)->id != $id)
			return "Błąd: Istnieje już magazyn o tej nazwie.";				
		if(!get_warehouse_by_id($id))
			return "Błąd: Nie istnieje taki magazyn.";		
		$sql="UPDATE Magazyn SET nazwa='$name', pojemnosc=$capacity, cena_Za_Przechowanie=$fee WHERE id_Magazyn=$id";
		DB::query($sql);
	}
	
	function insert_warehouse($terminal_id,$name,$capacity, $fee)
	{		
		$terminals=select_terminals();
		$goodTerminal=false;
		foreach($terminals as $terminal)
			if($terminal->id==$terminal_id)
			{
				$goodTerminal=true;
				break;
			}
		if(get_warehouse_by_name($name) && get_warehouse_by_name($name)->id != $id)
			return "Błąd: Istnieje już magazyn o tej nazwie.";				
		if(empty($name) || empty($capacity) || empty($fee) )
			return "Błąd: Podano niekompletne lub błędne dane.";				
		$sql="INSERT INTO Magazyn VALUES (NULL, '$name', $capacity,0, $fee, $terminal_id)";
		DB::query($sql);	
	}
	
	function select_warehouses($terminal_id, $name, $minCap='', $maxCap='')
	{
		if(!empty($terminal_id))
			$sql="SELECT id_Magazyn AS id, Magazyn.nazwa AS name, Terminal.nazwa AS term_name 
					FROM Magazyn INNER JOIN Terminal USING (id_Terminal) 
					WHERE id_Terminal=$terminal_id AND Magazyn.nazwa LIKE '%$name%' ";
		else
			$sql="SELECT id_Magazyn AS id, Magazyn.nazwa AS name, Terminal.nazwa AS term_name 
					FROM Magazyn INNER JOIN Terminal USING (id_Terminal)
					WHERE Magazyn.nazwa LIKE '%$name%' ";
		if($minCap!=='')
			$sql.="AND pojemnosc>=$minCap ";
		if($minCap!=='')
			$sql.="AND pojemnosc<=$maxCap ";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $warehouses[$i]=$result->fetch_object();                          
      return $warehouses;
	}
	
	function get_warehouse_by_id($id)
	{
		$sql="SELECT id_Magazyn AS id, 
						 Magazyn.nazwa AS name,						
                         CONCAT(Magazyn.pojemnosc, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS capacity,						 						 
                         CONCAT(Magazyn.aktualna_objetosc_ladunkow, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS curVol,						 						 
                         CONCAT(cena_Za_Przechowanie, ' $') AS fee,				 	 	  
				 	 	 Terminal.nazwa AS term_name, 
                         Terminal.id_Terminal AS term_id,
                         Terminal.id_Typ_Ladunku AS type_id
				FROM Magazyn INNER JOIN Terminal USING (id_Terminal) 
                    INNER JOIN Typ_Ladunku USING(id_Typ_Ladunku)
				WHERE id_Magazyn = $id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}						
	
	function get_warehouse_by_name($name)
	{
		$sql="SELECT id_Magazyn AS id 						  
				FROM Magazyn 
				WHERE nazwa = '$name'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}
?>