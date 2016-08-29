<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>

<!-- end nav -->

<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Home</a><span>—›</span></li>

                <li><strong>Contact</strong></li>

            </ul>
        </div>
    </div>
</div>

<div class="banner_contact">


</div>
<style>
    .form-control {
        border-radius: 0px;
    }
</style>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h4 style="margin-top: 20px;">Address</h4>
            <p style="font-size:14px; font-weight:bold; color:#000;text-transform:uppercase; margin-bottom: 20px; margin-top:20px;"></p>
            <ul style="list-style:none; margin:0px;">

                <li>
                    <p style="color:#333"><span style="color:#f26522" class="glyphicon glyphicon-map-marker"></span> 120 Nguyen Luong Bang - Da Nang - Viet Nam</p>
                </li>

                <li>
                    <p style="color:#333">

                        <span style="color:#f26522" class="glyphicon glyphicon-earphone"></span> (+84)12-666-00-863)

                </li>
                <li>
                    <p style="color:#383838">

                        <span style="color:#f26522" class="glyphicon glyphicon-envelope"></span> &nbsp;<span style="color:#f26522">thanhkhuebkdn2012@gmail.com</span>

                    </p>
                </li>

            </ul>
        </div>
        <?php
            if(isset($_POST['submit'])){
                $name = $_POST['name'];
                $email = $_POST['email'];
                $noidung = $_POST['noidung'];
                $sql = "INSERT INTO lienhe(hoten,email,noidung) VALUES ('$name','$email','$noidung')";
                $result = $mysqli->query($sql);
                if($result)
                {
                    echo "<strong>Sent</strong>";
                }
                else
                {
                    echo "Error";
                }
            }
        ?>
        <div class="col-md-8">
            <div class="form_blog_comment">
                <form accept-charset='UTF-8' action='' id='contact' method='post'>
                    <input name='FormType' type='hidden' value='contact' />
                    <input name='utf8' type='hidden' value='true' />
                    <h4 style="text-transform:uppercase; margin-top: 20px;">Contact Us</h4>

                    <div class="form-group">
                        <label for="name">Name*</label>
                        <input placeholder="Name" id="name" name="name" type="text" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Email*</label>
                        <input placeholder="Email" id="email" name="email" class="form-control" type="email" value="">
                    </div>
                    <div class="form-group">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Opinion*</label>
                            <textarea id="message" name="noidung" style="height: 120px;" class="form-control" rows="7"></textarea>
                        </div>
                        <div class="form-group">
                            <button style="border-radius: 0px;padding: 7px 30px;" type="submit" name = "submit" class="btn btn-default stl_btn_reg">Send</button>
                        </div>
                </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    (jQuery)(document).ready(function($) {
        if ($('#contact_map').length) {
            $('#contact_map').gMap({
                zoom: 17,
                scrollwheel: true,
                maptype: 'ROADMAP',
                markers: [{
                    address: '120 Nguyen Luong bang -  Da Nang - Viet Nam',
                    html: '_address'
                }]
            });
        }
    });
</script>
<style>
    .google-map {
        width: 100%;
    }
    
    .google-map .map {
        width: 100%;
        height: 350px;
        background: #dedede
    }
</style>
<?php include '/opt/lampp/htdocs/shophoa/include/footer.php';?>