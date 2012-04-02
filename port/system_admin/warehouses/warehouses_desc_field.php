<?php	include_once("warehouses_db_funs.php");
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$warehouse = get_warehouse_by_id($id);
		if($warehouse)
		{ 	
			echo "<h1>$warehouse->name</h1>";			
			echo "<h1>Terminal:</h1><p>$warehouse->term_name</p>";
			echo "<h1>Capacity:</h1><p>$warehouse->capacity [tu będzie pobierać jednostkę objętości z bazy]</p>";			
			echo "<h1>Fee:</h1><p>$warehouse->fee $</p>";
			echo "<a class=\"link\" href=\"#\" onClick=\"edit_toggle( $warehouse->id )\">Edit this warehouse</a><br />";
			echo	"<a class=\"link\" href=\"admin_system.php?menu=warehouses&action=delete&id=$warehouse->id\">";						echo	"Delete this piece of shit!</a>";						
		}
	}
	else 
	{
		echo "<h1>Warehouses</h1>";
		echo "<p>This is the warehouses menu.</p>";
		echo "<p>Select a warehouse from the list to view its details</p>";
	}?>