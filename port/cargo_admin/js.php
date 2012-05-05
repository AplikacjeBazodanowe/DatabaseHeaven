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
			
			echo '						if( arg == 0 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 4;			else if( arg == 1 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 3;			else if( arg == 2 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 2;			var emptyFields = 0;						for( i = 0; i < cargoNumber; ++i ) {				var cargoID = document.getElementsByName( "cargo" + i )[0].value				var cargo  = document.getElementsByName( "cargo" + i )[0].options[document.getElementsByName( "cargo" + i )[0].selectedIndex].text;								var amount = "";				if( arg != 2 )					amount = document.getElementsByName( "amount" + i )[0].value;				var box = "";				var boxlabel = "";				if( arg == 0 ) {					box = document.getElementsByName( "duty" + i )[0].checked;					if( box == true )						boxlabel = "<label><input name=\"duty" + i + "\" type=\"checkbox\" checked>Duty control required</label>";					else						boxlabel = "<label><input name=\"duty" + i + "\" type=\"checkbox\">Duty control required</label>";				}				var remarks = document.getElementsByName( "remarks" + i )[0].value;				if( cargo == "empty slot" ) {					++emptyFields;				}								if( arg == 0 ) {					current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 0 )\">" +													"<option value=\"" + cargo + "\" selected>" + cargo +
													"<option value=\"empty slot\">empty slot" +
													fields + 													"</select><input name=\"amount" + i + "\" value=\"" + amount + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +													boxlabel + "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"								} else if( arg == 1 ) {					  current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 1 )\">" +													"<option value=\"" + cargo + "\" selected>" + cargo +
													"<option value=\"empty slot\">empty slot" +
													fields + 													"</select><input name=\"amount" + i + "\" value=\"" + amount + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +													"<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"				} else if( arg == 2 ) {					  current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 2 )\">" +													"<option value=\"" + cargo + "\" selected>" + cargo +
													"<option value=\"empty slot\">empty slot" +
													fields + 													"</select>" +													"<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"									}			}			if( arg == 0 ) {				var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 0 )\">" +															 "<option value=\"empty slot\">empty slot" +
															  fields + 															  "</select><input name=\"amount" + cargoNumber + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +															  "<label><input name=\"duty" + i + "\" type=\"checkbox\">Duty control required</label><br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Register\">"			} else if( arg == 1 ) {				 var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 1 )\">" +															 "<option value=\"empty slot\">empty slot" +
															  fields + 															  "</select><input name=\"amount" + cargoNumber + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +															  "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Load\">"			} else if( arg == 2 ) {				 var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 2 )\">" +															 "<option value=\"empty slot\">empty slot" +
															  fields + 															  "</select>" +															  "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Load\">"			}						if( emptyFields < 1 ) {				document.getElementById( "cargo_form" ).innerHTML = current + newField;			}		}		</script>	';	}?>
