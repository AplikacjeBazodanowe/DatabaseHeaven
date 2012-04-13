<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/cargo_admin/cargo/cargo_db_funs.php");        	
    include_once("commodities_db_funs.php");        	
	
	if( isset( $_GET['action'] ) && $_GET['action'] == 'add') 
	{								
        $name=$_POST['name'];
        $type=$_POST['type'];
        $uValue=$_POST['value'];
        $uDuty=$_POST['duty'];
        $uMass=$_POST['mass'];
        $uVol=$_POST['volume'];
        insert_commodity($name,$type,$uValue,$uDuty,$uMass,$uVol);		
	}
?>

<div>
    <input class="button baseFont add" type="button" value="Add commodity" onClick="add_toggle()">
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Name:<br>
		Type:
	</div>
	<form action="?menu=commodities&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="name_filter" class="edit baseFont" type="edit" placeholder="Type name here">
			<select name="type_filter" class="baseFont select">
				<option value="">All</option>
				<?php
					$types=get_cargo_types();
					foreach($types as $type)
						echo "<option value=\"$type->id\">$type->name</option>";
				?>
			</select>
			<br>			
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="commodities_list overf">
	<?php
				
			if( isset($_POST['name_filter']) && $_POST['name_filter']!='Type name here') 			
				$name = $_POST['name_filter'];
			else 
				$name='';							
			if( isset($_POST['type_filter'])) 			
				$type = $_POST['type_filter'];
			else
				$type='';									 
			$commodities=get_commodities($type,$name);
			if($commodities)
				foreach($commodities as $commodity)
				{
					echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
					echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='?menu=commodities&id=$commodity->id'\">ID: $commodity->id</td></tr>";
					echo "<tr><td class=\"level\">$commodity->name</td></tr>";
					echo "</table><br>";
				}
	?>
</div>