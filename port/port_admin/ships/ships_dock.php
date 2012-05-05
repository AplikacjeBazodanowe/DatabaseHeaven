<?php
	session_start();

	include_once('ships_db_funs.php');
	DB::connect();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
	<meta charset="iso-8859-2">
	<link rel="stylesheet" type="text/css" href="../../style.css">
	<script src="../../js/edits.js"></script>
	<script src="../../js/fade.js"></script>
	<title>Ship docking</title>
</head>
<body>
	<a href="../port.php"><input class="button baseFont add" type="button" value="Back"></a>
	<br><br>
	<?php
		if( !( isset( $_GET['step'] ) && ( $_GET['step'] == 2 || $_GET['step'] == 3 ) && isset( $_GET['ship_id'] ) ) || isset( $_GET['done'] ) )
			echo '<label><input type="checkbox" onClick="register_toggle()"><span class="baseFont">Register a new ship</span></label>';
	?>
	<div id="register" class="register">
		<form action="#" method="post">						
			<fieldset  style="background-color: RGB( 240, 240, 240 ); border-radius: 10px; width: 280px">			
			<legend><span class="baseFont">Register a ship:</span></legend>
			<table border="0"><tr><td>
			<span class="baseFont">Name: </span></td><td><input name="ship_name" type="text" class="edit baseFont" pattern="^[a-zA-Z0-9 ]+$" required></td></tr><tr><td>
			<span class="baseFont">Type: </span></td><td>
				<select name="type" class="baseFont select">				
				<?php					
					$types=get_ship_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>
			</select></td></tr><tr><td>
			<span class="baseFont">Owner: </span></td><td>
				<select name="owner" class="baseFont select">				
				<?php					
					$owners=get_ship_owners();
					foreach($owners as $contractor)											
						echo "<option value=\"$contractor->id\">$contractor->name</option>";					
				?>
			</select></td></tr><tr><td>
			<span class="baseFont">Capacity (mass): </span></td><td><input name="cap_mass" type="text" class="edit baseFont" pattern="^[0-9]+.?[0-9]*$" required></td></tr><tr><td>
			<span class="baseFont">Capacity (volume): </span></td><td><input name="cap_vol" type="text" class="edit baseFont" pattern="^[0-9]+.?[0-9]*$" required></td></tr><tr><td>
			<span class="baseFont">Displacement: </span></td><td><input name="displacement" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>
			<span class="baseFont">Length: </span></td><td><input name="length" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>
			<span class="baseFont">Width: </span></td><td><input name="width" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>
			<span class="baseFont">Height: </span></td><td><input name="height" type="text" class="edit baseFont" pattern="^[0-9]+$" required></td></tr><tr><td>
			<span class="baseFont">Captain: </span></td><td><input name="captain" type="text" class="edit baseFont" pattern="^[a-zA-Z0-9 ]+$" required></td></tr><tr><td>
			<span class="baseFont">Production date: </span></td><td><input name="prod_date" type="text" class="edit baseFont" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" required></td></tr>
			</table>
			</fieldset>
			<input class="button baseFont" type="submit" value="Register new ship">
		</form>	
	</div>
	<br><br>
	<form action="?step=1" method="get">		
		<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here">
		<input class="button baseFont" type="submit" value="Search">
	</form>
	
	<?php					
		$conditions = isset( $_POST['ship_name'] ) && $_POST['ship_name'] != '' &&
					  isset( $_POST['type'] ) && $_POST['type'] != '' &&
					  isset( $_POST['owner'] ) && $_POST['owner'] != '' &&
					  isset( $_POST['captain'] ) && $_POST['captain'] != '' &&
					  isset( $_POST['prod_date'] ) && $_POST['prod_date'] != '' &&
					  isset( $_POST['cap_mass'] ) && $_POST['cap_mass'] != '' &&
					  isset( $_POST['cap_vol'] ) && $_POST['cap_vol'] != '' &&
					  isset( $_POST['displacement'] ) && $_POST['displacement'] != '' &&
					  isset( $_POST['length'] ) && $_POST['length'] != '' &&
					  isset( $_POST['width'] ) && $_POST['width'] != '' &&
					  isset( $_POST['height'] ) && $_POST['height'] != '';
		
		// zarejestruj nowy statek
		if( $conditions ) 
		{ 
			$name=$_POST['ship_name'];
			$displacement=$_POST['displacement'];
			$capMass=$_POST['cap_mass'];
			$capVol=$_POST['cap_vol'];
			$length=$_POST['length'];
			$width=$_POST['width'];
			$height=$_POST['height'];
			$captain=$_POST['captain'];
			$prodDate=$_POST['prod_date'];
			$ownerId=$_POST['owner'];
			$typeId=$_POST['type'];
			register_ship($name,$displacement,$capMass,$capVol,
								$length,$width,$height,$captain,$prodDate,$ownerId,$typeId);
		}		
		
		echo '<div style="float: left">';
		// 1 etap							
		echo '<form method="get">';
		echo '<input name="step" type="hidden" value="2">';
		if(isset($_GET['action']))
			echo '<input name="action" type="hidden" value="' . $_GET['action'] . '">';
		
		echo '<table border="0"><tr><td>';
		
		echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';
		echo '<legend><span class="baseFont">Choose a ship to dock:</span></legend>';			
		echo '<select name="ship_id" size="20" multiple>';
		if($_GET['action']!='move')
		{		
			if(isset($_GET['ship_name']))
				$ship_name = $_GET['ship_name'];
			else
				$ship_name = '';
			
			$ships = select_undocked_ships($ship_name);
			foreach($ships as $ship)
				echo "<option value=\"$ship->id\">$ship->name</option>";
		}
		else
		{
			$ship=get_ship_by_id($_GET['ship_id']);
			echo "<option>$ship->name</option>";
		}
		echo '</select></fieldset>';
		
		
		echo '</td><td style="text-align: center">';
		if( isset( $_GET['step'] ) && isset( $_GET['ship_id'] ) ) 
		{
			$ship_name=get_ship_by_id($_GET['ship_id'])->name;
			// wyswietl co sie wybralo (nad przyciskiem next step)
			echo '<span class="baseFont">' . $ship_name . '</span><br>';
		}
		echo '<input class="button baseFont" type="submit" value="Next step >>">';
		echo '</td></tr></table>';
		echo '</form>';
		
		echo '</div><div style="float: left">';
		
		// 2 etap, wyswietl liste terminali ktore pasuja do statku
		if( isset( $_GET['step'] ) && isset( $_GET['ship_id'] ) && !isset( $_GET['dock_id'] ) ) 
		{						
			$ship_id = $_GET['ship_id'];
			$typeId=get_ship_by_id($ship_id)->type;
			$terminals=select_terminals('',$typeId);
		
			echo '<form method="get">';
			echo '<table border="0"><tr><td>';
			echo '<input name="step" type="hidden" value="3">';
			echo '<input name="ship_id" type="hidden" value="' . $ship_id . '">';
			if(isset($_GET['docked_id']))
				echo '<input name="docked_id" type="hidden" value="' . $_GET['docked_id'] . '">';
			if(isset($_GET['action']))
				echo '<input name="action" type="hidden" value="' . $_GET['action'] . '">';
			
			echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';
			echo '<legend><span class="baseFont">Terminals (of matching type):</span></legend>';																					
			echo '<select name="terminal_id" size="20" multiple>';			
			foreach($terminals as $terminal)											
				echo "<option value=\"$terminal->id\">$terminal->name</option>";
			echo '</select></fieldset>';
			
			echo '</td><td style="text-align: center">';
			if( isset( $_GET['step'] ) && isset( $_GET['terminal_id'] ) ) 
			{
				$term_name=get_terminal_by_id($_GET['terminal_id'])->name;
				// wyswietl co sie wybralo (nad przyciskiem next step)
				echo '<span class="baseFont">' . $term_name . '</span><br>';
			}
			echo '<input class="button baseFont" type="submit" value="Next step >>">';
			echo '</td></tr></table>';
			echo '</form>';
		}
		echo '</div><div style="float: left">';
		// 3 etap, lista wolnych dokow
		if( isset( $_GET['step'] ) && !isset( $_GET['dock_id'] ) && isset( $_GET['ship_id'] ) && isset( $_GET['terminal_id'] ) ) 
		{		
			$terminal_id = $_GET['terminal_id'];
			$ship_id = $_GET['ship_id'];
			$docks=get_valid_docks($ship_id, $terminal_id);			
			
			echo '<form method="post" action="../port.php?menu=ships&action='.$_GET['action'].'">';
			echo '<table border="0"><tr><td>';
			echo '<input name="ship_id" type="hidden" value="' . $ship_id . '">';
			echo '<input name="terminal_id" type="hidden" value="' . $terminal_id . '">';
			if(isset($_GET['docked_id']))
				echo '<input name="docked_id" type="hidden" value="' . $_GET['docked_id'] . '">';			
			echo '<input name="step" type="hidden" value="3">';
			echo '<input name="done" type="hidden" value="1">';
			
			echo '<fieldset style="background-color: RGB( 240, 240, 240 ); border-radius: 10px">';
			echo '<legend><span class="baseFont">Valid docks:</span></legend>';				
			echo '<select name="dock_id" size="20" multiple>';
			foreach($docks as $dock)											
				echo "<option value=\"$dock->id\">Dok $dock->id</option>";
			echo '</select></fieldset>';
			
			echo '</td><td style="text-align: center">';
			echo '<input class="button baseFont" type="submit" value="Finish">';
			echo '</td></tr></table>';
			echo '</form>';
		}
		echo '</div>';
		DB::close();
	?>
</body>
</html>