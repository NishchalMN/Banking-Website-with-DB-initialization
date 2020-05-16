<html>
<head>
	<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
</style>
	<link rel="stylesheet" type="text/css" href="tab.css">
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
		$stmt="SELECT Customer_id FROM `customer` WHERE Email_id='$em_id';";

		$us=mysqli_query($db,$stmt);
		
		if ($us) 
		{
			if (mysqli_num_rows($us) > 0) 
			{
				$comp = mysqli_fetch_assoc($us);
				$cid = $comp['Customer_id'];
				$sa="SELECT * FROM `nominee` WHERE Customer_id='$cid';";
				$usa=mysqli_query($db,$sa);?>

				<table style="width:100%">
					  <caption>Nominees</caption>
					  <tr>
					    <th>First name</th>
					    <th>Last name</th>
					    <th>Age</th>
					    <th>Relation</th>
					    <th>Gender</th>
					  </tr>
				<?php while ($row = mysqli_fetch_assoc($usa)) 
				{?>
					  <tr>
					    <td><?php echo $row['N_Fname']; ?></td>
					    <td><?php echo $row['N_Lname']; ?></td>
					    <td><?php echo $row['N_age']; ?></td>
					    <td><?php echo $row['N_relation']; ?></td>
					    <td><?php echo $row['N_Gender']; ?></td>
					  </tr>
				<?php } ?>
			</table>
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

