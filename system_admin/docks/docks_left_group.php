<?php	if( isset( $_GET['action'] ) ) {		if( $_GET['action'] == 'delete' ) {			$dock_id = $_GET['id'];			// zapytanie na wywalenie doku		} else if( $_GET['action'] == 'edit' ) { // edycja doku			$dock_id = $_GET['id'];			// $terminal = $_POST['terminal']; tu w zaleznosci jakiego checkboxa zaznaczylismy to to edytujemy			// najlepiej po prostu odpowiednio doklejac do zapytania warunki		}	}?><div>	<input class="button baseFont add" type="button" value="Add dock" onClick="add_toggle()">	<hr class="line">	<form action="admin_system.php?menu=docks&action=search" method="post">		<input name="dock_name" class="edit baseFont" type="edit" value="Name" onClick="clr( this )" onBlur="back( this )">		<input class="button baseFont" type="submit" value="Search">	</form>	<br>	<div style="float: left; line-height: 21px;">		Terminal:<br>		Fee:<br>		Length:<br>		Width:<br>		Height:	</div>	<form action="admin_system.php?menu=docks&action=show" method="post">		<div style="margin-left: 69px;">			<select name="terminal" class="baseFont select">				<option>Terminal			</select>			<br>			<input name="from_fee" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_fee" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="fee_check" type="checkbox" onClick="on_off_edit('fee')">			<input name="from_length" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_length" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="length_check" type="checkbox" onClick="on_off_edit('length')">			<input name="from_width" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_width" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="width_check" type="checkbox" onClick="on_off_edit('width')">			<input name="from_height" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_height" class="ship_edit baseFont" type="text" value="To" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="height_check" type="checkbox" onClick="on_off_edit('height')">		</div>		<input class="button baseFont add" type="submit" value="Show" onClick="return validate()">	</form></div><br><div class="docks_list">	<?php		if( isset( $_GET['action'] ) ) {			if( $_GET['action'] == 'search' ) {				$surname = $_POST['dock_name'];				// wyswietl dok na podstawie nazwy			} else if( $_GET['action'] == 'show' ) {				// $terminal = $_POST['terminal']; tu w zaleznosci jakiego checkboxa zaznaczylismy to wzgledem tego wyswietlamy				// najlepiej po prostu odpowiednio doklejac do zapytania warunki			}		} else {			// wyswietl all			// wzor na "tabelke" dla itemu:			//  <a href="admin_system.php?menu=docks&id=ID"><div class="name float_left left_col align_cols link">			//		Jan Kowalski			//	</div></a>			//	<a href="admin_system.php?menu=docks&action=delete&id=ID"><div class=" delete float_left right_col align_cols link">			//		Delete			//	</div></a>			//	<div class="level float_left left_col align_cols">			//		Ninja			//	</div>			//	<a href="#" onClick="edit_toggle( ID )"><div class="change float_left right_col align_cols link">			//		Edit			//	</div></a>			//	<br><br><br>		}	?>	<!-- to tylko do testowania, wiec do wywalenia pozniej -->	<?php include( "docks/users.txt" ); ?></div>