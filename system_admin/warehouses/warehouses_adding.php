<form action="admin_system.php?menu=warehouses&action=add" method="post">	Name: <br><input name="name" class="edit_adding baseFont" type="edit"><br>	Terminal: <br>	<select name="terminal" class="baseFont select">			<option>Terminal	</select>	<br>	Capacity: <br><input name="capacity" class="edit_adding baseFont" type="edit"><br>	Fee: <br><input name="fee" class="edit_adding baseFont" type="edit"><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>