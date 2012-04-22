<?php
	include_once("docks_db_funs.php");

	if( isset( $_GET['action'] ) ) 
	{
		if( $_GET['action'] == 'delete' ) 
		{
			$dock_id = $_GET['id'];
			delete_dock($dock_id);
		} 
		else if( $_GET['action'] == 'edit' ) 
		{ // edycja doku
			$dock_id = $_GET['id'];
			$max_width = $_POST['width']; 
			$max_length = $_POST['length'];
			$max_height = $_POST['height']; 
			$fee = $_POST['fee'];
			$new_id = $_POST['id'];			
			$error=update_dock($dock_id,$new_id,$max_width, $max_length, $max_height, $fee);
		}
		elseif($_GET['action'] == 'add') 
		{
			$max_width = $_POST['width']; 
			$max_length = $_POST['length'];
			$max_height = $_POST['height']; 
			$fee = $_POST['fee'];
			$id = $_POST['id'];
			$term_id = $_POST['terminal'];
			$error=insert_dock($id,$term_id,$max_width, $max_length, $max_height, $fee);
		}
	}
?>
<div>
	<input class="button baseFont add" type="button" value="Add dock" onClick="add_toggle()">
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">		
		Terminal:<br>		
	</div>
	<form action="admin_system.php?menu=docks&action=show" method="post">
		<div style="margin-left: 69px;">			
			<select name="terminal_filter" class="baseFont select">
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
<div class="docks_list overf">
	<?php
		if( isset($_POST['terminal_filter']) ) 			
			$terminal = $_POST['terminal_filter'];
		else 
			$terminal='';																		 
		$docks=select_docks($terminal);
		if($docks)
			foreach($docks as $dock)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='admin_system.php?menu=docks&id=$dock->id'\">Dok $dock->id</td>";
				echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=docks&action=delete&id=$dock->id' )\">Delete</td></tr>";
				echo "<tr><td class=\"level\">Terminal: $dock->term_name</td>";
				echo "<td class=\"edit\" onClick=\"edit_toggle( $dock->id )\">Edit</td></tr>";
				echo "</table><br>";
			}		
	?>	
</div>