 <!--------------------------------------------- -->
 <!---------------------View 1------------------------ -->
 <?php
$v1 = "SELECT * FROM order_record";
$con = mysqli_connect('localhost','root','','project');
$result1 = mysqli_query($con, $v1);
$order_info[] = array();
?>

	<?php if(isset($_POST['view1'])) {
		?>
		<table>
			<tr>
				<th>Customer Id</th>
				<th>Order Id</th>
				<th>Payment Type</th>
			</tr>
			<?php
				while($order_info = mysqli_fetch_assoc($result1)) {
					?>
					<tr>
						<td> <?php echo $order_info['cust_id'] . " "; ?> </td>
						<td> <?php echo $order_info['order_id'] . " "; ?> </td>
						<td> <?php echo $order_info['payment_type'] . " "; ?> </td>
					</tr>
					<?php
				}
			}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view1" value="Admin Order Info">
		</form>
 <!--------------------------------------------- -->
 <!---------------------View 2------------------------ -->
 <?php
$v2 = "SELECT * FROM shoes_in_carts";
$con = mysqli_connect('localhost','root','','project');
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
 <!--------------------------------------------- -->
 <!---------------------View 3------------------------ -->
 <?php
	$v3 = "SELECT * FROM highest_price";
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
		
		<form method="post">
			<input type="submit" name="view3" value="Highest Price">
		</form>
  <!--------------------------------------------- -->
 <!---------------------View 4------------------------ -->
 <?php
	$v4 = "SELECT * FROM paid_users";
	$result4 = mysqli_query($con, $v4);
	$paid[] = array();
?>
	<?php if(isset($_POST['view4'])) {
		?>
		<table>
			<tr>
				<th>Customer Name</th>
				<th>Customer ID</th>
				<th>Payment Info</th>
			</tr>
			<?php
				while($paid = mysqli_fetch_assoc($result4)) {
					?>
					<tr>
						<td> <?php echo $paid['cust_username']; ?> </td>
						<td> <?php echo $paid['cust_id']; ?> </td>
						<td> <?php echo $paid['payment_type']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view4" value="Paid Customers">
		</form>
  <!--------------------------------------------- -->
   <!---------------------View 5------------------------ -->
<?php
	$v5 = "SELECT * FROM distinct_cart_shoes";
	$result5 = mysqli_query($con, $v5);
	$disti_cart_shoe[] = array();
?>
	<?php if(isset($_POST['view5'])) {
		?>
		<table>
			<tr>
				<th>Item Id</th>
			</tr>
			<?php
				while($disti_cart_shoe = mysqli_fetch_assoc($result5)) {
					?>
					<tr>
						<td> <?php echo $disti_cart_shoe['item_id']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view5" value="Unique Shoes in Cart">
		</form>
  <!--------------------------------------------- -->
   <!---------------------View 6------------------------ -->
<?php
	$v6 = "SELECT * FROM total_cost";
	$result6 = mysqli_query($con, $v6);
	$t_cost[] = array();
?>
	<?php if(isset($_POST['view6'])) {
		?>
		<table>
			<tr>
				<th>Cart Id</th>
				<th>Total Cost Before Tax</th>
			</tr>
			<?php
				while($t_cost = mysqli_fetch_assoc($result6)) {
					?>
					<tr>
						<td> <?php echo $t_cost['cart_id']; ?> </td>
						<td> <?php echo $t_cost['total_cost']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view6" value="Cost Before Tax">
		</form>
  <!--------------------------------------------- -->
   <!---------------------View 7------------------------ -->
<?php
	$v7 = "SELECT * FROM amount_taxed";
	$result7 = mysqli_query($con, $v7);
	$t_cost_tax[] = array();
?>
	<?php if(isset($_POST['view7'])) {
		?>
		<table>
			<tr>
				<th>Cart Id</th>
				<th>Total Cost Taxed</th>
			</tr>
			<?php
				while($t_cost_tax = mysqli_fetch_assoc($result7)) {
					?>
					<tr>
						<td> <?php echo $t_cost_tax['cart_id']; ?> </td>
						<td> <?php echo $t_cost_tax['amount_owed']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view7" value="Cost After Taxed">
		</form>
  <!--------------------------------------------- -->
   <!---------------------View 8------------------------ -->
<?php
	$v8 = "SELECT * FROM inventory";
	$result8 = mysqli_query($con, $v8);
	$inv[] = array();
?>
	<?php if(isset($_POST['view8'])) {
		?>
		<table>
			<tr>
				<th>Stock</th>
				<th>Shoe Name</th>
				<th>Price</th>
			</tr>
			<?php
				while($inv = mysqli_fetch_assoc($result8)) {
					?>
					<tr>
						<td> <?php echo $inv['stock']; ?> </td>
						<td> <?php echo $inv['shoe_name']; ?> </td>
						<td> <?php echo $inv['price']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view8" value="Simplified Inventory">
		</form>
  <!--------------------------------------------- -->
   <!---------------------View 9------------------------ -->
<?php
	$v9 = "SELECT * FROM num_users";
	$result9 = mysqli_query($con, $v9);
	$user_count[] = array();
?>
	<?php if(isset($_POST['view9'])) {
		?>
		<table>
			<tr>
				<th>Customer Count</th>
			</tr>
			<?php
				while($user_count = mysqli_fetch_assoc($result9)) {
					?>
					<tr>
						<td> <?php echo $user_count['cust_count']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view9" value="Customer Count">
		</form>	
  <!--------------------------------------------- -->
   <!---------------------View 10------------------------ -->		
<?php
	$v10 = "SELECT * FROM later_order";
	$result10 = mysqli_query($con, $v10);
	$late_order[] = array();
?>
	<?php if(isset($_POST['view10'])) {
		?>
		<table>
			<tr>
				<th>Customer Id</th>
				<th>Order Id</th>
			</tr>
			<?php
				while($late_order = mysqli_fetch_assoc($result10)) {
					?>
					<tr>
						<td> <?php echo $late_order['cust_id']; ?> </td>
						<td> <?php echo $late_order['order_id']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table>
		
		<form method="post">
			<input type="submit" name="view10" value="Late Orders">
		</form>	
  <!--------------------------------------------- -->
   <!---------------------View 11------------------------ -->	
<?php
	$v11 = "SELECT * FROM percentage_late";
	$result11 = mysqli_query($con, $v11);
	$percentageLate[] = array();
?>
	<?php if(isset($_POST['view11'])) {
		?>
		<table>
			<tr>
				<th>Late Percentage</th>
			</tr>
			<?php
				while($percentageLate = mysqli_fetch_assoc($result11)) {
					?>
					<tr>
						<td> <?php echo $percentageLate['percentage_late']; ?> </td>
					</tr>
					<?php
				}
	}?>
		</table> 
		
		<form method="post">
			<input type="submit" name="view11" value="Late Percentage">
		</form>	