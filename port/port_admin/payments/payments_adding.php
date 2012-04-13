<?php
	include_once("payments_db_funs.php");
?>

<form action="port.php?menu=payments&action=add" method="post">	Contractor: <br>
	<select name="contractor" class="baseFont select">			<?php					
					$contractors=get_contractors();
					foreach($contractors as $contractor)											
						echo "<option value=\"$contractor->id\">$contractor->name</option>";					
			?>	</select>		<br><br>Amount: <br><input name="value" class="edit_adding baseFont" type="edit" pattern="^[0-9]+$" required><br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>