<?php
$shoes_on_pg = 3; //sets the number of shoes that will show up on a page to be 3.
$currpg = isset($_GET['p']) && is_numeric($_GET['p']) ? (int)$_GET['p'] : 1; //This the formating of the url, so it reflects the page number the customer is on.
$q = $pdo->prepare('SELECT * FROM shoe ORDER BY brand DESC LIMIT ?,?'); //gets all of the shoes based on their brand.
// bindValue will allow us to use integer in the SQL statement, we need to use for LIMIT
$q->bindValue(1, ($currpg - 1) * $shoes_on_pg, PDO::PARAM_INT); //binds 1 to the amount of shoes retrieved. 
$q->bindValue(2, $shoes_on_pg, PDO::PARAM_INT); //binds 2 to number of shoes on the page.
$q->execute(); //execs the query.
$shoes = $q->fetchAll(PDO::FETCH_ASSOC); //Gets the all the shoes in the db which is stored in an array so they can be worked with later on.
$num_of_shoes = $pdo->query('SELECT * FROM shoe')->rowCount(); //Counts the number of shoes that are in the db using countRow().
?>

<?=pageHeader('Shoes')?> 
<div class="shoes content-wrapper">
    <h1>Shoes</h1>
    <p class="shoeNum"><?=$num_of_shoes?> Shoes Available</p>
    <div class="shoeWrapper">
        <?php foreach ($shoes as $shoe): ?>
        <a href="index.php?page=shoe&shoe_id=<?=$shoe['shoe_id']?>" class="shoe">
            <img src="images/<?=$shoe['image']?>" width="175" height="140" alt="<?=$shoe['shoe_name']?>">
            <span class="name"><?=$shoe['shoe_name']?></span>
            <span class="price">
                &dollar;<?=$shoe['price']?>
            </span>
        </a>
        <?php endforeach; ?>
    </div>
    <div class="btns">
        <?php if ($currpg > 1): ?>
        <a class="Prev" href="index.php?page=shoes&p=<?=$currpg - 1?>">Previous </a>
        <?php endif; ?>
        <?php if ($num_of_shoes > ($currpg * $shoes_on_pg) - $shoes_on_pg + count($shoes)): ?>
        <a class="Next" href="index.php?page=shoes&p=<?=$currpg + 1?>"> Next</a>
        <?php endif; ?>
    </div>
</div>