<div>	<a href="ships/ships_cargo.php"><input class="button baseFont add" type="button" value="Cargo manager"></a>	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">		Name:<br>		Type:<br>		Displace:<br>		Capacity:<br>		Length:<br>		Width:<br>		Height:	</div>	<form action="?menu=ships&action=show" method="post">		<div style="margin-left: 69px;">			<input name="ship_name" class="edit baseFont" type="edit" placeholder="Type name here">			<select name="type" class="baseFont select">				<option>All			</select>			<br>			<input name="from_displace" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">			<input name="to_displace" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">			<input name="displace_check" type="checkbox" onClick="on_off_edit('displace')">			<input name="from_capacity" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">			<input name="to_capacity" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">			<input name="capacity_check" type="checkbox" onClick="on_off_edit('capacity')">			<input name="from_length" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">			<input name="to_length" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">			<input name="length_check" type="checkbox" onClick="on_off_edit('length')">			<input name="from_width" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">			<input name="to_width" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">			<input name="width_check" type="checkbox" onClick="on_off_edit('width')">			<input name="from_height" class="ship_edit baseFont" type="text" disabled="true" placeholder="From" pattern="^[0-9]+$">			<input name="to_height" class="ship_edit baseFont" type="text" disabled="true" placeholder="To" pattern="^[0-9]+$">			<input name="height_check" type="checkbox" onClick="on_off_edit('height')">			<label><input name="empty_check" type="checkbox">Empty</label>			<label><input name="full_check" type="checkbox">Full</label><br>			<label><input name="unregistered_check" type="checkbox">Unregistered</label>		</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="ships_cargo_list overf">	<?php		if( isset( $_GET['action'] ) ) {			if( $_GET['action'] == 'show' ) {				// $type = $_POST['type']; tu w zaleznosci jakiego checkboxa zaznaczylismy to wzgledem tego wyswietlamy				// najlepiej po prostu odpowiednio doklejac do zapytania warunki			}		} else {			// wyswietl all			// wzor na "tabelke" dla itemu:			// <a href="?menu=ships&id=ID"><div class="name float_left left_col align_cols link">				// Tytanik			// </div></a>			// <a href="ships/ships_cargo.php?action=load&id=ID"><div class="delete float_left right_col align_cols link">				// Load			// </div></a>			// <a href="ships/ships_cargo.php?action=register&id=ID"><div class="level_link float_left left_col align_cols link">				// Register cargo			// </div></a>			// <a href="ships/ships_cargo.php?action=unload&id=ID"><div class="change float_left right_col align_cols link">				// Unload			// </div></a>			// <br><br><br>		}	?>	<!-- to tylko do testowania, wiec do wywalenia pozniej -->	<?php include( "ships/users.txt" ); ?></div>