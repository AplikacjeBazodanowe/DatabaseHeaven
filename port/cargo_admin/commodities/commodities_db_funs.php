<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	function insert_commodity($name,$type,$uValue,$uDuty,$uMass,$uVol)
	{		
		if(empty($name) || empty($uValue)  || empty($uMass) || empty($uVol) )
			return;
        if(empty($uDuty))
            $uDuty=0;
		if(get_commodity_by_name($name))
			return;		
		$sql="INSERT INTO Towar VALUES (NULL,'$name',$uDuty,$uValue,$uMass,$uVol,$type)";
		DB::query($sql);	
	}
	
	function get_commodity_by_id($id)
	{
		$sql="SELECT id_Towar AS id,
                     nazwa AS name,                                          
                     CONCAT(Towar.clo_jednostkowe, ' ' ,'$') AS duty,
                     CONCAT(Towar.masa_jednostkowa, ' ' ,Typ_Ladunku.jednostka_Masy) AS mass,
					 CONCAT(Towar.objetosc_jednostkowa, ' ' ,Typ_Ladunku.jednostka_Objetosci) AS volume,
					 CONCAT(Towar.wartosc_jednostkowa, ' ' ,'$') AS value,
                     Typ_Ladunku.nazwa_Typu_Ladunku AS type             
                FROM Towar INNER JOIN Typ_Ladunku USING(id_Typ_Ladunku)
                WHERE id_Towar=$id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	function get_commodity_by_name($name)
	{
        $sql="SELECT id_Towar FROM Towar WHERE nazwa='$name'";
		$result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object();                               
	}	
	
?>