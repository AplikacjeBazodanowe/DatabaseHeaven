<?php	
	include_once("users_db_funs.php");	
?>

<form action="admin_system.php?menu=users&action=add" method="post" enctype="multipart/form-data">
				<?php					
					$levels=get_levels();
					foreach($levels as $level)											
						echo "<option value=\"$level\">$level</option>";					
				?>
			 </select><br>
	Password: <br><input name="password" class="edit_adding baseFont" type="password" onBlur="isEmpty( this )"><br>	