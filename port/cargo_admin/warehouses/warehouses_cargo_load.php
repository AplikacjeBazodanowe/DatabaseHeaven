<span class="baseFont"><h1>List of cargo in the [warehouse_name] warehouse:</h1></span><table class="stuff_info_wider"><tr>	<td class="stuff_no" colspan="3">		nr ladunku albo cos	</td></tr><tr>	<td colspan="2">		data ostatniego zaladunku?	</td>	<td style="width: 300px" class="unload_to_label">			Remarks	</td></tr><tr>	<td class="cargo_name">		nazwa towaru	</td>	<td>		szczegoly towaru	</td>	<td class="unload_to">		remarks	</td></tr><tr>	<td class="cargo_name">		nazwa towaru	</td>	<td>		szczegoly towaru	</td>	<td class="unload_to">		remarks	</td></tr><tr>	<td class="cargo_name">		nazwa towaru	</td>	<td>		szczegoly towaru	</td>	<td class="unload_to">		remarks	</td></tr></table><?php	echo '<span class="baseFont"><h1>Load cargo to the [warehouse_name] warehouse:</h1></span>';	echo '<div>';	echo '<a href="?action=load&from=warehouse&id='   . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From another warehouse"></a>';	echo '<br><a href="?action=load&from=ship&id='    . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From ship"></a>';	echo '<br><a href="?action=load&from=outside&id=' . $_GET['id'] . '"><input class="button baseFont add" type="button" value="From outside the port"></a>';	echo '</div>';	if( isset( $_GET['from'] ) ) {		if( $_GET['from'] == 'warehouse' ) {			if( isset( $_GET['warehouse_id'] ) ) {				echo '<br><h2>Load from [warehouse_name] warehouse</h2>';				echo '<form id="cargo_form" action="?action=load&done=load&from=warehouse&id=' . $_GET['id'] . '&warehouse_id=' . $_GET['warehouse_id'] . '" method="post">';				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 2 )">';				echo '<option value="empty slot">empty slot';				echo '<option value="towary z magazynu">towary z magazynu';				echo '</select>';				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';				echo '</form>';			} else {				echo '<br><form id="cargo_form" method="get">';				echo '<input type="hidden" name="action" value="load">';				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';				echo '<br>Select a warehouse: <select name="warehouse_id" onChange="addCargoCombo()">';				echo '<option value="id">warehouse';				echo '</select>';				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the warehouse">';				echo '</form>';					}					} elseif( $_GET['from'] == 'ship' ) {			if( isset( $_GET['ship_id'] ) ) {				echo '<br><h2>Load from [shit_name] ship</h2>';				echo '<form id="cargo_form" action="?action=load&done=load&from=ship&id=' . $_GET['id'] . '&ship_id=' . $_GET['ship_id'] . '" method="post">';				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 2 )">';				echo '<option value="empty slot">empty slot';				echo '<option value="towary ze statku">towary ze statku';				echo '</select>';				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';				echo '</form>';			} else {				echo '<br><form id="cargo_form" method="get">';				echo '<input type="hidden" name="action" value="load">';				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';				echo '<br>Select a ship: <select name="ship_id" onChange="addCargoCombo()">';				echo '<option value="id">ship';				echo '</select>';				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the ship">';				echo '</form>';					}			} elseif( $_GET['from'] == 'outside' ) {			if( isset( $_GET['contractor_id'] ) ) {				echo '<h2>Load from outside the port</h2>';				echo '<form id="cargo_form" action="?action=load&done=load&from=outside&id=' . $_GET['id'] . '&contractor_id=' . $_GET['contractor_id'] . '" method="post">';				echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 1 )">';				echo '<option value="empty slot">empty slot';				echo '<option value="towary ze statku">towary ze statku';				echo '</select>';				echo '<input name="amount0" type="text" placeholder="Amount" onBlur="addCargoFieldNoBox()" pattern="^[0-9]+$">';				echo '<br><textarea style="margin-left: 40px" name="remarks0" cols="35" rows="3" placeholder="Remarks"></textarea><br>';				echo '<br><br><input type="submit" class="button baseFont add" value="Load">';				echo '</form>';			} else {				echo '<br><form id="cargo_form" method="get">';				echo '<input type="hidden" name="action" value="load">';				echo '<input type="hidden" name="from" value="' . $_GET['from'] . '">';				echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';				echo '<br>Choose a contrator from the list below:<br><br>';				echo '<select name="contractor_id">';				echo '<option value="id">mohamadz alibahamamasratata, ul. Sraka, Srarabia';				echo '</select>';				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the contractor">';			}		}	}?>