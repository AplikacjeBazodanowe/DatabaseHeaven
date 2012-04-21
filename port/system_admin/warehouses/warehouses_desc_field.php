<?php	include_once("warehouses_db_funs.php");
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$warehouse = get_warehouse_by_id($id);
		if($warehouse)
		{ 	
			echo "<h1>$warehouse->name</h1>";			
			echo "<h2>Terminal:</h2><p class=\"item_char_in_desc\">$warehouse->term_name</p>";
			echo "<h2>Capacity:</h2><p class=\"item_char_in_desc\">$warehouse->capacity</p>";			
			echo "<h2>Fee:</h2><p class=\"item_char_in_desc\">$warehouse->fee</p>";
			echo "<br><input class=\"button baseFont add\" type=\"button\" value=\"Edit this warehouse\" onClick=\"edit_toggle( $warehouse->id )\">";
			echo "<a href=\"admin_system.php?menu=warehouses&action=delete&id=$warehouse->id\">";						echo "<br><input class=\"button baseFont add\" type=\"button\" value=\"Delete this warehouse\"></a>";						
		}
	}
	else 
	{
		echo "<h1>Warehouses</h1>";
		echo "<p>This is the warehouses menu.</p>";
		echo "<p>Select a warehouse from the list to view its details</p>";
	}?>