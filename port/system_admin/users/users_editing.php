<?php
	include_once("users_db_funs.php");
?>

<form name="edit_form" action="admin_system.php?menu=users&action=edit&id=ID" method="post" enctype="multipart/form-data">	Name: <br><input name="name" class="edit_adding baseFont" type="edit"><br>		Level: <br><select name="level">
				<?php					
					$levels=get_levels();
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";					
				?>
			 </select><br>
	Password: <br><input name="password" class="edit_adding baseFont" type="password"><br>		Image: <br><input name="image" class="edit_adding baseFont" type="file"><br><br>	<input class="button baseFont menu_button" type="submit" value="Edit">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="edit_toggle()"></form>