<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/cargo_admin/cargo/cargo_db_funs.php");        	
?>

<form action="cargo.php?menu=commodities&action=add" method="post">
	Name: <br><input name="name" class="edit_adding baseFont" type="edit" placeholder="Name" pattern="^[a-zA-Z0-9 ]+$" required />
	Unit value: <br><input name="value" class="edit_adding baseFont" type="edit" placeholder="Value" pattern="^[0-9]+$" required />
    Unit duty: <br><input name="duty" class="edit_adding baseFont" type="edit" placeholder="Customs duty" pattern="^[0-9]+$"/>
    Unit mass: <br><input name="mass" class="edit_adding baseFont" type="edit" placeholder="Mass" pattern="^[0-9]+$" required />
    Unit volume: <br><input name="volume" class="edit_adding baseFont" type="edit" placeholder="Volume" pattern="^[0-9]+$" required />
    Type: <br><select name="type">
	<?php	
		$types=get_cargo_types();
		foreach($types as $type)
			echo "<option value=\"$type->id\">$type->name</option>"; 
	?>				
			  </select><br/>	
	<br><br>
	<input class="button baseFont menu_button" type="submit" value="Add">
	<input class="button baseFont menu_button" type="button" value="Cancel" onClick="add_toggle()">
</form>