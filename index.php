<?php
session_start(); //initiates session.
include 'funcs.php'; //include fucn.php as the connection info is there and needs to be used.
$pdo = pdo_connect_mysql(); //connects to the db.
$page = isset($_GET['page']) && file_exists($_GET['page'] . '.php') ? $_GET['page'] : 'home'; //send the customer to home.php
include $page . '.php'; //show the page.
?>