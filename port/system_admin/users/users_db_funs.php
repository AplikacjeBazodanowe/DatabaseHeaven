<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");

	function delete_user($id) 
	{
		$sql="DELETE FROM Uzytkownik WHERE id_Uzytkownik=$id";
		DB::query($sql);	
	}
	
	function update_user($id,$name,$pass,$level, $imgName='' )
	{		
		//jakaś walidacja
		if(empty($id) || empty($name) || empty($pass) || !in_array($level,get_levels()))
			return;        
		if(get_user_by_name($name) && get_user_by_name($name)->id_Uzytkownik != $id)
			return;        
		$pass=sha1($pass);		
        if($imgName!=='')
            $sql="UPDATE Uzytkownik 
                    SET nazwa='$name', haslo='$pass', funkcja='$level', url_Obrazka='$imgName'
                    WHERE id_Uzytkownik=$id";
        else
            $sql="UPDATE Uzytkownik 
                    SET nazwa='$name', haslo='$pass', funkcja='$level'
                    WHERE id_Uzytkownik=$id";
		DB::query($sql);
	}
	
	function insert_user($name,$pass,$level, $imgName='' )
	{		
		if(empty($name) || empty($pass) || !in_array($level,get_levels()) )
			return;
		if(get_user_by_name($name))
			return;
		$pass=sha1($pass);
        if($imgName!=='')
            $sql="INSERT INTO Uzytkownik VALUES (NULL,'$name','$level','$pass', '$imgName')";
        else
            $sql="INSERT INTO Uzytkownik VALUES (NULL,'$name','$level','$pass', NULL)";
		DB::query($sql);	
	}
	
	function select_users($name, $level)
	{
		$sql="SELECT id_Uzytkownik AS id, nazwa, funkcja 
				FROM Uzytkownik 
				WHERE nazwa LIKE '%$name%' AND funkcja LIKE '$level'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      for($i=0; $i<$count;$i++)      
          $users[$i]=$result->fetch_object();                          
      return $users;
	}
	
	function get_user_by_id($id)
	{
		$sql="SELECT * FROM Uzytkownik WHERE id_Uzytkownik=$id";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	function get_user_by_name($name)
	{
		$sql="SELECT * FROM Uzytkownik WHERE nazwa='$name'";
		$result=DB::query($sql);		
      $count=$result->num_rows;
      if($count==0)
          return NULL;
      else 
      	return $result->fetch_object();                               
	}	
	
	//pobieramy wartości, które może przyjmować pole funkcja
	function get_levels()
	{	
		$sql = " SHOW COLUMNS FROM `Uzytkownik` LIKE 'funkcja' ";
		$result = DB::query($sql);
		$row = mysqli_fetch_array( $result , MYSQL_NUM );
		#extract the values
		#the values are enclosed in single quotes
		#and separated by commas
		$regex = "/'(.*?)'/";
		preg_match_all( $regex , $row[1], $enum_array );
		$levels = $enum_array[1];
		return $levels;		
	}
	
?>