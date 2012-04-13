<?php    include_once('system_admin/users/users_db_funs.php');    include_once('DB.php');        $error='';        function logIn($login, $password)    {        global $error;        $user=get_user_by_name($login);        if($user==NULL || $user->haslo!=$password)        {            $error='Podano błędny login lub hasło';            return;        }                         switch($user->funkcja)        {            case 'Administrator portu':                $_SESSION['user_type']='port_admin';                break;            case 'Administrator ladunkow':                $_SESSION['user_type']='cargo_admin';                break;            case 'Administrator systemu':                $_SESSION['user_type']='system_admin';                break;            case 'Inspektor celny':                $_SESSION['user_type']='duty_admin';                break;            default:                $error='Błąd logowania';                return;        }                 $_SESSION['user'] = $user->id_Uzytkownik;            }	session_start();    DB::connect();		if( isset( $_GET['logout'] ) )         {		session_destroy();		session_start();				header( "Location: index.php" );	}		if( !isset( $_SESSION['user'] ) )     {		session_regenerate_id();		$_SESSION['user'] = 0;		$_SESSION['ip'] = $_SERVER['REMOTE_ADDR'];	}     else     {		if( isset( $_POST['done'] ) )         {			$login = $_POST['login'];			$password = sha1( $_POST['password'] );			logIn($login,$password);								}	}		if( isset( $_SESSION['user_type'] ) )     {		// tutaj na podstawie typu usera wyswietla ten panel, ktory trzeba		$type = $_SESSION['user_type'];		if( $type == 'system_admin' )         			header( "Location: system_admin/admin_system.php" );		elseif( $type == 'port_admin' )         			header( "Location: port_admin/port.php" );		elseif( $type == 'cargo_admin' )        			header( "Location: cargo_admin/cargo.php" );		        elseif( $type == 'duty_admin' )			header( "Location: duty_admin/duty.php" );			}			if( $_SESSION['ip'] != $_SERVER['REMOTE_ADDR'] )     {		die( 'Error in session' );          }			echo '<!DOCTYPE html>			<html lang="en">				<head>					<meta charset="iso-8859-2">					<link rel="stylesheet" type="text/css" href="style.css">					<title>Log in</title>				</head>				<body class="container baseFont" class="baseFont">';		echo'			<div class="login">				<form method="post">					<input type="hidden" name="done">					Login:<br>					<input class="loginput" type="text" name="login" placeholder="Login"><br>					Password:<br>					<input class="loginput" type="password" name="password" placeholder="Password"><br>					<input class="button" type="submit" value="Log in">				</form>			</div>';        echo $error;		echo '</body></html>';	        DB::close();?>