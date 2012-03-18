<?php	
	include_once("users_db_funs.php");	
		if( isset( $_GET['action'] ) ) 
	{				if( $_GET['action'] == 'delete' ) 
		{			$user_id = $_GET['id'];			delete_user($user_id);		} 
		elseif( $_GET['action'] == 'edit' ) 
		{ 			$user_id = $_GET['id'];
			$pass=$_POST['password'];
			$level=$_POST['level'];
			$name=$_POST['name'];
			update_user($user_id,$name,$pass,$level);		}
		elseif($_GET['action'] == 'add') 
		{
			$pass=$_POST['password'];
			$level=$_POST['level'];
			$name=$_POST['name'];
			insert_user($name,$pass,$level);
		}			}?><div>	<input class="button baseFont add" type="button" value="Add user" onClick="add_toggle()">	<hr class="line">	<form action="admin_system.php?menu=users&action=show" method="post">						<br>		<div style="float: left; line-height: 21px;">
			Surname:&nbsp;<br>			Level:		</div>
		<input name="user_name" class="edit baseFont" type="text" placeholder="Type surname here">			<select name="level" class="baseFont select">			<?php					
					$levels=get_levels();
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";
					echo "<option value=\"%\">all</option>";					
			?>		</select>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="users_list overf">	<?php								if( isset($_POST['user_name']) && $_POST['user_name']!='Surname') 						$name = $_POST['user_name'];
		else 
			$name='';							
		if( isset($_POST['level'])) 						$level = $_POST['level'];
		else
			$level="%";									 
		$users=select_users($name,$level);
		if($users)
			foreach($users as $user)
			{				 			 			  	echo "<a href=\"admin_system.php?menu=users&id=$user->id\">";
			  	echo "<div class=\"name float_left left_col align_cols link\">";				echo "$user->nazwa";				echo "</div></a>";				echo	"<a href=\"admin_system.php?menu=users&action=delete&id=$user->id\">";
				echo  "<div class=\" delete float_left right_col align_cols link\">";				echo	"Delete";				echo "</div></a><div class=\"level float_left left_col align_cols\">";				echo "$user->funkcja</div>";								echo "<a href=\"#\" onClick=\"edit_toggle( $user->id )\"><div class=\"change float_left right_col align_cols link\">";				echo "Edit</div></a><br><br><br>";
			}			?>	</div>