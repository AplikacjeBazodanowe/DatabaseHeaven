<form action="admin_system.php?menu=ships&action=add" method="post">	Contractor: <br><input name="contractor" class="edit_adding baseFont" type="edit" placeholder="Name Surname" required>	Type: <br><select name="level">				<option>type			  </select><br>	Amount: <br><input name="amount" class="edit_adding baseFont" type="edit" placeholder="100" pattern="^[0-9]+$" required><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>