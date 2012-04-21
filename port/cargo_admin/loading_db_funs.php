<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	include_once($root."/port_admin/ships/ships_db_funs.php");
	include_once($root."/system_admin/warehouses/warehouses_db_funs.php");
	include_once($root."/port_admin/ships/ships_db_funs.php");
	include_once('contractors/contractors_db_funs.php');
    
    
    function register_cargo_ship($commodity,$amount,$contractor,$ship,$duty_control=0, $remarks='')
    {
        $user_id=$_SESSION['user'];
        if($amount==='')
            return "Błąd: podaj ilość towaru";
        $sql="CALL nadanie($commodity, $amount , $contractor, $duty_control ,
                             $ship, NULL, $user_id, '$remarks')";
		DB::call($sql);	
		$sql="SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
		$result=DB::query($sql);
		$count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object()->opis;	
    }
    
    function register_cargo_warehouse($commodity,$amount,$contractor,$warehouse, $remarks='')
    {
        $user_id=$_SESSION['user'];        
        if($amount==='')
            return "Błąd: podaj ilość towaru";
        $sql="CALL nadanie($commodity, $amount , $contractor, FALSE ,
                             NULL, $warehouse, $user_id, '$remarks')";
		DB::call($sql);	
		$sql="SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
		$result=DB::query($sql);
		$count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object()->opis;	
    }        
    
    function deliver_cargo($cargo, $contractor, $remarks)
    {
        $user_id=$_SESSION['user'];	//będzie pobierane z sesji        
        $sql="CALL odbior($cargo, $contractor, $user_id, '$remarks')";
		DB::call($sql);	
		$sql="SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
		$result=DB::query($sql);
		$count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object()->opis;	
    }
    
    function move_cargo_to_warehouse($cargo, $warehouse, $remarks)
    {
        $user_id=$_SESSION['user'];	//będzie pobierane z sesji        
        $sql="CALL przeladuj($cargo, NULL, $warehouse, $user_id, '$remarks',FALSE)";
		DB::call($sql);	
		$sql="SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
		$result=DB::query($sql);
		$count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object()->opis;	
    }
    
    function move_cargo_to_ship($cargo, $ship, $remarks)
    {
        $user_id=$_SESSION['user'];	//będzie pobierane z sesji        
        $sql="CALL przeladuj($cargo, $ship, NULL, $user_id, '$remarks',FALSE)";
		DB::call($sql);	
		$sql="SELECT opis FROM Bledy_Operacji NATURAL JOIN Kody_Bledow";
		$result=DB::query($sql);
		$count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object()->opis;	
    }        
    
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
                WHERE (czy_kontrola_celna=FALSE OR czy_pozytywna=TRUE) AND id_Ladunek=$cargo_id";
      $result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return false;
      else 
      	 return true;
	}
?>