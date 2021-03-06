<?php
	session_start();
	
	$root=$_SERVER['DOCUMENT_ROOT'];		
	include_once($root."/DB.php");     
    if(!isset($_SESSION['user']) || !isset($_SESSION['user_type']) || $_SESSION['user_type']!='system_admin')
    {
?>
<!DOCTYPE html>
<html lang="pl">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../style.css">		
		<title>Not authorized</title>
	</head>
	<body class="baseFont">		
		<div id="main">
            <h1>Not authorized</h1>
            <p>You are not authorized to view contents of this page!</p>
		</div>
	</body>
</html>

<?php
    }
    else
    {
?>
<!DOCTYPE html>
<html lang="pl">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../style.css">
		<script src="../js/fade.js"></script>
		<script src="../js/edits.js"></script>
		<script src="../js/deletion.js"></script>
		<title>System admin</title>
	</head>
	<body class="baseFont">
		<div id="dark"></div>
		<div id="main">
			<div class="menu grad grayBorders">
				<a href="?menu=users"><input class="button baseFont menu_button" type="button" value="Users"></a>
				<a href="?menu=terminals"><input class="button baseFont menu_button" type="button" value="Terminals"></a>
				<a href="?menu=docks"><input class="button baseFont menu_button" type="button" value="Docks"></a>
				<a href="?menu=warehouses"><input class="button baseFont menu_button" type="button" value="Warehouses"></a>
				<a href="../index.php?logout="><input class="button baseFont menu_button" type="button" value="Log out"></a>
			</div>
			<div id="adding" class="add_edit">
				<?php 
					DB::connect();
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "ships" ) {
							include( "ships/ships_adding.php" );
						} elseif( $_GET['menu'] == "terminals" ) {
							include( "terminals/terminals_adding.php" );
						} elseif( $_GET['menu'] == "docks" ) {
							include( "docks/docks_adding.php" );
						} elseif( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_adding.php" );
						} else {
							include( "users/users_adding.php" );
						}
					} else {
						include( "users/users_adding.php" );
					}
				?>
			</div>
			<div id="editing" class="add_edit">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "ships" ) {
							include( "ships/ships_editing.php" );
						} elseif( $_GET['menu'] == "terminals" ) {
							include( "terminals/terminals_editing.php" );
						} elseif( $_GET['menu'] == "docks" ) {
							include( "docks/docks_editing.php" );
						} elseif( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_editing.php" );
						} else {
							include( "users/users_editing.php" );
						}
					} else {
						include( "users/users_editing.php" );
					}
				?>
			</div>
			<div class="left_group grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "ships" ) {
							include( "ships/ships_left_group.php" );
						} elseif( $_GET['menu'] == "terminals" ) {
							include( "terminals/terminals_left_group.php" );
						} elseif( $_GET['menu'] == "docks" ) {
							include( "docks/docks_left_group.php" );
						} elseif( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_left_group.php" );
						} else {
							include( "users/users_left_group.php" );
						}
					} else {
						include( "users/users_left_group.php" );
					}
				?>
			</div>
			<div class="desc grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "ships" ) {
							include( "ships/ships_desc_field.php" );
						} elseif( $_GET['menu'] == "terminals" ) {
							include( "terminals/terminals_desc_field.php" );
						} elseif( $_GET['menu'] == "docks" ) {
							include( "docks/docks_desc_field.php" );
						} elseif( $_GET['menu'] == "warehouses" ) {
							include( "warehouses/warehouses_desc_field.php" );
						} else {
							include( "users/users_desc_field.php" );
						}
					} else {
						include( "users/users_desc_field.php" );
					}
					DB::close();
				?>
			</div>
		</div>
	</body>
</html>
<?php
    }
?>
