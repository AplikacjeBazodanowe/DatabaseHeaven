<?php
	include_once("users_db_funs.php");
?>

<form name="edit_form" action="admin_system.php?menu=users&action=edit&id=ID" method="post" enctype="multipart/form-data">
	Password: <br><input name="password" class="edit_adding baseFont" type="password" onBlur="isEmpty( this )"><br>	