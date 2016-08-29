<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php include '/opt/lampp/htdocs/shophoa/functions/define.php';?>
<?php
    if(isset($_GET['id_loaisp'])){
        $idsp = $_GET['id_loaisp'];
        $sql = "SELECT * FROM loaisp WHERE id_loaisp = '$idsp'";
        $result = $mysqli->query($sql);
        $arr = mysqli_fetch_assoc($result);
        $loaisp = $arr['loaisp'];
    }else
    {
        $loaisp = "All Shoes";
    }
?>
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Home">Home</a><span>—›</span></li>


                <li><strong><?php echo $loaisp;?></strong></li>


            </ul>
        </div>
    </div>
</div>

<!-- Two columns content -->
<div class="main-container col2-left-layout">
    <div class="main container">
        <div class="row">
            <section class="col-main col-sm-9 col-sm-push-3">
                <div class="category-description std">
                    <div class="slider-items-products">
                        <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                            <div class="slider-items slider-width-col1">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="category-title">
                    <h1><?php echo $loaisp;?></h1>
                </div>
                <div class="category-products">

                    <ul class="products-grid hidden_btn_cart">
                        <?php
                            if(isset($_GET['id_loaisp'])){
                                $id = $_GET['id_loaisp'];
                                $sql_sp = "SELECT * FROM sanpham WHERE id_loaisp = '$id'";

                            }else
                            {
                                 $sql_sp = "SELECT * FROM sanpham";
                            }
                            $result = $mysqli->query($sql_sp);
                            $tsd = mysqli_num_rows($result);
                            $rowcount = pl_rowcount;
                            if(isset($_GET['trang'])){
                                $currentpage = $_GET['trang'];
                            }else
                            {
                                $currentpage = 1;
                            }
                            $offset = ($currentpage - 1) * $rowcount; 
                            $sql_sp = $sql_sp.' ORDER BY id_sp DESC LIMIT '.$offset.','.$rowcount;
                            $result = $mysqli->query($sql_sp);
                            while ($arr_sp = mysqli_fetch_assoc($result)) {
								$id_sp = $arr_sp['id_sp'];
                                $tensp = $arr_sp['tensp'];
                                $gia = $arr_sp['giasp'];
                                $gia = number_format($gia,0,'.','.');
                                $hinh = $arr_sp['hinhanh'];
                                $ten = convertUtf8ToLatin($tensp);
                                $url_chitiet = "chi-tiet-san-pham/{$ten}-{$id_sp}.html";
                                
                        ?>
                        <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6">

                             <div class="col-item">

                                <div class="product-image-area">
                                    <a class="product-image" title="<?php echo $tensp;?>" href="<?php echo $url_chitiet?>">
                                        <img src="files/<?php echo $hinh;?>" class="img-responsive" alt="<?php echo $tensp;?>" />
                                    </a>
                                    
                                </div>
                                <div class="info">
                                    <div class="info-inner">
                                        <div class="item-title"> <a title="<?php echo $tensp;?>" href="chitietsp.php?id_sp=<?php echo $id_sp;?>"><?php echo $tensp;?></a> </div>
                                        <!--item-title-->
                                        <div class="item-content">

                                            <div class="price-box">
                                                <p class="special-price"> <span class="price"><?php echo $gia;?></span> </p>
                                            </div>

                                        </div>
                                        <!--item-content-->
                                    </div>
                                    <!--info-inner-->
                                   
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </li>
                        <?php }?>
                        




                    </ul>
                    <div class="toolbar">
                        <div class="pager">
                            <div class="pages">
                                <label>Trang:</label>
                                <ul class="pagination">
                                    <?php
                                        $ten = convertUtf8ToLatin($loaisp);
                                        $tongsotrang = ceil($tsd/$rowcount);
                                        for($i=1;$i<=$tongsotrang;$i++){
                                            if($i == $currentpage)
                                            {
                                                $active = 'class="active" style="pointer-events:none"';
                                            }else
                                            {
                                                $active = '';
                                            }
                                            if(isset($_GET['id_loaisp'])){
                                                $id_loaisp = $_GET['id_loaisp'];
                                                $link = "san-pham/{$ten}-{$id_loaisp}-p{$i}.html";
                                            }else
                                            {
                                                $link = "san-pham/{$ten}/trang{$i}/";
                                            }
                                    ?>
                                     <li <?php echo $active;?>><a href="<?php echo $link;?>" ><?php echo $i;?></a></li>
                                    <?php
                                        }

                                    ?>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
            </section>
            <aside class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                <div class="side-nav-categories">
                    <div class="block-title"> Danh mục sản phẩm </div>
                    <!--block-title-->
                    <!-- BEGIN BOX-CATEGORY -->
                    <div class="box-content box-category">
                        <ul>
                           <?php
                                $sql = "SELECT * FROM loaisp";
                                $result = $mysqli->query($sql);
                                while($arr = mysqli_fetch_assoc($result)){
                                    $id_loaisp = $arr['id_loaisp'];
                                    $loaisp = $arr['loaisp'];
                                    if(isset($_GET['id_loaisp'])){
                                        if($id_loaisp == $_GET['id_loaisp']){
                                            $active = 'class="active"';
                                        }else
                                        {
                                            $active = '';
                                        }
                                    }
                                    $ten = convertUtf8ToLatin($loaisp);
                                    $url_chitiet1 = "san-pham/{$ten}-{$id_loaisp}.html";
                            ?>

                            <li> <a <?php echo $active;?>  href="<?php echo $url_chitiet1;?>"><?php echo $loaisp;?></a> </li>

                            <?php 
                                }
                            ?>
                        </ul>
                    </div>
                    <!--box-content box-category-->
                </div>
                
            </aside>
        </div>
    </div>
</div>
<?php include '/opt/lampp/htdocs/shophoa/include/footer.php';?>