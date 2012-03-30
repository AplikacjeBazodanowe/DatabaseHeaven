<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/system_admin/terminals/terminals_db_funs.php");

	function delete_dock($id) 
	{
		$sql="DELETE FROM Dok WHERE id_Dok=$id";
		DB::query($sql);	
	}
	
	function update_dock($id,$new_id,$max_width, $max_length, $max_height, $fee)
	{		
		//jakaś walidacja					
		if(empty($id) || empty($new_id) || empty($max_width) || empty($max_length) || empty($max_height) || empty($fee))
			return;		
		if(!get_dock_by_id($id))
			return;		
		$sql="UPDATE Dok 
				SET id_Dok=$new_id,
					 maks_dlugosc_statku=$max_length,
					 maks_szerokosc_statku=$max_width,
					 maks_wysokosc_statku=$max_height,
				 	 cena_za_pobyt=$fee, 
				WHERE id_Dok=$id";
		DB::query($sql);
	}
	
	function insert_dock($id,$terminal_id,$max_width, $max_length, $max_height, $fee)
	{		
		$terminals=select_terminals();
		$goodTerminal=false;
		foreach($terminals as $terminal)
			if($terminal->id==$terminal_id)
			{
				$goodTerminal=true;
				break;
			}			
		if(empty($id) || empty($max_width) || empty($max_length) || empty($max_height) || empty($fee))
			return;				
		$sql="INSERT INTO Dok VALUES ($id, $max_length, $max_width, $max_height, $fee, $terminal_id)";
		DB::query($sql);	
	}
	
	function select_docks($terminal_id)
	{
		if(!empty($terminal_id))
			$sql="SELECT id_Dok AS id, nazwa AS term_name 
					FROM Dok NATURAL JOIN Terminal 
					WHERE id_Terminal=$terminal_id";
		else
			$sql="SELECT id_Dok AS id, nazwa AS term_name 
					FROM Dok NATURAL JOIN Terminal";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $docks[$i]=$result->fetch_object();                          
      return $docks;
	}
	
	function get_dock_by_id($id)
	{
		$sql="SELECT id_Dok AS id, 
						 maks_dlugosc_statku AS max_length,
					 	 maks_szerokosc_statku AS max_width,
					 	 maks_wysokosc_statku AS max_height,
				 	 	 cena_za_pobyt AS fee,
				 	 	 nazwa AS term_name 
				FROM Dok NATURAL JOIN Terminal 
				WHERE id_Dok = $id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}						
?>