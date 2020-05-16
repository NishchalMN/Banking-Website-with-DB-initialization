<html>
<head>
	<link rel="stylesheet" type="text/css" href="Success.css">
</head>
<header></header>
<body>
<?php
	extract($_POST);
	$db=mysqli_connect('localhost:3306','root','','bank1');
	
	if(isset($db))
	{   
		$acc_no = $_POST['acc_no'];
		$racc_no = $_POST['racc_no'];
		$ifsc = $_POST['ifsc'];
		$cust_id = $_POST['cust_id'];
		$amount = $_POST['amount'];
		$passwrd = $_POST['passwrd'];
		//$sel_acc_no = $_POST['sel_acc_no'];INSERT INTO `transaction` VALUES('$dacc_no',NULL,'$amount','$dat','$tim');

		//$stmt="UPDATE account SET Account_balance=Account_balance-'$amount' WHERE Customer_id='$cust_id' AND Account_balance>'$amount');";
		$sa="SELECT * FROM account WHERE Customer_id='$cust_id' AND EXISTS (SELECT * FROM `customer` WHERE Customer_id='$cust_id' AND Password='$passwrd');";
		$usa=mysqli_query($db,$sa);
		if ($usa) 
		{
			if (mysqli_num_rows($usa) > 0) 
			{
				$comp = mysqli_fetch_assoc($usa);
				if($comp['Account_balance'] >= $amount)
				{
					$stmt="UPDATE account SET Account_balance=Account_balance-'$amount' WHERE Customer_id='$cust_id';";
		
					$us=mysqli_query($db,$stmt);
					if ($us) 
					{
						if ($us > 0) 
						{
							$stmtb="UPDATE account SET Account_balance=Account_balance+'$amount' WHERE '$acc_no'='$racc_no' AND Account_no='$racc_no';";
							$usb=mysqli_query($db,$stmtb);
							if ($usb > 0) 
							{
								$rand1=mt_rand(1000000,9999999);
								$rand2=mt_rand(1000001,9999999);
								$dat=date('Y-m-d');
								$tim=date('H:i:s');
								$dacc_no=$comp['Account_no'];
							
								$tc="INSERT INTO transaction VALUES('".$acc_no."','".$amount."',NULL,'".$rand1."','".$dat."','".$tim."');";
								$td="INSERT INTO transaction VALUES('".$dacc_no."',NULL,'".$amount."','".$rand2."','".$dat."','".$tim."');";
								$ustc=mysqli_query($db,$tc);
								$ustd=mysqli_query($db,$td);
								if ($ustd)
								{
									echo "aithu";
								}
								else
								{
									echo "aagilla";
								}

								echo '<h2 id = "done">"Transaction Successful :)"</h2>';

								echo '<div class="button">
										<a href="inside.html" class = "btn">Go back to main Page</a>
									  </div>';
							}
							else 
							{
								echo '<h2 id = "done">"Insufficient Balance..."</h2>';	
								echo '<div class="button">
										<a href="inside.html" class = "btn">Go back to main Page</a>
									  </div>';
							}
						} 
						else 
						{
							echo '<h2 id = "done">"Please try later.."</h2>';	
							echo '<div class="button">
									<a href="inside.html" class = "btn">Go back to main Page</a>
								  </div>';
						}	
					}
					else 
					{
						echo '<h2 id = "done">"Something went wrong"</h2>';	
						echo '<div class="button">
								<a href="inside.html" class = "btn">Go back to main Page</a>
							  </div>';
					}
				}
				else 
				{
					echo '<h2 id = "done">"Insufficient Balance..."</h2>';	
					echo '<div class="button">
							<a href="inside.html" class = "btn">Go back to main Page</a>
						  </div>';
				}

			}
			else{
			echo '<h2 id = "done">"Invalid customer ID or password...try again"</h2>';	
					echo '<div class="button">
							<a href="inside.html" class = "btn">Go back to main Page</a>
						  </div>';}
		}
	}
?>
</html>