<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/port_admin/ships/ships_db_funs.php");	
	DB::connect();	
		if( isset( $_POST['done'] ) ) 
	{		if( $_POST['done']  == 'register' ) 
		{			// zarejestruj wprowadzone towary $_POST['cargo0'], $_POST['amount0'], $_POST['cargo1'], $_POST['amount1'] itd.		}		if( $_POST['done']  == 'load' ) 
		{			// zaladuj wprowadzone towary $_POST['cargo0'], $_POST['amount0'], $_POST['cargo1'], $_POST['amount1'] itd.		}		if( $_POST['done']  == 'unload' ) 
		{			// wyladuj zaznaczone towary $_POST['to0'], $_POST['to1'] itd.		}	}?><!DOCTYPE html><html lang="pl">	<head>		<meta charset="iso-8859-2">		<link rel="stylesheet" type="text/css" href="../../style.css">		<script src="../../js/edits.js"></script>		<script src="../../js/fade.js"></script>		<script src="../../js/cargo_form.js"></script>		<script src="../../js/unload.js"></script><?php	include( '../js.php' );?>		<title>Cargo manager</title>	</head>	<body class="baseFont">		<?php			if( !isset( $_GET['id'] ) ) 
			{
				$ships=select_docked_ships();				echo '<form method="get">';				echo 'Select a ship:<select name="id">';				foreach($ships as $ship)
					echo "<option value=\"$ship->id\">$ship->name</option>";				echo '</select>';				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the ship">';				echo '</form>';			} 
			else 			
			{
				$ship=get_docked_ship_by_id($_GET['id']);
				$cargo=get_ship_cargo($_GET['id']);				echo '<div class="menu grad grayBorders">';				echo '<a href="../cargo.php?menu=ships"><input class="button baseFont menu_button" type="button" value="Back"></a>';				echo '&nbsp;<a href="?"><input class="button baseFont menu_button" type="button" value="Choose a ship"></a>';				echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';				echo '&nbsp;<a href="?action=register&id=' . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Register cargo"></a>';				echo '&nbsp;<a href="?action=load&id='     . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Load cargo"></a>';				echo '&nbsp;<a href="?action=unload&id='   . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Unload cargo"></a>';								echo '</div>';				if( isset( $_GET['action'] ) ) 
				{					if( $_GET['action'] == 'register' ) 
					{						include( "ships_cargo_register.php" );					} 
					elseif( $_GET['action'] == 'load' ) {						include( "ships_cargo_load.php" );					} 
					elseif( $_GET['action'] == 'unload' ) {						include( 'ships_cargo_unload.php' );					}				}			}
			DB::close();		?>	</body></html>