<?php
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");
	
	DB::connect();
?>
<!DOCTYPE html>
<html lang="pl">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../style.css">
		<script src="../js/fade.js"></script>
		<script src="../js/edits.js"></script>        
		<title>Cargo admin</title>
	</head>
	<body class="baseFont">
		<div id="dark"></div>
		<div id="main">
			<div class="menu grad grayBorders">
				<a href="?menu=ships"><input class="button baseFont menu_button" type="button" value="Docked ships"></a>
				<a href="?menu=warehouses"><input class="button baseFont menu_button" type="button" value="Warehouses"></a>
				<a href="?menu=contractors"><input class="button baseFont menu_button" type="button" value="Contractors"></a>
				<a href="?menu=cargo"><input class="button baseFont menu_button" type="button" value="Cargo"></a>
                <a href="?menu=commodities"><input class="button baseFont menu_button" type="button" value="Commodities"></a>
                <a href="#"><input class="button baseFont menu_button" type="button" value="Log out"></a>
			</div>
			<div id="adding" class="add_edit">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "contractors" ) {
							include( "contractors/contractors_adding.php" );
						}
                        if( $_GET['menu'] == "commodities" ) {
							include( "commodities/commodities_adding.php" );
						}
					}
				?>
			</div>
			<div id="editing" class="add_edit">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "contractors" ) {
							include( "contractors/contractors_editing.php" );
						}
					}
				?>
			</div>						
			<div class="left_group grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_left_group.php" );
						} elseif( $_GET['menu'] == "ships" ) {
							include( "ships/ships_left_group.php" );
						} elseif( $_GET['menu'] == "contractors" ) {
							include( "contractors/contractors_left_group.php" );
						} elseif( $_GET['menu'] == "commodities" ) {
							include( "commodities/commodities_left_group.php" );
						}
                        else {
							include( "cargo/cargo_left_group.php" );
						}
					} else {
						include( "ships/ships_left_group.php" );
					}
				?>
			</div>
			<div class="desc grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_desc_field.php" );
						} elseif( $_GET['menu'] == "ships" ) {
							include( "ships/ships_desc_field.php" );
						} elseif( $_GET['menu'] == "contractors" ) {
							include( "contractors/contractors_desc_field.php" );
						} elseif( $_GET['menu'] == "commodities" ) {
							include( "commodities/commodities_desc_field.php" );
						} else {
							include( "cargo/cargo_desc_field.php" );
						}
					} else {
						include( "ships/ships_desc_field.php" );
					}
					
					DB::close();
				?>
			</div>
		</div>
	</body>
</html>