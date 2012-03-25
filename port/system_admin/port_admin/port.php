<!DOCTYPE html>
<html lang="pl">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../style.css">
		<script src="../js/fade.js"></script>
		<script src="../js/edits.js"></script>
		<title>Port admin</title>
	</head>
	<body class="baseFont">
		<div id="dark"></div>
		<div id="main">
			<div class="menu grad grayBorders">
				<a href="?menu=ships"><input class="button baseFont menu_button" type="button" value="Docked ships"></a>
				<a href="?menu=history"><input class="button baseFont menu_button" type="button" value="History"></a>
			</div>
			<div class="left_group grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "history" ) {
							include( "history/history_left_group.php" );
						} else {
							include( "ships/ships_left_group.php" );
						}
					} else {
						include( "ships/ships_left_group.php" );
					}
				?>
			</div>
			<div class="desc grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) {
						if( $_GET['menu'] == "history" ) {
							include( "history/history_desc_field.php" );
						} else {
							include( "ships/ships_desc_field.php" );
						}
					} else {
						include( "ships/ships_desc_field.php" );
					}
				?>
			</div>
		</div>
	</body>
</html>