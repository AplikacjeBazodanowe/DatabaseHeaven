<?php
	include_once("users_db_funs.php");
		
	if(isset($_GET['id']))
	{			$id = $_GET['id'];		$user = get_user_by_id($id);
		if($user)
		{ 				echo "<img class=\"photo\" src=\"$user->url_obrazka\">";
			echo "<h1>User name:</h1><p>$user->nazwa</p>";
			echo "<h1>Privileges Level:</h1><p>$user->funkcja</p>";
			echo "<a class=\"link\" href=\"#\" onClick=\"edit_toggle( $user->id_Uzytkownik )\">Edit this user</a><br />";
			echo	"<a class=\"link\" href=\"admin_system.php?menu=users&action=delete&id=$user->id_Uzytkownik\">";						echo	"Delete this motherfucker!</a>";			
		}
	}
	else 
	{
		echo "<h1>Debil</h1>";
		echo "<p>Coś zjebałeś pierdolcu, hahaha.</p>";
		echo "<p>Ale tak serio to coś tu mozna wrzucić</p>";
	}	?>