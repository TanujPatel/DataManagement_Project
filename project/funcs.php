<?php
function pdo_connect_mysql() {
    $Host = 'localhost'; //set to host to localhost
    $User = 'root'; //sets the user to root
    $Pwd = ''; //sets pass to root password
    $db_name = 'project'; //sets the db name
    try {
    	return new PDO('mysql:host=' . $Host . ';dbname=' . $db_name . ';charset=utf8', $User, $Pwd); //starts the connection.
    } catch (PDOException $exception) {
    	die('Failed to connect to database!'); //kills the connection if it fails to connect.
    }
}
function pageHeader($title) {
	echo <<<EOT
	<!DOCTYPE html>
		<html lang="en">
			<head>
				<meta charset="UTF-8">
				<title>$title</title>
				<link rel="stylesheet" href="style.css" type="text/css">
				<title>Shoe Website</title>
			</head>
			<div class="navbar">
			<ul>
				<p>STORE NAME</p>
				<li><a href="index.php">Home</a></li>
				<li><a href="index.php?page=shoes">Inventory</a></li>
				<li><a href="#signin">sign in</a></li>
				<li><a href="#signup">sign up</a></li>
				<li><a href="#contact">Contact Us</a></li>
			</ul>
		</div>
		<main>
	EOT;
}
?>
