<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php require_once '/opt/lampp/htdocs/shophoa/functions/dbconnect.php';?>
<?php
	$sql = "SELECT * FROM gioithieu";
	$result = $mysqli->query($sql);
	$arr = mysqli_fetch_assoc($result);
	$noidung = $arr['noidung'];
	echo $noidung;
?>
<?php include '/opt/lampp/htdocs/shophoa/include/footer.php';?>