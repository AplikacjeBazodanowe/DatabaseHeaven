<?php
		$root=$_SERVER['DOCUMENT_ROOT'];		
		include_once($root."/port_admin/ships/ships_db_funs.php");
?>

<div>	<div style="float: left; line-height: 20px">		Name:<br>		Type:<br>		Terminal:<br>						Dock date:<br>
		Undock date:			</div>	<form action="?menu=history&action=show" method="post">		<div style="margin-left: 77px;">			<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here">			<select name="type" class="baseFont select">	
				<option value="">All</option>				<?php					
					$types=get_ship_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>			</select>			<br>		
			<select name="terminal" class="baseFont select">
				<option value="">All</option>				<?php					
					$types=select_terminals();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>			</select>
			<br>				<input name="from_dockdate" class="ship_edit baseFont" type="text" 
						disabled="true" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" placeholder="From">			<input name="to_dockdate" class="ship_edit baseFont" type="text" 
						disabled="true" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" placeholder="To">			<input name="dockdate_check" type="checkbox" onClick="on_off_edit('dockdate')">			<input name="from_undockdate" class="ship_edit baseFont" type="text" 
						disabled="true" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" placeholder="From">			<input name="to_undockdate" class="ship_edit baseFont" type="text" 
						disabled="true" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" placeholder="To">			<input name="undockdate_check" type="checkbox" onClick="on_off_edit('undockdate')">		</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="ships_history_list overf">	<?php		if( isset($_POST['ship_name']) && $_POST['ship_name']!='Type name here') 						$name = $_POST['ship_name'];
		else 
			$name='';							
		if( isset($_POST['type'])) 						$type = $_POST['type'];
		else
			$type='';
		if( isset($_POST['terminal'])) 						$terminal = $_POST['terminal'];
		else
			$terminal='';
		if( isset($_POST['from_dockdate'])) 						$dockdateMin = $_POST['from_dockdate'];
		else
			$dockdateMin='';
		if( isset($_POST['to_dockdate'])) 						$dockdateMax = $_POST['to_dockdate'];
		else
			$dockdateMax='';
		if( isset($_POST['from_undockdate'])) 						$undockdateMin = $_POST['from_undockdate'];
		else
			$undockdateMin='';
		if( isset($_POST['to_undockdate'])) 						$undockdateMax = $_POST['to_undockdate'];
		else
			$undockdateMax='';									 
		$ships=select_history_ships($name, $type,$terminal, $dockdateMin, $dockdateMax, 
									$undockdateMin, $undockdateMax);
		if($ships)
			foreach($ships as $ship)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name\" onClick=\"window.location.href='?menu=history&id=$ship->docked_id'\">$ship->name</td></tr>";
				echo "<tr><td class=\"level\">Docked: $ship->dock_date</td></tr>";
				echo "<tr><td class=\"level\">Undocked: $ship->undock_date</td></tr>";
				echo "</table><br>";				
			}	?>	</div>