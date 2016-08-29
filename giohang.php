<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php include '/opt/lampp/htdocs/shophoa/functions/define.php';?>
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>

                <li><strong>Giỏ hàng</strong></li>

            </ul>
        </div>
    </div>
</div>

<section class="main-container col1-layout">
    <div class="main container">
        <div class="col-main">
            <div class="cart wow bounceInUp animated">
                <div class="page-title">
                    <h2>Giỏ hàng</h2>
                </div>

                <div class="table-responsive">
                    <form action="" method="post">
                        <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
                        <fieldset>
                            <table class="data-table cart-table" id="shopping-cart-table">
                                <thead>
                                    <tr class="first last">
                                        <th rowspan="1">&nbsp;</th>
                                        <th rowspan="1"><span class="nobr">Tên sản phẩm</span></th>
                                        <th rowspan="1">Giá</th>
                                        <th colspan="1" class="a-center"><span class="nobr">Số lượng</span></th>
                                        <th class="a-center" rowspan="1">Tổng tiền</th>
                                        <th colspan="1" class="a-center">Xóa</th>
                                        <th class="a-center" rowspan="1">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr class="first last">
                                        <td class="a-right last" colspan="50"><button class="button btn-continue" title="Continue Shopping" type="button"><span><span>Tiếp tục mua hàng</span></span></button>
                                            

                                            <button id="empty_cart_button" class="button btn-empty" title="" value="empty_cart" name="delete_cart_action" type="submit"><span><span>Xóa giỏ hàng</span></span></button></td>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    
                                    <?php
                                        if(isset($_SESSION['giohang'])){
                                            if(isset($_POST['delete_cart_action'])){
                                                unset($_SESSION['giohang']);
                                                header("LOCATION:giohang.php");
                                            }
                                            
                                            $thanhtien = 0;
                                            foreach ($_SESSION['giohang'] as $key => $value) {

                                                $ten = $value['ten'];
                                                $hinhanh = $value['hinh'];
                                                $gia = $value['gia'];
                                                $giaf = number_format($gia,0,'.','.');
                                                $soluong = $value['soluong'];
                                                $tongtien = $gia * $soluong;
                                                $tongtienf = number_format($tongtien,0,'.','.');
                                                $thanhtien = $thanhtien + $tongtien;
                                                $thanhtienf = number_format($thanhtien,0,'.','.');
                                    ?>
                                    <tr class="first odd">
                                        <td class="image" style="text-align: center;">
                                            <a class="product-image" title="<?php echo $ten;?>" href="/chitietsp.php?id_sp=<?php echo $key;?>"><img src="/shophoa/files/<?php echo $hinhanh;?>" width="75" height="75" alt="<?php echo $ten;?>" src=""></a>
                                        </td>
                                        <td>
                                            <h2 class="product-name"> <a href="chitietsp.php?id_sp=<?php echo $key;?>"><?php echo $ten;?></a></h2>


                                        </td>

                                        <td class="a-right"><span class="cart-price"> <span class="price"><?php echo $giaf;?> VNĐ</span> </span>
                                        </td>
                                        <td class="a-center movewishlist"><input maxlength="12" class="input-text qty" type="number" min="0" name="Lines" id="updates_268379" value="<?php echo $soluong;?>"></td>
                                        <td class="a-right movewishlist"><span class="cart-price"> <span class="price"><?php echo $tongtienf;?> VNĐ</span> </span>
                                        </td>
                                        <td class="a-center last" style="text-align: center;"><a style="float:initial !important;" class="button remove-item" title="Remove item" href=""><span><span>Remove item</span></span></a></td>
                                    </tr>
                                    <?php
                                        }

                                    }
                                    else
                                    {
                                        header("LOCATION:index.php");
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </fieldset>
                    </form>
                </div>

            </div>
            <!-- BEGIN CART COLLATERALS -->
            <div class="cart-collaterals row">
                <div class="totals col-sm-4" style="float:right">
                    <h3><span>Tổng tiền</span></h3>
                    <div class="inner">
                        <table class="table shopping-cart-table-total" id="shopping-cart-totals-table">
                            <colgroup>
                                <col>
                                <col width="1">
                            </colgroup>
                            <tfoot>
                                <tr>
                                    <td colspan="1" class="a-left" style=""><strong>Tổng</strong></td>
                                    <td class="a-right" style=""><strong><span class="price"><?php echo $thanhtienf;?> VNĐ</span></strong></td>
                                </tr>
                            </tfoot>
                        </table>
                        <ul class="checkout">
                            <li>
                                <button onclick="window.location='/shophoa/thanhtoan.php'" name="checkout" class="button btn-proceed-checkout" title="Proceed to Checkout" type="button"><span>Thanh toán</span></button>
                            </li>
                        </ul>
                    </div>
                    <!--inner-->
                </div>
            </div>
        </div>
    </div>
</section>
<style>
    img {
        max-width: initial;
    }
</style>
<?php include $_SERVER["DOCUMENT_ROOT"].'/shophoa/include/footer.php';?>