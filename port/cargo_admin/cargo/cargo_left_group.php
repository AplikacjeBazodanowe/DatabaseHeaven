<?php
	include_once('cargo_db_funs.php');
?>

<div>	<div style="float: left; line-height: 21px;">		Name:<br>		Type:	</div>	<form action="?menu=cargo&action=show" method="post">		<div style="margin-left: 69px;">			<input name="commodity" class="edit baseFont" type="edit" placeholder="Type commodity here">			<select name="type" class="baseFont select">				<option value="">All</option>
				<?php
					$types=get_cargo_types();
					foreach($types as $type)
						echo "<option value=\"$type->id\">$type->name</option>";
				?>			</select>			<br>
			<label>Current only</label><input type="checkbox" name="current" />					</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="cargo_list overf">	<?php			if( isset($_POST['commodity']) && $_POST['commodity']!='Type commodity here') 							$commodity = $_POST['commodity'];
			else 
				$commodity='';							
			if( isset($_POST['type'])) 							$type = $_POST['type'];
			else
				$type='';									 
			if( isset($_POST['current'])) 							$current = true;
			else
				$current = false;
			$cargo=select_cargo($commodity,$type,$current);

			if($cargo)
				foreach($cargo as $cargoItem)
				{
					echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
					echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=cargo&id=$cargoItem->id'\">ID: $cargoItem->id</td></tr>";
					echo "<tr><td class=\"level\">$cargoItem->commodity: $cargoItem->amount</td></tr>";
					echo "</table><br>";				}	?></div>