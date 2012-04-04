<?php
	include_once('../loading_db_funs.php');	
	DB::connect();

	if( isset( $_GET['done'] ) ) 
	{		
		if( $_GET['done']  == 'load' && isset($_GET['from'])) 
		{
			if($_GET['from']=='ship' && isset($_GET['ship_id']))
			{
				$i=0;				
				$warehouse_id=$_GET['id'];
				$ship_id=$_GET['ship_id'];
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
				$to_warehouse_id=$_GET['id'];
				$from_warehouse_id=$_GET['warehouse_id'];
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
				$warehouse_id=$_GET['id'];
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
			$warehouse_id=$_GET['id'];
			while(true) 
			{
				if(isset($_POST["cargo$i"]) && isset($_POST["to_ship$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo_id=$_POST["cargo$i"];
						$ship_id=$_POST["to_ship$i"];
						$remarks=$_POST["remarks$i"];
						echo("wywołaj procedurę Pawła - przeładunek magazyn->statek");
					}
				elseif(isset($_POST["cargo$i"]) && isset($_POST["to_warehouse$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo_id=$_POST["cargo$i"];
						$to_warehouse_id=$_POST["to_warehouse$i"];
						$remarks=$_POST["remarks$i"];
						echo("wywołaj procedurę Pawła - przeładunek mag->mag");
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
	include( '../js1.php' );
?>
		<title>Cargo manager</title>
	</head>
	<body class="baseFont">
		<?php
			if( !isset( $_GET['id'] ) ) 
			{
                $warehouses=select_warehouses('','');                
				echo '<form method="get">';
				echo 'Select a warehouse:<select name="id">';
                if($warehouses!=NULL)
                    foreach ($warehouses as $warehouse) 
                        echo "<option value=\"$warehouse->id\">$warehouse->name</option>";
				echo '</select>';
				echo '<br><br><input type="submit" class="button baseFont add" value="Choose the warehouse">';
				echo '</form>';
			} 
			else 
			{
                $warehouse=get_warehouse_by_id($_GET['id']);
                $cargo=get_warehouse_cargo($_GET['id']);
				echo '<div class="menu grad grayBorders">';
				echo '<a href="../cargo.php?menu=warehouses"><input class="button baseFont menu_button" type="button" value="Back"></a>';
				echo '&nbsp;<a href="?"><input class="button baseFont add" type="button" value="Choose a warehouse"></a>';
				echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				echo '&nbsp;<a href="?action=load&id='     . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Load cargo"></a>';
				echo '&nbsp;<a href="?action=unload&id='   . $_GET['id'] . '"><input class="button baseFont menu_button" type="button" value="Unload cargo"></a>';
				echo '</div>';
				if( isset( $_GET['action'] ) ) 
				{
					if( $_GET['action'] == 'load' ) 
					{
						include( "warehouses_cargo_load.php" );
					} 
					elseif( $_GET['action'] == 'unload' ) 
					{
						include( 'warehouses_cargo_unload.php' );
					}
				}
                else
                    echo "<h1>You are currently managing the $warehouse->name warehouse</h1>";
			}
            DB::close();
		?>
	</body>
</html>