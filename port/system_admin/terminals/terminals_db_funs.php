<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/system_admin/docks/docks_db_funs.php");
	include_once($root."/system_admin/warehouses/warehouses_db_funs.php");	

	function delete_terminal($id) 
	{
		$sql="DELETE FROM Terminal WHERE id_Terminal=$id";
		DB::query($sql);	
	}
	
	function update_terminal($id,$name,$typeId)
	{		
		//jakaś walidacja
		$types=get_types();
		$goodType=false;
		foreach($types as $type)
			if($type->id==$typeId)
			{
				$goodType=true;
				break;
			}			
		if(empty($name) || !$goodType)
			return "Błąd: Podano błędne lub niekompletne dane.";
		if(get_terminal_by_name($name) && get_terminal_by_name($name)->id_Terminal != $id)
			return "Błąd: Istnieje już terminal o podanej nazwie.";
		if(!get_terminal_by_id($id))
			return "Błąd: Nie ma takiego terminala.";
		$sql="UPDATE Terminal 
				SET nazwa='$name', id_Typ_Ladunku=$typeId 
				WHERE id_Terminal=$id";
		DB::query($sql);
	}
	
	function insert_terminal($name,$typeId)
	{		
		$types=get_types();
		$goodType=false;
		foreach($types as $type)
			if($type->id==$typeId)
			{
				$goodType=true;
				break;
			}			
		if( empty($name) || !$goodType)
			return "Błąd: Podano błędne lub niekompletne dane.";
		if(get_terminal_by_name($name))
			return "Błąd: Istnieje już terminal o podanej nazwie.";
		$sql="INSERT INTO Terminal VALUES (NULL,'$name',$typeId)";
		DB::query($sql);	
	}
	
	function select_terminals($name='', $typeId='')
	{
		if(!empty($typeId))
			$sql="SELECT id_Terminal AS id, nazwa AS name, typ_Terminala AS type 
					FROM Terminal NATURAL JOIN Typ_Ladunku 
					WHERE nazwa LIKE '%$name%' AND id_Typ_Ladunku = $typeId";
		else
			$sql="SELECT id_Terminal AS id, nazwa AS name, typ_Terminala AS type
					FROM Terminal NATURAL JOIN Typ_Ladunku 
					WHERE nazwa LIKE '%$name%'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $terminals[$i]=$result->fetch_object();                          
      return $terminals;
	}
	
	function get_terminal_by_id($id)
	{
		$sql="SELECT id_Terminal AS id, nazwa AS name, typ_Terminala AS type 
				FROM Terminal NATURAL JOIN Typ_Ladunku 
				WHERE id_Terminal = $id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	function get_terminal_by_name($name)
	{
		$sql="SELECT id_Terminal FROM Terminal WHERE nazwa='$name'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	//pobieramy wartości, które może przyjmować typ terminala
	function get_types()
	{
		$sql="SELECT id_Typ_Ladunku AS id, typ_Terminala AS name 
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