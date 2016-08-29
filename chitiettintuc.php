<?php include '/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php require_once '/opt/lampp/htdocs/shophoa/functions/re.php';?>
<?php
    if(isset($_GET['id_tt']))
    {
        $id_tt = $_GET['id_tt'];
        $sql = "SELECT * FROM tintuc WHERE id_tt = $id_tt";
        $result = $mysqli->query($sql);
        $arr = mysqli_fetch_assoc($result);
        $tentt = $arr['tentt'];
        $chitiet = $arr['noidung'];
        $ngaydang = $arr['ngaydang'];
        $tachchuoi = explode('-', $ngaydang);
        $ngaydang = $tachchuoi[2].'-'.$tachchuoi[1].'-'.$tachchuoi[0];
    }
?>
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>                
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>               
                
                <li><a href='/tin-tuc.html'>Tin tức</a></li>
                <li><span style="margin-right:5px;">—›</span><strong><?php echo $tentt;?></strong></li>
                
            </ul>
        </div>
    </div>
</div>
<div class="main-container col2-right-layout">
    <div class="main container">
        <div class="row">
            <div class="col-main col-sm-9">
               
                <div class="blog-wrapper" id="main">
                    <div class="site-content" id="primary">
                        <div role="main" id="content">
                            <article class="blog_entry clearfix">
                                <header class="blog_entry-header clearfix">
                                    <div class="blog_entry-header-inner">
                                        <h1 class="blog_entry-title"><?php echo $tentt;?></h1>
                                    </div>
                                    <!--blog_entry-header-inner-->
                                </header>
                                <!--blog_entry-header clearfix-->
                                <div class="entry-content">
                                    <div class="entry-content">
                                        <?php echo $chitiet;?>
                                    </div>
                                </div>
                                <footer class="entry-meta"><time class="entry-date"><?php echo $ngaydang;?></time></footer>
                            </article>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-right sidebar col-sm-3">
                <div role="complementary" class="widget_wrapper13" id="secondary">

                    <div class="popular-posts widget widget__sidebar " id="recent-posts-4">
                        <h2 class="widget-title"><span>Tin mới </span></h2>
                        <div class="widget-content">
                            <ul class="posts-list unstyled clearfix">
                                <?php
                                     $sql = "SELECT * FROM tintuc ORDER BY id_tt DESC LIMIT 5";
                                        $result = $mysqli->query($sql);
                                        while($arr = mysqli_fetch_assoc($result)){
                                            $id_tt = $arr['id_tt'];
                                            $tentt = $arr['tentt'];
                                            $mota = $arr['mota'];
                                            $hinhanh = $arr['hinhanh'];
                                            $ngaydang = $arr['ngaydang'];
                                            $tachchuoi = explode('-', $ngaydang);
                                            $ngaydang = $tachchuoi[2].'-'.$tachchuoi[1].'-'.$tachchuoi[0];
                                            $ten = convertUtf8ToLatin($tentt);
                                            $url_chitiet3 = "chi-tiet-tin-tuc/{$ten}-{$id_tt}.html";
                                ?>
                                <li>
                                    <figure class="featured-thumb" style="width:35%">
                                        <a href="<?php echo $url_chitiet3;?>" title="<?php echo $tentt;?>">
                                            <img src="files/<?php echo $hinhanh;?>" style=" width: 100px;" alt="<?php echo $tentt;?>">
                                        </a>
                                    </figure>
                                    <!--featured-thumb-->
                                    <h4><a title="<?php echo $tentt;?>" href="<?php echo $url_chitiet3;?>"><?php echo $tentt;?></a></h4>
                                    <p class="post-meta"><i class="icon-calendar"></i>
                                        <time class="entry-date"><?php echo $ngaydang;?></time> .
                                    </p>
                                </li>
                                <?php }?>
                                
                            </ul>
                        </div>
                        <!--widget-content-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include '/opt/lampp/htdocs/shophoa/include/footer.php';?>