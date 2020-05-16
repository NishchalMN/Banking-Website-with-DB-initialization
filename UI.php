
<?php
	$db = pg_connect("host=localhost user=postgres dbname=bank");
	if (isset($db)) {
		echo "Suxus";	
	} else {
		echo "Nope";
	}
?>