<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	function update_contractor($id,$name,$address,$country_id)
	{		
		$countries=get_countries();
		$goodCountry=false;
		foreach($countries as $country)
			if($country->id==$country_id)
			{
				$goodCountry=true;
				break;
			}		
		if(empty($id) || empty($name) || empty($address) || !$goodCountry)
			return;
		if(get_contractor_by_name($name) && get_contractor_by_name($name)->id_Kontrahent != $id)
			return;		
		$sql="UPDATE Kontrahent 
				SET nazwa='$name', adres='$address', id_Kraj='$country_id' 
				WHERE id_Kontrahent=$id";
		DB::query($sql);
	}
	
	function insert_contractor($name,$address,$country_id)
	{		
		$countries=get_countries();
		$goodCountry=false;
		foreach($countries as $country)
			if($country->id==$country_id)
			{
				$goodCountry=true;
				break;
			}
		if(empty($name) || empty($address) || !$goodCountry)
			return;
		if(get_contractor_by_name($name))
			return;		
		$sql="INSERT INTO Kontrahent VALUES (NULL,'$name','$address',$country_id,'Wlasciciel ladunku')";
		DB::query($sql);	
	}
	
	function select_contractors($name='', $country='')
	{
		$sql="SELECT id_Kontrahent AS id, 
						 Kontrahent.nazwa AS name,
						 Kraj.nazwa AS country						  
				FROM Kontrahent INNER JOIN Kraj USING(id_Kraj)
				WHERE Kontrahent.typ='Wlasciciel ladunku' AND Kontrahent.nazwa LIKE '%$name%' ";
		if($country!=='')
			$sql.="AND Kraj.id_Kraj=$country";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $contractors[$i]=$result->fetch_object();                          
      return $contractors;
	}
	
	function get_contractor_by_id($id)
	{
		$sql="SELECT id_Kontrahent AS id, 
						 Kontrahent.nazwa AS name,
						 adres AS address,
						 Kraj.nazwa AS country 
						 FROM Kontrahent INNER JOIN Kraj USING(id_Kraj)
						 WHERE id_Kontrahent=$id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	function get_contractor_by_name($name)
	{
		$sql="SELECT id_Kontrahent FROM Kontrahent WHERE nazwa='$name'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
		
	function get_countries()
	{	
		$sql="SELECT id_Kraj AS id, nazwa AS name FROM Kraj";  				
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $countries[$i]=$result->fetch_object();                          
      return $countries;		
	}
	
	
?>