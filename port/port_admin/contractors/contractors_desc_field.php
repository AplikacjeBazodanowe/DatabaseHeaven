<?php
	include_once('contractors_db_funs.php');

	{		
		$contractor=get_contractor_by_id($_GET['id'] );
		if($contractor!=NULL)
		{
			echo "<table class=\"stuff_info\">
	else 
	{
		echo "<h1>Contractors</h1>";
		echo "<p>This is the Contractors menu.</p>";
		echo "<p>You can add, edit and browse contractors using the menu on the left.</p>";
	}	