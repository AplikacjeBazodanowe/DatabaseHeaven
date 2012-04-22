<?php
	include_once("users_db_funs.php");
        if(isset($error) && $error!=NULL)
                echo "<table class=\"error\" border=\"0\"><tr><td class=\"error_title\">Error</td></tr><tr><td><p class=\"error_msg\">$error</p></td></tr></table>";
	if(isset($_GET['id']))
	{	
		$id = $_GET['id'];
		$user = get_user_by_id($id);
		if($user)
		{ 	
			echo "<img class=\"photo\" src=\"../photos/$user->url_Obrazka\" alt=\"       No picture\">";
			echo "<h2>User name:</h2><p class=\"item_char_in_desc\">$user->nazwa</p>";
			echo "<h2>Privileges level:</h2><p class=\"item_char_in_desc\">$user->funkcja</p>";
			echo "<br>";
			echo "<input class=\"button baseFont add\" type=\"button\" value=\"Edit this user\" onClick=\"edit_toggle( $user->id_Uzytkownik )\">";
			echo "<a href=\"#\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=users&action=delete&id=$user->id_Uzytkownik' )\">";			
			echo "<br><input class=\"button baseFont add\" type=\"button\" value=\"Delete this user\"></a>";			
		}
	}
	else 
	{
		echo "<h1>Users</h1>";
		echo "<p>This is the Users menu.</p>";
		echo "<p>Select an user from the list to view their details</p>";
	}	
?>