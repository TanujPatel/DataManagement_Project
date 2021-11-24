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

<?=pageHeader('Shoe')?>
<!-- Just the formating of the page -->
<div class="shoe content-wrapper">
    <img src="images/<?=$shoe['image']?>" width="300" height="200" alt="<?=$shoe['shoe_name']?>">
    <div>
        <h1 class="name"><?=$shoe['shoe_name']?></h1>
        <span class="price">
            &dollar;<?=$shoe['price']?>
        </span>
		<div class="desc">
            <?=$shoe['descr']?>
        </div>
        <form action="index.php?page=cart" method="post">
            <input type="number" name="quantity" value="1" min="1" max="<?=$shoe['stock']?>" placeholder="Quantity" required>
            <input type="hidden" name="shoe_id" value="<?=$shoe['shoe_id']?>">
            <input type="submit" value="Add To Cart">
        </form>
    </div>
</div>