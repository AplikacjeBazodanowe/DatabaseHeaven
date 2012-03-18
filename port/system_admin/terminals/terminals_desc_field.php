<?php
	include_once("terminals_db_funs.php");
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$terminal = get_terminal_by_id($id);
		if($terminal)
		{ 				
			echo "<h1>Terminal name:</h1><p>$terminal->name</p>";
			echo "<h1>Type:</h1><p>$terminal->type</p>";
			echo "<a class=\"link\" href=\"#\" onClick=\"edit_toggle( $terminal->id )\">Edit this terminal</a><br />";
			echo	"<a class=\"link\" href=\"admin_system.php?menu=users&action=delete&id=$terminal->id\">";						echo	"Delete this piece of shit!</a>";
			echo "<p>Tu będzie się wyświetlać lista doków tego terminala</p>";			
		}
	}
	else 
	{
		echo "<h1>Terminals</h1>";
		echo "<p>This is the Terminals menu.</p>";
		echo "<p>Select a terminal from the list to view its details</p>";
	}	?>