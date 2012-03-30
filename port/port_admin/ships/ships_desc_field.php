<?php
	include_once('ships_db_funs.php');		if( isset( $_GET['id'] ) ) 
	{
		$ship_id = $_GET['id'];
		$ship = get_docked_ship_by_id($ship_id);
		if($ship==NULL)
			return;
		$owner = get_ship_owner($ship_id);
		$cargo = get_ship_cargo($ship_id);		if( !isset( $_GET['action'] ) ) 
		{						 echo "<table class=\"stuff_info\">					<tr>						<td class=\"stuff_no\" colspan=\"2\">							Ship details						</td></tr><tr><td width=\"50%\">							Name						</td><td >							$ship->name						</td></tr><tr><td>							Type						</td><td>							$ship->type						</td></tr><tr><td>							Displacement						</td><td>							$ship->displacement						</td></tr><tr><td>							Capacity (Mass)						</td><td>							$ship->capMass						</td></tr><tr><td>							Capacity (Volume)						</td><td>							$ship->capVol						</td></tr><tr><td>							Length						</td><td>							$ship->length
						</td></tr><tr><td>							Width						</td><td>							$ship->width						</td></tr><tr><td>							Height						</td><td>							$ship->height
						</td></tr><tr><td>							Captain						</td><td>							$ship->captain
						</td></tr><tr><td>							Date of production						</td><td>							$ship->production_date						</td></tr><tr><td>							Dock date						</td><td>							$ship->dock_date
						</td></tr><tr><td>							Docked by						</td><td>							$ship->docked_by						</td>					</tr>					</table><br>";						echo '<a href="?menu=ships&action=undocking&id=' . $ship_id . '"><input class="button baseFont add" type="button" value="Undock the ship"></a>';
			echo '<a href="ships/ships_dock.php?action=search&step=2&ship_name=' . $ship->name . '"><input class="button baseFont add" type="button" value="Move the ship"></a>';								echo '<br><h2>Cargo on board:</h2>';				  									if($cargo==NULL)
				return;
			foreach($cargo as $cargo_item)			
			{								echo "<br><div style=\"text-align: center\">					  <table class=\"stuff_info\">					  <tr>						  <td class=\"stuff_no\" colspan=\"2\">							  Cargo ID: $cargo_item->id						  </td>					  </tr>
					  <tr>						  <td colspan=\"2\">							  $cargo_item->name						  </td>					  </tr>					  <tr>						  <td>							  Load date: $cargo_item->date						  </td>						  <td >							  Loaded by: $cargo_item->loaded_by						  </td>					  </tr>					  <tr>						  <td>							  Type: $cargo_item->type						  </td>						  <td>							  Amount: $cargo_item->amount						  </td>					  </tr>
					  <tr>						  <td>							  Mass: $cargo_item->mass						  </td>						  <td>							  Volume: $cargo_item->volume						  </td>					  </tr>
					  <tr>						  <td>							  Owner: $cargo_item->owner						  </td>						  <td>							  Value: $cargo_item->value						  </td>					  </tr>					  <tr>						  <td colspan=\"2\">							  Remarks: $cargo_item->remarks						  </td>					  </tr>					  </table></div>";
		  		}				  		// potwierdzenie wydokowania		} 
		elseif( $_GET['action'] == 'undocking' ) 
		{			$startTimeStr = "2012-9-1";			$endTimeStr = "2012-9-3";			$startTime = strtotime( $startTimeStr );			$endTime = strtotime( $endTimeStr ).'days';			$days = round( ( abs( $startTime - $endTime ) ) / 86400 );						echo '<table class="stuff_info">				  <tr>					<td class="stuff_no" colspan="2">						Undocking the [ship_name] ship from [dock_name] dock					</td>				  </tr>				  					<td>						Dock date					</td>					<td>';						echo $startTimeStr; // czyli chyba ta dataNaliczenia za tabeli oplaty			echo '	</td>				  </tr>				  <tr>					<td>						Current date					</td>					<td>';						echo $endTimeStr;			echo '	</td>				  </tr>				  </table><br>';				  				  echo '<h2>Are you sure you want to undock this ship?<br></h2>';				 			  					$id = $_GET['id'];					echo '<a href="?menu=ships&action=undocked&id=' . $id . '"><input class="button baseFont add" type="button" value="Continue undocking"></a><br>';					echo '<a href="?menu=ships&id=' . $id . '"><input class="button baseFont add" type="button" value="Cancel"></a>';				  		} 
		elseif( $_GET['action'] == 'undocked' ) 
		{			echo 'The ship\'s been undocked.';		}	}
	else 
	{
		echo "<h1>Ships</h1>";
		echo "<p>This is the Ships menu.</p>";
		echo "<p>You can browse currently docked ships using the list on the left. Select
				a ship to view its details or to undock it. You can also dock a new ship with
				the \"Dock Ship\" button. To view history of docked ships enter the \"History\" menu</p>";
	}?>