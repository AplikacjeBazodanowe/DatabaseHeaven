<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/port_admin/ships/ships_db_funs.php");
?>

<div>
	<a href="ships/ships_cargo.php"><input class="button baseFont add" type="button" value="Cargo manager"></a>
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Name:<br>
		Terminal:<br>		
	</div>
	<form action="?menu=ships&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here">
			<select name="terminal" class="baseFont select">
				<option value="">All</option>
				<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
				?>
			</select>
			<br>			
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="ships_cargo_list overf">
	<?php
		if( isset($_POST['ship_name']) && $_POST['ship_name']!='Type name here') 			
			$name = $_POST['ship_name'];
		else 
			$name='';									
		if( isset($_POST['terminal'])) 			
			$terminal = $_POST['terminal'];
		else
			$terminal='';											 
		$ships=select_docked_ships($name, '',$terminal);
		if($ships)
			foreach($ships as $ship)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=ships&id=$ship->id'\">$ship->name</td>";
				echo "<td class=\"delete right_column\" onClick=\"window.location.href='ships/ships_cargo.php?action=load&id=$ship->id'\">Load</td></tr>";
				echo "<tr><td class=\"delete\" onClick=\"window.location.href='ships/ships_cargo.php?action=register&id=$ship->id'\">Register cargo</td>";
				echo "<td class=\"edit\" onClick=\"window.location.href='ships/ships_cargo.php?action=unload&id=$ship->id'\">Unload</td></tr>";
				echo "</table><br>";
			}
	?>
</div>