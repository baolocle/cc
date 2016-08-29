<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>


<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>

                <li><strong>Đăng ký tài khoản</strong></li>

            </ul>
        </div>
    </div>
</div>

<section class="main-container col1-layout">
    <div class="main container">
        <div class="account-login">
            <div class="page-title">
                <h2>Tạo tài khoản</h2>
            </div>
            <fieldset class="col2-set">
                <legend>Tạo tài khoản</legend>
                <div class="col-1 new-users"><strong>Khách hàng mới</strong>
                    <div class="content">
                        <p>Bằng cách tạo một tài khoản với cửa hàng của chúng tôi , bạn sẽ có thể thực hiện những quy trình mua hàng nhanh hơn , lưu trữ nhiều địa chỉ gửi hàng , xem và theo dõi đơn đặt hàng của bạn trong tài khoản của bạn và nhiều hơn nữa .</p>
                        <?php
                            if(isset($_POST['submit'])){
                                $hoten = $_POST['hoten'];
                                $username = $_POST['username'];
                                $password = $_POST['password'];
                                $sql = "SELECT * FROM khachhang WHERE username = '$username' && phanquyen =0";
                                $result = $mysqli->query($sql);
                                $dem = mysqli_num_rows($result);
                                if($dem == 0){
                                    $sql_ins = "INSERT INTO khachhang(tenkh,username,password,phanquyen)
                                                VALUES('$hoten','$username','$password','1')";
                                    $result_ins = $mysqli->query($sql_ins);
                                    if($result_ins){
                                        echo "<p style='color:#C22B3B;font-weight:bold;' >Đăng ký thành công</p>";
                                    }else{
                                        echo "<p style='color:#C22B3B;font-weight:bold;' >Đăng ký thất bại</p>";
                                    }
                                }else
                                {
                                    echo "<p style='color:#C22B3B;font-weight:bold;' >Tài khoản đã tồn tại</p>";
                                }
                            }
                        ?>
                        <form accept-charset='UTF-8' action='' id='customer_register' method='post'>
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='utf8' type='hidden' value='true' />
                            <h4>Thông tin cá nhân</h4>
                            <div class="form-group">
                                <label for="first_name">Tên<span class="required">*</span></label>
                                <input style="border-radius:0px;" type="text" class="form-control" name="hoten" id="first_name" placeholder="Tên">
                            </div>
                            <div class="form-group">
                                <label for="email">Username<span class="required">*</span></label>
                                <input style="border-radius:0px;" type="text" class="form-control" name="username" id="email" placeholder="username">
                            </div>
                            <div class="form-group">
                                <label for="customer_password">Mật khẩu<span class="required">*</span></label>
                                <input style="border-radius:0px;" type="password" class="form-control" name="password" id="creat_password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <button style=" border-radius:0px; border:none; background:#c22b3b; color:#fff;" name="submit" class="btn btn-default button-red">Đăng ký</button>
                                <a href="dangnhap.php">
                                    <button style="float:right; border-radius:0px; border:none;  background:#c22b3b; color:#fff;" type="submit" class="btn btn-default button-red"><a  style="color:#fff;"href="/">Quay lại</a></button>
                                </a>
                            </div>
                            <p class="required">* Yêu cầu bắt buộc</p>
                        </form>
                    </div>
                </div>
            </fieldset>
        </div>
        <br>
    </div>
</section>
<script>
    function showRecoverPasswordForm() {
        document.getElementById('recover_password').style.display = 'block';
        document.getElementById('customer_login').style.display = 'none';
    }

    function hideRecoverPasswordForm() {
        document.getElementById('recover_password').style.display = 'none';
        document.getElementById('customer_login').style.display = 'block';
    }

    // Allow deep linking to the recover password form
    if (window.location.hash == '#recover') {
        showRecoverPasswordForm()
    }

    // reset_success is only true when the reset form is

    document.getElementById('note-reset').text('Chúng tôi đã gửi email cho bạn.Vui lòng vào hòm mail của bạn để kiểm tra và làm theo hướng dẫn');
</script>
<?php include $_SERVER["DOCUMENT_ROOT"].'/shophoa/include/footer.php';?>