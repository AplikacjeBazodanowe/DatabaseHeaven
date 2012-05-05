<?php
	include_once('warehouses/warehouses_db_funs.php');
	include_once('cargo/cargo_db_funs.php');
	include_once('loading_db_funs.php');

	// ten skrypt jest dla ladowania z magazynu na statek, ze statku na statek i z magazynu do magazynu
    // z poziomu statku
	if( isset( $_GET['action'] ) ) 
	{
		echo '<script>
		function addCargoCombo( arg ) {
			var current = "";';
									
			if( isset( $_GET['from'] ) && $_GET['from'] == 'warehouse' && isset($_GET['warehouse_id']) ) 
			{
				echo 'var fields = \'';
				$cargo=get_warehouse_cargo($_GET['warehouse_id']);
				foreach($cargo as $cargo_item)
					echo "<option value=\"$cargo_item->id\">$cargo_item->name amount: $cargo_item->amount </option>";
				echo '\';';
			} 
			elseif (isset( $_GET['from'] ) && $_GET['from'] == 'ship' && isset($_GET['ship_id'])) 
			{
				echo 'var fields = \'';
				$cargo=get_ship_cargo($_GET['ship_id']);
				foreach($cargo as $cargo_item)
					if(passed_control($cargo_item->id))
						echo "<option value=\"$cargo_item->id\">$cargo_item->name amount: $cargo_item->amount </option>";
				echo '\';';
			}
			elseif (isset( $_GET['from'] ) && $_GET['from'] == 'outside' && isset($_GET['contractor_id']) || $_GET['action'] == 'register')
			{
				$ship=get_docked_ship_by_id($_GET['id']);
				echo 'var fields = \'';
				$commodities=get_commodities($ship->type_id);
				foreach($commodities as $commodity)
					echo "<option value=\"$commodity->id\">$commodity->name</option>";
				echo '\';';
			}
			
			echo '
													"<option value=\"empty slot\">empty slot" +
													fields + 
													"<option value=\"empty slot\">empty slot" +
													fields + 
													"<option value=\"empty slot\">empty slot" +
													fields + 
															  fields + 
															  fields + 
															  fields + 