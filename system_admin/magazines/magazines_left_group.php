<div>	<input class="button baseFont add" type="button" value="Add magazine" onClick="add_toggle()">	<hr class="line">	<form action="admin_system.php?menu=magazines&action=search" method="post">		<input name="magazine_name" class="edit baseFont" type="edit" value="Magazine name" onClick="clr( this )" onBlur="back( this )">		<input class="button baseFont" type="submit" value="Search">	</form>	<br>	<div style="float: left; line-height: 21px;">		Terminal:<br>		Capacity:<br>		Fee:	</div>	<form action="admin_system.php?menu=magazines&action=show" method="post">		<div style="margin-left: 69px;">			<select name="terminal" class="baseFont select">				<option>Terminal			</select>			<br>			<input name="from_capacity" class="ship_edit baseFont" type="text" value="From" disabled="true" onClick="clr( this )" onBlur="back( this )">			<input name="to_capacity" class="ship_edit baseFont" type="text" value="To" disabled="true"  onClick="clr( this )" onBlur="back( this )">			<input type="checkbox" onClick="on_off_edit('capacity')">			<input name="from_fee" class="ship_edit baseFont" type="text" value="From" disabled="true"  onClick="clr( this )" onBlur="back( this )">			<input name="to_fee" class="ship_edit baseFont" type="text" value="To" disabled="true"  onClick="clr( this )" onBlur="back( this )">			<input type="checkbox" onClick="on_off_edit('fee')">		</div>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="magazines_list">	<?php include( "magazines/users.txt" ); ?></div>