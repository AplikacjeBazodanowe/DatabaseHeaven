<?php
	include_once("ships_db_funs.php");
	
	if( isset( $_GET['action'] ) ) 
	{
		if( $_GET['action'] == 'undocked' ) 
		{
			$ship_id = $_GET['docked_id'];
			$error=undock_ship($ship_id);
		}
		if( $_GET['action']=='dock_new' && isset( $_POST['dock_id'] )  && isset( $_POST['ship_id'] )) 
		{
			$ship_id = $_POST['ship_id'];			
			$dock_id = $_POST['dock_id'];				
			$error=dock_ship($ship_id,$dock_id);			
		}
		elseif( $_GET['action']=='move' && isset( $_POST['ship_id'] )
				&& isset( $_POST['dock_id'] ) && isset( $_POST['docked_id'] )) 
		{
			$ship_id = $_POST['ship_id'];			
			$dock_id = $_POST['dock_id'];
			$docked_id = $_POST['docked_id'];				
			$error=move_ship($ship_id,$docked_id,$dock_id);			
		}
	}
?>
<div>
	<a href="ships/ships_dock.php?action=dock_new"><input class="button baseFont add" type="button" value="Dock ship"></a>
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Name:<br>
		Type:<br>
		Terminal:<br>		
		Mass:<br>
		Volume:<br>
		Length:<br>
		Width:<br>
		Height:
	</div>
	<form action="?menu=ships&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here">
			<select name="type" class="baseFont select">
				<option value="">All</option>
				<?php					
					$types=get_ship_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>

			</select>
			<br>
			<select name="terminal" class="baseFont select">
				<option value="">All</option>
				<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
				?>
			</select>
			<br>			
			<input name="from_mass_cap" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_mass_cap" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="mass_cap_check" type="checkbox" onClick="on_off_edit('mass_cap')">
			<input name="from_vol_cap" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_vol_cap" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="vol_cap_check" type="checkbox" onClick="on_off_edit('vol_cap')">
			<input name="from_length" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_length" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="length_check" type="checkbox" onClick="on_off_edit('length')">
			<input name="from_width" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_width" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="width_check" type="checkbox" onClick="on_off_edit('width')">
			<input name="from_height" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_height" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="height_check" type="checkbox" onClick="on_off_edit('height')">
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="ships_list overf">
	<?php
		if( isset($_POST['ship_name']) && $_POST['ship_name']!='Type name here') 			
			$name = $_POST['ship_name'];
		else 
			$name='';							
		if( isset($_POST['type'])) 			
			$type = $_POST['type'];
		else
			$type='';
		if( isset($_POST['terminal'])) 			
			$terminal = $_POST['terminal'];
		else
			$terminal='';
		if( isset($_POST['from_mass_cap'])) 			
			$capMassMin = $_POST['from_mass_cap'];
		else
			$capMassMin='';
		if( isset($_POST['to_mass_cap'])) 			
			$capMassMax = $_POST['to_mass_cap'];
		else
			$capMassMax='';
		if( isset($_POST['from_vol_cap'])) 			
			$capVolMin = $_POST['from_vol_cap'];
		else
			$capVolMin='';
		if( isset($_POST['to_vol_cap'])) 			
			$capVolMax = $_POST['to_vol_cap'];
		else
			$capVolMax='';
		if( isset($_POST['from_height'])) 			
			$heightMin = $_POST['from_height'];
		else
			$heightMin='';
		if( isset($_POST['to_height'])) 			
			$heightMax = $_POST['to_height'];
		else
			$heightMax='';
		if( isset($_POST['from_length'])) 			
			$lengthMin = $_POST['from_length'];
		else
			$lengthMin='';
		if( isset($_POST['to_length'])) 			
			$lengthMax = $_POST['to_length'];
		else
			$lengthMax='';
		if( isset($_POST['from_width'])) 			
			$widthMin = $_POST['from_width'];
		else
			$widthMin='';
		if( isset($_POST['to_width'])) 			
			$widthMax = $_POST['to_width'];
		else
			$widthMax='';									 
		$ships=select_docked_ships($name, $type,$terminal, $capVolMin, $capVolMax,
									$capMassMin, $capMassMax, $lengthMin, $lengthMax, 
									$widthMin, $widthMax, $heightMin, $heightMax);
		if($ships)
			foreach($ships as $ship)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=ships&id=$ship->id'\">$ship->name</td>";
				echo "<td class=\"delete right_column\" onClick=\"window.location.href='?menu=ships&action=undocking&id=$ship->id&docked_id=$ship->docked_id'\">Undock</td></tr>";
				echo "<tr><td class=\"level\">Dok $ship->dock_id</td>";
				echo "<td class=\"edit\" onClick=\"window.location.href='ships/ships_dock.php?action=move&step=2&ship_id=$ship->id&docked_id=$ship->docked_id'\">Move</td></tr>";
				echo "</table><br>";
			}
	?>	
</div>