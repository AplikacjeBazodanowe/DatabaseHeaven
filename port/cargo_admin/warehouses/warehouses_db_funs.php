<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	function get_warehouse_cargo($warehouse_id, $from='', $to='') 
	{				
		$sql="SELECT Ladunek.id_Ladunek AS id, 
						Towar.nazwa AS name,
						Typ_Ladunku.nazwa_Typu_Ladunku AS type,
						Przeladunek.data AS date,
						Uzytkownik.nazwa AS loaded_by,
						Ladunek.ilosc AS amount,						
                                                CONCAT(ROUND(Towar.masa_jednostkowa*Ladunek.ilosc,2), ' ' ,Typ_Ladunku.jednostka_Masy) AS mass,
						CONCAT(ROUND(Towar.objetosc_jednostkowa*Ladunek.ilosc,2), ' ' ,Typ_Ladunku.jednostka_Objetosci) AS volume,
						CONCAT(Towar.wartosc_jednostkowa*Ladunek.ilosc, ' ' ,'$') AS value,						
						Kontrahent.nazwa AS owner											 
				FROM Ladunek
					INNER JOIN Towar USING ( id_Towar )
					INNER JOIN Typ_Ladunku	USING (id_Typ_Ladunku)									
					INNER JOIN Przeladunek USING ( id_Ladunek )
					INNER JOIN Nadanie_Ladunku USING ( id_Ladunek )
					INNER JOIN Kontrahent USING ( id_Kontrahent )				 					
					LEFT OUTER JOIN Uzytkownik USING(id_Uzytkownik)						 
				WHERE Przeladunek.id_Magazyn2 = $warehouse_id AND czy_aktualne_polozenie=TRUE ";		
        if($from==='' AND $to==='')
            $sql.="AND czy_aktualne_polozenie=TRUE ";
		else
        {
            if($from!=='')
                $sql.="AND Przeladunek.data>='$from' ";
            if($to!=='')
                $sql.="AND Przeladunek.data<='$to' ";
        }
        $result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
           return NULL;
        for($i=0; $i<$count;$i++)      
           $cargo[$i]=$result->fetch_object();                          
        return $cargo;                               	
	}
?>