<?php
function pdo_connect_mysql() {
    $DATABASE_HOST = 'localhost'; //set to host to localhost
    $DATABASE_USER = 'root'; //sets the user to root
    $DATABASE_PASS = ''; //sets pass to root password
    $DATABASE_NAME = 'project'; //sets the db name
    try {
    	return new PDO('mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8', $DATABASE_USER, $DATABASE_PASS); //starts the connection.
    } catch (PDOException $exception) {
    	die('Failed to connect to database!'); //kills the connection if it fails to connect.
    }
}
function pageHeader($title) {
	//$num_items_in_cart = isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0;
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
