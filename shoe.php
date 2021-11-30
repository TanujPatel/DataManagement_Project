<?php
if (isset($_GET['shoe_id'])) { //checks if the url has the a shoe's id.
    $q = $pdo->prepare('SELECT * FROM shoe WHERE shoe_id = ?'); //prepares the query to get the shoe using the id the customer "specifies".
    $q->execute([$_GET['shoe_id']]); //execs the query.
    $shoe = $q->fetch(PDO::FETCH_ASSOC); //get the shoe from the db.

    if (!$shoe) { //check is the shoe exists.
        exit('Shoe not available!'); //error message if the id isn't in the 
    }
} else {
    exit('Shoe not available!'); //error message if id is not given.
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <meta name="description" content="This is the description">
    <link rel="stylesheet" href="styles.css" />
    <script src="store.js" async></script>
</head>
<body>
<header class="main-header">
     <div class="navBar">
        <a href="MainPage.html">Home</a>
        <a class="active" href="index.php?page=shoes">Shoes</a>
        <a href="Login.html">Log In</a>
        <a  href="Signup.html">Sign Up</a>

    </div>
    <h1 class="band-name band-name-large">Stock Z</h1>
</header>

<!-- Just the formating of the page -->
<div class="section-header">
    <img src="images/<?=$shoe['image']?>" width="300" height="200" alt="<?=$shoe['shoe_name']?>">
    <div>
        <h1 class="shop-item-title"><?=$shoe['shoe_name']?></h1>
        <span class="price">
            &dollar;<?=$shoe['price']?>
        </span>
		<div class="desc">
            <?=$shoe['descr']?>
        </div>
    </div>
</div>
</html>