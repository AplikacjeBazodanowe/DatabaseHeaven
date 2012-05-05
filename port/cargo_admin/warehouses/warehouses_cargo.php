<?php
	session_start();
	
	include_once('../loading_db_funs.php');	
	DB::connect();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user_type']) || $_SESSION['user_type']!='cargo_admin')
    {
    ?>
        <!DOCTYPE html>
        <html lang="pl">
            <head>
                <meta charset="iso-8859-2">
                <link rel="stylesheet" type="text/css" href="../style.css">		
                <title>Not authorized</title>
            </head>
            <body class="baseFont">		
                <div id="main">
                    <h1>Not authorized</h1>
                    <p>You are not authorized to view contents of this page!</p>
                </div>
            </body>
        </html>
    <?php 
        die();
    }
	if( isset( $_GET['done'] ) ) 
	{		
		if( $_GET['done']  == 'load' && isset($_GET['from'])) 
		{
			if($_GET['from']=='ship' && isset($_GET['id']))
			{
				$i=0;				
				$warehouse=$_GET['id'];				
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["remarks$i"]))
                    { 
                        $cargo=$_POST["cargo$i"];
                        if($cargo=='empty slot')
                        {
                            $i++;
                            continue;
                        }
                        $remarks=$_POST["remarks$i"];
                        $error=move_cargo_to_warehouse($cargo, $warehouse, $remarks);
                        $i++;					 
                    }
					else 
						break;				
			}
			elseif($_GET['from']=='warehouse' && isset($_GET['id']))
			{
				$i=0;				
				$warehouse=$_GET['id'];				
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["remarks$i"]))
                    { 
                        $cargo=$_POST["cargo$i"];
                        if($cargo=='empty slot')
                        {
                            $i++;
                            continue;
                        }
                        $remarks=$_POST["remarks$i"];
                        $error=move_cargo_to_warehouse($cargo, $warehouse, $remarks);
                        $i++;					 
                    }
					else 
						break;
			}
			elseif($_GET['from']=='outside' && isset($_GET['contractor_id']) && isset($_GET['id']))
			{
				$i=0;
				$contractor=$_GET['contractor_id'];
				$warehouse=$_GET['id'];
				while(true) 
					if(isset($_POST["cargo$i"]) && isset($_POST["amount$i"]) && isset($_POST["remarks$i"]))
                    { 
                        $commodity=$_POST["cargo$i"];
                        if($commodity=='empty slot')
                        {
                            $i++;
                            continue;
                        }
                        $amount=$_POST["amount$i"];
                        $remarks=$_POST["remarks$i"];
                        $error=register_cargo_warehouse($commodity, $amount, $contractor, $warehouse, $remarks);
                        $i++;					 
                    }
					else 
						break;
			}
		}
		elseif( $_GET['done']  == 'unload' ) 
		{
			$i=0;			
			while(true) 
			{
				if(isset($_POST["cargo$i"]) && isset($_POST["to_ship$i"]) && isset($_POST["remarks$i"]))
                { 
                    $cargo=$_POST["cargo$i"];                    
                    $to_ship=$_POST["to_ship$i"];
                    if($cargo=='empty slot' || $to_ship=="Don't unload")
                    {
                        $i++;
                        continue;
                    }
                    $remarks=$_POST["remarks$i"];						                        
                    $error=move_cargo_to_ship($cargo, $to_ship, $remarks);                    	 
                }
				elseif(isset($_POST["cargo$i"]) && isset($_POST["to_warehouse$i"]) && isset($_POST["remarks$i"]))
					{ 												
						$cargo=$_POST["cargo$i"];						                        
                        $to_warehouse=$_POST["to_warehouse$i"];						
                        if($cargo=='empty slot' || $to_warehouse=="Don't unload")
                        {
                            $i++;
                            continue;
                        }
						$remarks=$_POST["remarks$i"];						                        
                        $error=move_cargo_to_warehouse($cargo, $to_warehouse, $remarks);
					}
				elseif(isset($_POST["cargo$i"]) && isset($_POST["to_contractor$i"]) && isset($_POST["remarks$i"]))
					{ 
						$cargo=$_POST["cargo$i"];                        
						$contractor=$_POST["to_contractor$i"];
                        if($cargo=='empty slot' || $contractor=="Don't unload")
                        {
                            $i++;
                            continue;
                        }
						$remarks=$_POST["remarks$i"];
						$error=deliver_cargo($cargo, $contractor, $remarks);                        
					}
				elseif(!isset($_POST["ignore$i"])) 
					break;
				$i++;
			}
		}
	}	
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
	include( 'js.php' );
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
                if(isset($error) && $error!=NULL )
					echo "<table class=\"error\" border=\"0\"><tr><td class=\"error_title\">Error</td></tr><tr><td><p class=\"error_msg\">$error</p></td></tr></table>";
                echo "<h1>You are currently managing the $warehouse->name warehouse</h1>";                                
                echo "<h2>Cargo volume: $warehouse->curVol / $warehouse->capacity </h2>";
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
                 
			}
            DB::close();
		?>
	</body>
</html>