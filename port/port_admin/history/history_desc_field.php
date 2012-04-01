<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/port_admin/ships/ships_db_funs.php");	
				if( isset( $_GET['id'] ) ) 
	{
		$docked_id = $_GET['id'];		
		$ship = get_history_ship_by_id($docked_id);		
		if($ship==NULL)
			return;
		$ship_id=$ship->id;		
		$cargo = get_ship_cargo($ship_id, true);		if( !isset( $_GET['action'] ) ) 
		{						 echo "<table class=\"stuff_info\">					<tr>						<td class=\"stuff_no\" colspan=\"2\">							Ship details						</td></tr><tr><td width=\"50%\">							Name						</td><td >							$ship->name						</td></tr><tr><td>							Type						</td><td>							$ship->type						</td></tr><tr><td>							Displacement						</td><td>							$ship->displacement						</td></tr><tr><td>							Capacity (Mass)						</td><td>							$ship->capMass						</td></tr><tr><td>							Capacity (Volume)						</td><td>							$ship->capVol						</td></tr><tr><td>							Length						</td><td>							$ship->length
						</td></tr><tr><td>							Width						</td><td>							$ship->width						</td></tr><tr><td>							Height						</td><td>							$ship->height
						</td></tr><tr><td>							Captain						</td><td>							$ship->captain
						</td></tr><tr><td>							Ship Owner						</td><td>							$ship->owner						</td></tr>
						<tr><td>							Date of production						</td><td>							$ship->production_date						</td></tr><tr><td>							Dock date						</td><td>							$ship->dock_date						
						</td></tr><tr><td>							Docked by						</td><td>
							$ship->docked_by						</td></tr><tr><td>							Undock date						</td><td>							$ship->undock_date						
						</td></tr><tr><td>							Undocked by						</td><td>
							$ship->undocked_by						</td>											</tr>					</table><br>";														echo '<br><h2>History of cargo:</h2>';				  									if($cargo==NULL)
				return;
			foreach($cargo as $cargo_item)			
			{								echo "<br><div style=\"text-align: center\">					  <table class=\"stuff_info\">					  <tr>						  <td class=\"stuff_no\" colspan=\"2\">							  Cargo ID: $cargo_item->id						  </td>					  </tr>
					  <tr>						  <td colspan=\"2\">							  $cargo_item->name						  </td>					  </tr>					  <tr>						  <td>							  Load date: $cargo_item->date						  </td>						  <td >							  Loaded by: $cargo_item->loaded_by						  </td>					  </tr>					  <tr>						  <td>							  Type: $cargo_item->type						  </td>						  <td>							  Amount: $cargo_item->amount						  </td>					  </tr>
					  <tr>						  <td>							  Mass: $cargo_item->mass						  </td>						  <td>							  Volume: $cargo_item->volume						  </td>					  </tr>
					  <tr>						  <td>							  Owner: $cargo_item->owner						  </td>						  <td>							  Value: $cargo_item->value						  </td>					  </tr>					  <tr>						  <td colspan=\"2\">							  Remarks: $cargo_item->remarks						  </td>					  </tr>					  </table></div>";
		  		}				  				} 			}
	else 
	{
		echo "<h1>History</h1>";
		echo "<p>This is the History menu.</p>";
		echo "<p>You can browse the history of docked ships using the list on the left. Select
				a ship to view its details and history of its cargo. To view currently docked ships
				use the \"Docked ships\" menu</p>";
	}?>