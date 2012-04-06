<?php
	include_once('contractors_db_funs.php');
?>

<form action="port.php?menu=contractors&action=add" method="post">
	Name: <br><input name="name" class="edit_adding baseFont" type="edit" placeholder="Name" required>
	Address: <br><input name="address" class="edit_adding baseFont" type="edit" placeholder="Address" required>
    Type: <br><select name="type">
	<?php	
		$types=get_types();
		foreach($types as $type)
			echo "<option value=\"$type\">$type</option>"; 
	?>				
			  </select><br/>
	Country: <br><select name="country">
	<?php	
		$countries=get_countries();
		foreach($countries as $country)
			echo "<option value=\"$country->id\">$country->name</option>"; 
	?>				
			  </select>
	<br><br>
	<input class="button baseFont menu_button" type="submit" value="Add">
	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()">
</form>