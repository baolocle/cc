<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php include '/opt/lampp/htdocs/shophoa/functions/define.php';?>


<?php

    if(isset($_GET['id_sp'])){

        $id_sp = $_GET['id_sp'];

        $cookieName='hoa_'.$id_sp;

        if(!isset($_COOKIE["$cookieName"]))

        {

            setcookie("$cookieName","1",time()+3600);
            
            $sql = "UPDATE sanpham SET view = view + 1 WHERE id_sp= $id_sp ";
            $result = $mysqli->query($sql);
        }

        $sql = "SELECT loaisp.loaisp,sanpham.* FROM sanpham INNER JOIN loaisp ON sanpham.id_loaisp =loaisp.id_loaisp WHERE id_sp = '$id_sp'";
        $result = $mysqli->query($sql);
        $arr = mysqli_fetch_assoc($result);
        $id_loaisp = $arr['id_loaisp'];
        $loaisp = $arr['loaisp'];
        $tensp = $arr['tensp'];
        $gia = $arr['giasp'];
        $giaf = number_format($gia,0,'.','.');
        $chitiet = $arr['chitiet'];
        $mota = $arr['mota'];
        $hinhanh = $arr['hinhanh'];
        $ten = convertUtf8ToLatin($loaisp);
        $url_chitiet = "/loai-san-pham/{$ten}-{$id_loaisp}.html";
    }
?>
<?php
    if(isset($_POST['them'])){
        $id_sp = $_POST['variantId'];
        $soluong = $_POST['quantity'];
        $tensp = $arr['tensp'];
        $gia = $arr['giasp'];
        $hinhanh = $arr['hinhanh'];
        if(isset($_SESSION['giohang'][$id_sp])){
            $_SESSION['giohang'][$id_sp]['soluong'] =
            $_SESSION['giohang'][$id_sp]['soluong'] + $soluong;
        }else
        {
            $_SESSION['giohang'][$id_sp] = array(
                'ten' => $tensp,
                'soluong' => $soluong,
                'gia' => $gia,
                'hinh' => $hinhanh, );
        }
        header("LOCATION:giohang.php");

    } 
         
        
    
?>
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>

                <li><a href="<?php echo $url_chitiet;?>"> <?php echo $loaisp;?></a><span>—›</span></li>
                <li><strong><?php echo $tensp;?></strong>
                    <li>

            </ul>
        </div>
    </div>
</div>

<section class="main-container col1-layout">
    <div class="main container">
        <div class="col-main">
            <div class="row">
                <div class="product-view" itemscope itemtype="http://schema.org/Product">
                    <meta itemprop="url" content="">
                    <meta itemprop="image" content="files/<?php echo $hinhanh;?>">
                    <meta itemprop="shop-currency" content="VND">
                    <div class="product-essential">
                        <form action="" method="post" enctype="multipart/form-data" id="product_addtocart_form">
                            <div class="product-img-box col-lg-6 col-sm-6 col-xs-12">

								<img style="width:500px;height:500px;" src="files/<?php echo $hinhanh;?>" alt="<?php echo $tensp;?>">

                            </div>
                            <div class="product-shop col-lg-6 col-sm-6 col-xs-12">

                                <div class="product-name">
                                    <h1 itemprop="name"><?php echo $tensp;?></h1>
                                </div>

                                <p class="availability ">Tình trạng: <span class="in-stock">Còn hàng</span></p>

                                <div class="price-block">

                                    <div class="price-box">
                                        <p class="special-price" itemprop="price"> <span class="price-label">Giá</span> <span class="price"><?php echo $giaf;?> VNĐ</p>
									</div>
									
								</div>
								<div class="short-description">
									<h2>Giới thiệu</h2>
									<p><?php echo $mota;?></p>
								</div>
								<div class="add-to-box">
									<div class="add-to-cart" style=" float: left; width: 100%;">
										<div class="pull-left" style=" float: left; width: 100%;">
											
											 
											
											<input type="hidden" name="variantId" value="<?php echo $id_sp;?>" />
											
											
										</div>
									</div>
									<div class="add-to-cart">
										<label for="qty">Số lượng:</label>
										<div class="pull-left">
											<div class="custom pull-left">
												<button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="icon-minus">&nbsp;</i></button>
												<input type="text" title="Qty" value="1" maxlength="12" id="qty" name="quantity" class="input-text qty">
												<button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="icon-plus">&nbsp;</i></button>
											</div>
										</div>
										
										<button name ="them" class="button btn-cart  " title="Thêm vào giỏ hàng" type="submit"><span><i class="icon-basket"></i>Thêm vào giỏ hàng</span></button>

                                    </div>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                    <div class="product-collateral">
                        <div class="col-sm-12">
                            <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                                <li class="active"> <a href="#product_tabs_description" data-toggle="tab"> Chi tiết sản phẩm </a> </li>
                                <li><a href="#product_tabs_tags" data-toggle="tab">Tags sản phẩm</a></li>
                                <li>
                                    <a href="#product_tabs_title" data-toggle="tab"></a>
                                </li>
                                <li>
                                    <a href="#product_tabs_content" data-toggle="tab"></a>
                                </li>
                            </ul>
                            <div id="productTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="product_tabs_description">
                                    <div class="std">
                                        <p style="color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: normal;"><?php echo$chitiet;?></p>
                                        <p style="color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: normal; text-align: center;"><img alt="" src="/files/<?php echo $hinhanh;?>" style="width: 500px; height: 500px;" /></p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="product_tabs_tags">
                                    <div class="box-collateral box-tags">
                                        <div class="tags">
                                            <ul>

                                                <li><a href='chitietsp.php?id_sp=<?php echo $id_sp;?>' title='hoa-tuoi'><?php echo $loaisp;?></a></li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="product_tabs_title">
                                    <div class="box-collateral box-tags">
                                        <div class="tags">

                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="product_tabs_content">
                                    <div class="box-collateral box-tags">
                                        <div class="tags">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="box-additional">



                                <div class="related-pro">
                                    <div class="slider-items-products">
                                        <div class="new_title center">
                                            <h2>Sản phẩm liên quan</h2>
                                        </div>
                                        <div id="related-products-slider" class="product-flexslider hidden-buttons ">
                                            <div class="slider-items slider-width-col4 hidden_btn_cart">

                                                

                                                <?php
                                                    $sql_lq = "SELECT * FROM sanpham WHERE id_loaisp = '$id_loaisp' && id_sp != '$id_sp'";
                                                    $result_lq = $mysqli->query($sql_lq);
                                                    while($arr_lq = mysqli_fetch_assoc($result_lq))
                                                    {
                                                        $id_sp = $arr_lq['id_sp'];
                                                        $tensp = $arr_lq['tensp'];
                                                        $id_loaisp = $arr_lq['id_loaisp'];
                                                        $gia = $arr_lq['giasp'];
                                                        $giaf = number_format($gia,0,'.','.');
                                                        $hinh = $arr_lq['hinhanh'];
                                                        $ten = convertUtf8ToLatin($tensp);
                                                        $url_chitiet = "/chi-tiet-san-pham/{$ten}-{$id_sp}.html";
                                                    
                                                ?>
                                                <div class="item">
                                                    <div class="col-item">

                                                        <div class="product-image-area">
                                                            <a class="product-image" title="<?php echo $tensp;?>" href="<?php echo $url_chitiet;?>">
                                                                <img src="files/<?php echo $hinh;?>" class="img-responsive" alt="<?php echo $tensp;?>" />
                                                            </a>
                                                        </div>

                                                        <div class="info">
                                                            <div class="info-inner">
                                                                <div class="item-title">
                                                                    <h3><a title="<?php echo $tensp;?>" href="<?php echo $url_chitiet;?>"><?php echo $tensp;?></a></h3></div>
                                                                <!--item-title-->
                                                                <div class="item-content">

                                                                    <div class="price-box">
                                                                        <p class="special-price"> <span class="price"><?php echo $giaf;?> VNĐ </span> </p>
                                                                    </div>

                                                                </div>
                                                                <!--item-content-->
                                                            </div>
                                                            <!--info-inner-->
                                                            
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php
                                                    }
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End main-container -->
<script src='//bizweb.dktcdn.net/assets/themes_support/option-selectors.js?137261' type='text/javascript'></script>
<style>
    .add-to-cart .selector-wrapper label {
        float: left !important;
        margin-right: 15px;
    }
</style>
<script>
    var selectCallback = function(variant, selector) {

        var addToCart = jQuery('.btn-cart'),
            productPrice = jQuery('.special-price .price'),
            comparePrice = jQuery('.old-price .price');

        if (variant) {
            if (variant.available) {
                // We have a valid product variant, so enable the submit button
                addToCart.text(' THÊM VÀO GIỎ HÀNG').removeClass('disabled').removeAttr('disabled');
                $('.product-shop .in-stock').text('Còn hàng').removeClass('out-stock');
            } else {
                // Variant is sold out, disable the submit button
                addToCart.text(' HẾT HÀNG').addClass('disabled').attr('disabled', 'disabled');
                $('.product-shop .in-stock').text('Hết hàng').addClass('out-stock');
            }

            // Regardless of stock, update the product price
            productPrice.html(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}&#8363;"));

            // Also update and show the product's compare price if necessary
            if (variant.compare_at_price > variant.price) {

                comparePrice.html(Bizweb.formatMoney(variant.compare_at_price, "{{amount_no_decimals_with_comma_separator}}&#8363;")).show();
            } else {
                comparePrice.hide();
            }


        } else {
            // The variant doesn't exist. Just a safeguard for errors, but disable the submit button anyway
            addToCart.text('Hết hàng').attr('disabled', 'disabled');
        }
        /*begin variant image*/
        if (variant && variant.image) {
            var originalImage = jQuery(".large-image img");
            var zoomImage = jQuery(".zoomImg");
            var sourceImage = jQuery(".moreview_source_image");
            var newImage = variant.image;
            var element = originalImage[0];
            Bizweb.Image.switchImage(newImage, element, function(newImageSizedSrc, newImage, element) {
                jQuery(element).parents('a').attr('href', newImageSizedSrc);
                jQuery(element).attr('src', newImageSizedSrc);
                jQuery(zoomImage).attr('src', newImageSizedSrc);
                jQuery(sourceImage).attr('src', newImageSizedSrc);
            });
        }
        /*end of variant image*/
    };
    jQuery(function($) {


        // Add label if only one product option and it isn't 'Title'. Could be 'Size'.


        // Hide selectors if we only have 1 variant and its title contains 'Default'.

        $('.selector-wrapper').hide();

        $('.selector-wrapper').css({
            'text-align': 'left',
            'margin-bottom': '15px'
        });
    });
</script>



<?php include '/opt/lampp/htdocs/shophoa/include/footer.php';?>