<?php
$shoes_on_pg = 9; //sets the number of shoes that will show up on a page to be 3.
$currpg = isset($_GET['p']) && is_numeric($_GET['p']) ? (int)$_GET['p'] : 1; //This the formating of the url, so it reflects the page number the customer is on.
$q = $pdo->prepare('SELECT * FROM shoe ORDER BY brand DESC LIMIT ?,?'); //gets all of the shoes based on their brand.
// bindValue will allow us to use integer in the SQL statement, we need to use for LIMIT
$q->bindValue(1, ($currpg - 1) * $shoes_on_pg, PDO::PARAM_INT); //binds 1 to the amount of shoes retrieved. 
$q->bindValue(2, $shoes_on_pg, PDO::PARAM_INT); //binds 2 to number of shoes on the page.
$q->execute(); //execs the query.
$shoes = $q->fetchAll(PDO::FETCH_ASSOC); //Gets the all the shoes in the db which is stored in an array so they can be worked with later on.
$num_of_shoes = $pdo->query('SELECT * FROM shoe')->rowCount(); //Counts the number of shoes that are in the db using countRow().
?>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <meta name="description" content="This is the description">
    <link rel="stylesheet" href="styles.css" />
    <script src="store.js" async></script>
    <script type="text/javascript">
        function search() {
    let input = document.getElementById('search').value
    input=input.toLowerCase();
    let x = document.getElementsByClassName('shop-item-title');
      
    for (i = 0; i < x.length; i++) { 
        if (!x[i].innerHTML.toLowerCase().includes(input)) {
            x[i].style.display="none";
        }
        else {
            x[i].style.display="list-item";                 
        }
    }
}
    </script>
</head>
<body>
<header class="main-header">
     <div class="navBar">
        <a href="MainPage.html">Home</a>
        <a  class="active" href="index.php?page=shoes">Shoes</a>
        <a href="Login.html">Log In</a>
        <a  href="Signup.html">Sign Up</a>

    </div>
    <h1 class="band-name band-name-large">Stock Z</h1>
</header>
 <?php
$v1 = "SELECT * FROM order_record";
$con = mysqli_connect('localhost','root','','DataProject');
$result1 = mysqli_query($con, $v1);
$order_info[] = array();
?>
<?php
    $v3 = "SELECT shoe_name, price FROM shoe where price=(SELECT MAX(price) FROM shoe)";
    $result3 = mysqli_query($con, $v3);
    $most_expen[] = array();
 ?>
    <?php if(isset($_POST['view3'])) {
        ?>
        <table>
            <tr>
                <th>Shoe Name</th>
                <th>Price</th>
            </tr>
            <?php
                while($most_expen = mysqli_fetch_assoc($result3)) {
                    ?>
                    <tr>
                        <td> <?php echo $most_expen['shoe_name']; ?> </td>
                        <td> <?php echo $most_expen['price']; ?> </td>
                    </tr>
                    <?php
                }
    }?>
        </table>
        
        <form method="POST">
            <input type="submit" name="view3" value="Highest Price">
        </form>

    <?php
$v2 = "SELECT * FROM shoes_in_carts";
$con = mysqli_connect('localhost','root','','DataProject');
$result2 = mysqli_query($con, $v2);
$shoes_in_carts[] = array();
?>
    <?php if(isset($_POST['view2'])) {
        ?>
        <table>
            <tr>
                <th>Shoe Name</th>
                <th>Stock</th>
            </tr>
            <?php
                while($shoes_in_carts = mysqli_fetch_assoc($result2)) {
                    ?>
                    <tr>
                        <td> <?php echo $shoes_in_carts['shoe_name'] . " "; ?> </td>
                        <td> <?php echo $shoes_in_carts['stock'] . " "; ?> </td>
                    </tr>
                    <?php
                }
    }?>
        </table>
        
        <form method="post">
            <input type="submit" name="view2" value="Shoes in Carts">
        </form>

    <div>
        <input type="text" onkeyup='search()' id="search" placeholder="Enter Keyword">
        <ul></ul>
    </div>


<?php foreach ($shoes as $shoe): ?>
<section class="container content-section">
    <h2 class="section-header">Brands</h2>
    <div class="shop-items">
        <div class="shop-item">
            <span class="shop-item-title"><?=$shoe['brand']?></span>
			<a href="index.php?page=shoe&shoe_id=<?=$shoe['shoe_id']?>">
			<img class="shop-item-image" src="images/<?=$shoe['image']?>" width="175" height="140" alt="<?=$shoe['shoe_name']?>">
			</a>
			<div class="shop-item-details">
                <span class="shop-item-price">&dollar;<?=$shoe['price']?></span>
                <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button>
            </div>
		</a>
        </div>
<?php endforeach; ?>


    </div>
</section>

<section class="container content-section">
    <h2 class="section-header">CART</h2>
    <div class="cart-row">
        <span class="cart-item cart-header cart-column">ITEM</span>
        <span class="cart-price cart-header cart-column">PRICE</span>
        <span class="cart-quantity cart-header cart-column">QUANTITY</span>
    </div>
    <div class="cart-items">
    </div>
    <div class="cart-total">
        <strong class="cart-total-title">Total</strong>
        <span class="cart-total-price">$0</span>
    </div>
        <button onclick="location.href = 'Payment.html';" class="btn btn-primary btn-purchase" type="button">PURCHASE</button>
</section>
<footer class="main-footer">
    <div class="container main-footer-container">
        
        <ul class="nav footer-nav">
            <li>
                <a href="https://www.youtube.com" target="_blank">
                    <img src="images/YouTube Logo.png">
                </a>
            </li>
            <li>
                <a href="https://www.spotify.com" target="_blank">
                    <img src="images/Spotify Logo.png">
                </a>
            </li>
            <li>
                <a href="https://www.facebook.com" target="_blank">
                    <img src="images/Facebook Logo.png">
                </a>
            </li>
        </ul>
    </div>
</footer>
</body>
</html>