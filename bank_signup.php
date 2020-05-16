<html>

<head>
	<link rel="stylesheet" type="text/css" href="Success.css">
</head>
<header></header>

<?php
	extract($_POST);
	$db=mysqli_connect('localhost:3306','root','','bank1');
	
	if(isset($db))
	{
		$uid = $_POST['uid'];
		$email = $_POST['email'];
		$passwrd = $_POST['passwrd'];
		$stmt="UPDATE customer SET Email_id='$email',Password='$passwrd' WHERE Customer_id='$uid'";

		$us=mysqli_query($db,$stmt);
		
		if ($us) {
			if ($us > 0) {
				echo '<h2 id = "done">"Signed in Successfully"</h2>';

				echo '<div class="button">
						<a href="bank_login.html" class = "btn">Go to Login Page</a>
					  </div>';
			} else {
				echo '<h2 id = "done">"Sorry Customer ID does not exist...please see at the first page of your passbook"</h2>';	
				echo '<div class="button">
						<a href="bank_signup.html" class = "btn">Go back to Signup Page</a>
					  </div>';
			}	
		} else {
			echo '<h2 id = "done">"Something went wrong please try later"</h2>';	
			echo '<div class="button">
					<a href="bank_signup.html" class = "btn">Go back to Signup Page</a>
				  </div>';
		}
	}
?>
</html>