<?php
	include_once('contractors_db_funs.php');
?>

<form action="cargo.php?menu=ships&action=add" method="post">	Name: <br><input name="name" class="edit_adding baseFont" type="edit" placeholder="Name" required>	Address: <br><input name="address" class="edit_adding baseFont" type="edit" placeholder="Address" required>	Country: <br><select name="country">
	<?php	
		$countries=get_countries();
		foreach($countries as $country)
			echo "<option value=\"$country->id\">$country->name</option>"; 
	?>							  </select>	<br><br>	<input class="button baseFont menu_button" type="submit" value="Add">	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()"></form>