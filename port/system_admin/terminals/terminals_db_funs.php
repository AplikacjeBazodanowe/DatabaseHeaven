<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");

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
			return;
		if(get_terminal_by_name($name) && get_terminal_by_name($name)->id_Terminal != $id)
			return;
		if(!get_terminal_by_id($id))
			return;		
		$sql="UPDATE Terminal 
				SET nazwa='$name', id_TypLadunku=$typeId 
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
			return;
		if(get_terminal_by_name($name))
			return;		
		$sql="INSERT INTO Terminal VALUES (NULL,'$name',$typeId)";
		DB::query($sql);	
	}
	
	function select_terminals($name='', $typeId='')
	{
		if(!empty($typeId))
			$sql="SELECT id_Terminal AS id, nazwa AS name, nazwaTerminala AS type 
					FROM Terminal NATURAL JOIN TypLadunku 
					WHERE nazwa LIKE '%$name%' AND id_TypLadunku = $typeId";
		else
			$sql="SELECT id_Terminal AS id, nazwa AS name, nazwaTerminala AS type
					FROM Terminal NATURAL JOIN TypLadunku 
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
		$sql="SELECT id_Terminal AS id, nazwa AS name, nazwaTerminala AS type 
				FROM Terminal NATURAL JOIN TypLadunku 
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
		$sql="SELECT id_TypLadunku AS id, nazwaTerminala AS name 
				FROM  TypLadunku ";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $types[$i]=$result->fetch_object();                          
      return $types;
	}
?>