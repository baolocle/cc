
<?php
    session_start();
?>
<?php include'/opt/lampp/htdocs/shophoa/functions/dbconnect.php';?>
<?php
    if(!isset($_SESSION['giohang'])){
        header("LOCATION:index.php");
    }
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Shop name - Thanh toán đơn hàng" />
    
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    
     
    <link href='/shophoa/css/bootstrap.min.css' rel='stylesheet' type='text/css' />
    <link href='/shophoa/css/nprogress.css?01042016' rel='stylesheet' type='text/css' />

    <link href='/shophoa/css/checkout.css?20160411' rel='stylesheet' type='text/css' />
    
    <link href='/shophoa/css/checkouts.css?1459501174447' rel='stylesheet' type='text/css' />
    
    <title>polo-theme - Thanh toán đơn hàng</title>
    <script type="text/javascript">
        function addDOMLoadedEvent(func) {
            if (document.readyState === 'complete') {
                func();
            } else {
                if (document.addEventListener) {
                    document.addEventListener("DOMContentLoaded", func, false);
                }
                else {
                    document.attachEvent("onDOMContentLoaded", func);
                }
            }
        }
    </script>
	<script>
    //<![CDATA[
            (function() {
            var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;
            s.src = '//bizweb.dktcdn.net/assets/themes_support/bizweb_stats.js?v=1';
            var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
            })();

    //]]>
    </script>
</head>
<body class="body--custom-background-color ">
    <?php
        
        if(isset($_POST['dathang'])){
            $ten = $_POST['ShippingAddress_LastName'];
            $sdt = $_POST['ShippingAddress_Phone'];
            $diachi = $_POST['ShippingAddress_Address1'];
            $ghichu = $_POST['note'];
            $ngaydat = getdate()['year'].'/'.getdate()['mon'].'/'.getdate()['mday'];
            $sql = "INSERT INTO dathang(tenkh,diachi,sdt,ghichu,ngaydat) VALUES('$ten','$diachi','$sdt','$ghichu','$ngaydat')";
            $result = $mysqli->query($sql);
            if($result)
            {
                $sql1 = "SELECT max(id_dh) AS id_dathang FROM dathang ";
                $result1 = $mysqli->query($sql1);
                $arr = mysqli_fetch_assoc($result1);
                $id_dh = $arr['id_dathang'];
                foreach ($_SESSION['giohang'] as $id_sp => $value) 
                {
                    $sl = $value['soluong'];
                    $gia = $value['gia'];
                    $thanhtien = $sl * $gia;
                    $sql2 = "INSERT INTO chitietdathang(id_dh,id_sp,soluong,thanhtien) VALUES('$id_dh','$id_sp','$sl','$thanhtien')";
                    $result2 = $mysqli->query($sql2);
                    
                }
                if($result2)
                {
                        unset($_SESSION['giohang']);
                        header("LOCATION:index.php?msg=Đặt hàng thành công");

                }

            }
        }
    ?>
    <form method="post" action="" data-toggle="validator" class="formCheckout">
        <div context="checkout" define="{checkout: new Bizweb.Checkout(this,{})}" class="container">
            <div class="header">
                <div class="wrap">
                    <div class="shop  logo--left ">
                        
                        <h1 class="shop__name">
                            <a href="/">
                                polo-theme
                            </a>
                        </h1>
                        
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="wrap clearfix">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div define="{billing_address: {},billing_expand:true}" class="form-group m0">
                                <h2>
                                    <label class="control-label">Thông tin mua hàng</label>
                                </h2>
                            </div>
                            
                            <div class="form-group">
                                <a href="dangky.php">Đăng ký tài khoản mua hàng</a>
                                |
                                <a href="dangnhap.php">Đăng nhập </a>
                            </div>
                            
                            <?php
                            ?>
                            <div bind-show="" define="{shipping_address: {}, shipping_expand:true,show_district:  true }" class="shipping">
                                <div class="form-group">
                                    <a class="underline-none" bind-event-click="shipping_expand = !shipping_expand" href="javascript:void(0)">
                                        Thông tin nhận hàng<span bind-show="!shipping_expand">+</span><span bind-show="shipping_expand">-</span>
                                    </a>
                                </div>
                                <div bind-show="shipping_expand || !otherAddress">
                                    <?php
                                        if(isset($_SESSION['taikhoan'])){
                                            $ten = $_SESSION['taikhoan']['name'];
                                        }
                                        else
                                        {
                                            $ten = '';
                                        }
                                    ?>
                                    <div class="form-group">
                                        <input value="<?php echo $ten;?>" data-error="Vui lòng nhập họ tên" required bind="shipping_address.full_name" name="ShippingAddress.LastName" class="form-control" placeholder="Họ và tên" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <input  bind="shipping_address.phone" name="ShippingAddress.Phone" class="form-control" placeholder="Số điện thoại" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <input  bind="shipping_address.address1" name="ShippingAddress.Address1" class="form-control" placeholder="Địa chỉ" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="note" value="" class="form-control" placeholder="Ghi chú"></textarea>
                            </div>
                            
                        </div>
                        
                        <div class="col-md-4 col-sm-6" style="float:right" >
                            <div class="order-summary order-summary--custom-background-color ">
                                <div class="order-summary-header">
                                    <h2>
                                        <label class="control-label">Đơn hàng</label>
                                    </h2>
                                </div>
                                <div class="summary-body  summary-section">
                                    <div class="summary-product-list">
                                        <ul class="product-list">
                                            <?php
                                                if(isset($_SESSION['giohang'])){
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
                                            <li class="product product-has-image clearfix">
                                                
                                                <img src='shophoa/files/<?php echo $hinhanh;?>' alt='<?php echo $ten;?>' class='pull-left product-image' />
                                                
                                                <div class="product-info pull-left">
                                                    <span class="product-info-name">
                                                        <strong><?php echo $ten;?></strong> x <?php echo $soluong;?>
                                                    </span>
                                                    
                                                    
                                                </div>
                                                <strong class="product-price pull-right">
                                                    <?php echo $tongtienf;?> VNĐ
                                                </strong>
                                            </li>
                                            <?php
                                                }
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="summary-section">
                                    
                                    <div class="total-line total-line-shipping clearfix" bind-show="requiresShipping">
                                        <span class="total-line-name pull-left">
                                            Phí ship
                                        </span>
                                        <span bind="shippingFee >  0 ? money(shippingFee,'{{amount_no_decimals_with_comma_separator}}&#8363;') : ((requiresShipping && shippingMethods.length == 0) ? 'Khu vực này không hỗ trợ vận chuyển': 'Miễn phí vận chuyển')" class="total-line-shipping pull-right">
                                            
                                            Miễn phí vận chuyển
                                            
                                        </span>
                                    </div>

                                    <div class="total-line total-line-total">

                                        <span class="total-line-name pull-left">
                                            Tổng cộng
                                        </span>
                                        <span  class="total-line-price pull-right">
                                            <?php
                                                if(isset($_SESSION['giohang'])){
                                                    echo $thanhtienf;
                                              }
                                            ?> VNĐ
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <input class="btn btn-primary col-md-12 mt10" type="submit" name="dathang"bind-event-click="paymentCheckout()" value="ĐẶT HÀNG" />
                            </div>
                            <div class="form-group has-error">
                                <div class="help-block ">
                                    <ul class="list-unstyled">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <script src='//bizweb.dktcdn.net/assets/themes_support/jquery-2.1.3.min.js?01042016' type='text/javascript'></script>
                <script src='//bizweb.dktcdn.net/assets/themes_support/bootstrap.min.js?01042016' type='text/javascript'></script>
                <script src='//bizweb.dktcdn.net/assets/themes_support/twine.min.js?01042016' type='text/javascript'></script>
                <script src='//bizweb.dktcdn.net/assets/themes_support/validator.min.js?01042016' type='text/javascript'></script>
                <script src='//bizweb.dktcdn.net/assets/themes_support/nprogress.js?01042016' type='text/javascript'></script>
                <script src='//bizweb.dktcdn.net/assets/themes_support/money-helper.js?01042016' type='text/javascript'></script>

                
                
                
                <a href="javascript:void(0)" data-toggle="modal" data-target="#moca-modal" data-backdrop="static" data-keyboard="false" class="trigger-moca-modal" style="display: none;" title="Thanh toán qua Moca">
                </a>
				<a href="javascript:void(0)" data-toggle="modal" data-target="#moca-error-modal" class="trigger-moca-error-modal" style="display: none;" title="Lỗi thanh toán qua Moca">
                </a>
                <script type="text/javascript">
                    $(document).ajaxStart(function () {
                        NProgress.start();
                    });
                    $(document).ajaxComplete(function () {
                        NProgress.done();
                    });
                    context = {}
                    $(function () {
                        Twine.reset(context).bind().refresh();
                    });
                    $(document).ready(function () {
                        
                        $("#customer-address").trigger("change");
                        
                        $("select[name='BillingProvinceId']").trigger("change");
                        $("select[name='ShippingProvinceId']").trigger("change");
                        Twine.context(document.body).checkout.caculateShippingFee();
                    });

                    window.Bizweb || (window.Bizweb = {});
                    (function () {
                        Bizweb.Utility = {
                            getParameter: function (name) {
                                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                                    results = regex.exec(location.search);
                                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
                            }
                        }
                        Bizweb.Checkout = function () {
                            function r(e, b) {
                                if (b) {
                                    var property;
                                    for (property in b) this[property] = b[property];
                                }
                                this.ele = e;
                                this.existCode= "false";
                                this.totalOrderItemPrice = 1700000.0000;
                                this.discount = 0;
                                this.shippingFee = 0;
                                this.freeShipping = false;
                                this.requiresShipping = true;
                                this.code = "";
                                this.inValidCode = false;
                                this.discountShipping = false;
                                this.shippingMethods = [];
                                this.settingLanguage = "vi";
                                this.invalidEmail = false;
                                var that = this;

                                $("[name='code']").keyup(function(event){
                                    if(event.keyCode == 13){
                                        that.caculateShippingFee();
                                        event.preventDefault();
                                        return false;
                                    }
                                });

                                var coupon = Bizweb.Utility.getParameter("coupon");
                                if(coupon)
                                {
                                    this.code = coupon;
                                }
                            };

                            r.prototype.changeOtherAddress = function(element){
                                element.value = this.otherAddress;
                                if(this.otherAddress){
                                    $("select[name='ShippingProvinceId']").trigger("change");
                                }else{
                                    $("select[name='BillingProvinceId']").trigger("change");
                                }
                            }

                            r.prototype.shippingProviceChange = function(){
                                if(this.otherAddress)
                                {
                                    var that = this;
                                    if(this.show_district)
                                    {
                                        this.showShippingDistrict();
                                    }
                                    else {
                                        this.caculateShippingFee();
                                    }
                                }else{
                                    var initDistrict = $("select[name='ShippingDistrictId'] >option").length > 0 ? false : true;
                                    if(initDistrict){
                                        if(this.show_district)
                                        {
                                            this.showShippingDistrict();
                                        }
                                    }
                                }
                            }

                            r.prototype.showShippingDistrict = function(){
                                var that = this;
                                $.ajax({
                                    url:"/checkout/getdistricts?provinceId=" + that.ShippingProvinceId,
                                    async: false,
                                    success:function(data)
                                    {
                                        var html = "";
                                        
                                        html = "<option value='0'>Chọn quận huyện</option>";
                                        
                                        for(var index in data)
                                        {
                                            var district = data[index];
                                            html += "<option value='" + district.id + "'>" + district.name + "</option>"
                                        }
                                        $("select[name='ShippingDistrictId']").empty().html(html);
                                        $("select[name='ShippingDistrictId']").trigger("change");
                                    }
                                });
                            }

                            r.prototype.billingProviceChange = function(){
                                if(!this.otherAddress)
                                {                                   
                                    var that = this;
                                    if(this.show_district)
                                    {
                                        $.ajax({
                                            url:"/checkout/getdistricts?provinceId=" + that.BillingProvinceId,
                                            async: false,
                                            success:function(data)
                                            {
                                                var html = "";
                                                
                                                html = "<option value='0'>Chọn quận huyện</option>";
                                                
                                                for(var index in data)
                                                {
                                                    var district = data[index];
                                                    html += "<option value='" + district.id + "'>" + district.name + "</option>"
                                                }
                                                $("select[name='BillingDistrictId']").empty().html(html);
                                                $("select[name='BillingDistrictId']").trigger("change");
                                            }
                                        });
                                    }
                                    else {
                                        this.caculateShippingFee();
                                    }
                                }
                            }

                            r.prototype.shippingDistrictChange = function(){
                                if(this.otherAddress)
                                {
                                    this.caculateShippingFee();
                                }
                            }

                            r.prototype.billingDistrictChange = function(){
                                if(!this.otherAddress)
                                {
                                    this.caculateShippingFee();
                                }
                            }

                            r.prototype.changeShippingMethod = function(){
                                var shippingFee = parseFloat( $("[name='ShippingMethod'] option:selected").attr("fee"));
                                if(this.discountShipping){
                                    if(shippingFee <= 0){
                                        this.freeShipping = true;
                                        this.discount = shippingFee;
                                    }else{
                                        this.freeShipping = false;
                                        this.discount = 0;
                                    }
                                }else{
                                    if(shippingFee <= 0){
                                        this.freeShipping = true;
                                    }else{
                                        this.freeShipping = false;
                                    }
                                }
                                this.shippingFee = shippingFee;
                            }
                            r.prototype.removeCode = function(){
                                this.code = "";
                                this.caculateShippingFee();
                            }
                            r.prototype.caculateShippingFee = function(){
                                var that = this;
                                
                                if(this.settingLanguage != "vi"){
                                    var provinceId = 0;
                                    var districtId = 0;
                                }else{
                                    var provinceId = that.otherAddress ? that.ShippingProvinceId : that.BillingProvinceId;
                                    var districtId = that.otherAddress ? that.ShippingDistrictId : that.BillingDistrictId;
                                }
                                var shippingMethod = $("[name='ShippingMethod'] option:selected").val();

                                $.ajax({
                                    url:"/checkout/getshipping?provinceId=" + provinceId  + "&districtId=" + districtId + "&code=" + that.code + "&shippingMethod="+shippingMethod,
                                    type:"GET",
                                    success:function(data)
                                    {
                                        if(data.error)
                                        {
                                            //Lỗi
                                            that.shippingMethods = [];
                                            Twine.refreshImmediately();
                                        }
                                        else{
                                            that.existCode = data.exist_code;
                                            if(that.code && !that.existCode)
                                            {
                                                that.inValidCode = !that.existCode;
                                            }
                                            else{
                                                that.inValidCode = false;
                                            }
                                            that.freeShipping = data.free_shipping;
                                            that.code= data.code;
                                            that.discount = data.discount;
                                            that.totalOrderItemPrice = data.total_line_item_price;
                                            if(that.requiresShipping)
                                                that.shippingMethods = data.shipping_methods;
                                            that.discountShipping = data.discount_shipping;
                                            Twine.refreshImmediately();
                                            var html = "";
                                            for(var index in that.shippingMethods)
                                            {
                                                var shippingMethod = that.shippingMethods[index];
                                                html += "<option fee=" + shippingMethod.fee + " value=" + shippingMethod.value + ">" + shippingMethod.name + " - " +( shippingMethod.fee > 0 ? money(shippingMethod.fee,"{{amount_no_decimals_with_comma_separator}}&#8363;") : "Miễn phí vận chuyển" )  +  "</option>"
                                            }
                                            $("select[name='ShippingMethod']").empty().html(html);
                                            $("select[name='ShippingMethod']").val(data.shipping_method);
                                            $("select[name='ShippingMethod']").trigger("change");
                                        }
                                    }
                                });
                                return false;
                            }

							r.prototype.paymentCheckout = function(){
                                var that = this;
								var $form = $("form.formCheckout");
                                var prvdId = parseInt( $(".iradio_square.checked .icheck.square").attr("data-check-id"));
                                if(prvdId == 11) {
									//if($form.valid()) {
										var url = "/checkout";
										var method = "POST";
										NProgress.start();
										$.ajax({
											url: url,
											type: method,
											global: false,
											data: $form.serialize(),
											success: function (data) {
												if(data.error == "0") {
													$(".trigger-moca-error-modal").trigger("click");
												} else if(data.error == "fail") {
													window.location.href = "/checkout/failure/" + data.order_id;
												} else {
													$("#moca-modal iframe").attr("src", data.moca_iframe_url);
													//$(".cancel-moca-payment-btn").attr("href", "/checkout/canceled/" + data.order_id);
													$(".trigger-moca-modal").trigger("click");			
												}
											    NProgress.done();
											}
										});
									//}
									return false;
								}
								$form.submit();
								return true;
                            }

                            return r;
                        }();
                    }).call(this)
                </script>
            </div>
            <div class="modal fade" id="refund-policy" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Chính sách hoàn trả</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="privacy-policy" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Chính sách bảo mật</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="terms-of-service" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Điều khoản sử dụng</h4>
                        </div>
                        <div class="modal-body">
                            <pre></pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade moca-modal" id="moca-modal" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
						<div>
							<iframe style="border: 0px; width: 100%; height: 100%;" src=""></iframe>
						</div>
                    </div>
                </div>
            </div>
			<div class="modal fade" id="moca-error-modal" data-width="" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
							<div>
								<p>Giao dịch của bạn chưa đủ hạn mức thanh toán</p>
								<p>Hạn mức tối thiểu để thanh toán được là 1đ</p>
								<p>Vui lòng chọn hình thức thanh toán khác</p>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
