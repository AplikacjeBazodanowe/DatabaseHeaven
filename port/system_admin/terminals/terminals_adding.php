<?php	
	include_once("terminals_db_funs.php");	
?>

<form action="admin_system.php?menu=terminals&action=add" method="post">
	Type: <br><select name="type">
				<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>
			 </select><br>