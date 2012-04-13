<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/system_admin/warehouses/warehouses_db_funs.php");
	include_once($root."/system_admin/terminals/terminals_db_funs.php");
?>

<div>
	<a href="warehouses/warehouses_cargo.php"><input class="button baseFont add" type="button" value="Cargo manager"></a>
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Name:<br>
		Terminal:<br>
		Capacity:		
	</div>
	<form action="?menu=warehouses&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="warehouse_name" class="edit baseFont" type="edit" placeholder="Type name here">
			<select name="terminal_filter" class="baseFont select">
				<option value="">All</option>
				<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
				?>
			</select>			
			<input name="from_capacity" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">
			<input name="to_capacity" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">
			<input name="capacity_check" type="checkbox" onClick="on_off_edit('capacity')">						
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="warehouses_cargo overf">
	<?php
		if( isset($_POST['warehouse_name']) && $_POST['warehouse_name']!='Type name here') 			
			$name = $_POST['warehouse_name'];
		else 
			$name='';
		if( isset($_POST['terminal_filter']) ) 			
			$terminal = $_POST['terminal_filter'];
		else 
			$terminal='';																		 
		if( isset($_POST['from_capacity']) ) 			
			$minCap = $_POST['from_capacity'];
		else 
			$minCap='';
		if( isset($_POST['to_capacity']) ) 			
			$maxCap = $_POST['to_capacity'];
		else 
			$maxCap='';
		$warehouses=select_warehouses($terminal, $name, $minCap, $maxCap);
		if($warehouses)
			foreach($warehouses as $warehouse)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=warehouses&id=$warehouse->id'\">$warehouse->name</td>";
				echo "<td class=\"delete right_column\" onClick=\"window.location.href='warehouses/warehouses_cargo.php?action=load&id=$warehouse->id'\">Load</td></tr>";
				echo "<tr><td class=\"level\">$warehouse->term_name</td>";
				echo "<td class=\"edit\" onClick=\"window.location.href='warehouses/warehouses_cargo.php?action=unload&id=$warehouse->id'\">Unload</td></tr>";
				echo "</table><br>";				
			}		
	?>	
</div>