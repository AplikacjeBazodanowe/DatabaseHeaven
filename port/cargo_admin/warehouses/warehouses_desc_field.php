<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/system_admin/warehouses/warehouses_db_funs.php");
	include_once("warehouses_db_funs.php");
	
	if( isset( $_GET['id'] ) ) 
	{
		$warehouse_id = $_GET['id'];	
		$warehouse = get_warehouse_by_id($warehouse_id);
        
        if(isset($_GET['stuff']) && $_GET['stuff']=='history')
         {
            if(isset($_POST['from']) && $_POST['from']!=='')            
                $from= 'from '.$_POST['from'];
            else           
                $from=' ';                
            if(isset($_POST['to']) && $_POST['to']!=='')            
                $to= 'to '.$_POST['to'];                
            else            
                $to=' ';                
            $historyOrCurrent= "<br><h2>History of cargo $from $to:</h2>";				  													  			
            $cargo = get_warehouse_cargo($warehouse_id,$_POST['from'],$_POST['to']);			
         }
         else
         {
            $historyOrCurrent='<br><h2>Cargo currently in the warehouse:</h2>';				  													  			
            $cargo = get_warehouse_cargo($warehouse_id);		
         }		

		echo "<table class=\"stuff_info\">
		<tr>
			<td class=\"stuff_no\" colspan=\"2\">
				Warehouse details
			</td></tr><tr><td width=\"50%\">
				Name
			</td><td >
				$warehouse->name
			</td></tr><tr><td>
				Terminal
			</td><td>
				$warehouse->term_name
			</td></tr><tr><td>
				Capacity
			</td><td>
				$warehouse->capacity
			</td></tr><tr><td>
				Fee
			</td><td>
				$warehouse->fee
			</td>
		</tr>
		</table><br>
		<hr>";
        
        echo $historyOrCurrent;
        
		echo '<div style="text-align: center">';
		echo '<a href="?menu=warehouses&id=' . $_GET['id'] . '&stuff=now"><input class="button baseFont add" type="submit" value="Show cargo in the warehouse"></a><br>';
		echo '<br>';
		echo '<form action="?menu=warehouses&id=' . $_GET['id'] . '&stuff=history" method="post">';
		echo '&nbsp;<input type="submit" class="button baseFont add" value="Show cargo history"><br>';
		echo 'Date:';
		echo '<input name="from" style="width: 75px" class="baseFont" type="edit" placeholder="From">';
		echo '&nbsp;<input name="to" style="width: 75px" class="baseFont" type="edit" placeholder="To">';
		echo '</form>';
		echo '</div>';		
			
		if($cargo==NULL)
			return;
		foreach($cargo as $cargo_item)			
		{				
			echo "<br><div style=\"text-align: center\">
				  <table class=\"stuff_info\">
				  <tr>
					  <td class=\"stuff_no\" colspan=\"2\">
						  Cargo ID: $cargo_item->id
					  </td>
				  </tr>
				  <tr>
					  <td colspan=\"2\">
						  $cargo_item->name
					  </td>
				  </tr>
				  <tr>
					  <td>
						  Load date: $cargo_item->date
					  </td>
					  <td >
						  Loaded by: $cargo_item->loaded_by
					  </td>
				  </tr>
				  <tr>
					  <td>
						  Type: $cargo_item->type
					  </td>
					  <td>
						  Amount: $cargo_item->amount
					  </td>
				  </tr>
				  <tr>
					  <td>
						  Mass: $cargo_item->mass
					  </td>
					  <td>
						  Volume: $cargo_item->volume
					  </td>
				  </tr>
				  <tr>
					  <td>
						  Owner: $cargo_item->owner
					  </td>
					  <td>
						  Value: $cargo_item->value
					  </td>
				  </tr>				  
				  </table></div>";
	  		}
			echo '<a href="warehouses/warehouses_cargo.php?action=load&id=' . $_GET['id'] . '"><input class="button baseFont add" type="submit" value="Load to warehouse"></a><br>';
			echo '<a href="warehouses/warehouses_cargo.php?action=unload&id=' . $_GET['id'] . '"><input class="button baseFont add" type="submit" value="Unload from warehouse"></a><br>';

	}
?>