<?php
	include_once("terminals_db_funs.php");
	
	if( isset( $_GET['action'] ) ) 
	{
		if( $_GET['action'] == 'delete' ) 
		{
			$terminal_id = $_GET['id'];
			delete_terminal($terminal_id);
		} 
		else if( $_GET['action'] == 'edit' ) 
		{ 
			$terminal_id = $_GET['id'];
			$name=$_POST['name'];
			$typeId=$_POST['type'];
			update_terminal($terminal_id,$name,$typeId);
		}
		elseif($_GET['action'] == 'add') 
		{
			$name=$_POST['name'];
			$typeId=$_POST['type'];
			insert_terminal($name,$typeId);
		}
	}
?>
<div>
	<input class="button baseFont add" type="button" value="Add terminal" onClick="add_toggle()">
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Name:&nbsp;<br>
		Type:
	</div>
	<form action="admin_system.php?menu=terminals&action=show" method="post">
		<input name="name_filter" class="edit baseFont" type="edit" placeholder="Type name here">
		<select name="type_filter" class="baseFont select">
			<option value="">All</option>
			<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
			?>
		</select>
		<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="terminals_list overf">
	<?php
		if( isset($_POST['name_filter']) && $_POST['name_filter']!='Type name here') 			
			$name = $_POST['name_filter'];
		else 
			$name='';							
		if( isset($_POST['type_filter'])) 			
			$type = $_POST['type_filter'];
		else
			$type='';									 
		$terminals=select_terminals($name,$type);
		if($terminals)
			foreach($terminals as $terminal)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='admin_system.php?menu=terminals&id=$terminal->id'\">$terminal->name</td>";
				echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=terminals&action=delete&id=$terminal->id' )\">Delete</td></tr>";
				echo "<tr><td class=\"level\">$terminal->type</td>";
				echo "<td class=\"edit\" onClick=\"edit_toggle( $terminal->id )\">Edit</td></tr>";
				echo "</table><br>";
			}
	?>	
</div>