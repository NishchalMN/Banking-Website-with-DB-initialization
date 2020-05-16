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
				$sa="SELECT * FROM `transaction` WHERE Account_no='$acc' ORDER BY Transaction_date ASC;";
				$usa=mysqli_query($db,$sa);?>

				<table style="width:100%">
					  <caption>Transaction report</caption>
					  <tr>
					    <th>Transaction_id</th>
					    <th>Credit</th>
					    <th>Debit</th>
					    <th>Date</th>
					    <th>Time</th>
					  </tr>
				<?php while ($row = mysqli_fetch_assoc($usa)) 
				{?>
					  <tr>
					    <td><?php echo $row['Transaction_id']; ?></td>
					    <td><?php echo $row['Credit']; ?></td>
					    <td><?php echo $row['Debit']; ?></td>
					    <td><?php echo $row['Transaction_date']; ?></td>
					    <td><?php echo $row['Transaction_time']; ?></td>
					  </tr>
				<?php } 
				$ct="SELECT SUM(Credit) AS csum FROM `transaction` WHERE Account_no='$acc';";
				$dt="SELECT SUM(Debit) AS dsum FROM `transaction` WHERE Account_no='$acc';";
				$tc=mysqli_query($db,$ct);
				$td=mysqli_query($db,$dt);
				$ctotal = mysqli_fetch_assoc($tc);
				$dtotal = mysqli_fetch_assoc($td);
				?>
				<tr>
					<td><b>TOTAL</b></td>
					<td><?php echo $ctotal['csum']; ?></td>
					<td><?php echo $dtotal['dsum']; ?></td>
					<td></td>
					<td></td>
				</tr>
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

