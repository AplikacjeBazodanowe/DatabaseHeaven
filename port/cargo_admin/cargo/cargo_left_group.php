<?php
	include_once('cargo_db_funs.php');
?>

<div>
				<?php
					$types=get_cargo_types();
					foreach($types as $type)
						echo "<option value=\"$type->id\">$type->name</option>";
				?>
			<label>Current only</label><input type="checkbox" name="current" />			
			else 
				$commodity='';							
			if( isset($_POST['type'])) 			
			else
				$type='';									 
			if( isset($_POST['current'])) 			
			else
				$current = false;
			$cargo=select_cargo($commodity,$type,$current);

			if($cargo)
				foreach($cargo as $cargoItem)
				{
					echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
					echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=cargo&id=$cargoItem->id'\">ID: $cargoItem->id</td></tr>";
					echo "<tr><td class=\"level\">$cargoItem->commodity: $cargoItem->amount</td></tr>";
					echo "</table><br>";