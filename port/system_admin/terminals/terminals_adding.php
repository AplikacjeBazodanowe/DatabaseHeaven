<?php	
	include_once("terminals_db_funs.php");	
?>

<form action="admin_system.php?menu=terminals&action=add" method="post">	Name: <br><input name="name" class="edit_adding baseFont" type="edit" required><br>
	Type: <br><select name="type">
				<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>
			 </select><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>