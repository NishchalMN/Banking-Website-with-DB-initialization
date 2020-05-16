<html>
<head>
	<link rel="stylesheet" type="text/css" href="Success.css">
</head>
<header></header>
<body>
<?php
	session_start();
	$em_id=$_SESSION['x'];
	extract($_POST);
	$db=mysqli_connect('localhost:3306','root','','bank1');
	
	if(isset($db))
	{
		$stmt="SELECT Account_no FROM `account` WHERE Customer_id IN (SELECT Customer_id FROM `customer` WHERE Email_id='$em_id');";

		$us=mysqli_query($db,$stmt);
		
		if ($us) 
		{
			if (mysqli_num_rows($us) > 0) 
			{
				$comp = mysqli_fetch_assoc($us);
				$acc = $comp['Account_no'];
				$sa="SELECT Wallet_balance FROM `wallet` WHERE Account_no='$acc';";
				$usa=mysqli_query($db,$sa);
				$balance = mysqli_fetch_assoc($usa);
				 ?>

				<h2 id = "done">Your Balance is Rs.<?php echo $balance['Wallet_balance'] ?></h2>
				<div class="button">
					<a href="inside.html" class = "btn">Go back to main Page</a>
				</div>
			<?php	} }
			else 
			{
				echo '<h2 id = "done">"Sorry Customer ID does not exist...please see at the first page of your passbook"</h2>';	
				echo '<div class="button">
						<a href="inside.html" class = "btn">Go back to main Page</a>
					  </div>';
			}
		}
	?>
	
</body>
</html>