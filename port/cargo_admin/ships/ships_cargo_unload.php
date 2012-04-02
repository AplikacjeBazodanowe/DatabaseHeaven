<?php			
	include_once('../loading_db_funs.php');
	include_once('../contractors/contractors_db_funs.php');

	echo "<span class=\"baseFont\"><h1>List of articles on the $ship->name ship:</h1></span>";	echo "<form action=\"?action=unload&done=unload&id=" . $_GET['id'] . "\" method=\"post\">";	echo "<table class=\"stuff_info_wider\">		<tr>			<td class=\"stuff_no\" colspan=\"4\">				Cargo			</td>		</tr>		<tr>			<td colspan=\"2\">				data zaladunku			</td>			<td style=\"width: 240px\" class=\"unload_to_label\">				Unload to...			</td>			<td style=\"width: 200px\" class=\"unload_to_label\">				Remarks			</td>		</tr>";
	$i=0;
	$contractors=select_contractors();	//kontrahentów pobieramy raz bo są dobrzy dla wszystkiego
	foreach($cargo as $cargo_item)
	{	
		if(passed_control($cargo_item->id))
		{
			//pobieramy prawidłowe magazyny i statki dla danego ładunku
			$warehouses=select_warehouses_to_load($cargo_item->id);
			$ships=select_ships_to_load($cargo_item->id);			echo "<tr>				<td class=\"cargo_name\">					nazwa towaru				</td>				<td>					szczegoly towaru				</td>				<td class=\"unload_to\">					<!-- pierwszy argument showTarget to kolejne numery towarow (dla atrybutu name select'a ponizej), a drugi i trzeci Cie w sumie nie interesuje -->					<input id=\"butt1_$i\" style=\"border: 2px solid RGB( 84, 122, 150 )\" class=\"button\" type=\"button\" value=\"Ships\" onClick=\"showTarget( $i, 0, this )\">					<input id=\"butt2_$i\" class=\"button\" type=\"button\" value=\"Warehouses\" onClick=\"showTarget( $i, 1, this )\">					<input id=\"butt3_$i\" class=\"button\" type=\"button\" value=\"Contractors\" onClick=\"showTarget( $i, 2, this )\">					<hr>					<select class=\"baseFont\" name=\"to$i\">						<option>Don't unload</option>";			foreach($ships as $ship)
				echo "<option value=\"$ship->id\">$ship->name</option>";					echo "</select>					<select class=\"baseFont\" name=\"to$i\" style=\"display: none\" disabled=\"true\">						<option>Don't unload</option>";			foreach($warehouses as $warehouse)
				echo "<option value=\"$warehouse->id\">$warehouse->name</option>";					echo "</select>					<select class=\"baseFont\" name=\"to$i\" style=\"display: none\" disabled=\"true\">						<option>Don't unload</option>";
			foreach($contractors as $contractor)
				echo "<option value=\"$contractor->id\">$contractor->name</option>";											echo "</select>				</td>				<td>					<textarea name=\"remarks$i\" cols=\"35\" rows=\"3\" placeholder=\"Remarks will be ignored if 'Don't unload' is selected\"></textarea>				</td>			</tr>";
		}
		else
		{			echo "<tr>				<td class=\"cargo_name\">					nazwa towaru				</td>				<td>					szczegoly towaru				</td>				<td class=\"unload_to\">					Duty control required				</td>				<td>					<textarea name=\"remarks1\" cols=\"35\" rows=\"3\" placeholder=\"Remarks will be ignored if 'Don't unload' is selected\"></textarea>				</td>			</tr>";
		}
		$i++;
	}	echo '</table>			<br><input type="submit" class="button baseFont add" value="Unload">		</form>';
?>