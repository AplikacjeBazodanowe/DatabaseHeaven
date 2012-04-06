<?php
	include_once('contractors_db_funs.php');
	
	if( isset( $_GET['action'] ) ) 
	{				
		if( $_GET['action'] == 'edit' ) 
		{ 
			$contractor_id = $_GET['id'];
			$name=$_POST['name'];
			$address=$_POST['address'];
			$country=$_POST['country'];			
			update_contractor($contractor_id,$name,$address,$country);
		}
		elseif($_GET['action'] == 'add') 
		{
			$name=$_POST['name'];
            $type=$_POST['type'];
			$address=$_POST['address'];
			$country=$_POST['country'];			
			insert_contractor($name,$address,$type,$country);
		}		
	}
?>

<div>
	<input class="button baseFont add" type="button" value="Add a new contractor" onClick="add_toggle()">
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Surname:<br>
		Country:<br>
        Type:
	</div>
	<form action="?menu=contractors&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="name_filter" class="edit baseFont" type="edit" placeholder="Type name here">
			<select name="country_filter" class="baseFont select">
				<option value="">All</option>
				<?php					
						$countries=get_countries();
						foreach($countries as $country)
							echo "<option value=\"$country->id\">$country->name</option>";
				?>
			</select>
            <select name="type_filter" class="baseFont select">
                <option value="">All</option>
                <?php	
                    $types=get_types();
                    foreach($types as $type)
                        echo "<option value=\"$type\">$type</option>"; 
                ?>				
			  </select><br/>
			<br>
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="contractors_list overf">
	<?php
				
			if( isset($_POST['name_filter']) && $_POST['name_filter']!='Type name here') 			
				$name = $_POST['name_filter'];
			else 
				$name='';							
			if( isset($_POST['country_filter'])) 			
				$country = $_POST['country_filter'];
			else
				$country='';									 
            if( isset($_POST['type_filter'])) 			
				$type = $_POST['type_filter'];
			else
				$type='';
			$contractors=select_contractors($name,$country,$type);
			if($contractors)
				foreach($contractors as $contractor)
				{
					echo "<a href=\"?menu=contractors&id=$contractor->id\"><div class=\"name float_left left_col align_cols link\">";
						echo "$contractor->name";
					echo "</div></a>";
					echo "<a href=\"#\" onClick=\"edit_toggle( $contractor->id );\"><div class=\"delete float_left right_col align_cols link\">";
						echo "Edit";
					echo "</div></a>";
					echo "<div class=\"level float_left left_col align_cols\">";
						echo "$contractor->country";
					echo "</div></a>";
					echo "<div class=\"change float_left right_col align_cols\">";					
					echo "</div>";
					echo "<br><br><br>";
				}						
	?>	
</div>