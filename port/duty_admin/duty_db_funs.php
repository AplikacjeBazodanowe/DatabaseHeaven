<?php
    $root=$_SERVER['DOCUMENT_ROOT'];		
    include_once($root."/DB.php");
    include_once($root."/port_admin/ships/ships_db_funs.php");
    include_once($root."/cargo_admin/cargo/cargo_db_funs.php");
    
    function select_pending_cargo($name='', $contractor='', $ship='')
    {
        //oczekujące
        $sql="SELECT id_Ladunek AS id,
                Towar.nazwa AS commodity,
                Ladunek.ilosc AS amount,
                Kontrahent.nazwa AS owner,
                Statek.nazwa AS ship
            FROM Ladunek
                INNER JOIN Towar USING (id_Towar)
                LEFT OUTER JOIN Kontrola_Celna USING(id_Ladunek)                
                INNER JOIN Nadanie_Ladunku USING (id_Ladunek)
                INNER JOIN Przeladunek USING (id_Ladunek)
                INNER JOIN Kontrahent USING (id_Kontrahent)
                INNER JOIN Statek ON Statek.id_Statek = Przeladunek.id_Statek2
            WHERE czy_kontrola_celna=TRUE 
                AND id_Kontrola_Celna IS NULL 
                AND czy_aktualne_polozenie=TRUE ";        
        if($name!=='')
            $sql.="AND Towar.nazwa LIKE '%$name%' ";
        if($contractor!=='')        
            $sql.="AND Nadanie_Ladunku.id_Kontrahent = $contractor ";
        if($ship!=='')    
            $sql.="AND Statek.id_Statek = $ship ";
        $result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
            return NULL;
        for($i=0; $i<$count;$i++)      
            $cargo[$i]=$result->fetch_object();                          
        return $cargo;
    }
    
    function select_suspended_cargo($name='', $contractor='', $ship='')
    {
        //z negatywną ale nieskonfiskowane
        $sql="SELECT l1.id_Ladunek AS id,
                Towar.nazwa AS commodity,
                l1.ilosc AS amount,
                Kontrahent.nazwa AS owner,
                Statek.nazwa AS ship
              FROM Ladunek l1
                INNER JOIN Kontrola_Celna kc1 USING(id_Ladunek)
                INNER JOIN Towar USING (id_Towar)
                INNER JOIN Przeladunek USING (id_Ladunek)
                INNER JOIN Nadanie_Ladunku USING (id_Ladunek)
                INNER JOIN Kontrahent USING (id_Kontrahent)
                INNER JOIN Statek ON Statek.id_Statek = Przeladunek.id_Statek2
              WHERE czy_pozytywna=FALSE
               AND NOT EXISTS 
                            (
                                    SELECT id_Przeladunek 
                                    FROM Przeladunek NATURAL JOIN Ladunek l2
                                    WHERE id_statek2 IS NULL AND id_magazyn2 IS NULL 
                                        AND l2.id_Ladunek=l1.id_Ladunek
                            ) 
               AND NOT EXISTS 
                            (
                                    SELECT id_Kontrola_Celna
                                    FROM Kontrola_Celna kc2
                                    WHERE kc2.id_Ladunek = kc1.id_Ladunek
                                        AND kc2.czy_pozytywna=TRUE
                            )";
        if($name!=='')
            $sql.="AND Towar.nazwa LIKE '%$name%' ";
        if($contractor!=='')        
            $sql.="AND Nadanie_Ladunku.id_Kontrahent = $contractor ";
        if($ship!=='')    
            $sql.="AND Statek.id_Statek = $ship ";
        $result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
            return NULL;
        for($i=0; $i<$count;$i++)      
            $cargo[$i]=$result->fetch_object();                          
        return $cargo;
    }     
    
    function select_controls_history($from='', $to='',$status)
    {
        $sql="SELECT id_Kontrola_Celna AS id,                     
                     Towar.nazwa AS commodity,
                     l.ilosc AS amount,
                     data AS date
              FROM Kontrola_Celna INNER JOIN Ladunek l USING(id_Ladunek)
                        INNER JOIN Towar USING(id_Towar)
              WHERE 1 ";
        if($from!=='')
            $sql.="AND data>='$from'";
        if($to!=='')
            $sql.="AND data<='$to'";  
        if($status=='positive')
            $sql.="AND czy_pozytywna = TRUE ";  
        elseif($status=='suspended')
            $sql.="AND czy_pozytywna = FALSE
                    AND NOT EXISTS 
                    (
                            SELECT id_Przeladunek 
                            FROM Przeladunek NATURAL JOIN Ladunek l2
                            WHERE id_Statek2 IS NULL AND id_Magazyn2 IS NULL 
                                AND l2.id_Ladunek=l.id_Ladunek
                    )";  
        elseif($status=='confiscated')
            $sql.="AND czy_pozytywna = FALSE 
                    AND EXISTS 
                    (
                            SELECT id_Przeladunek 
                            FROM Przeladunek NATURAL JOIN Ladunek l2
                            WHERE id_Statek2 IS NULL AND id_Magazyn2 IS NULL 
                                AND l2.id_Ladunek=l.id_Ladunek
                    )";  
        $result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
            return NULL;
        for($i=0; $i<$count;$i++)      
            $controls[$i]=$result->fetch_object();                          
        return $controls;
    }        
    
    function get_control_by_id($id)
    {
        $sql="SELECT id_Kontrola_Celna AS id,
                     Ladunek.id_Ladunek AS cargo_id,
                     data AS date,
                     Towar.nazwa AS commodity,
                     Ladunek.ilosc AS amount,
                     Kontrola_Celna.uwagi AS remarks,
                     CONCAT(Ladunek.ilosc*Towar.clo_jednostkowe,' $') AS duty
              FROM Kontrola_Celna INNER JOIN Ladunek USING(id_Ladunek)
                        INNER JOIN Towar USING(id_Towar)
              WHERE id_Kontrola_Celna=$id";
        $result=DB::query($sql);		
        $count=$result->num_rows;
        if($count==0)
            return NULL;
        else 
            return $result->fetch_object();                               
    }
    
    function duty_control_accept($cargo,$remarks)
    {
        $user_id=$_SESSION['user'];        
        $sql="INSERT INTO Kontrola_Celna VALUES(NULL,'$remarks',TRUE,NOW(),$user_id,$cargo)";
        DB::query($sql);
    }
    
    function duty_control_suspend($cargo,$remarks)
    {
        $user_id=$_SESSION['user'];
        $sql="INSERT INTO Kontrola_Celna 
            VALUES(NULL,'$remarks',FALSE,NOW(),$user_id,$cargo)";
        DB::query($sql);
    }
    
    function duty_control_confiscate($cargo,$remarks)
    {
        $user_id=$_SESSION['user'];
        $sql="CALL konfiskata($cargo,'$remarks',$user_id)";        
        DB::call($sql);        
    }        
    
    function get_control_result($control_id)
    {
        $sql="SELECT czy_pozytywna AS passed,
                     id_Ladunek AS cargo_id
            FROM Kontrola_Celna                 
            WHERE id_Kontrola_Celna=$control_id";
        $result=DB::query($sql);		         
        $control=$result->fetch_object();
        if($control->passed)
            return 'Positive';
        else
        {
            $sql="SELECT id_Przeladunek 
                  FROM Przeladunek NATURAL JOIN Ladunek
                  WHERE id_statek2 IS NULL AND id_magazyn2 IS NULL 
                    AND id_Ladunek=$control->cargo_id";
            $result=DB::query($sql);		         
            $count=$result->num_rows;
            if($count==0)
                return 'Negative (Suspended)'; 
            else
                return 'Negative (Confiscated)';
        }
    }
    
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

    function add_payment($contractor,$value,$type)
    {				
        $user=$_SESSION['user']; //to będzie pobierane z sesji na podstawie zalogowania!
        $sql="INSERT INTO Oplata VALUES (NULL,'$type',$value,FALSE,NOW(),$contractor,$user)";
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
                $sql.="AND Oplata.typ LIKE 'Celna%' ";
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
            FROM Oplata	LEFT OUTER JOIN Uzytkownik USING(id_Uzytkownik)					 
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
        $sql="SELECT id_Kontrahent AS id, nazwa AS name 
              FROM Kontrahent 
              WHERE typ='Wlasciciel ladunku'";
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
        $regex = "/'(Celna.*?)'/";
        preg_match_all( $regex , $row[1], $enum_array );
        $types = $enum_array[1];
        return $types;		
    }
?>
