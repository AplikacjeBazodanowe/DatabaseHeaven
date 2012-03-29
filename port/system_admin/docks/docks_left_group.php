<?php
	include_once("docks_db_funs.php");
	if( isset( $_GET['action'] ) ) 
	{		if( $_GET['action'] == 'delete' ) 
		{			$dock_id = $_GET['id'];			delete_dock($dock_id);		} 
		else if( $_GET['action'] == 'edit' ) 
		{ // edycja doku			$dock_id = $_GET['id'];			$max_width = $_POST['width']; 
			$max_length = $_POST['length'];
			$max_height = $_POST['height']; 
			$fee = $_POST['fee'];
			$new_id = $_POST['id'];						update_dock($dock_id,$new_id,$max_width, $max_length, $max_height, $fee);		}
		elseif($_GET['action'] == 'add') 
		{
			$max_width = $_POST['width']; 
			$max_length = $_POST['length'];
			$max_height = $_POST['height']; 
			$fee = $_POST['fee'];
			$id = $_POST['id'];
			$term_id = $_POST['terminal'];			insert_dock($id,$term_id,$max_width, $max_length, $max_height, $fee);
		}	}?><div>	<input class="button baseFont add" type="button" value="Add dock" onClick="add_toggle()">	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">				Terminal:<br>			</div>	<form action="admin_system.php?menu=docks&action=show" method="post">		<div style="margin-left: 69px;">						<select name="terminal_filter" class="baseFont select">				<option value="">All</option>				<?php					
					$terminals=select_terminals();
					foreach($terminals as $terminal)											
						echo "<option value=\"$terminal->id\">$terminal->name</option>";					
				?>			</select>			<br>					</div>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="docks_list overf">	<?php		if( isset($_POST['terminal_filter']) ) 						$terminal = $_POST['terminal_filter'];
		else 
			$terminal='';																		 
		$docks=select_docks($terminal);
		if($docks)
			foreach($docks as $dock)
			{				 			 			  	echo "<a href=\"admin_system.php?menu=docks&id=$dock->id\">";
			  	echo "<div class=\"name float_left left_col align_cols link\">";				echo "Dok $dock->id";				echo "</div></a>";				echo	"<a href=\"admin_system.php?menu=docks&action=delete&id=$dock->id\">";
				echo  "<div class=\" delete float_left right_col align_cols link\">";				echo	"Delete";				echo "</div></a><div class=\"level float_left left_col align_cols\">";				echo "Terminal: $dock->term_name</div>";								echo "<a href=\"#\" onClick=\"edit_toggle( $dock->id )\"><div class=\"change float_left right_col align_cols link\">";				echo "Edit</div></a><br><br><br>";
			}			?>	</div>