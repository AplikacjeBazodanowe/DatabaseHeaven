<?php
	session_start();

    include_once('duty_db_funs.php');
    DB::connect();
    if(!isset($_SESSION['user']) || !isset($_SESSION['user_type']) || $_SESSION['user_type']!='duty_admin')
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
<html lang="en">
	<head>
		<meta charset="iso-8859-2">
		<link rel="stylesheet" type="text/css" href="../style.css">
		<script src="../js/fade.js"></script>
		<script src="../js/edits.js"></script>
		<script src="../js/duty.js"></script>
		<script src="../js/deletion.js"></script>
		<title>Customs duty admin</title>
	</head>
	<body class="baseFont">
		<div id="dark"></div>
		<div id="main">
			<div class="menu grad grayBorders">
				<a href="?menu=cargo"><input class="button baseFont menu_button" type="button" value="Cargo list"></a>
				<a href="?menu=history"><input class="button baseFont menu_button" type="button" value="Duty history"></a>
				<a href="?menu=payments"><input class="button baseFont menu_button" type="button" value="Payments"></a>
                <a href="../index.php?logout="><input class="button baseFont menu_button" type="button" value="Log out"></a>
			</div>	
			<div id="adding" class="add_edit">
				<?php 
					if( isset( $_GET['menu'] ) && ( $_GET['menu'] == "payments" || $_GET['menu'] == "cargo" ) )
						include( "payments/payments_adding.php" );
				?>
			</div>
			<div id="editing" class="add_edit">
				<?php 
					if( isset( $_GET['menu'] ) && ( $_GET['menu'] == "payments" || $_GET['menu'] == "cargo" ) )
						include( "payments/payments_editing.php" );
				?>
			</div>			
			<div class="left_group grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) 
                                        {
                                            if( $_GET['menu'] == "cargo" )
                                                include( "cargo/cargo_left_group.php" );
                                            elseif( $_GET['menu'] == "history" )
                                                include( "history/history_left_group.php" );
                                            elseif( $_GET['menu'] == "payments" )
                                                include( "payments/payments_left_group.php" );						
					} 
                                        else 
                                            include( "cargo/cargo_left_group.php" );					
				?>
			</div>
			<div class="desc grad grayBorders">
				<?php 
					if( isset( $_GET['menu'] ) ) 
                                        {
                                            if( $_GET['menu'] == "cargo" )                                                 
                                                include( "cargo/cargo_desc_field.php" );						
                                            elseif( $_GET['menu'] == "history" )                                                 
                                                include( "history/history_desc_field.php" );
                                            elseif( $_GET['menu'] == "payments")
                                                include( "payments/payments_desc_field.php" );						
					} 
                                        else 
                                            include( "cargo/cargo_desc_field.php" );					
                                        DB::close();
				?>
			</div>
		</div>
	</body>
</html>
<?php
    }
?>