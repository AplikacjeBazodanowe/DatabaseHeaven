<?php
	include_once('contractors_db_funs.php');
	
	if( isset( $_GET['action'] ) ) 
	{				
		if( $_GET['action'] == 'edit' ) 
		{ 			$contractor_id = $_GET['id'];
			$name=$_POST['name'];
			$address=$_POST['address'];
			$country=$_POST['country'];			
			update_contractor($contractor_id,$name,$address,$country);		}
		elseif($_GET['action'] == 'add') 
		{
			$name=$_POST['name'];
			$address=$_POST['address'];
			$country=$_POST['country'];			
			insert_contractor($contractor_id,$name,$address,$country);
		}			}
?>

<div>	<input class="button baseFont add" type="button" value="Add a new contractor" onClick="add_toggle()">	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">		Surname:<br>		Country:	</div>	<form action="?menu=contractors&action=show" method="post">		<div style="margin-left: 69px;">			<input name="name_filter" class="edit baseFont" type="edit" placeholder="Type name here">			<select name="country_filter" class="baseFont select">				<option value="">All</option>
				<?php					
						$countries=get_countries();
						foreach($countries as $country)
							echo "<option value=\"$country->id\">$country->name</option>";
				?>			</select>			<br>		</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="contractors_list overf">	<?php			if( isset($_POST['name_filter']) && $_POST['name_filter']!='Type name here') 							$name = $_POST['name_filter'];
			else 
				$name='';							
			if( isset($_POST['country_filter'])) 							$country = $_POST['country_filter'];
			else
				$country='';									 
			$contractors=select_contractors($name,$country);
			if($contractors)
				foreach($contractors as $contractor)
				{
					echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
					echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=contractors&id=$contractor->id'\">$contractor->name</td>";
					echo "<td class=\"edit right_column\" onClick=\"edit_toggle( $contractor->id )\" rowspan=\"2\">Edit</td></tr>";
					echo "<tr><td class=\"level\">$contractor->country</td></tr>";
					echo "</table><br>";				}							?>	</div>