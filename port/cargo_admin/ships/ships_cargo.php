<?php		
	include_once('../loading_db_funs.php');	
	DB::connect();	
	
	if( isset( $_GET['done'] ) ) 
	{		
		if( $_GET['done']  == 'register' ) 
		{
			$i=0;
			$contractor_id=$_GET['contractor_id'];
			$ship_id=$_GET['id'];
			while(true) 
				if(isset($_POST["cargo$i"]) && isset($_POST["amount$i"]) && isset($_POST["remarks$i"]))
					{
						if(isset($_POST["duty$i"])) 
						echo("wywołaj procedurę Pawła - nadanie ładunku");
						$i++; 
					}
				else 
					break;				
		}
		elseif( $_GET['done']  == 'load' && isset($_GET['from'])) 
		{
			if($_GET['from']=='ship' && isset($_GET['ship_id']))
			{
				$i=0;				
				$ship_id_to=$_GET['id'];
				$ship_id_from=$_GET['ship_id'];
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["remarks$i"]))
						{ 
							echo("wywołaj procedurę Pawła - przeładunek statek->statek");
							$i++;					 
						}
					else 
						break;				
			}
			elseif($_GET['from']=='warehouse' && isset($_GET['warehouse_id']))
			{
				$i=0;
				$contractor_id=$_GET['contractor_id'];
				$ship_id=$_GET['id'];
				$warehouse_id=$_GET['warehouse_id'];
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["remarks$i"]))
						{ 
							echo("wywołaj procedurę Pawła - przeładunek magazyn->statek");
							$i++;					 
						}
					else 
						break;
			}
			elseif($_GET['from']=='outside' && isset($_GET['contractor_id']))
			{
				$i=0;
				$contractor_id=$_GET['contractor_id'];
				$ship_id=$_GET['id'];
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["amount$i"]) && isset($_POST["remarks$i"]))
						{ 
							echo("wywołaj procedurę Pawła - nadanie ładunku");
							$i++;					 
						}
					else 
						break;
			}
		}
		elseif( $_GET['done']  == 'unload' ) 
		{
			$i=0;
			$ship_id=$_GET['id'];
			while(true) 
			{
				if(isset($_POST["cargo$i"]) && isset($_POST["to_ship$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo_id=$_POST["cargo$i"];
						$to_ship_id=$_POST["to_ship$i"];
						$remarks=$_POST["remarks$i"];
						echo("wywołaj procedurę Pawła - przeładunek statek->statek");							
					}
				elseif(isset($_POST["cargo$i"]) && isset($_POST["to_warehouse$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo_id=$_POST["cargo$i"];
						$warehouse_id=$_POST["to_warehouse$i"];
						$remarks=$_POST["remarks$i"];
						echo("wywołaj procedurę Pawła - przeładunek statek->mag");							
					}
				elseif(isset($_POST["cargo$i"]) && isset($_POST["to_contractor$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo_id=$_POST["cargo$i"];
						$contractor_id=$_POST["to_contractor$i"];
						$remarks=$_POST["remarks$i"];
						echo("wywołaj procedurę Pawła - odbiór ładunku");														 
					}
				elseif(!isset($_POST["ignore$i"])) 
					break;
				$i++;
			}
		}
	}
	print_r($_POST);
?>
<!DOCTYPE html>
<html lang="pl">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../../style.css">
		<script src="../../js/edits.js"></script>
		<script src="../../js/fade.js"></script>
		<script src="../../js/cargo_form.js"></script>
		<script src="../../js/unload.js"></script>
<?php
	include( '../js.php' );
?>
		<title>Cargo manager</title>
	</head>
	<body class="baseFont">
    <?php
        if( !isset( $_GET['id'] ) ) 
        {
            $ships=select_docked_ships();
            echo '<form method="get">';
            echo 'Select a ship:<select name="id">';
            foreach($ships as $ship)
                echo "<option value=\"$ship->id\">$ship->name</option>";
            echo '</select>';
            echo '<br><br><input type="submit" class="button baseFont add" value="Choose the ship">';
            echo '</form>';
        } 
        else 			
        {
            $ship=get_docked_ship_by_id($_GET['id']);
            $cargo=get_ship_cargo($_GET['id']);
            echo '<div class="menu grad grayBorders">';
            echo '<a href="../cargo.php?menu=ships"><input class="button baseFont menu_button" type="button" value="Back"></a>';
            echo '&nbsp;<a href="?"><input class="button baseFont menu_button" type="button" value="Choose a ship"></a>';
            echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            echo '&nbsp;<a href="?action=register&id=' . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Register cargo"></a>';
            echo '&nbsp;<a href="?action=load&id='     . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Load cargo"></a>';
            echo '&nbsp;<a href="?action=unload&id='   . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Unload cargo"></a>';				
            echo '</div>';
            if( isset( $_GET['action'] ) ) 
            {
                if( $_GET['action'] == 'register' ) 
                {
                    include( "ships_cargo_register.php" );
                } 
                elseif( $_GET['action'] == 'load' ) {
                    include( "ships_cargo_load.php" );
                } 
                elseif( $_GET['action'] == 'unload' ) {
                    include( 'ships_cargo_unload.php' );
                }
            }
            else
                echo "<h1>You are currently managing the $ship->name ship</h1>";
        }
        DB::close();
		?>
	</body>
</html>