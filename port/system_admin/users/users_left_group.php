<?php	
	include_once("users_db_funs.php");	
	
	{		
		{
		elseif( $_GET['action'] == 'edit' ) 
		{ 
			$pass=sha1($_POST['password']);
			$level=$_POST['level'];
			$name=$_POST['name'];
			update_user($user_id,$name,$pass,$level);
		elseif($_GET['action'] == 'add') 
		{
			$pass=sha1($_POST['password']);
			$level=$_POST['level'];
			$name=$_POST['name'];
			insert_user($name,$pass,$level);
		}		
					$levels=get_levels();
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";
					echo "<option value=\"%\">all</option>";					
			?>
		else 
			$name='';							
		if( isset($_GET['level'])) 			
		else
			$level="%";									 
		$users=select_users($name,$level);
		if($users)
			foreach($users as $user)
			{				 			 
			  	echo "<div class=\"name float_left left_col align_cols link\">";
				echo  "<div class=\" delete float_left right_col align_cols link\">";
			}