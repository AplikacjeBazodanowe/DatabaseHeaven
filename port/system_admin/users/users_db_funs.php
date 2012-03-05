<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");

	function delete_user($id) 
	{
		$sql="DELETE FROM Uzytkownik WHERE id_Uzytkownik=$id";
		DB::query($sql);	
	}
	
	function update_user($id,$name,$pass,$level)
	{
		$sql="UPDATE Uzytkownik 
				SET nazwa='$name', haslo='$pass', funkcja='$level' 
				WHERE id_Uzytkownik=$id";
		DB::query($sql);
	}
	
	function insert_user($name,$pass,$level)
	{
		$sql="INSERT INTO Uzytkownik VALUES (NULL,'$name','$pass',NULL,'$level')";
		DB::query($sql);	
	}
	
	function select_users($name, $level)
	{
		$sql="SELECT id_Uzytkownik AS id, nazwa, funkcja, url_obrazka 
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