<?php
	ob_start();
	session_start();
	if(isset($_SESSION['taikhoan'])){
		unset($_SESSION['taikhoan']);
		unset($_SESSION['matkhau']);
		unset($_SESSION['name']);
		header("LOCATION: index.php");
	}
	ob_end_flush();
?>