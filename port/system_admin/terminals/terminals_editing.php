<form name="edit_form" action="admin_system.php?menu=terminals&action=edit&id=ID" method="post">	Name: <br><input name="name" class="edit_adding baseFont" type="edit" required><br>	Type: <br><select name="type">
				<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>
			 </select><br><br>	<input class="button baseFont menu_button" type="submit" value="Edit" required>	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="edit_toggle()"></form>