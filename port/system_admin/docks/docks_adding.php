<?php			
	include_once("docks_db_funs.php");
?>

<form action="admin_system.php?menu=docks&action=add" method="post">
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
			?>