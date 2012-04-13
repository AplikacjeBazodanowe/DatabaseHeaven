<?php	
	include_once("users_db_funs.php");	
?>

<form action="admin_system.php?menu=users&action=add" method="post" enctype="multipart/form-data">	Name: <br><input name="name" class="edit_adding baseFont" type="edit" onBlur="isEmpty( this )" required><br>			Level: <br><select name="level">
				<?php					
					$levels=get_levels();
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";					
				?>
			 </select><br>
	Password: <br><input name="password" class="edit_adding baseFont" type="password" required><br>		Image (jpg allowed): <br><input name="image" class="edit_adding baseFont" type="file" required><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>