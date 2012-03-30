<?php	
	include_once("terminals_db_funs.php");	
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$terminal = get_terminal_by_id($id);
		$docks = select_docks($id);
		$warehouses = select_warehouses($id,'');
		if($terminal)
		{ 				
			echo "<h1>Terminal name:</h1><p>$terminal->name</p>";
			echo "<h1>Type:</h1><p>$terminal->type</p>";
			echo "<a class=\"link\" href=\"#\" onClick=\"edit_toggle( $terminal->id )\">Edit this terminal</a><br />";
			echo	"<a class=\"link\" href=\"admin_system.php?menu=users&action=delete&id=$terminal->id\">";						echo	"Delete this piece of shit!</a>";
			echo "<h2>List of docks for this terminal:</h2>";
			if($docks!=NULL)
			{
				echo "<ol>";
				foreach($docks as $dock)
					echo "<li><a class=\"link\" href=admin_system.php?menu=docks&action=show&id=$dock->id>Dok nr $dock->id</a></li>";
				echo "</ol>";
			}
			else
				echo "None";		
			echo "<h2>List of warehouses for this terminal:</h2>";
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