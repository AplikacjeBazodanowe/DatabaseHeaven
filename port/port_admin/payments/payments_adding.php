<?php
	include_once("payments_db_funs.php");
?>

<form action="port.php?menu=payments&action=add" method="post">
	<select name="contractor" class="baseFont select">
					$contractors=get_contractors();
					foreach($contractors as $contractor)											
						echo "<option value=\"$contractor->id\">$contractor->name</option>";					
			?>