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
		$stmt="SELECT Account_no FROM `account` WHERE Customer_id IN (SELECT Customer_id FROM `customer` WHERE Email_id='$em_id');";

		$us=mysqli_query($db,$stmt);
		
		if ($us) 
		{
			if (mysqli_num_rows($us) > 0) 
			{
				$comp = mysqli_fetch_assoc($us);
				$acc = $comp['Account_no'];
				$sa="SELECT * FROM loan WHERE Account_no='$acc' ORDER BY Due_date DESC;";
				$usa=mysqli_query($db,$sa);?>

				<table style="width:100%">
					  <caption>Loan report</caption>
					  <tr>
					    <th>Loan no</th>
					    <th>Type</th>
					    <th>Amount</th>
					    <th>Interest</th>
					    <th>days remaining</th>
					  </tr>
				<?php while ($row = mysqli_fetch_assoc($usa)) 
				{?>
					  <tr>
					    <td><?php echo $row['Loan_no']; ?></td>
					    <td><?php echo $row['Loan_type']; ?></td>
					    <td><?php echo $row['Loan_amount']; ?></td>
					    <td><?php echo $row['Loan_interest']; ?></td>

					   <?php
					    $dat1=date('Y-m-d');
					    $dat2=$row['Due_date'];
					    $days1 = "SELECT DATEDIFF('$dat2','$dat1') AS days;";
					    $days2 = mysqli_query($db,$days1);
					    $days3 = mysqli_fetch_assoc($days2);
					    ?>
					    <td><?php echo $days3['days']; ?></td>
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

