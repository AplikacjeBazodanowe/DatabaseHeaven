<?php
	include_once('cargo_db_funs.php');
		if( isset( $_GET['id'] ) ) 
	{		$cargo = get_cargo_by_id($_GET['id']);
		$history = get_cargo_history($_GET['id']);
		if($cargo==NULL)
			return;
		echo "<table class=\"stuff_info\">		<tr>			<td class=\"stuff_no\" colspan=\"2\">				Cargo ID: $cargo->id			</td></tr><tr><td width=\"50%\">				Commodity			</td><td>				$cargo->commodity			</td></tr><tr><td>				Cargo Type			</td><td>				$cargo->type			</td></tr><tr><td>				Amount			</td><td>				$cargo->amount			</td></tr><tr><td>				Mass			</td><td>				$cargo->mass			</td></tr><tr><td>				Volume			</td><td>				$cargo->volume			</td></tr><tr><td>				Value			</td><td>				$cargo->value			</td></tr><tr><td>				Original Owner			</td><td>				$cargo->sender			</td></tr><tr><td>				Receiver			</td><td>				$cargo->receiver			</td></tr><tr><td colspan=\"2\">				Remarks: <br/>
				$cargo->remarks			</td>		</tr>		</table><br>			<hr><br>";
				echo '<div style="text-align: center">';		if( !isset( $_GET['history'] ) ) 				echo '<a href="?menu=cargo&id=' . $_GET['id'] . '&history="><input class="button baseFont add" type="button" value="Show history"></a><br><br>';	
		else 				echo '<a href="?menu=cargo&id=' . $_GET['id'] . '"><input class="button baseFont add" type="button" value="Hide history"></a><br><br>';		echo '</div>';		
		if($history==NULL || !isset( $_GET['history']))
			return;
		echo "<table class=\"stuff_info\">";
		foreach($history as $historyItem)
		{			
			if($historyItem->fromWarehouse!=NULL)
				$from="Warehouse: ".$historyItem->fromWarehouse;
			elseif($historyItem->fromShip!=NULL)
				$from="Ship: ".$historyItem->fromShip;
			else			
				$from="Received from Original Owner";
			if($historyItem->toWarehouse!=NULL)
				$from="Warehouse: ".$historyItem->toWarehouse;
			elseif($historyItem->toShip!=NULL)
				$to="Ship: ".$historyItem->toShip;
			else			
				$to="Delivered to Receiver";			echo "<tr><td class=\"stuff_no\" colspan=\"2\">					History of cargo loads/unloads				</td></tr><tr><td class=\"bold unload_to_label\" colspan=\"2\">					$historyItem->date				</td></tr><tr><td width=\"50%\">					From				</td><td>					$from 				</td></tr><tr><td>					To				</td><td>					$to				</td></tr><tr><td>					Registered by				</td><td>					$historyItem->loadedBy				</td></tr><tr><td colspan=\"2\">					Remarks:
					$historyItem->remarks				</td></tr>";
		}				
		echo "</table><br>";		
	}
	else 
	{
		echo "<h1>Cargo</h1>";
		echo "<p>This is the Cargo menu.</p>";
		echo "<p>Select a cargo item from the menu on the left to view its details and history.</p>";
	}
	 ?>