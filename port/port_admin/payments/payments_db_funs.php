<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");	
		
	function delete_payment($id)
	{						
            $sql="SELECT id_Uzytkownik as added_by, czy_oplacona as paid FROM Oplata WHERE id_Oplata=$id";
            $result=DB::query($sql);		
            $count=$result->num_rows;
            if($count==0)
                return; 
            $payment=$result->fetch_object();
            /*$current_user=1;
            if($payment->paid || $payment->added_by!=$current_user)
              return;*/     
            $sql="DELETE FROM Oplata WHERE id_Oplata=$id";
            DB::query($sql);
	}
	
	function modify_payment($id, $value)
	{						
            $sql="UPDATE Oplata SET kwota=$value WHERE id_Oplata=$id";
            DB::query($sql);
	}
	
	function change_status($payment_id, $status)
	{						
            $sql="UPDATE Oplata SET czy_oplacona=$status WHERE id_Oplata=$payment_id";
            DB::query($sql);
	}
			
	function add_payment($contractor,$value)
	{				
            $user=1; //to będzie pobierane z sesji na podstawie zalogowania!
            $sql="INSERT INTO Oplata VALUES (NULL,'Portowa (inna)',$value,FALSE,NOW(),$contractor,$user)";
            DB::query($sql);	
	}
	
	function select_payments($contractor='', $valueMin='', $valueMax='', $from='', $to='', $paid='', $type='')
	{			
            $sql="SELECT Oplata.id_Oplata AS id, Kontrahent.nazwa AS contractor, kwota AS value
                            FROM Oplata INNER JOIN Kontrahent USING(id_Kontrahent)				 								
                            WHERE 1 ";
            if(!empty($contractor)) 
                    $sql.="AND Kontrahent.nazwa LIKE '%$contractor%' ";		
            if(!empty($valueMin)) 
                    $sql.="AND kwota >= $valueMin ";
            if(!empty($valueMax)) 
                    $sql.="AND kwota <= $valueMax ";
            if(!empty($from)) 
                    $sql.="AND data_naliczenia >= $from ";
            if(!empty($to)) 
                    $sql.="AND data_naliczenia <= $to ";		
            if($paid!=='') 
                    $sql.="AND czy_oplacona = $paid ";
            if(!empty($type)) 
                    $sql.="AND Oplata.typ = '$type' ";
            else
                    $sql.="AND Oplata.typ IN ('Portowa (za dok)','Portowa (za magazyn)','Portowa (inna)') ";
            $result=DB::query($sql);		
            $count=$result->num_rows;
            if($count==0)
                return NULL;
            for($i=0; $i<$count;$i++)      
                $payments[$i]=$result->fetch_object();                          
            return $payments;
	}
	
	function get_payment_by_id($id)
	{
            $sql="SELECT id_Oplata AS id, 
                        kwota AS value, 
                        typ AS type,
                        czy_oplacona AS paid,
                        data_naliczenia AS date,
                        Uzytkownik.nazwa AS added_by						
                FROM Oplata	NATURAL JOIN Uzytkownik					 
                WHERE id_Oplata = $id";
            $result=DB::query($sql);		
            $count=$result->num_rows;
            if($count==0)
                return NULL;
            else 
                return $result->fetch_object();                               
         }
	
	function get_payment_contractor($payment_id)
	{
            $sql="SELECT Kontrahent.nazwa AS name,
                                adres AS address,
                                Kraj.nazwa AS country,
                                Kontrahent.typ AS type				 						 
                FROM Kontrahent INNER JOIN Oplata USING(id_Kontrahent)
                        INNER JOIN Kraj USING(id_Kraj)										 
                WHERE id_Oplata = $payment_id";
            $result=DB::query($sql);		
            $count=$result->num_rows;
            if($count==0)
                return NULL;
            else 
                return $result->fetch_object();                               
	}					
		
	//pobiera listę kontrahentów
	function get_contractors()
	{
            $sql="SELECT id_Kontrahent AS id, nazwa AS name FROM Kontrahent";
            $result=DB::query($sql);		
            $count=$result->num_rows;
            if($count==0)
                return NULL;
            for($i=0; $i<$count;$i++)      
                $contractors[$i]=$result->fetch_object();                          
            return $contractors;
	}
	
	//pobiera typy opłat (portowych)
	function get_payment_types()
	{	
            $sql = " SHOW COLUMNS FROM `Oplata` LIKE 'Typ' ";
            $result = DB::query($sql);
            $row = mysqli_fetch_array( $result , MYSQL_NUM );
            #extract the values
            #the values are enclosed in single quotes
            #and separated by commas
            $regex = "/'(Portowa.*?)'/";
            preg_match_all( $regex , $row[1], $enum_array );
            $types = $enum_array[1];
            return $types;		
	}	
?>
