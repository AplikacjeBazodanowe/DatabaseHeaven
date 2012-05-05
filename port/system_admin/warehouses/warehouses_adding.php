<?php			
	include_once("warehouses_db_funs.php");
?>

<form action="admin_system.php?menu=warehouses&action=add" method="post">	Name: <br><input name="name" class="edit_adding baseFont" type="edit" required><br>	Terminal: <br>	<select name="terminal" class="baseFont select">			<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
			?>	</select>	<br>	Capacity: <br><input name="capacity" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br>	Fee: <br><input name="fee" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>