<?php include'/opt/lampp/htdocs/shophoa/include/header.php';?>
<?php include'/opt/lampp/htdocs/shophoa/functions/define.php';?>



<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <ul>
                <li class="home"> <a href="/" title="Trang chủ">Trang chủ</a><span>—›</span></li>

                <li><strong>Tin tức</strong></li>

            </ul>
        </div>
    </div>
</div>

<div class="main-container col2-right-layout">
    <div class="main container">
        <div class="row">
            <div class="col-main col-sm-9">
                <div class="page-title">
                    <h2>Tin tức</h2>
                </div>

                <div class="blog-wrapper" id="main">
                    <div class="site-content" id="primary">
                        <div role="main" id="content">
                        <?php

                            $rowcount = pl_rowcount;
                            if(isset($_GET['trang'])){
                                $currentpage = $_GET['trang'];
                            }else
                            {
                                $currentpage = 1;
                            }
                            $offset = ($currentpage - 1)* $rowcount;
                            
                            $sql = "SELECT * FROM tintuc ORDER BY id_tt DESC LIMIT $offset,$rowcount";
                            $result = $mysqli->query($sql);
                            while($arr = mysqli_fetch_assoc($result)){
                                $id_tt = $arr['id_tt'];
                                $tentt = $arr['tentt'];
                                $mota = $arr['mota'];
                                $hinhanh = $arr['hinhanh'];
                                $ngaydang = $arr['ngaydang'];
                                $tachchuoi = explode('-', $ngaydang);
                                $ngaydang = $tachchuoi[2].'-'.$tachchuoi[1].'-'.$tachchuoi[0];
                            
                        ?>
                        <article class="blog_entry clearfix">
                                <header class="blog_entry-header clearfix">
                                    <div class="blog_entry-header-inner">
                                        <h2 class="blog_entry-title"> <a rel="bookmark" href="chitiettintuc.php?id_tt=<?php echo $id_tt;?>"><?php echo $tentt;?></a> </h2>
                                    </div>
                                    <!--blog_entry-header-inner-->
                                </header>
                                <div class="entry-content">
                                    <div class="featured-thumb">
                                        <a href="tintuc.php?id_tt=<?php echo $id_tt;?>" title="<?php echo $tentt;?>">

                                            <img src="/files/<?php echo $hinhanh;?>" style='width:360px;' />

                                        </a>
                                    </div>
                                    <div class="entry-content">

                                        <p>
                                            <p style="text-align: justify;"><?php echo $mota;?></p>
                                        </p>

                                    </div>
                                    <p> <a class="btn" href="tintuc.php?id_tt=<?php echo $id_tt;?>">Xem chi tiết</a> </p>
                                </div>
                                <footer class="entry-meta"><time class="entry-date"><?php echo $ngaydang;?></time></footer>
                            </article>
                            <?php } ?>
                         </div>
                    </div>
                    <div class="pager">
                        <div class="pages">
                            <label>Trang:</label>
                            <ul class="pagination">
                            <?php
                                $tsd = "SELECT count(*) AS tongsodong FROM tintuc";
                                $result_tsd = $mysqli->query($tsd);
                                $arr_tsd = mysqli_fetch_assoc($result_tsd);
                                $tongsodong = $arr_tsd['tongsodong'];
                                $tongsotrang = ceil($tongsodong/$rowcount);
                                for($i=1;$i <= $tongsotrang; $i ++){
                                    if($i == $currentpage){
                                        $active = 'class="active"';
                                    }else{
                                        $active = '';
                                    }
                            ?>
                            <li <?php echo $active;?> ><a href="tintuc.php?trang=<?php echo $i;?>" style="pointer-events:none"><?php echo $i;?></a></li>
                            <?php
                                    
                                }
                            ?>
                             </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-right sidebar col-sm-3">
                <div role="complementary" class="widget_wrapper13" id="secondary">

                    <div class="popular-posts widget widget__sidebar " id="recent-posts-4">
                        <h3 class="widget-title"><span>Tin mới </span></h3>
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
                                ?>
                                <li>
                                    <figure class="featured-thumb" style="width:35%">
                                        <a href="chitiettintuc.php?id_tt=<?php echo $id_tt;?>" title="<?php echo $tentt;?>">
                                            <img style="width:100px;" src="/files/<?php echo $hinhanh;?>"/>
                                        </a>
                                    </figure>
                                    <!--featured-thumb-->
                                    <h4><a title="<?php echo $tentt;?>" href="chitiettintuc.php?id_tt=<?php echo $id_tt;?>"><?php echo $tentt?></a></h4>
                                    <p class="post-meta"><i class="icon-calendar"></i>
                                        <time class="entry-date"><?php echo $ngaydang;?></time> .
                                    </p>
                                </li>
                                <?php } ?>
                               
                            </ul>
                        </div>
                        <!--widget-content-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include $_SERVER["DOCUMENT_ROOT"].'/include/footer.php';?>