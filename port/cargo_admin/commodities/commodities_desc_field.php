<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/cargo_admin/cargo/cargo_db_funs.php");        	
	
	if( isset( $_GET['id'] ) ) 
	{
		$commodity = get_commodity_by_id($_GET['id']);		
		if($commodity==NULL)
			return;
		echo "<table class=\"stuff_info\">
		<tr>
			<td class=\"stuff_no\" colspan=\"2\">
				Commodity: $commodity->name
			</td></tr><tr><td width=\"50%\">
				Type
			</td><td>
				$commodity->type
			</td></tr><tr><td>
				Unit value
			</td><td>
				$commodity->value
			</td></tr><tr><td>
				Unit duty
			</td><td>
				$commodity->duty
			</td></tr><tr><td>
				Unit Mass
			</td><td>
				$commodity->mass
			</td></tr><tr><td>
				Unit Volume
			</td><td>
				$commodity->volume
			</td></tr>
		</table><br><br>";				
	}
	else 
	{
		echo "<h1>Commodities</h1>";
		echo "<p>This is the Commodities menu.</p>";
		echo "<p>Select a commodity from the menu on the left to view its details. You can
            also add new commodities using the \"Add commodity\" button.</p>";
	}
	
 ?>
