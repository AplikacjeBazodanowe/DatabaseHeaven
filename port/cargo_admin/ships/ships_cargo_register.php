<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/port_admin/ships/ships_db_funs.php");
	include_once($root."/cargo_admin/contractors/contractors_db_funs.php");

	echo "<span class=\"baseFont\"><h1>List of cargo on the $ship->name ship:</h1></span>
	<table class=\"stuff_info_wider\" style=\"text-align: center\">
	<tr>
		<td class=\"stuff_no\">
			Cargo ID
		</td>
		<td class=\"stuff_no\">
			Cargo name
		</td>
		<td class=\"stuff_no\">
			Amount
		</td>
		<td style=\"width: 150px\" class=\"stuff_no\">
			Duty control requirement
		</td>			
	</tr>";
	if($cargo!=NULL)
		foreach($cargo as $cargo_item)
		{					 
			echo	"<tr>
					<td class=\"cargo_name\">
						$cargo_item->id
					</td>
					<td>
						$cargo_item->name
					</td>
					<td>
						$cargo_item->amount
					</td>
					<td>";
						if( $cargo_item->control_required )
							echo "Required";
						else
							echo "Not required";
			echo	"</td>					
				</tr>";				
		}
	echo "</table>";

	if( isset( $_GET['contractor_id'] ) ) 
	{
		echo '<span class="baseFont"><h1>Register cargo on the [ship_name] ship:</h1></span>';
		echo '<form id="cargo_form" action="?action=register&done=register&id=' . $_GET['id'] . '&contractor_id=' . $_GET['contractor_id'] . '" method="post">';
		echo '<br>No. 0: <select name="cargo0" onChange="addCargoCombo( 0 )">';
		echo '<option>empty slot</option>';
		$commodities=get_commodities($ship->type_id);
		foreach($commodities as $commodity)
			echo "<option value=\"$commodity->id\">$commodity->name</option>";								
			  echo '</select>
			  <input name="amount0" type="text" placeholder="Amount" pattern="^[0-9]+$">
			  <label><input type="checkbox" name="duty0">Duty control required</label><br>
			  <textarea style="margin-left: 40px" name="remarks0" cols="37" rows="3" placeholder="Remarks"></textarea><br>';
		echo '<br><br><input type="submit" class="button baseFont add" value="Register">';
		echo '</form>';
	} 
	else 
	{
		$contractors = select_contractors();
		echo '<br><form id="cargo_form" method="get">';
		echo '<input type="hidden" name="action" value="register">';
		echo '<input type="hidden" name="id" value="' . $_GET['id'] . '">';
		echo '<br>Choose a contrator from the list below:<br><br>';
		echo '<select name="contractor_id">';
		foreach($contractors as $contractor)		
			echo "<option value=\"$contractor->id\">$contractor->name</option>";
		echo '</select>';
		echo '<br><br><input type="submit" class="button baseFont add" value="Choose the contractor">';
	}
?>
