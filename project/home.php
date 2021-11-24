<?php
$q = $pdo->prepare('SELECT * FROM shoe ORDER BY brand DESC LIMIT 3'); //get 3 shoes from the db.
$q->execute();
$shoes = $q->fetchAll(PDO::FETCH_ASSOC);
?>

<?=pageHeader('Home')?>

    <div class="background-container">
 
    <!-- Products -->
    <h3 id="products">Most Popular sneakers :</h3>
    <div class="shoes">
        <?php foreach ($shoes as $shoe): ?>
        <a href="index.php?page=shoe&shoe_id=<?=$shoe['shoe_id']?>" class="product">
            <img src="images/<?=$shoe['image']?>" width="175" height="125" alt="<?=$shoe['shoe_name']?>">
            <span class="name"><?=$shoe['shoe_name']?></span>
            <span class="price">
                &dollar;<?=$shoe['price']?>
            </span>
        </a>
        <?php endforeach; ?>
    </div>

    <!-- About Section -->
    <div id="about" class="about">
        <h2>About Us</h2>
        
    </div>

    
    <!-- Footer -->
    <footer>
        <p></p>
    </footer>

</div>

</body>
</html>