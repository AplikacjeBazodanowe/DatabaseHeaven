<!DOCTYPE html><html lang="pl"><head>	<meta charset="iso-8859-2">	<link rel="stylesheet" type="text/css" href="../../style.css">	<script src="../../js/edits.js"></script>	<script src="../../js/fade.js"></script>	<title>Ship docking</title></head><body>	<a href="../port.php"><input class="button baseFont add" type="button" value="Back"></a>	<br><br>	<?php		if( !( isset( $_GET['step'] ) && ( $_GET['step'] == 2 || $_GET['step'] == 3 ) && isset( $_GET['ship_name'] ) ) || isset( $_GET['done'] ) )			echo '<label><input type="checkbox" onClick="register_toggle()"><span class="baseFont">Register a new ship</span></label>';	?>	<div id="register" class="register">		<form action="?newShip=1" method=post">			<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px; width: 230px">			<legend><span class="baseFont">Register a ship:</span></legend>			<table border="0"><tr><td>			<span class="baseFont">Name: </span></td><td><input name="ship_name" type="text" class="edit baseFont" pattern="^[a-zA-Z0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Type: </span></td><td><input name="type" type="text" class="edit baseFont" pattern="^[a-zA-Z0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Capacity: </span></td><td><input name="capacity" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Displacement: </span></td><td><input name="displacement" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Length: </span></td><td><input name="length" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Width: </span></td><td><input name="width" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>			<span class="baseFont">Height: </span></td><td><input name="height" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr></table>			</fieldset>			<input class="button baseFont" type="submit" value="Register new ship">		</form>		</div>	<br><br>	<form action="?step=1" method="get">		<input name="action" type="hidden" value="search">		<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here" pattern="^[a-zA-Z0-9]+$" required>		<input class="button baseFont" type="submit" value="Search">	</form>		<?php		// jesli ukonczylo sie 3 etapy		if( isset( $_GET['done'] ) && isset( $_GET['dock_name'] ) ) {			$ship_name = $_GET['ship_name'];			$terminal_name = $GET['terminal_name'];			$dock_name = $GET['dock_name'];					}				$conditions = isset( $_GET['ship_name'] ) && $_GET['ship_name'] != '' &&					  isset( $_GET['type'] ) && $_GET['type'] != '' &&					  isset( $_GET['capacity'] ) && $_GET['capacity'] != '' &&					  isset( $_GET['displacement'] ) && $_GET['displacement'] != '' &&					  isset( $_GET['length'] ) && $_GET['length'] != '' &&					  isset( $_GET['width'] ) && $_GET['width'] != '' &&					  isset( $_GET['height'] ) && $_GET['height'] != '';				// zarejestruj nowy statek		if( $conditions ) { 					}						echo '<div style="float: left">';		// 1 etap		if( isset( $_GET['action'] ) ) {			// wyszukaj po nazwie			$ship_name = $_GET['ship_name'];						echo '<form method="get">';			echo '<input name="step" type="hidden" value="2">';			echo '<table border="0"><tr><td>';						echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';			echo '<legend><span class="baseFont">Choose a ship to dock:</span></legend>';						echo '<select name="ship_name" size="20" multiple>';			echo '<option>dupaaaaaaaaaaaaa';			echo '</select></fieldset>';									echo '</td><td style="text-align: center">';			if( isset( $_GET['step'] ) && isset( $_GET['ship_name'] ) ) {				// wyswietl co sie wybralo (nad przyciskiem next step)				echo '<span class="baseFont">' . $_GET['ship_name'] . '</span><br>';			}			echo '<input class="button baseFont" type="submit" value="Next step >>">';			echo '</td></tr></table>';			echo '</form>';		} else {			// wywietl all			echo '<form method="get">';			echo '<table border="0"><tr><td>';			echo '<input name="step" type="hidden" value="2">';						echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';			echo '<legend><span class="baseFont">Choose a ship to dock:</span></legend>';			echo '<select name="ship_name" size="20" multiple>';			echo '<option>dupaaaaaaaaaaaaa';			echo '</select></fieldset>';						echo '</td><td style="text-align: center">';			if( isset( $_GET['step'] ) && isset( $_GET['ship_name'] ) ) {				// wyswietl co sie wybralo (nad przyciskiem next step)				echo '<span class="baseFont">' . $_GET['ship_name'] . '</span><br>';			}			echo '<input class="button baseFont" type="submit" value="Next step >>">';			echo '</td></tr></table>';			echo '</form>';		}		echo '</div><div style="float: left">';				// 2 etap, wyswietl liste terminali, w ktorych sa wolne doki i ktore pasuja do statku		if( isset( $_GET['step'] ) && isset( $_GET['ship_name'] ) && !isset( $_GET['dock_name'] ) ) {			$ship_name = $_GET['ship_name'];					echo '<form method="get">';			echo '<table border="0"><tr><td>';			echo '<input name="step" type="hidden" value="3">';			echo '<input name="ship_name" type="hidden" value="' . $ship_name . '">';						echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';			echo '<legend><span class="baseFont">Terminals (with free docks):</span></legend>';							echo '<select name="terminal_name" size="20" multiple>';			echo '<option>terminal jakis';			echo '</select></fieldset>';						echo '</td><td style="text-align: center">';			if( isset( $_GET['step'] ) && isset( $_GET['terminal_name'] ) ) {				// wyswietl co sie wybralo (nad przyciskiem next step)				echo '<span class="baseFont">' . $_GET['terminal_name'] . '</span><br>';			}			echo '<input class="button baseFont" type="submit" value="Next step >>">';			echo '</td></tr></table>';			echo '</form>';		}		echo '</div><div style="float: left">';		// 3 etap, lista wolnych dokow		if( isset( $_GET['step'] ) && !isset( $_GET['dock_name'] ) && isset( $_GET['ship_name'] ) && isset( $_GET['terminal_name'] ) ) {					$terminal_name = $_GET['terminal_name'];			$ship_name = $_GET['ship_name'];					echo '<form method="get">';			echo '<table border="0"><tr><td>';			echo '<input name="ship_name" type="hidden" value="' . $ship_name . '">';			echo '<input name="terminal_name" type="hidden" value="' . $terminal_name . '">';			echo '<input name="step" type="hidden" value="3">';			echo '<input name="done" type="hidden" value="1">';						echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';			echo '<legend><span class="baseFont">Free docks:</span></legend>';							echo '<select name="dock_name" size="20" multiple>';			echo '<option>dok jakis';			echo '</select></fieldset>';						echo '</td><td style="text-align: center">';			echo '<input class="button baseFont" type="submit" value="Finish">';			echo '</td></tr></table>';			echo '</form>';		}		echo '</div>';	?></body></html>