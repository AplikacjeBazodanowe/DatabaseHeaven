<?php	session_start();		if( isset( $_GET['out'] ) ) {		session_destroy();		session_start();	}		if( !isset( $_SESSION['user'] ) ) {		session_regenerate_id();		$_SESSION['user'] = 0;		$_SESSION['ip'] = $_SERVER['REMOTE_ADDR'];	} else {		if( isset( $_POST['done'] ) ) {			$login = $_POST['login'];			$password = md5( $_POST['password'] );						// tutaj jakies porownanie z danymi z bazy			// haslo: kabacik			if( $login == "jajcek" && $password == "a6017ce91eb02c0dcce569283a00e89c" ) {				$_SESSION['user_type'] = 'system_admin';				$_SESSION['user_name'] = 'jajcek';			}		}	}		if( isset( $_SESSION['user_type'] ) ) {		// tutaj na podstawie typu usera wyswietla ten panel, ktory trzeba		$type = $_SESSION['user_type'];		if( $type == 'system_admin' ) {			//header( "Location: system_admin/admin_system.php" );		} elseif( $type == 'port_admin' ) {			//header( "Location: port_admin/port.php" );		} elseif( $type == 'cargo_admin' ) {			//header( "Location: cargo_admin/cargo.php" );		} elseif( $type == 'duty_admin' ) {			//header( "Location: duty_admin/duty.php" );		}	}			if( $_SESSION['ip'] != $_SERVER['REMOTE_ADDR'] ) {		die( 'Error in session' );          }			echo '<!DOCTYPE html>			<html lang="en">				<head>					<meta charset="iso-8859-2">					<link rel="stylesheet" type="text/css" href="style.css">					<title>Log in</title>				</head>				<body class="container baseFont" class="baseFont">';		echo'			<div class="login">				<form method="post">					<input type="hidden" name="done">					Login:<br>					<input class="loginput" type="text" name="login" placeholder="Login"><br>					Password:<br>					<input class="loginput" type="password" name="password" placeholder="Password"><br>					<input class="button" type="submit" value="Log in">				</form>			</div>';		echo '</body></html>';	?>