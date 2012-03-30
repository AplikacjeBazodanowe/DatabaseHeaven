<?php
	include_once("terminals_db_funs.php");
		if( isset( $_GET['action'] ) ) 
	{		if( $_GET['action'] == 'delete' ) 
		{			$terminal_id = $_GET['id'];			delete_terminal($terminal_id);		} 
		else if( $_GET['action'] == 'edit' ) 
		{ 			$terminal_id = $_GET['id'];
			$name=$_POST['name'];
			$typeId=$_POST['type'];
			update_terminal($terminal_id,$name,$typeId);		}
		elseif($_GET['action'] == 'add') 
		{
			$name=$_POST['name'];
			$typeId=$_POST['type'];
			insert_terminal($name,$typeId);
		}	}?><div>	<input class="button baseFont add" type="button" value="Add terminal" onClick="add_toggle()">	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">		Name:&nbsp;<br>		Type:	</div>	<form action="admin_system.php?menu=terminals&action=show" method="post">		<input name="terminal_name" class="edit baseFont" type="edit" placeholder="Type name here">		<select name="type" class="baseFont select">
			<option value="">All</option>			<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
			?>		</select>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="terminals_list overf">	<?php		if( isset($_POST['terminal_name']) && $_POST['terminal_name']!='Type name here') 						$name = $_POST['terminal_name'];
		else 
			$name='';							
		if( isset($_POST['type'])) 						$type = $_POST['type'];
		else
			$type='';									 
		$terminals=select_terminals($name,$type);
		if($terminals)
			foreach($terminals as $terminal)
			{				 			 			  	echo "<a href=\"admin_system.php?menu=terminals&id=$terminal->id\">";
			  	echo "<div class=\"name float_left left_col align_cols link\">";				echo "$terminal->name";				echo "</div></a>";				echo	"<a href=\"admin_system.php?menu=terminals&action=delete&id=$terminal->id\">";
				echo  "<div onclick=\"return confirm('Are you sure?')\" class=\" delete float_left right_col align_cols link\">";				echo	"Delete";				echo "</div></a><div class=\"level float_left left_col align_cols\">";				echo "$terminal->type</div>";								echo "<a href=\"#\" onClick=\"edit_toggle( $terminal->id )\"><div class=\"change float_left right_col align_cols link\">";				echo "Edit</div></a><br><br><br>";
			}	?>	</div>