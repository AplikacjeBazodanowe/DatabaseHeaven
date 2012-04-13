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
		if( $_GET['done']  == 'register' && isset($_GET['contractor_id']) && isset($_GET['id'])) 
		{
			$i=0;            
			$contractor=$_GET['contractor_id'];
			$ship=$_GET['id'];
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
						if(isset($_POST["duty$i"])) 
                            $duty=1;
                        else
                            $duty=0;
                        $error=register_cargo_ship($commodity, $amount, $contractor, $ship, $duty, $remarks);
						$i++; 
					}
				else 
					break;				
		}
		elseif( $_GET['done']  == 'load' && isset($_GET['from'])) 
		{
			if($_GET['from']=='ship' && isset($_GET['id']))
			{
				$i=0;				
				$ship=$_GET['id'];				
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
                            $error=move_cargo_to_ship($cargo, $ship, $remarks);
							$i++;					 
						}
					else 
						break;				
			}
			elseif($_GET['from']=='warehouse' && isset($_GET['id']))
			{
				$i=0;				
				$ship=$_GET['id'];				
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
                            $error=move_cargo_to_ship($cargo, $ship, $remarks);
							$i++;					 
						}
					else 
						break;
			}
			elseif($_GET['from']=='outside' && isset($_GET['contractor_id']) && isset($_GET['id']))
			{
				$i=0;
				$contractor=$_GET['contractor_id'];
				$ship=$_GET['id'];
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
							$error=register_cargo_ship($commodity, $amount, $contractor, $ship, 0, $remarks);
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
                        $warehouse=$_POST["to_warehouse$i"];						
                        if($cargo=='empty slot' || $warehouse=="Don't unload")
                        {
                            $i++;
                            continue;
                        }
						$remarks=$_POST["remarks$i"];						                        
                        $error=move_cargo_to_warehouse($cargo, $warehouse, $remarks);
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
	include_once( 'js.php' );
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
            if(isset($error) && $error!=NULL )
                echo "<table class=\"error\" border=\"0\"><tr><td class=\"error_title\">Error</td></tr><tr><td><p class=\"error_msg\">$error</p></td></tr></table>";
            echo "<h1>You are currently managing the $ship->name ship</h1>";
            echo "<h2>Cargo mass: $ship->curMass / $ship->capMass</h2>";
            echo "<h2>Cargo volume: $ship->curVol / $ship->capVol </h2>";            
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
        }
        DB::close();
		?>
	</body>
</html>