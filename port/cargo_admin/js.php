<?php	// ten skrypt jest dla ladowania z magazynu na statek, ze statku na statek i z magazynu do magazynu	if( isset( $_GET['from'] ) || isset( $_GET['action'] ) ) {		echo '<script>		function addCargoCombo( arg ) {			var current = "";';									// tu w fields wypisz towary z magazynu/innego statku			if( $_GET['from'] == 'warehouse' ) {				echo 'var fields = "<option value=\"0\">towary z magazynu</option>";';			} else {				echo 'var fields = "<option value=\"0\">towary z innego statku</option>";';			}			echo '						if( arg == 0 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 4;			else if( arg == 1 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 3;			else if( arg == 2 )				var cargoNumber = ( document.getElementById( "cargo_form" ).elements.length - 1 ) / 2;			var emptyFields = 0;						for( i = 0; i < cargoNumber; ++i ) {				var cargoID = document.getElementsByName( "cargo" + i )[0].value				var cargo  = document.getElementsByName( "cargo" + i )[0].options[document.getElementsByName( "cargo" + i )[0].selectedIndex].text;								var amount = "";				if( arg != 2 )					amount = document.getElementsByName( "amount" + i )[0].value;				var box = "";				var boxlabel = "";				if( arg == 0 ) {					box = document.getElementsByName( "duty" + i )[0].checked;					if( box == true )						boxlabel = "<label><input name=\"duty" + i + "\" type=\"checkbox\" checked>Duty control required</label>";					else						boxlabel = "<label><input name=\"duty" + i + "\" type=\"checkbox\">Duty control required</label>";				}				var remarks = document.getElementsByName( "remarks" + i )[0].value;				if( cargo == "empty slot" ) {					++emptyFields;				}								if( arg == 0 ) {					current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 0 )\">" +													"<option value=\"" + cargoID + "\" selected>" + cargo + "</option>" +													"<option value=\"empty slot\">empty slot" + "</option>" +													fields + 													"</select><input name=\"amount" + i + "\" value=\"" + amount + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +													boxlabel + "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"								} else if( arg == 1 ) {					  current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 1 )\">" +													"<option value=\"" + cargoID + "\" selected>" + cargo + "</option>" +													"<option value=\"empty slot\">empty slot" + "</option>" +													fields + 													"</select><input name=\"amount" + i + "\" value=\"" + amount + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +													"<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"				} else if( arg == 2 ) {					  current += "<br>No. " + i + ": <select name=\"cargo" + i + "\" onChange=\"addCargoCombo( 2 )\">" +													"<option value=\"" + cargoID + "\" selected>" + cargo + "</option>" +													"<option value=\"empty slot\">empty slot" + "</option>" +													fields + 													"</select>" +													"<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\">" + remarks + "</textarea><br>"									}			}			if( arg == 0 ) {				var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 0 )\">" +															 "<option value=\"empty slot\">empty slot" + "</option>" +															  fields + 															  "</select><input name=\"amount" + cargoNumber + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +															  "<label><input name=\"duty" + i + "\" type=\"checkbox\">Duty control required</label><br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Register\">"			} else if( arg == 1 ) {				 var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 1 )\">" +															 "<option value=\"empty slot\">empty slot" + "</option>" +															  fields + 															  "</select><input name=\"amount" + cargoNumber + "\" type=\"text\" placeholder=\"Amount\" pattern=\"^[0-9]+$\">" +															  "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Load\">"			} else if( arg == 2 ) {				 var newField = "<br>No. " + cargoNumber + ": <select name=\"cargo" + cargoNumber + "\" onChange=\"addCargoCombo( 2 )\">" +															 "<option value=\"empty slot\">empty slot" + "</option>" +															  fields + 															  "</select>" +															  "<br><textarea style=\"margin-left: 40px\" name=\"remarks" + i + "\" cols=\"35\" rows=\"3\" placeholder=\"Remarks\"></textarea><br>" +															  "<br><br><input type=\"submit\" class=\"button baseFont add\" value=\"Load\">"			}						if( emptyFields < 1 ) {				document.getElementById( "cargo_form" ).innerHTML = current + newField;			}		}		</script>	';	}?>