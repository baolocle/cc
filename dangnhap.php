<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>


<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>

                <li><strong>Đăng nhập tài khoản</strong></li>

            </ul>
        </div>
    </div>
</div>

<section class="main-container col1-layout">
    <div class="main container">
        <div class="account-login">
            <div class="page-title">
                <h2>Đăng nhập / tạo tài khoản</h2>
            </div>
            <fieldset class="col2-set">
                <legend>Đăng nhập / tạo tài khoản</legend>
                <div class="col-1 new-users"><strong>Khách hàng mới</strong>
                    <div class="content">
                        <p>Bằng cách tạo một tài khoản với cửa hàng của chúng tôi , bạn sẽ có thể thực hiện những quy trình mua hàng nhanh hơn , lưu trữ nhiều địa chỉ gửi hàng , xem và theo dõi đơn đặt hàng của bạn trong tài khoản của bạn và nhiều hơn nữa .</p>
                        <div class="buttons-set">
                            <button onclick="window.location='dangky.php';" class="button create-account" type="button"><span>Tạo tài khoản</span></button>
                        </div>
                    </div>
                </div>
                <div class="col-2 registered-users"><strong>Đăng nhập</strong>
                    <div class="content">
                        <p>Nếu bạn đã có tài khoản , xin vui lòng đăng nhập </p>
                        <form accept-charset='UTF-8' action='' id='customer_login' method='post'>
                            <input name='FormType' type='hidden' value='customer_login' />
                            <input name='utf8' type='hidden' value='true' />
                            <?php
                                if(isset($_POST['dangnhap'])){
                                    $user = $_POST['user'];
                                    $password = $_POST['password'];
                                    $sql = "SELECT * FROM khachhang WHERE username = '$user' && password = '$password'";
                                    $result = $mysqli->query($sql);
                                    $demdong = mysqli_num_rows($result);
                                    if($demdong == 1)
                                    {
                                        $arr = mysqli_fetch_assoc($result);
                                        $name = $arr['tenkh'];
                                        $_SESSION['taikhoan'] = $user;
                                        $_SESSION['matkhau'] = $password;
                                        $_SESSION['name'] = $name;
                                        header("LOCATION:index.php");
                                    }
                                    else
                                    {
                                        echo "<strong>Đăng nhập thất bại</strong>";
                                    }
                                }
                            ?>
                            <ul class="form-list">
                                <li>
                                    <label for="email">Tài khoản <span class="required">*</span></label>
                                    <br>
                                    <input type="text" title="Email Address" class="input-text required-entry" id="email" value="" name="user">
                                </li>
                                <li>
                                    <label for="pass">Mật khẩu <span class="required">*</span></label>
                                    <br>
                                    <input type="password" title="Password" id="pass" class="input-text required-entry validate-password" name="password">
                                </li>
                            </ul>
                            <p class="required">* Yêu cầu bắt buộc</p>
                            <div class="buttons-set">
                                <button id="send2" name="dangnhap" type="submit" class="button login"><span>Đăng nhập</span></button>
                                
                            </div>
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
</script>
<?php include $_SERVER["DOCUMENT_ROOT"].'/shophoa/include/footer.php';?>