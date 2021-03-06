<?php			
	include_once('../loading_db_funs.php');
	include_once('../contractors/contractors_db_funs.php');	

	echo "<span class=\"baseFont\"><h1>List of articles on the $ship->name ship:</h1></span>";

	echo "<form action=\"?action=unload&done=unload&id=" . $_GET['id'] . "\" method=\"post\">";

	echo "<table class=\"stuff_info_wider\" style=\"text-align: center\" style=\"text-align: center\">
		<tr>
			<td class=\"stuff_no\" colspan=\"7\">
				Cargo
			</td>
		</tr>
		<tr>
			<td>
				ID
			</td>
			<td>
				Cargo name
			</td>
			<td>
				Amount
			</td>
            <td>
                Mass
            </td>
            <td >
                Volume
            </td>
			<td style=\"width: 250px\" class=\"unload_to_label\">
				Unload to...
			</td>
			<td style=\"width: 200px\" class=\"unload_to_label\">
				Remarks
			</td>
		</tr>";
	$i=0;	
	$contractors=select_contractors();	//kontrahentów pobieramy raz bo są dobrzy dla wszystkiego
	if($cargo!=NULL)
	{
		foreach($cargo as $cargo_item)
		{	
			if(passed_control($cargo_item->id))
			{
				//pobieramy prawidłowe magazyny i statki dla danego ładunku
				$warehouses=select_warehouses($ship->term_id,'');
				$ships=select_docked_ships('','',$ship->term_id);
				echo "<tr>
					<td>
						$cargo_item->id
					</td>
					<td class=\"cargo_name\">
						<a class=\"link\" href=\"../cargo.php?menu=cargo&id=$cargo_item->id\">$cargo_item->name</a><br>
					</td>
					<td>
						$cargo_item->amount
					</td>
                    <td>
						$cargo_item->mass
					</td>
                    <td>
						$cargo_item->volume
					</td>
					<td class=\"unload_to\">
						<!-- pierwszy argument showTarget to kolejne numery towarow (dla atrybutu name select'a ponizej), a drugi i trzeci Cie w sumie nie interesuje -->
						<input id=\"butt1_$i\" style=\"border: 2px solid RGB( 84, 122, 150 )\" class=\"button\" type=\"button\" value=\"Ships\" onClick=\"showTarget( $i, 0, this )\">
						<input id=\"butt2_$i\" class=\"button\" type=\"button\" value=\"Warehouses\" onClick=\"showTarget( $i, 1, this )\">
						<input id=\"butt3_$i\" class=\"button\" type=\"button\" value=\"Contractors\" onClick=\"showTarget( $i, 2, this )\">
						<input name=\"cargo$i\" type=\"hidden\" value=\"$cargo_item->id\" />
						<hr>
						<select class=\"baseFont\" name=\"to_ship$i\">
							<option>Don't unload</option>";
				foreach($ships as $theShip)
				{
					if($theShip->id!=$ship->id)
						echo "<option value=\"$theShip->id\">$theShip->name</option>";
				}
						echo "</select>
						<select class=\"baseFont\" name=\"to_warehouse$i\" style=\"display: none\" disabled=\"true\">
							<option>Don't unload</option>";
				foreach($warehouses as $warehouse)
					echo "<option value=\"$warehouse->id\">$warehouse->name</option>";
						echo "</select>
						<select class=\"baseFont\" name=\"to_contractor$i\" style=\"display: none\" disabled=\"true\">
							<option>Don't unload</option>";
				foreach($contractors as $contractor)
					echo "<option value=\"$contractor->id\">$contractor->name</option>";						
						echo "</select>
					</td>
					<td>
						<textarea name=\"remarks$i\" cols=\"35\" rows=\"3\" placeholder=\"Remarks will be ignored if 'Don't unload' is selected\"></textarea>
					</td>
				</tr>";
			}
			else
			{
				echo "
					<input type=\"hidden\" name=\"ignore$i\" />
					<tr>
					<td>
						$cargo_item->id
					</td>
					<td class=\"cargo_name\">
						<a class=\"link\" href=\"../cargo.php?menu=cargo&id=$cargo_item->id\">$cargo_item->name</a>
					</td>
					<td>
						$cargo_item->amount
					</td>
                    <td>
						$cargo_item->mass
					</td>
                    <td>
						$cargo_item->volume
					</td>
					<td class=\"unload_to\">
						Duty control required
					</td>
					<td>
						<textarea name=\"remarks$i\" cols=\"35\" rows=\"3\" placeholder=\"Remarks will be ignored if 'Don't unload' is selected\"></textarea>
					</td>
				</tr>";
			}
			$i++;
		}
	}
	echo '</table>
			<br><input type="submit" class="button baseFont add" value="Unload">
		</form>';
?>