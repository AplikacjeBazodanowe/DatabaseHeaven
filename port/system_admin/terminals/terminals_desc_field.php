<?php	
	include_once("terminals_db_funs.php");	
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$terminal = get_terminal_by_id($id);
		$docks = select_docks($id);
		$warehouses = select_warehouses($id,'');
		if($terminal)
		{ 				
			echo "<h2>Terminal name:</h2><p class=\"item_char_in_desc\">$terminal->name</p>";
			echo "<h2>Type:</h2><p class=\"item_char_in_desc\">$terminal->type</p>";
			echo "<br><input class=\"button baseFont add\" type=\"button\" value=\"Edit this terminal\" onClick=\"edit_toggle( $terminal->id )\">";
			echo "<a href=\"admin_system.php?menu=users&action=delete&id=$terminal->id\">";						echo "<br><input class=\"button baseFont add\" type=\"button\" value=\"Delete this terminal\"></a>";
			echo "<br><br><h3>List of docks for this terminal:</h3>";
			if($docks!=NULL)
			{
				echo "<ol>";
				foreach($docks as $dock)
					echo "<li><a class=\"link\" href=admin_system.php?menu=docks&action=show&id=$dock->id>Dok nr $dock->id</a></li>";
				echo "</ol>";
			}
			else
				echo "None";		
			echo "<h3>List of warehouses for this terminal:</h3>";
			if($warehouses!=NULL)
			{
				echo "<ol>";
				foreach($warehouses as $warehouse)
					echo "<li><a class=\"link\" href=admin_system.php?menu=warehouses&action=show&id=$warehouse->id>$warehouse->name</a></li>";
				echo "</ol>";
			}
			else
				echo "None";
		}
	}
	else 
	{
		echo "<h1>Terminals</h1>";
		echo "<p>This is the Terminals menu.</p>";
		echo "<p>Select a terminal from the list to view its details</p>";
	}	?>