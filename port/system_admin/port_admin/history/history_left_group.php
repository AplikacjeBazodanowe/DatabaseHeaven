<div>	<form action="?menu=history&action=search" method="post">		<input name="ship_name" class="edit baseFont" type="edit" value="Name" onClick="clr( this )" onBlur="back( this )">		<input class="button baseFont" type="submit" value="Search">	</form>	<br>	<div style="float: left; line-height: 21px;">		Type:<br>		Displace:<br>		Capacity:<br>		Length:<br>		Width:<br>		Height:<br>		Dock date:<br>		<span style="font-size: 9px">Undock date:</span>	</div>	<form action="?menu=history&action=show" method="post">		<div style="margin-left: 69px;">			<select name="type" class="baseFont select">				<option>All			</select>			<br>			<input name="from_displace" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="to_displace" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="displace_check" type="checkbox" onClick="on_off_edit('displace')">			<input name="from_capacity" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="to_capacity" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this ; validateEdit( this )">			<input name="capacity_check" type="checkbox" onClick="on_off_edit('capacity')">			<input name="from_length" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="to_length" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="length_check" type="checkbox" onClick="on_off_edit('length')">			<input name="from_width" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="to_width" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="width_check" type="checkbox" onClick="on_off_edit('width')">			<input name="from_height" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="to_height" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this ); validateEdit( this )">			<input name="height_check" type="checkbox" onClick="on_off_edit('height')">			<input name="from_dockdate" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_dockdate" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="dockdate_check" type="checkbox" onClick="on_off_edit('dockdate')">			<input name="from_undockdate" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_undockdate" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="undockdate_check" type="checkbox" onClick="on_off_edit('undockdate')">		</div>	<input class="button baseFont add" type="submit" value="Show" onClick="return validate( 'from_displace|to_displace|from_capacity|to_capacity|from_length|to_length|from_width|to_width|from_height|to_height|from_dockdate|to_dockdate|from_undockdate|to_undockdate' )">	</form></div><br><div class="ships_history_list overf">	<?php		if( isset( $_GET['action'] ) ) {			if( $_GET['action'] == 'search' ) {				$ship_name = $_POST['ship_name'];				// wyswietl statki na podstawie nazwy statku			} else if( $_GET['action'] == 'show' ) {				// $type = $_POST['type']; tu w zaleznosci jakiego checkboxa zaznaczylismy to wzgledem tego wyswietlamy				// najlepiej po prostu odpowiednio doklejac do zapytania warunki			}		} else {			// wyswietl all			// wzor na "tabelke" dla itemu:			//  <a href="?menu=history&id=ID"><div class="name float_left left_col align_cols link">			//		Tytanik			//	</div></a>			//	<a href="?menu=ships&action=delete&id=ID"><div class="delete float_left right_col align_cols link">			//		Undock			//	</div></a>			//	<div class="level float_left left_col align_cols">			//		Docked: 1.01.2012			//	</div>			//	<a href="#" onClick="edit_toggle( ID )"><div class="change float_left right_col align_cols link">			//		Edit			//	</div></a>			//	<br><br><br>		}	?>	<!-- to tylko do testowania, wiec do wywalenia pozniej -->	<?php include( "history/users.txt" ); ?></div>