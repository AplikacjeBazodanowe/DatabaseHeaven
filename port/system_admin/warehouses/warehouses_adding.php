<?php			
	include_once("warehouses_db_funs.php");
?>

<form action="admin_system.php?menu=warehouses&action=add" method="post">
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
			?>