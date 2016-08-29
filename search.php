<?php
    require_once '/opt/lampp/htdocs/shophoa/functions/dbconnect.php';

?>
<?php 
	if(isset($_POST['searchtxt']))
	{
		$searchtxt=$mysqli->real_escape_string($_POST['searchtxt']);
		$sql="SELECT * FROM sanpham WHERE tensp like '%{$searchtxt}%' LIMIT 5";
		$result=$mysqli->query($sql);
		if(mysqli_num_rows($result)>0)
		{
?>
		<h2 class="headsearch"><a href="timtheoten.php?idkey=<?php echo $searchtxt ?>">Tất cả tên sản phẩm tìm được</a></h2>
		<ul class="listsearch">
<?php 
			while($arr=mysqli_fetch_assoc($result))
			{
                $id_sp = $arr['id_sp'];
				$tensp=$arr['tensp'];
				$id_loaisp=$arr['id_loaisp'];
				$hinhanh=$arr['hinhanh'];
                $gia = $arr['giasp'];
                $gia = number_format($gia,0,'.','.');
?>
			<li class="itemsearch">
				<div class="imgsearch">
<?php 
		if($hinhanh!="")
		{
?>						
					<a href="sanpham.php?id_sp=<?php echo $id_sp?>"><img src="/shophoa/files/<?php echo $hinhanh ?>" /></a>
<?php 
		}else 
		{
?>
					<a href="sanpham.php?id_sp=<?php echo $id_sp?>"><img src="/shophoa/images/images.png" /></a>
<?php 
		}
?>
				</div>
				<div class="infosearch">
					<h3><a href="sanpham.php?id_sp=<?php echo $id_sp?>"><?php echo $tensp ?></a></h3>
<?php 
			$sqltg="SELECT loaisp FROM loaisp WHERE id_loaisp='{$id_loaisp}' ";
			$querytg=$mysqli->query($sqltg);
			if(mysqli_num_rows($querytg)==1)
			{
				$rowtg=mysqli_fetch_assoc($querytg);
				$tenloai=$rowtg['loaisp'];
		?>
				<span><a href="loaisanpham.php?loaisp=<?php echo $id_loaisp ?>"><?php echo $tenloai ?></a></span>
		<?php 	
			}
        ?>
        <p style = "color:#C22B3B; ">
            Giá : <?php echo $gia;?>
        </p>
				</div>
				<div class="clear"></div>
			</li>
<?php 
	           }
?>
		</ul>
<?php 
		}
    }
?>

