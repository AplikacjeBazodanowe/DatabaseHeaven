<?php	include_once("docks_db_funs.php");
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$dock = get_dock_by_id($id);
		if($dock)
		{ 	
			echo "<h1>Dock number $dock->id</h1>";			
			echo "<h1>Terminal:</h1><p>$dock->term_name</p>";
			echo "<h1>Max Ship Length:</h1><p>$dock->max_length meters</p>";
			echo "<h1>Max Ship Width:</h1><p>$dock->max_width meters</p>";
			echo "<h1>Max Ship Height:</h1><p>$dock->max_height meters</p>";
			echo "<h1>Fee:</h1><p>$dock->fee $</p>";
			echo "<a class=\"link\" href=\"#\" onClick=\"edit_toggle( $dock->id )\">Edit this dock</a><br />";
			echo	"<a class=\"link\" href=\"admin_system.php?menu=docks&action=delete&id=$dock->id\">";						echo	"Delete this piece of shit!</a>";						
		}
	}
	else 
	{
		echo "<h1>Docks</h1>";
		echo "<p>This is the Docks menu.</p>";
		echo "<p>Select a dock from the list to view its details</p>";
	}?>