<html>
<head>
	<link rel="stylesheet" type="text/css" href="Success.css">
</head>
<header></header>

<?php
	session_start();

	extract($_GET);
	$db=mysqli_connect('localhost:3306','root','','bank1');

	if(isset($db))
	{
		$email = $_GET['email'];
		$passwrd = $_GET['passwrd'];

		$_SESSION['x'] = $email;
		$_SESSION['y'] = $passwrd;

		$sql="SELECT * FROM `customer` WHERE Email_id='$email' AND Password='$passwrd' ";
		$result=mysqli_query($db, $sql);

		if (mysqli_num_rows($result) > 0) {
			echo '<script type="text/javascript">
					function loadnew(){
						window.location="inside.html";
					}
					</script>
					<body onload="setTimeout(\'loadnew()\',3000)">
					<h2 id="done">This Page will be redirected in 3 seconds :)</h2>
					</body>';
		}
		else {
			echo '<h2 id = "done">"Your Email or Password is wrong...Please try again."</h2>';
		}
	}
	else {
		echo "PHP not working!";
	}
?>
</html>
