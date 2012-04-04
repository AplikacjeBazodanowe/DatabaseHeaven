<?php
	echo "<span class=\"baseFont\"><h1>List of cargo on the $ship->name ship:</h1></span>
	<table class=\"stuff_info_wider\">
	<tr>
		<td class=\"stuff_no\" colspan=\"2\">
				Cargo
			</td>
			<td style=\"width: 150px\" class=\"stuff_no\">
				Duty control requirement
			</td>
			<td style=\"width: 250px\" class=\"stuff_no\">
				Remarks
			</td>
	</tr>";
	if($cargo!=NULL)
		foreach($cargo as $cargo_item)
		{					 
			echo	"<tr>
					<td class=\"cargo_name\">
						ID: $cargo_item->id <br>$cargo_item->name
					</td>
					<td>
						$cargo_item->amount
					</td>
					<td>
						$cargo_item->control_required
					</td>
					<td>
						$cargo_item->remarks
					</td>
				</tr>";				
		}
	echo "</table>";

	echo '<span class="baseFont"><h1>Load cargo on the [ship_name] ship:</h1></span>';
	echo '<div>';
	echo '<a href="?action=load&from=warehouse&id='   . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From warehouse"></a>';
	echo '<br><a href="?action=load&from=ship&id='    . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From another ship"></a>';
	echo '<br><a href="?action=load&from=outside&id=' . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From outside the port"></a>';
	echo '</div>';
	if( isset( $_GET['from'] ) ) 
	{
		if( $_GET['from'] == 'warehouse' ) 
		{
			if( isset( $_GET['warehouse_id'] ) ) 
			{
				$warehouse_name=get_warehouse_by_id($_GET['warehouse_id'])->name;
				$cargo = get_warehouse_cargo($_GET['warehouse_id']);								
				echo "<br><h2>Load from $warehouse_name warehouse</h2>";
				echo '<form id="cargo_form" action="?action=load&done=load&from=warehouse&id=' . $_GET['id'] . '&warehouse_id=' . $_GET['warehouse_id'] . '" method="post">';
				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 2 )">';
				echo '<option value="empty slot">empty slot';
				if($cargo!=NULL)
					foreach($cargo as $cargo_item)
						echo "<option value=\"$cargo->id\">$cargo->name: $cargo->amount</option>";
				echo '</select>';
				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';
				echo '</form>';
			} 
			else 
			{
				$warehouses=select_warehouses($ship->term_id,'');
				echo '<br><form id="cargo_form" method="get">';
				echo '<input type="hidden" name="action" value="load">';
				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';
				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';
				echo '<br>Select a warehouse: <select name="warehouse_id">';
				if($warehouses!=NULL)
					foreach($warehouses as $warehouse)
						echo "<option value=\"$warehouse->id\">$warehouse->name</option>";				
				echo '</select>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the warehouse">';
				echo '</form>';		
			}			
		} 
		elseif( $_GET['from'] == 'ship' ) 
		{
			if( isset( $_GET['ship_id'] ) ) 
			{				
				$ship_name=get_ship_by_id($_GET['ship_id'])->name;
				$cargo = get_ship_cargo($_GET['ship_id']);				
				echo "<br><h2>Load from $ship_name ship</h2>";
				echo '<form id="cargo_form" action="?action=load&done=load&from=ship&id=' . $_GET['id'] . '&ship_id=' . $_GET['ship_id'] . '" method="post">';
				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 2 )">';
				echo '<option value="empty slot">empty slot';
				if($cargo!=NULL)
					foreach($cargo as $cargo_item)
						echo "<option value=\"$cargo_item->id\">$cargo_item->name: $cargo_item->amount</option>";
				echo '</select>';
				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';
				echo '</form>';
			} 
			else 
			{
				$ships=select_docked_ships('','',$ship->term_id);
				echo '<br><form id="cargo_form" method="get">';
				echo '<input type="hidden" name="action" value="load">';
				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';
				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';
				echo '<br>Select a ship: <select name="ship_id"">';
				if($ships!=NULL)
					foreach($ships as $theShip)
						if($ship->id != $theShip->id)
							echo "<option value=\"$theShip->id\">$theShip->name</option>";				
				echo '</select>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the ship">';
				echo '</form>';		
			}	
		} 
		elseif( $_GET['from'] == 'outside' ) 
		{
			if( isset( $_GET['contractor_id'] ) ) 
			{
				$commodities=get_commodities($ship->type_id);
				echo '<h2>Load from outside the port</h2>';
				echo '<form id="cargo_form" action="?action=load&done=load&from=outside&id=' . $_GET['id'] . '&contractor_id=' . $_GET['contractor_id'] . '" method="post">';
				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 1 )">';
				echo '<option value="empty slot">empty slot';
				if($commodities!=NULL)
					foreach($commodities as $commodity)						
						echo "<option value=\"$commodity->id\">$commodity->name</option>";
				echo '</select>';
				echo '<input name="amount0" type="text" placeholder="Amount" onBlur="addCargoFieldNoBox()" pattern="^[0-9]+$">';
				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';
				echo '</form>';
			} 
			else 
			{
				$contractors=select_contractors();
				echo '<br><form id="cargo_form" method="get">';
				echo '<input type="hidden" name="action" value="load">';
				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';
				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';
				echo '<br>Choose a contrator from the list below:<br><br>';
				echo '<select name="contractor_id">';
				if($contractors!=NULL)
					foreach($contractors as $contractor)
						echo "<option value=\"$contractor->id\">$contractor->name</option>";
				echo '</select>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the contractor">';
			}
		}
	}
?>