<div>	<input class="button baseFont add" type="button" value="Add user" onClick="add_toggle()">	<hr class="line">	<form action="admin_system.php?menu=users&action=search" method="post">		<input name="user_name" class="edit baseFont" type="edit" value="Surname" onClick="clr( this )" onBlur="back( this )">		<input class="button baseFont" type="submit" value="Search">	</form>	<br>	<div style="float: left; line-height: 21px;">		Level:&nbsp;	</div>	<form action="admin_system.php?menu=users&action=show" method="post">		<select name="level" class="baseFont select">			<option>Debile		</select>		<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="users_list">	<!-- tutaj php do obslugi action=search/show, wzor jest w users.txt, ale to pewnie i tak ja bede robic ;P -->	<?php include( "users/users.txt" ); ?></div>