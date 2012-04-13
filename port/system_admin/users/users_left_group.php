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
					echo "<option value=\"%\">All</option>";
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";										
			?>		</select>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="users_list overf">	<?php								if( isset($_POST['user_name']) && $_POST['user_name']!='Surname') 						$name = $_POST['user_name'];
		else 
			$name='';							
		if( isset($_POST['level'])) 						$level = $_POST['level'];
		else
			$level="%";									 
		$users=select_users($name,$level);
		if($users)
			foreach($users as $user)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='admin_system.php?menu=users&id=$user->id'\">$user->nazwa</td>";
				echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=users&action=delete&id=$user->id' )\">Delete</td></tr>";
				echo "<tr><td class=\"level\">$user->funkcja</td>";
				echo "<td class=\"edit\" onClick=\"edit_toggle( $user->id )\">Edit</td></tr>";
				echo "</table><br>";
			}			?>	</div>