<div>	<div style="float: left; line-height: 21px;">		Name:<br>		Owner:<br>                Terminal:	</div>	<form action="?menu=cargo&action=show" method="post">		<div style="margin-left: 69px;">			<input name="name_filter" class="edit baseFont" type="edit" placeholder="Type name here">			<select name="contractor_filter" class="baseFont select">                            <option value="">All</option>                            <?php                                $contractors=get_contractors();                                foreach($contractors as $contractor)                                    echo "<option value=\"$contractor->id\">$contractor->name</option>";                            ?>			</select>                        <select name="ship_filter" class="baseFont select">				                                <option value="">All</option>                            <?php                                $ships=select_all_ships();                                foreach($ships as $ship)                                    echo "<option value=\"$ship->id\">$ship->name</option>";                            ?>			</select>			<br>			<label><input name="list_switch" type="radio" value="pending" checked>Pending</label><br/>			<label><input name="list_switch" type="radio" value="suspended">Suspended</label>		</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="cargo_duty_list overf">	<?php		if( !isset( $_POST['list_switch'] ) )			$_POST['list_switch'] = 'pending';		if(isset($_POST['name_filter']))			$name=$_POST['name_filter'];		else			$name='';		if(isset($_POST['contractor_filter']))			$contractor=$_POST['contractor_filter'];		else			$contractor='';		if(isset($_POST['ship_filter']))			$ship=$_POST['ship_filter'];		else			$ship='';		if($_POST['list_switch']=='pending')			$cargoList=select_pending_cargo ($name, $contractor, $ship);		elseif($_POST['list_switch']=='suspended')			$cargoList=select_suspended_cargo ($name, $contractor, $ship);		if($cargoList!=NULL)			foreach($cargoList as $cargo)			{				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=cargo&id=$cargo->id'\">$cargo->commodity</td></tr>";				echo "<tr><td class=\"level\">Amount: $cargo->amount</td></tr>";				echo "<tr><td class=\"level\">Owner: $cargo->owner</td></tr>";				echo "<tr><td class=\"level\">Ship: $cargo->ship</td></tr>";				echo "</table><br>";									}                	?>	</div>