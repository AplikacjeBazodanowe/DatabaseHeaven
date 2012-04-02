<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/port_admin/ships/ships_db_funs.php");
	
	if( isset( $_GET['id'] )  ) 
	{
		 $ship_id = $_GET['id'];
		 $ship = get_docked_ship_by_id($ship_id);
		 if($ship==NULL)
			 return;			 
		 $cargo = get_ship_cargo($ship_id);					 echo "<table class=\"stuff_info\">				<tr>					<td class=\"stuff_no\" colspan=\"2\">						Ship details					</td></tr><tr><td width=\"50%\">						Name					</td><td >						$ship->name					</td></tr><tr><td>						Type					</td><td>						$ship->type					</td></tr><tr><td>						Displacement					</td><td>						$ship->displacement					</td></tr><tr><td>						Capacity (Mass)					</td><td>						$ship->capMass					</td></tr><tr><td>						Capacity (Volume)					</td><td>						$ship->capVol					</td></tr><tr><td>						Length					</td><td>						$ship->length
					</td></tr><tr><td>						Width					</td><td>						$ship->width					</td></tr><tr><td>						Height					</td><td>						$ship->height
					</td></tr><tr><td>						Captain					</td><td>						$ship->captain
					</td></tr><tr><td>						Date of production					</td><td>						$ship->production_date					</td></tr><tr><td>						Ship Owner					</td><td>						$ship->owner					</td></tr>
					<tr><td>						Dock date					</td><td>						$ship->dock_date
					</td></tr><tr><td>						Docked by					</td><td>						$ship->docked_by					</td>				</tr>				</table><br>";				echo '<a href="?menu=ships&action=undocking&id=' . $ship_id . '&docked_id='.$ship->docked_id.'"><input class="button baseFont add" type="button" value="Undock the ship"></a>';
		echo '<a href="ships/ships_dock.php?action=move&step=2&docked_id='.$ship->docked_id.
				'&ship_id='.$ship_id.'&ship_name=' . $ship->name . '">
				<input class="button baseFont add" type="button" value="Move the ship"></a>';							echo '<br><h2>Cargo on board:</h2>';				  													  			
				echo '<div style="text-align: center">';		echo '<a href="?menu=ships&id=' . $_GET['id'] . '&stuff=now"><input class="button baseFont add" type="submit" value="Show cargo on the ship"></a><br>';		echo '<br>';		echo '<form action="?menu=ships&id=' . $_GET['id'] . '&stuff=history" method="post">';		echo '&nbsp;<input type="submit" class="button baseFont add" value="Show cargo history"><br>';		echo 'Date:';		echo '<input name="from" style="width: 75px" class="baseFont" type="edit" placeholder="From">';		echo '&nbsp;<input name="to" style="width: 75px" class="baseFont" type="edit" placeholder="To">';		echo '</form>';		echo '</div>';			if($cargo==NULL)
			return;		foreach($cargo as $cargo_item)			
		{							echo "<br><div style=\"text-align: center\">				  <table class=\"stuff_info\">				  <tr>					  <td class=\"stuff_no\" colspan=\"2\">						  Cargo ID: $cargo_item->id					  </td>				  </tr>
				  <tr>					  <td colspan=\"2\">						  $cargo_item->name					  </td>				  </tr>				  <tr>					  <td>						  Load date: $cargo_item->date					  </td>					  <td >						  Loaded by: $cargo_item->loaded_by					  </td>				  </tr>				  <tr>					  <td>						  Type: $cargo_item->type					  </td>					  <td>						  Amount: $cargo_item->amount					  </td>				  </tr>
				  <tr>					  <td>						  Mass: $cargo_item->mass					  </td>					  <td>						  Volume: $cargo_item->volume					  </td>				  </tr>
				  <tr>					  <td>						  Owner: $cargo_item->owner					  </td>					  <td>						  Value: $cargo_item->value					  </td>				  </tr>				  <tr>					  <td colspan=\"2\">						  Remarks: $cargo_item->remarks					  </td>				  </tr>				  </table></div>";
	  		}				echo '<a href="ships/ships_cargo.php?action=register&id=' . $_GET['id'] . '"><input class="button baseFont add" type="submit" value="Register cargo"></a><br>';			echo '<a href="ships/ships_cargo.php?action=load&id=' . $_GET['id'] . '"><input class="button baseFont add" type="submit" value="Load ship"></a><br>';			echo '<a href="ships/ships_cargo.php?action=unload&id=' . $_GET['id'] . '"><input class="button baseFont add" type="submit" value="Unload ship"></a><br>';		}?>