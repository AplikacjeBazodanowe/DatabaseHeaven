<?php	if( isset( $_GET['action'] ) ) {		if( $_GET['action'] == 'delete' ) {			$user_id = $_GET['id'];			// zapytanie na wywalenie usera		} else if( $_GET['action'] == 'edit' ) { // edycja usera			$user_id = $_GET['id'];		}	}?><div>	<input class="button baseFont add" type="button" value="Add user" onClick="add_toggle()">	<hr class="line">	<form action="admin_system.php?menu=users&action=search" method="post">		<input name="user_name" class="edit baseFont" type="text" value="Surname" onClick="clr( this )" onBlur="back( this )">		<input class="button baseFont" type="submit" value="Search">	</form>	<br>	<div style="float: left; line-height: 21px;">		Level:&nbsp;	</div>	<form action="admin_system.php?menu=users&action=show" method="post">		<select name="level" class="baseFont select">			<option>Debile		</select>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="users_list">	<?php		if( isset( $_GET['action'] ) ) {			if( $_GET['action'] == 'search' ) {				$surname = $_POST['user_name'];				// wyswietl userow na podstawie surname			} else if( $_GET['action'] == 'show' ) {				$level = $_POST['level'];				// wyswietl na podstawie levelu			}		} else {			// wyswietl all			// wzor na "tabelke" dla itemu:			//  <a href="admin_system.php?menu=users&id=ID"><div class="name float_left left_col align_cols link">			//		Jan Kowalski			//	</div></a>			//	<a href="admin_system.php?menu=users&action=delete&id=ID"><div class=" delete float_left right_col align_cols link">			//		Delete			//	</div></a>			//	<div class="level float_left left_col align_cols">			//		Ninja			//	</div>			//	<a href="#" onClick="edit_toggle( ID )"><div class="change float_left right_col align_cols link">			//		Edit			//	</div></a>			//	<br><br><br>		}	?>	<!-- to tylko do testowania, wiec do wywalenia pozniej -->	<?php include( "users/users.txt" ); ?></div>