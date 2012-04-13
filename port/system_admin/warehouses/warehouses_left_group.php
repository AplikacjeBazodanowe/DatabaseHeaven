<?php
	include_once("warehouses_db_funs.php");	
		if( isset( $_GET['action'] ) ) 
	{		if( $_GET['action'] == 'delete' ) 
		{			$warehouse_id = $_GET['id'];			delete_warehouse($warehouse_id);		} 
		elseif( $_GET['action'] == 'edit' ) 
		{ // edycja magazynu			$warehouse_id = $_GET['id'];			$name = $_POST['name'];
			$capacity = $_POST['capacity']; 			 
			$fee = $_POST['fee'];					update_warehouse($warehouse_id,$name,$capacity, $fee);		}
		elseif($_GET['action'] == 'add') 
		{
			$name = $_POST['name'];
			$capacity = $_POST['capacity']; 			 
			$fee = $_POST['fee'];
			$term_id = $_POST['terminal'];			insert_warehouse($term_id,$name,$capacity, $fee);
		}	}?><div>	<input class="button baseFont add" type="button" value="Add warehouse" onClick="add_toggle()">	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">		Name:<br>		Terminal:			</div>	<form action="admin_system.php?menu=warehouses&action=show" method="post">		<div style="margin-left: 69px;">			<input name="warehouse_name" class="edit baseFont" type="edit" placeholder="Type name here">			<select name="terminal_filter" class="baseFont select">				<option value="">All</option>				<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
				?>			</select>			<br>		</div>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="warehouses_list overf">	<?php
		if( isset($_POST['warehouse_name']) && $_POST['warehouse_name']!='Type name here') 						$name = $_POST['warehouse_name'];
		else 
			$name='';		if( isset($_POST['terminal_filter']) ) 						$terminal = $_POST['terminal_filter'];
		else 
			$terminal='';																		 
		$warehouses=select_warehouses($terminal, $name);
		if($warehouses)
			foreach($warehouses as $warehouse)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='admin_system.php?menu=warehouses&id=$warehouse->id'\">$warehouse->name</td>";
				echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=warehouses&action=delete&id=$warehouse->id' )\">Delete</td></tr>";
				echo "<tr><td class=\"level\">Terminal: $warehouse->term_name</td>";
				echo "<td class=\"edit\" onClick=\"edit_toggle( $warehouse->id )\">Edit</td></tr>";
				echo "</table><br>";
			}	?>	</div>