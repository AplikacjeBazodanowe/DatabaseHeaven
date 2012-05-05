<?php			
	include_once("docks_db_funs.php");
?>

<form action="admin_system.php?menu=docks&action=add" method="post">	Id: <br><input name="id" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br>	Terminal: <br>		<select name="terminal" class="baseFont select">			<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
			?>	</select>	<br>	Fee: <br><input name="fee" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br>	Max Ship Length: <br><input name="length" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br>	Max Ship Width: <br><input name="width" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br>	Max Ship Height: <br><input name="height" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>