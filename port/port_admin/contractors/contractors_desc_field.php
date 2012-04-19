<?php
	include_once('contractors_db_funs.php');

	if( isset( $_GET['id'] ) ) 
	{		
		$contractor=get_contractor_by_id($_GET['id'] );
		if($contractor!=NULL)
		{
			echo "<table class=\"stuff_info\">
				<tr>
					<td class=\"stuff_no\" colspan=\"2\">
						Contractor details
					</td></tr><tr><td width=\"50%\">
						Name
					</td><td >
						$contractor->name
					</td></tr><tr><td>
						Address
					</td><td>
						$contractor->address
					</td></tr><tr><td>
						Country
					</td><td>
						$contractor->country
					</td><tr><td>
						Type
					</td><td>
						$contractor->type
					</td></tr>
				</tr>
				</table><br>";
	
			echo '<a href="#" onClick="edit_toggle( ' . $_GET['id'] . ' )"><input class="button baseFont add" type="submit" value="Edit contractor data"></a><br>';
		}
	}
	else 
	{
		echo "<h1>Contractors</h1>";
		echo "<p>This is the Contractors menu.</p>";
		echo "<p>You can add, edit and browse contractors using the menu on the left.</p>";
	}	
?>