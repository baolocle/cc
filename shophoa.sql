-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2016 at 05:13 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shophoa`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdathang`
--

CREATE TABLE `chitietdathang` (
  `id_dh` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `thanhtien` int(11) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietdathang`
--

INSERT INTO `chitietdathang` (`id_dh`, `id_sp`, `soluong`, `thanhtien`, `trangthai`) VALUES
(2, 1, 2, 0, 1),
(4, 2, 4, 0, 1),
(6, 2, 3, 690000, 1),
(6, 4, 1, 250000, 1);

--
-- Triggers `chitietdathang`
--
DELIMITER $$
CREATE TRIGGER `tongtien` AFTER INSERT ON `chitietdathang` FOR EACH ROW BEGIN
	declare tt int;
	SELECT sum(thanhtien) INTO tt FROM chitietdathang WHERE id_dh = NEW.id_dh;
	UPDATE dathang SET tongtien = tt WHERE id_dh = NEW.id_dh;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dathang`
--

CREATE TABLE `dathang` (
  `id_dh` int(5) NOT NULL,
  `tenkh` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `diachi` text COLLATE utf8_unicode_ci NOT NULL,
  `tongtien` int(11) NOT NULL,
  `ngaydat` date NOT NULL,
  `tinhtrang` int(11) NOT NULL,
  `ghichu` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dathang`
--

INSERT INTO `dathang` (`id_dh`, `tenkh`, `sdt`, `diachi`, `tongtien`, `ngaydat`, `tinhtrang`, `ghichu`) VALUES
(1, 'Thui', 'dsfể', '12', 0, '0000-00-00', 1, '13f'),
(4, 'uyen', '13', '13', 0, '0000-00-00', 1, 'fff'),
(6, 'xu', '1', '35', 940000, '2016-04-23', 0, 'et');

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `id_gh` int(11) NOT NULL,
  `id_kh` int(5) NOT NULL,
  `hinh` text COLLATE utf8_unicode_ci NOT NULL,
  `tensanpham` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `giatien` int(11) NOT NULL,
  `sl` int(11) NOT NULL,
  `tt` int(11) NOT NULL,
  `duyet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gioithieu`
--

CREATE TABLE `gioithieu` (
  `id_gt` int(11) NOT NULL,
  `ten` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gioithieu`
--

INSERT INTO `gioithieu` (`id_gt`, `ten`, `noidung`) VALUES
(1, 'Giới thiệu', '<h1>Giới thiệu</h1>\r\n\r\n<p><strong>I. QU&Aacute; TR&Igrave;NH H&Igrave;NH TH&Agrave;NH V&Agrave; PH&Aacute;T TRIỂN</strong></p>\r\n\r\n<p>Trong những năm qua, x&atilde; hội ph&aacute;t triển, kinh tế tăng trưởng đồng thời l&agrave; chất lượng cuộc sống của người d&acirc;n ng&agrave;y c&agrave;ng c&agrave;ng được n&acirc;ng cao nhiều trung t&acirc;m thương mại, nh&agrave; cao tầng, biệt thự được mọc ra k&egrave;m theo đấy l&agrave; nhu cầu mua sắm c&aacute;c mặt h&agrave;ng phục vụ nhu cầu cuộc sống h&agrave;ng ng&agrave;y như hoa v&agrave; qu&agrave; tặng.</p>\r\n\r\n<p>Polo Sore khai trương si&ecirc;u thị số 442 Đội Cấn, Cống Vị, Ba Đ&igrave;nh, H&agrave; Nội, ch&iacute;nh thức tham gia v&agrave;o lĩnh vực kinh doanh b&aacute;n lẻ trực tuyến, tạo ra một phong c&aacute;ch mua sắm ho&agrave;n to&agrave;n mới với người d&acirc;n thủ đ&ocirc;, th&ocirc;ng qua cung cấp c&aacute;c sản phẩm v&agrave; dịch vụ tới người ti&ecirc;u d&ugrave;ng.</p>\r\n\r\n<p><strong>II. MỤC TI&Ecirc;U CHIẾN LƯỢC</strong></p>\r\n\r\n<p>1. Tối đa ho&aacute; gi&aacute; trị đầu tư của c&aacute;c cổ đ&ocirc;ng; giữ vững tốc độ tăng trưởng lợi nhuận v&agrave; t&igrave;nh h&igrave;nh t&agrave;i ch&iacute;nh l&agrave;nh mạnh;</p>\r\n\r\n<p>2. Kh&ocirc;ng ngừng n&acirc;ng cao động lực l&agrave;m việc v&agrave; năng lực c&aacute;n bộ; Polo Sore&nbsp;phải lu&ocirc;n dẫn đầu ng&agrave;nh b&aacute;n lẻ trong việc s&aacute;ng tạo, ph&aacute;t triển ch&iacute;nh s&aacute;ch đ&atilde;i ngộ v&agrave; cơ hội thăng tiến nghề nghiệp cho c&aacute;n bộ của m&igrave;nh;</p>\r\n\r\n<p>3. Duy tr&igrave; sự h&agrave;i l&ograve;ng, trung th&agrave;nh v&agrave; gắn b&oacute; của kh&aacute;ch h&agrave;ng với Polo Sore; x&acirc;y dựng Polo Sore th&agrave;nh một trong những c&ocirc;ng ty h&agrave;ng đầu Việt Nam c&oacute; chất lượng dịch vụ tốt nhất do kh&aacute;ch h&agrave;ng lựa chọn.</p>\r\n\r\n<p>4. Ph&aacute;t triển Polo Sore th&agrave;nh một trong những c&ocirc;ng ty h&agrave;ng đầu Việt Nam về: quản l&yacute; tốt nhất, m&ocirc;i trường l&agrave;m việc tốt nhất, văn ho&aacute; doanh nghiệp ch&uacute; trọng kh&aacute;ch h&agrave;ng, th&uacute;c đẩy hợp t&aacute;c v&agrave; s&aacute;ng tạo, linh hoạt nhất khi m&ocirc;i trường kinh doanh thay đổi.</p>\r\n\r\n<p><strong>III. THẾ MẠNH V&Agrave; ĐỊNH HƯỚNG CỦA C&Ocirc;NG TY</strong></p>\r\n\r\n<p>Với kim chỉ nam l&agrave; &ldquo;<em>Kh&ocirc;ng ngừng ph&aacute;t triển v&igrave; kh&aacute;ch h&agrave;ng</em>&rdquo;, Polo Sore đ&atilde; quy tụ được Ban l&atilde;nh đạo c&oacute; bề d&agrave;y kinh nghiệm trong lĩnh vực b&aacute;n lẻ, kh&ocirc;ng chỉ mạnh về kinh doanh m&agrave; c&ograve;n mạnh về c&ocirc;ng nghệ, c&oacute; nhiều tiềm năng ph&aacute;t triển, kết hợp với đội ngũ nh&acirc;n vi&ecirc;n trẻ, năng động v&agrave; chuy&ecirc;n nghiệp, tạo n&ecirc;n thế mạnh n&ograve;ng cốt của c&ocirc;ng ty để thực hiện tốt c&aacute;c mục ti&ecirc;u đề ra.</p>\r\n\r\n<p>Hơn nữa, tr&ecirc;n cơ sở nguồn lực của c&ocirc;ng ty v&agrave; nhu cầu của x&atilde; hội, Polo Sore<strong>&nbsp;</strong>lựa chọn ph&aacute;t triển kinh doanh hoa v&agrave; qu&agrave; tặng phục vụ nhu cầu thiết yếu của người d&acirc;n với c&aacute;c sản phẩm đa dạng, phong ph&uacute;, mang lại gi&aacute; trị gia tăng cho người ti&ecirc;u d&ugrave;ng th&ocirc;ng qua c&aacute;c dịch vụ sau b&aacute;n h&agrave;ng.</p>\r\n\r\n<p>Qua qu&aacute; tr&igrave;nh ph&aacute;t triển, b&ecirc;n cạnh việc thiết lập được một hệ thống đối t&aacute;c nước trong nước v&agrave; ngo&agrave;i đến từ c&aacute;c doanh nghiệp lớn, c&oacute; thế mạnh trong lĩnh vực ban..., c&ocirc;ng ty sẽ đầu tư v&agrave;o c&aacute;c ng&agrave;nh nghề mới như bất động sản, khai th&aacute;c kho&aacute;ng, đầu tư t&agrave;i ch&iacute;nh... trong thời gian tới.</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `id_kh` int(5) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tenkh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phanquyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`id_kh`, `username`, `password`, `tenkh`, `phanquyen`) VALUES
(1, 'nguyenvana', '123456', 'Nguyễn Văn A', 1),
(2, 'nguyenvanb', '123456', 'Nguyễn Văn B', 1),
(3, 'admin', '123123', 'Uyên Nguyễn', 0),
(6, 'uyen1', '123', 'uyen', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lienhe`
--

CREATE TABLE `lienhe` (
  `id_lh` int(5) NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lienhe`
--

INSERT INTO `lienhe` (`id_lh`, `hoten`, `email`, `noidung`) VALUES
(1, 'uyên', 'uyennlt291@gmail.com', 'xấu'),
(2, 'uyên', 'uyennlt291@gmail.com', 'xấu'),
(3, 'uyên', 'uyennlt291@gmail.com', 'xấu');

-- --------------------------------------------------------

--
-- Table structure for table `loaisp`
--

CREATE TABLE `loaisp` (
  `id_loaisp` int(5) NOT NULL,
  `loaisp` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaisp`
--

INSERT INTO `loaisp` (`id_loaisp`, `loaisp`) VALUES
(1, 'Sản phẩm khuyến mãi'),
(2, 'Hoa Valentine'),
(3, 'Hoa sinh nhật'),
(4, 'Hoa tươi cưới'),
(5, 'Hoa tình yêu'),
(6, 'Quà tặng'),
(7, 'Socola');

-- --------------------------------------------------------

--
-- Table structure for table `phantrang`
--

CREATE TABLE `phantrang` (
  `id_pt` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `public` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phantrang`
--

INSERT INTO `phantrang` (`id_pt`, `admin`, `public`) VALUES
(1, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `quangcao`
--

CREATE TABLE `quangcao` (
  `id_qc` int(11) NOT NULL,
  `hinh` text COLLATE utf8_unicode_ci NOT NULL,
  `tenqc` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `vitri` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quangcao`
--

INSERT INTO `quangcao` (`id_qc`, `hinh`, `tenqc`, `link`, `vitri`) VALUES
(10, '1.jpg', 'Ấm áp yêu thương', 'http://localhost:8080/shophoa/chitietsp.php?id_sp=13', b'0'),
(11, '2.jpg', 'Tình khúc vàng', 'http://localhost:8080/shophoa/chitietsp.php?id_sp=1', b'0'),
(14, '3.jpg', 'Vườn xuân', 'http://localhost:8080/shophoa/chitietsp.php?id_sp=2', b'0'),
(15, '4.jpg', 'Sản phẩm khuyến mãi', 'http://localhost:8080/shophoa/sanpham.php?id_loaisp=1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sp` int(5) NOT NULL,
  `id_loaisp` int(11) NOT NULL,
  `tensp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `chitiet` text COLLATE utf8_unicode_ci NOT NULL,
  `giasp` int(10) NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id_sp`, `id_loaisp`, `tensp`, `hinhanh`, `mota`, `chitiet`, `giasp`, `view`) VALUES
(1, 1, 'HighBrown', '1.jpg', '"Tình Khúc Vàng" với cách bó đơn giản nhưng sang trọng, đã tôn vinh lên hết được ý nghĩa...', '"Tình Khúc Vàng" với cách bó đơn giản nhưng sang trọng, đã tôn vinh lên hết được ý nghĩa tượng trưng của hoa hồng vàng sẵn có trong tình yêu kiêu sa và rực rỡ và không bao giờ phai nhạt.\r\n\r\nBó hoa Tình Khúc Vàng bao gồm:\r\n\r\n- 25 Hoa hồng vàng cao cấp;\r\n\r\n- Hoa mimi (có thể thay đổi hoa phụ tùy theo mùa)\r\n\r\n- Giấy gói Hàn quốc sang trọng.\r\n\r\n\r\n\r\nTình yêu luôn đem đến cho người ta nhiều cảm xúc nhất.\r\n\r\nBó hoa gồm 25 hồng vàng kết hợp với mimi trắng cùng với giấy gói sang trọng.\r\n\r\nVà đó không chỉ là tình yêu đôi lứa, Tình Khúc Vàng có thể thích hợp để tặng sinh nhật, chúc mừng, kỉ niệm, cám ơn...\r\n\r\nDành tặng người mà bạn yêu thương những lời nhắn nhủ thầm kín ẩn trong bó hoa sang trọng và rực rỡ này nhé.\r\n', 200000, 17),
(2, 1, 'GoldBrilliant', '2.jpg', '"Gió xuân thoang thoảng hương hoa Em đi trên cỏ mượt mà đẫm sương Những bông hoa...', '"Gió xuân thoang thoảng hương hoa\r\n\r\nEm đi trên cỏ mượt mà đẫm sương\r\n\r\nNhững bông hoa thắm trong vườn\r\n\r\nĐong đưa cành lá dễ thương khoe mình."\r\n\r\nNhững câu thơ dễ thương như đang vẽ bức chân dung cho giỏ "Vườn xuân".\r\n\r\nHãy đem đến cho những người bạn thương yêu những ngày tươi đẹp và may mắn với giỏ hoa đầy màu sắc của chúng tôi nhé.\r\n\r\n\r\n\r\nGiỏ hoa "Vườn xuân" bao gồm:\r\n\r\n- 4 bông hướng dương,\r\n\r\n- Cát tường xanh,\r\n\r\n- Hoa hồng sen,\r\n\r\n- Hoa hồng phấn,\r\n\r\n- Cúc calimero vàng,\r\n\r\n- Cúc pingpong xanh,\r\n\r\n- Mõm sói,\r\n\r\n- Một số loại lá phụ khác.\r\n', 230000, 14),
(3, 1, 'Bearpaw', '3.jpg', 'Giỏ hoa mang một vẻ đẹp rạng rỡ, tươi mới Kết hợp đa dạng của các loại hoa...', 'Giỏ hoa mang một vẻ đẹp rạng rỡ, tươi mới\r\n\r\nKết hợp đa dạng của các loại hoa như hoa hồng tím, cát tường tím, cát tường xanh, cúc calimero trắng.\r\n\r\nSự sắp xếp tự nhiên và hài hòa của giỏ hoa mang lại cảm giác như mùa xuân đã về đến.\r\n\r\nHãy để "Hương mùa xuân" thổi một làn gió mới đến cho những người thân yêu quanh bạn nhé.\r\n\r\n\r\n\r\nGiỏ hoa "Hương mùa xuân" gồm:\r\n\r\n- Hoa hồng sen;\r\n\r\n- Hoa cát tường các màu;\r\n\r\n- Cúc calimero và các loại lá phụ.\r\n', 180000, 6),
(4, 1, 'Success', '4.jpg', 'Với tông màu vàng tươi sáng của những đoá hướng dương, cúc pingpong trên nền xanh của cẩm tú...', 'Với tông màu vàng tươi sáng của những đoá hướng dương, cúc pingpong trên nền xanh của cẩm tú cầu và các phụ liệu khác.\r\n\r\nThành Công đem đến cho người nhận cảm giác vui tươi, đầy sức sống.\r\n\r\nThành Công thích hợp tặng nhân dịp khai trương, sinh nhật hoặc chúc mừng.\r\n\r\nMẫu hoa cao 70cm.\r\n\r\n\r\n\r\nThành Công gồm:\r\n\r\n- Hoa hướng dương\r\n\r\n- Cúc pingpong vàng\r\n\r\n- Cẩm tú cầu\r\n\r\n- Môn xanh và các phụ liệu khác\r\n', 250000, 6),
(5, 2, 'Moccasin', '5.jpg', 'Bữa Tiệc Hoa Hồng gồm có hoa Hồng Nhung cao cấp. Những đóa hoa Hồng đỏ sắc nhung...', 'Bữa Tiệc Hoa Hồng gồm có hoa Hồng Nhung cao cấp.\r\n\r\nNhững đóa hoa Hồng đỏ sắc nhung huyền được bó và thiết kế theo phong cách hoàng gia quý phái và trang nhã dành tặng cho nữ hoàng của buổi tiệc.\r\n\r\nNhững đóa hoa tươi thắm tôn vinh vẻ đẹp kiêu hãnh của chủ nhân buổi tiệc và cũng thể hiện một tình yêu sâu sắc, cháy bỏng và lời hứa:\r\n\r\n"...chân tình không bao giờ thay đổi..."\r\n\r\nThích hợp để làm hoa sinh nhật, hoa chúc mừng,...\r\n\r\n\r\n\r\nBữa Tiệc Hoa Hồng gồm\r\n\r\n- 50 hoa Hồng Sasa\r\n\r\n- Giấy gói vân long màu trắng đỏ\r\n\r\nLưu ý:\r\n\r\n- Chúng tôi có thể thay thế màu sắc hoa Hồng phù hợp với sở thích khách hàng', 250000, 0),
(6, 2, 'DrSchooll', '6.jpg', 'Bó hoa Trọn vẹn được thiết kế với tông màu xanh đỏ tươi sáng như một lời an lành, hạnh phúc đến người, một hạnh phúc "trọn vẹn". Đây sẽ là món quà tinh thần tuyệt vời dành tặng những người thân yêu của bạn.', 'Bó hoa "Trọn vẹn" gồm:\r\n\r\n- 12 hoa hồng đỏ\r\n\r\n- Hoa cát tường xanh\r\n\r\n- Hoa cúc calimero xanh\r\n\r\n- Hoa mimi trắng\r\n\r\n- Hoa lá phụ', 200000, 0),
(7, 2, 'Pearl', '7.jpg', '"Sắc vàng" mang đến cho người ngắm một cảm nhận về nét đẹp mộc mạc và cổ điển. Không ồn ào cũng chẳng nổi bật như sắc đỏ hồng hoa, thế nhưng "sắc vàng" luôn đủ sức khiến...', '"Sắc vàng" mang đến cho người ngắm một cảm nhận về nét đẹp mộc mạc và cổ điển. Không ồn ào cũng chẳng nổi bật như sắc đỏ hồng hoa, thế nhưng "sắc vàng" luôn đủ sức khiến người ta cảm thấy yên bình và sâu lắng. Chính cái nét đẹp hoài cổ và đầy kiêu hãnh ấy khiến bó hoa trở thành một sự lựa chọn vô cùng thích hợp để dành tặng cho một anh chàng hay một cô nàng ưa nét đẹp giản đơn.\r\nBó hoa "Sắc vàng 2" gồm:\r\n\r\n- 5 hoa hồng vàng\r\n\r\n- 5 hoa đồng tiền vàng\r\n\r\n- Hoa lá phụ', 230000, 0),
(8, 2, 'Hope', '8.jpg', '"Khát vọng" là mẫu hoa được thiết kế chỉ từ một bông hướng dương, hệt như những người trẻ tuổi đi tìm lí tưởng cho cuộc đời mình...', '"Khát vọng" là mẫu hoa được thiết kế chỉ từ một bông hướng dương, hệt như những người trẻ tuổi đi tìm lí tưởng cho cuộc đời mình. Hoa thích hợp để dành tặng bạn bè trong ngày tốt nghiệp, ngày sinh nhật hoặc đơn giản chỉ là một lời động viên, cỗ vũ tinh thần trong một ngày bình thường chẳng cần lí do.\r\nBó hoa "Khát vọng 3" gồm:\r\n\r\n- 1 hoa hướng dương\r\n\r\n- 2 hoa đồng tiền vàng\r\n\r\n- Hoa hồng vàng\r\n\r\n- Hoa lá phụ', 150000, 2),
(9, 3, 'Naturalize', '9.jpg', 'Được thiết kế với tông vàng tươi sang, hộp hoa "Sum họp" mang lại cảm giác ấm áp, tươi vui. Hoa hướng dương xen lẫn cùng hoa mõm sói như hình tượng cả gia đình sum họp...', 'Được thiết kế với tông vàng tươi sang, hộp hoa "Sum họp" mang lại cảm giác ấm áp, tươi vui. Hoa hướng dương xen lẫn cùng hoa mõm sói như hình tượng cả gia đình sum họp. Mẫu hoa thích hợp tang cho những người thân yêu của bạn.\r\nMẫu hoa "Sum họp" gồm các loại hoa:\r\n\r\n- Hoa hướng dương\r\n\r\n- Hoa mõm sói vàng\r\n\r\n- Hoa hồng vàng\r\n\r\n- Hoa cúc calimero xanh\r\n\r\n- Hoa lá phụ', 250000, 0),
(10, 3, 'Lifestride', '10.jpg', 'Với tông màu hồng ngọt ngào của hoa hồng cùng đồng tiền nhí, "Remember" mang lại cảm giác tươi tắn, tràn đầy sức sống...', 'Với tông màu hồng ngọt ngào của hoa hồng cùng đồng tiền nhí, "Remember" mang lại cảm giác tươi tắn, tràn đầy sức sống. "Remember" thích hợp để dành tặng đối tác, chúc mừng sinh nhật, lễ kỉ niệm...vv.\r\n"Remember" được thiết kế từ:\r\n\r\n- Hoa hồng da\r\n\r\n- Hoa đồng tiền nhí\r\n\r\n- Hoa cúc calimero trắng\r\n\r\n- Và các phụ liệu khác', 180000, 0),
(11, 3, 'Aerosoles', '11.jpg', 'Với tông xanh trắng chủ đạo, đây là một trong những thiết kế nổi bật vì sự đơn giản và tinh khôi. Mẫu hoa trong trẻo như một sớm ban mai thanh khiết, dịu dàng và nhiều niềm vui...', 'Với tông xanh trắng chủ đạo, đây là một trong những thiết kế nổi bật vì sự đơn giản và tinh khôi. Mẫu hoa trong trẻo như một sớm ban mai thanh khiết, dịu dàng và nhiều niềm vui. Đây sẽ là một món quà tuyệt vời dành tặng những người thân yêu của bạn.\r\nHộp hoa "Ban mai xanh" gồm các loại hoa:\r\n\r\n- Cẩm tú cầu\r\n\r\n- Hoa hồng trắng\r\n\r\n- Cúc calimero trắng\r\n\r\n- Hoa mimi trắng\r\n\r\n- Hoa lá phụ', 220000, 2),
(12, 3, 'TouchOfNina', '12.jpg', 'Được thiết kế với tông vàng rực rỡ chủ đạo, mẫu hoa như một Bản tình ca dịu dàng, réo rắt...', 'Được thiết kế với tông vàng rực rỡ chủ đạo, mẫu hoa như một Bản tình ca dịu dàng, réo rắt. Những bông hoa thủy tiên vàng mêm mại như những cánh bướm làm nổi bật nhứng cánh hồng tím lãng mạn. Đây sẽ là món quà tuyệt vời dành tặng những người thân yêu của bạn.\r\nHộp hoa "Bản tình ca" gồm các loại hoa:\r\n\r\n- Hoa hồng tím\r\n\r\n- Hoa lan vũ nữ\r\n\r\n- Hoa thủy tiên\r\n\r\n- Hoa lá phụ\r\n\r\n- Kích thước hộp: 20x20cm', 230000, 1),
(13, 4, 'Warming girl', '13.jpg', '', 'Mẫu thiết kế gồm có: \r\n\r\n- Hoa hồng trắng\r\n\r\n- Hoa đồng tiền đỏ\r\n\r\n- Lá và các phụ liệu khác', 300000, 34),
(14, 4, 'Roxy', '14.jpg', '', 'Mẫu thiết kế gồm có: \r\n\r\n- Hoa hồng trắng\r\n\r\n- Hoa lan thái trắng\r\n\r\n- Hoa lá phụ liệu khác', 420000, 0),
(15, 4, 'Violet', '15.jpg', '', 'Bó "Violet" gồm các loại hoa:\r\n\r\n- Phi yến tím\r\n\r\n- Hoa hồng tím\r\n\r\n- Cát tường tím\r\n\r\n- Cẩm chướng tím', 220000, 65),
(16, 4, 'XOXO', '16.jpg', '', '', 320000, 0),
(17, 5, 'Madden', '17.jpg', 'Mẫu hoa "Trót yêu" được thiết kế với tông đỏ chủ đao gồm hoa hồng và lan mokara và chuỗi ngọc. Sắc đỏ nồng nàn ...', 'Mẫu hoa "Trót yêu" được thiết kế với tông đỏ chủ đao gồm hoa hồng và lan mokara và chuỗi ngọc. Sắc đỏ nồng nàn của hoa hồng như một thông điệp yêu thương say đắm dành cho người nhận. Nếu bạn đang tìm kiếm môt món quà cho một nửa của mình, đừng bỏ qua "Trót yêu" nhé.\r\nBình hoa "Trót yêu" gồm:\r\n\r\n- Hoa hồng đỏ Salsa\r\n\r\n- Hoa chuỗi ngọc\r\n\r\n- Hoa lan mokara đỏ\r\n\r\n- Hoa sao tím\r\n\r\n- Hoa lá phụ\r\n\r\n- Bình thủy tinh, kích thước 15x15x15cm', 350000, 0),
(18, 5, 'plataforma', '18.jpg', '"Một chiều thênh thang,về nơi con sóng tràn Nơi đây bình yên một màu xanh gió trong lành..."', '"Một chiều thênh thang,về nơi con sóng tràn Nơi đây bình yên một màu xanh gió trong lành..." Dịu dàng, đáng yêu và ngọt ngào như bản tình ca, mẫu hoa chính là lời nhắn gửi yêu thương đến những người xung quanh bạn. Mẫu hoa thích hợp tặng chúc mừng, sinh nhật, v.v...\r\nMẫu hoa "Bài ca tình yêu" gồm các loại hoa:\r\n\r\n- Hoa hồng sen\r\n\r\n- Hoa hồng tím\r\n\r\n- Hoa cúc calimero trắng\r\n\r\n- Hoa cát tường viền tím\r\n\r\n- Hoa cẩm chướng Nhật (Green Wicky)\r\n\r\n- Hoa lá phụ\r\n\r\n- Bình thủy tinh', 260000, 0),
(19, 5, 'KhomBu', '19.jpg', 'Fall In Love Với 50 bông Hồng Đỏ được cắm trong bình thuỷ tinh màu trắng, tạo nên sự sang trọng và quý phái, thích hợp tặng cho bạn bè và những người mình kính trọng, yêu thương', 'Fall In Love Với 50 bông Hồng Đỏ được cắm trong bình thuỷ tinh màu trắng, tạo nên sự sang trọng và quý phái, thích hợp tặng cho bạn bè và những người mình kính trọng, yêu thương\r\nFall In Love gồm:\r\n\r\n- 50 Hoa Hồng Sasa', 240000, 0),
(20, 5, 'Pinterest', '20.jpg', 'Được thiết kế với tông màu tươi sáng theo tông hồng trắng, bình hoa "Hạnh phúc bất tận" toát lên vẻ đẹp ngọt ngào nhưng cũng không kém phần sang trọng...', 'Được thiết kế với tông màu tươi sáng theo tông hồng trắng, bình hoa "Hạnh phúc bất tận" toát lên vẻ đẹp ngọt ngào nhưng cũng không kém phần sang trọng. Đây sẽ là món quà tuyêt vời dành tặng cho những người thân yêu của bạn.\r\nMẫu hoa "Hạnh phúc bất tận" gồm các loại hoa:\r\n\r\n- Hoa hồng da\r\n\r\n- Hoa hồng sen\r\n\r\n- Hoa tú cầu\r\n\r\n- Hoa mõm sói\r\n\r\n- Hoa lan hồ điệp trắng\r\n\r\n- Các loại hoa lá phụ', 250000, 0),
(21, 5, 'Hilfiger', '21.jpg', 'Được thiết kế với tạo hình xinh xắn, gần gũi, mẫu búp bê này đáng yêu và rất thích hợp làm quà tặng cho những người thân yêu của bạn.', 'Kích thước: 60cm\r\n\r\nMàu sắc: màu hồng', 180000, 0),
(22, 6, 'Le Sole', '22.jpg', 'Đúng như tên gọi, bé khỉ Sunshine đáng yêu sẽ mang nắng vàng ấm áp và nụ cười hạnh phúc đến với bất cứ ai sở hữu bé đấy. Nếu bạn đang chọn một món quà dành tặng những người thân yêu của mình, đừng ngần ngại chọn ngay Sunshine nhé.', 'Kích thước: 35cm\r\n\r\nMàu sắc: Xám\r\n\r\n____________________\r\n\r\nNgoài ra, khỉ Sunshine còn có size nhỏ hơn cho bạn lựa chọn: 26cm', 150000, 0),
(23, 6, 'Ring Jewelry', '23.jpg', 'Có người đã từng nói một nụ cười là khoảng cách ngắn nhất giữa hai tâm hồn, và rằng: nụ cười luôn có sức mạnh nhiều hơn vạn lời nói… Hãy để chú gấu Happiness với khuôn miệng luôn cười giúp bạn lưu giữ kỉ niệm, bày tỏ niềm vui và gửi trao hơi ấm đến người thân thương của mình, bạn nhé!', 'Gấu Happiness là mẫu gấu bông với nụ cười dễ thương cùng hai má hồng nhỏ xinh được rất nhiều khách hàng yêu thích, chọn làm quà tặng.\r\n\r\nVới thiết kế từ sợi lông xoắn mềm mịn cùng lõi gấu bông cao cấp, Happiness không chỉ mang lại một hình ảnh xinh xắn mà còn thân thiện với sức khỏe của người dùng.\r\n\r\nGấu bông Happiness có nhiều kích cỡ phù hợp với sở thích của bạn:\r\n\r\n- Size 1m - đứng 75cm : 600,000đ\r\n\r\n- Size 1m3 - đứng 1m: 800,000đ\r\n\r\n- Size 1m5 - đứng 1m2: 1,150,000đ\r\n\r\n- Size 2m  - đứng 1m6: 1,800,000đ\r\n\r\nBên cạnh đó, còn có nhiều màu sắc cho bạn lựa chọn: \r\n\r\ngấu bông\r\n\r\n \r\n\r\n \r\n\r\nChúng tôi hiểu rằng: Gấu là để ôm. Chính vì vậy, không chỉ quan tâm đến cảm nhận, mà trên hết, chúng tôi quan tâm đến sức khỏe của những người thân yêu mà khách hàng dành tặng. Với Gấu Yêu Thương, chúng tôi cam kết 100% lõi bông hoàn toàn là gòn trắng công nghiệp, nhằm giúp bạn trao hơi ấm, trao tình thân và bảo vệ sức khỏe của người bạn dành tặng.', 500000, 0),
(24, 6, 'Saucony', '24.jpg', 'Chú gấu bông mang trên mình màu tím lãng mạn cùng trái tim có in dòng chữ "My love", hệt như thay bạn tỏ lời với người yêu thương. Kích thước : 95cm', 'Màu sắc:\r\n\r\n- Màu tím như hình. \r\n\r\n*****\r\n\r\nChúng tôi hiểu rằng: Gấu là để ôm. Chính vì vậy, không chỉ quan tâm đến cảm nhận, mà trên hết, chúng tôi quan tâm đến sức khỏe của những người thân yêu mà khách hàng dành tặng. Với Gấu Yêu Thương, chúng tôi cam kết 100% lõi bông hoàn toàn là gòn trắng công nghiệp, nhằm giúp bạn trao hơi ấm, trao tình thân và bảo vệ sức khỏe của người bạn dành tặng.\r\n\r\nLõi bông của gấu', 480000, 1),
(25, 6, 'Impractical', '25.jpg', 'Hộp 10 viên chocolate tươi được chế tác theo hình dạng khác nhau.Mỗi viên cũng ẩn chứa một dòng hương vị riêng biệt như: hương rượu (Nhân Whisky, Cognac, Remy ...),hương các hạt ngũ cốc (nhân hạt gạo,dẻ,hạnh nhân...), hương trái cây.', 'Từ những trái cacao ban đầu, qua quá trình xử lý chế biến, pha trộn sữa, cream, trái cây, hạt, rượu… BONIVA thực sự đã tạo ra một khu vườn hương vị với khỏang 50 loại socola khác nhau cho khách hàng lựa chọn theo nhu cầu.\r\n\r\nNhững người thích hương vị truyền thống có thể chọn cho mình ba loại socola gốc là socola đắng, socola sữa và socola trắng, socola có nhân (PRALINE) dành cho người thích sự mạo hiểm, bí ẩn và thử thách. Đặc biệt hơn nữa của SHOP BONIVA, sản phẩm đến tay người tiêu dùng là socola TƯƠI – thời gian xuất xưởng không quá 10 ngày – đáp ứng được nhu cầu thưởng thức loại socola cao cấp với hương vị đang còn nồng nàn từ những nguyên liệu thiên nhiên ban tặng.\r\n\r\nNhiều chuyên gia nghề bếp người Bỉ chuyên về socola có nhân đã bị quyến rũ bởi hương vị nóng bỏng của miền nhiệt đới, nó đem đến cho chúng ta một sự bất ngờ tuyệt vời! Ngoài các lọai nhân truyền thống như Cappuccino, hạnh nhân, rượu loãng XO, whisky, liqueur, hạt Macadamia, các lọai Truffle…,\r\n\r\nBONIVA còn đột phá tạo ra socola của miền nhiệt đới như nhân sầu riêng, chanh dây, caramel gừng, tropicana…,đây là dòng sản phẩm độc đáo và hoàn toàn mới.', 200000, 0),
(26, 7, 'Planet Women’s', '26.jpg', 'Hương Vị Tình Yêu : Hộp 32 viên chocolate tươi được chế tác theo hình dạng khác nhau.Mỗi viên cũng ẩn chứa một dòng hương vị riêng biệt như: hương rượu (Nhân Whisky, Cognac, Remy ...),hương các hạt ngũ cốc (nhân hạt gạo,dẻ,hạnh nhân...), hương trái cây..', 'Từ những trái cacao ban đầu, qua quá trình xử lý chế biến, pha trộn sữa, cream, trái cây, hạt, rượu… BONIVA thực sự đã tạo ra một khu vườn hương vị với khỏang 50 loại socola khác nhau cho khách hàng lựa chọn theo nhu cầu.\r\n\r\nNhững người thích hương vị truyền thống có thể chọn cho mình ba loại socola gốc là socola đắng, socola sữa và socola trắng, socola có nhân (PRALINE) dành cho người thích sự mạo hiểm, bí ẩn và thử thách. Đặc biệt hơn nữa của SHOP BONIVA, sản phẩm đến tay người tiêu dùng là socola TƯƠI – thời gian xuất xưởng không quá 10 ngày – đáp ứng được nhu cầu thưởng thức loại socola cao cấp với hương vị đang còn nồng nàn từ những nguyên liệu thiên nhiên ban tặng.\r\n\r\nNhiều chuyên gia nghề bếp người Bỉ chuyên về socola có nhân đã bị quyến rũ bởi hương vị nóng bỏng của miền nhiệt đới, nó đem đến cho chúng ta một sự bất ngờ tuyệt vời! Ngoài các lọai nhân truyền thống như Cappuccino, hạnh nhân, rượu loãng XO, whisky, liqueur, hạt Macadamia, các lọai Truffle…,\r\n\r\nBONIVA còn đột phá tạo ra socola của miền nhiệt đới như nhân sầu riêng, chanh dây, caramel gừng, tropicana…,đây là dòng sản phẩm độc đáo và hoàn toàn mới.', 240000, 1),
(27, 7, 'Fergalicious', '27.jpg', 'Gift Of Love: Hộp 30 viên chocolate tươi được chế tác theo hình dạng khác nhau.Mỗi viên cũng ẩn chứa một dòng hương vị riêng biệt như: hương rượu (Nhân Whisky, Cognac, Remy ...),hương các hạt ngũ cốc (nhân hạt gạo,dẻ,hạnh nhân...), hương trái cây.. ', 'Từ những trái cacao ban đầu, qua quá trình xử lý chế biến, pha trộn sữa, cream, trái cây, hạt, rượu… BONIVA thực sự đã tạo ra một khu vườn hương vị với khỏang 50 loại socola khác nhau cho khách hàng lựa chọn theo nhu cầu.\r\n\r\nNhững người thích hương vị truyền thống có thể chọn cho mình ba loại socola gốc là socola đắng, socola sữa và socola trắng, socola có nhân (PRALINE) dành cho người thích sự mạo hiểm, bí ẩn và thử thách. Đặc biệt hơn nữa của SHOP BONIVA, sản phẩm đến tay người tiêu dùng là socola TƯƠI – thời gian xuất xưởng không quá 10 ngày – đáp ứng được nhu cầu thưởng thức loại socola cao cấp với hương vị đang còn nồng nàn từ những nguyên liệu thiên nhiên ban tặng.\r\n\r\nNhiều chuyên gia nghề bếp người Bỉ chuyên về socola có nhân đã bị quyến rũ bởi hương vị nóng bỏng của miền nhiệt đới, nó đem đến cho chúng ta một sự bất ngờ tuyệt vời! Ngoài các lọai nhân truyền thống như Cappuccino, hạnh nhân, rượu loãng XO, whisky, liqueur, hạt Macadamia, các lọai Truffle…,\r\n\r\nBONIVA còn đột phá tạo ra socola của miền nhiệt đới như nhân sầu riêng, chanh dây, caramel gừng, tropicana…,đây là dòng sản phẩm độc đáo và hoàn toàn mới.', 30000, 1),
(28, 7, 'New Blance', '28.jpg', 'Hộp kim cương tình yêu gồm 6 viên chocolate tươi được chế tác theo hình dạng khác nhau.Mỗi viên cũng ẩn chứa một dòng hương vị riêng biệt như: hương rượu (Nhân Whisky, Cognac, Remy ...),hương các hạt ngũ cốc (nhân hạt gạo,dẻ,hạnh nhân...), hương trái cây.. Cùng nhau chia sẽ hương vị ngọt ngào này cho bạn bè và người thân nhé. ', 'Từ những trái cacao ban đầu, qua quá trình xử lý chế biến, pha trộn sữa, cream, trái cây, hạt, rượu… BONIVA thực sự đã tạo ra một khu vườn hương vị với khỏang 50 loại socola khác nhau cho khách hàng lựa chọn theo nhu cầu.\r\n\r\nNhững người thích hương vị truyền thống có thể chọn cho mình ba loại socola gốc là socola đắng, socola sữa và socola trắng, socola có nhân (PRALINE) dành cho người thích sự mạo hiểm, bí ẩn và thử thách. Đặc biệt hơn nữa của SHOP BONIVA, sản phẩm đến tay người tiêu dùng là socola TƯƠI – thời gian xuất xưởng không quá 10 ngày – đáp ứng được nhu cầu thưởng thức loại socola cao cấp với hương vị đang còn nồng nàn từ những nguyên liệu thiên nhiên ban tặng.\r\n\r\nNhiều chuyên gia nghề bếp người Bỉ chuyên về socola có nhân đã bị quyến rũ bởi hương vị nóng bỏng của miền nhiệt đới, nó đem đến cho chúng ta một sự bất ngờ tuyệt vời! Ngoài các lọai nhân truyền thống như Cappuccino, hạnh nhân, rượu loãng XO, whisky, liqueur, hạt Macadamia, các lọai Truffle…,\r\n\r\nBONIVA còn đột phá tạo ra socola của miền nhiệt đới như nhân sầu riêng, chanh dây, caramel gừng, tropicana…,đây là dòng sản phẩm độc đáo và hoàn toàn mới.', 340000, 1),
(34, 3, 'Borjan', '29.jpg', 'Giỏ hoa "Nhiệt huyết 2" được thiết kế với tông màu cam chủ đạo. Như một lời chúc ngày mới tràn đầy năng lượng và sáng tạo. Thêm sắc xanh của cát tường và cúc calimero, "Nhiệt huyết 2" khoác thêm trên mình một hi vọng...', '<p>Giỏ hoa &quot;Nhiệt huyết 2&quot; được thiết kế với t&ocirc;ng m&agrave;u cam chủ đạo. Như một lời ch&uacute;c ng&agrave;y mới tr&agrave;n đầy năng lượng v&agrave; s&aacute;ng tạo. Th&ecirc;m sắc xanh của c&aacute;t tường v&agrave; c&uacute;c calimero, &quot;Nhiệt huyết 2&quot; kho&aacute;c th&ecirc;m tr&ecirc;n m&igrave;nh một hi vọng về sự th&agrave;nh c&ocirc;ng. H&atilde;y d&agrave;nh tặng &quot;Nhiệt huyết 2&quot; cho bạn b&egrave;, người th&acirc;n, đồng nghiệp ... của m&igrave;nh, bạn nh&eacute;!</p>\r\n\r\n<p>Giỏ hoa &quot;Nhiệt huyết 2&quot; gồm:</p>\r\n\r\n<p>- Hoa hồng cam</p>\r\n\r\n<p>- Đồng tiền cam (ngắt c&aacute;nh)</p>\r\n\r\n<p>- Hoa c&uacute;c calimero xanh</p>\r\n\r\n<p>- C&aacute;t tường xanh&nbsp;</p>\r\n\r\n<p>- c&aacute;c loại hoa l&aacute; phụ kh&aacute;c.&nbsp;</p>\r\n\r\n<p>- C&aacute;c phụ liệu kh&aacute;c</p>\r\n\r\n<p>- Giỏ m&acirc;y hoặc c&aacute;c loại giỏ kh&aacute;c c&oacute; sẵn tại shop.&nbsp;</p>\r\n', 300000, 0),
(35, 3, 'Amuze', '30.jpg', 'Xin chào! Có phải bạn đang tìm kiếm một món quà gửi tặng người thương? Và….hmm…bạn cũng đang phân vân không biết tặng gì thì phù hợp với người ấy, phù hợp với mối quan hệ vừa mới chớm nở của cả hai? Nếu đúng như vậy thì đích thị Hello là một gợi ý không tồi dành cho bạn đấy!...', '<p>Xin ch&agrave;o! C&oacute; phải bạn đang t&igrave;m kiếm một m&oacute;n qu&agrave; gửi tặng người thương? V&agrave;&hellip;.hmm&hellip;bạn cũng đang ph&acirc;n v&acirc;n kh&ocirc;ng biết tặng g&igrave; th&igrave; ph&ugrave; hợp với người ấy, ph&ugrave; hợp với mối quan hệ vừa mới chớm nở của cả hai? Nếu đ&uacute;ng như vậy th&igrave; đ&iacute;ch thị Hello l&agrave; một gợi &yacute; kh&ocirc;ng tồi d&agrave;nh cho bạn đấy! Được t&ocirc; điểm bởi những đ&oacute;a hoa dịu ngọt v&agrave; nhẹ nh&agrave;ng nhất, giỏ hoa Hello như một lời ch&agrave;o đầy e ấp mỗi sớm mai. D&agrave;nh tặng Hello cho người thương tựa như trao cho họ lời thầm th&igrave;: Xin ch&agrave;o, lại l&agrave; tớ - người tr&oacute;t thương thầm cậu đ&acirc;y&hellip; C&ograve;n chờ g&igrave; nữa m&agrave; kh&ocirc;ng để Hello gi&uacute;p bạn bắt đầu chuyện t&igrave;nh dễ thương với người ấy, bạn nhỉ?</p>\r\n\r\n<p>Giỏ hoa &quot;Hello&quot; gồm c&aacute;c loại hoa:</p>\r\n\r\n<p>- Hoa hồng t&iacute;m</p>\r\n\r\n<p>- Hoa hồng da</p>\r\n\r\n<p>- Hoa lan vườn</p>\r\n\r\n<p>- Hoa hồng sen</p>\r\n\r\n<p>- Hoa thủy ti&ecirc;n</p>\r\n\r\n<p>- C&aacute;c loại hoa l&aacute; phụ kh&aacute;c</p>\r\n', 320000, 0),
(36, 7, 'B.O.C', '31.jpg', 'Hộp 14 viên chocolate tươi được chế tác theo hình dạng khác nhau.Mỗi viên cũng ẩn chứa một dòng hương vị riêng biệt như: hương rượu ', '<p>Hộp 14 vi&ecirc;n chocolate tươi được chế t&aacute;c theo h&igrave;nh dạng kh&aacute;c nhau.Mỗi vi&ecirc;n cũng ẩn chứa một d&ograve;ng hương vị ri&ecirc;ng biệt như: hương rượu (Nh&acirc;n Whisky, Cognac, Remy ...),hương c&aacute;c hạt ngũ cốc (nh&acirc;n hạt gạo,dẻ,hạnh nh&acirc;n...), hương tr&aacute;i c&acirc;y..&nbsp;<img alt="" src="https://hoayeuthuong.com/editor/tiny_mce/plugins/advimage/ShowItemSubImage.aspx?id=842" style="height:360px; width:300px" /></p>\r\n', 280000, 0),
(37, 2, 'BlueBeauty', '32.jpg', 'Trái tim bằng hoa hồng được kết trên hộp gỗ mộc mạc, nền lá xanh hi vọng tượng trưng cho tình yêu mà bạn muốn nhắn gửi đến người ấy...', '<p>Tr&aacute;i tim bằng hoa hồng được kết tr&ecirc;n hộp gỗ mộc mạc, nền l&aacute; xanh hi vọng tượng trưng cho t&igrave;nh y&ecirc;u m&agrave; bạn muốn nhắn gửi đến người ấy. Đối với t&igrave;nh y&ecirc;u, c&agrave;ng đơn giản c&agrave;ng hạnh ph&uacute;c, giống như hộp hoa tr&aacute;i tim n&agrave;y vậy.</p>\r\n\r\n<p>Hộp hoa &quot;Gửi t&igrave;nh y&ecirc;u của t&ocirc;i&quot; được kết từ 30-35 hoa hồng đỏ sasa tr&ecirc;n hộp gỗ mộc mạc.&nbsp;&nbsp;</p>\r\n', 340000, 1),
(38, 5, 'Clarks', '33.jpg', 'Rạng Rỡ 2 gồm có bình hoa thủy tinh và 30 hoa hồng sen. Với lời nhắn ý nghĩa "Tình yêu anh dành cho em là bất tận" Thích hợp để tặng sinh nhật, chúc mừng,...', '<p>B&igrave;nh hoa &quot;Rạng rỡ 2&quot; gồm:</p>\r\n\r\n<p>- 30 hoa hồng sen</p>\r\n\r\n<p>- Hoa thủy ti&ecirc;n</p>\r\n\r\n<p>- Hoa l&aacute; phụ</p>\r\n\r\n<p>- B&igrave;nh thủy tinh</p>\r\n', 240000, 0),
(39, 5, 'Stiletto', '34.jpg', 'Sau một tuần làm việc mệt nhoài, chúng ta đều có quyền tự thưởng cho mình những ngày nghỉ để phục hồi năng lượng. Những ngày cuối tuần có thể trôi qua nhẹ nhàng và tùy ý, miễn sao chúng khiến bản thân cảm thấy thoải mái, dễ chịu.', '<p>Sau một tuần l&agrave;m việc mệt nho&agrave;i, ch&uacute;ng ta đều c&oacute; quyền tự thưởng cho m&igrave;nh những ng&agrave;y nghỉ để phục hồi năng lượng. Những ng&agrave;y cuối tuần c&oacute; thể tr&ocirc;i qua nhẹ nh&agrave;ng v&agrave; t&ugrave;y &yacute;, miễn sao ch&uacute;ng khiến bản th&acirc;n cảm thấy thoải m&aacute;i, dễ chịu. Dựa tr&ecirc;n &yacute; tưởng đ&oacute;, &ldquo;Ng&agrave;y cuối tuần&rdquo; ra đời với sự tập hợp của nhiều loại hoa c&oacute; điểm chung l&agrave; dịu nhẹ, tinh khiết. Hy vọng rằng m&oacute;n qu&agrave; n&agrave;y sẽ đem đến cho kh&aacute;ch h&agrave;ng &ldquo;một l&agrave;n gi&oacute; m&aacute;t&rdquo;, giảm bớt &aacute;p lực giữa cuộc sống bộn bề lo toan, tiếp sức cho những ng&agrave;y d&agrave;i ph&iacute;a trước.</p>\r\n\r\n<p>B&igrave;nh hoa &quot;Ng&agrave;y cuối tuần&quot; gồm c&aacute;c loại hoa:</p>\r\n\r\n<p>- Hoa hồng sen</p>\r\n\r\n<p>- Hoa hồng da</p>\r\n\r\n<p>- Hoa c&uacute;c calimero trắng</p>\r\n\r\n<p>- Hoa baby</p>\r\n\r\n<p>- C&aacute;c loại hoa l&aacute; phụ</p>\r\n\r\n<p>- B&igrave;nh thủy tinh</p>\r\n', 170000, 0),
(40, 1, 'Sports', '35.jpg', 'Được thiết kế với tông màu hồng tím, bình hoa Dịu dàng 2 mang lại một vẻ đẹp dịu dàng, ngọt ngào và không kém phần lãng mạn. Những hoa cát tường tím điểm xuyết trên nền hoa hồng trắng kết hợp đồng tiền nhí. ', '<p>Được thiết kế với t&ocirc;ng m&agrave;u hồng t&iacute;m, b&igrave;nh hoa Dịu d&agrave;ng 2 mang lại một vẻ đẹp dịu d&agrave;ng, ngọt ng&agrave;o v&agrave; kh&ocirc;ng k&eacute;m phần l&atilde;ng mạn. Những hoa c&aacute;t tường t&iacute;m điểm xuyết tr&ecirc;n nền hoa hồng trắng kết hợp đồng tiền nh&iacute;. Một b&igrave;nh hoa thế n&agrave;y sẽ l&agrave; m&oacute;n qu&agrave; tuyệt vời để ch&uacute;c người lu&ocirc;n hạnh ph&uacute;c v&agrave; ngập tr&agrave;n t&igrave;nh y&ecirc;u</p>\r\n\r\n<p>B&igrave;nh hoa &quot;Dịu d&agrave;ng 2&quot; gồm:</p>\r\n\r\n<p>- Hoa đồng tiền hồng</p>\r\n\r\n<p>- Hoa hồng trắng</p>\r\n\r\n<p>- Hoa c&aacute;t tường t&iacute;m</p>\r\n\r\n<p>- Hoa thạch thảo t&iacute;m</p>\r\n\r\n<p>- Hoa t&uacute; cầu</p>\r\n', 250000, 0),
(41, 2, 'BlackMen', '36.jpg', 'Gắn Kết Yêu Thương gồm hoa hoa đồng tiền nhiều màu kết hơp cùng các loại lá phụ cao cấp. Những sắc màu tươi tắn, trẻ trung, đáng yêu và đầy cá tính của hai trái tim', '<p>Gắn Kết Y&ecirc;u Thương gồm hoa hoa đồng tiền nhiều m&agrave;u kết hơp c&ugrave;ng c&aacute;c loại l&aacute; phụ cao cấp. Những sắc m&agrave;u tươi tắn, trẻ trung, đ&aacute;ng y&ecirc;u v&agrave; đầy c&aacute; t&iacute;nh của hai tr&aacute;i tim trẻ nguyện s&aacute;nh bước v&agrave; gắn kết c&ugrave;ng nhau tr&ecirc;n con đường đời. Th&iacute;ch hợp để tặng ch&uacute;c sức khỏe, kỉ niệm,...</p>\r\n\r\n<p>&nbsp;Gắn Kết Y&ecirc;u Thương III gồm :</p>\r\n\r\n<p>- Hoa đồng tiền c&aacute;c m&agrave;u</p>\r\n\r\n<p>- C&aacute;c loại l&aacute; phụ kh&aacute;c</p>\r\n', 230000, 0),
(42, 7, 'Cycle love', '37.jpg', 'Cycle Love là sự kết hợp độc đáo giữa chocolate nghệ thuật hình chiếc xe đạp tình yêu và Chocolate tươi là món quà đáng yêu và ý nghĩa cho Valentine này.', '<p>Cycle Love l&agrave; sự kết hợp độc đ&aacute;o giữa chocolate nghệ thuật h&igrave;nh chiếc xe đạp t&igrave;nh y&ecirc;u v&agrave; Chocolate tươi l&agrave; m&oacute;n qu&agrave; đ&aacute;ng y&ecirc;u v&agrave; &yacute; nghĩa cho Valentine n&agrave;y. H&ocirc;̣p g&ocirc;̀m 8 vi&ecirc;n Chocolate tươi và chocolate ngh&ecirc;̣ thu&acirc;̣t kích thước 100 x 150 x 6 mm với nguy&ecirc;n li&ecirc;̣u từ Chocolate couverture của t&acirc;̣p đoàn Callebaut</p>\r\n', 140000, 0),
(43, 7, 'Chaco', '38.jpg', 'Hộp socola "I Love You" gồm 3 thỏi chocolate có chữ I Love You nằm vừa vặn trong hộp thiếc màu nâu cổ điển.', '', 140000, 0),
(44, 7, 'Blue Diamond', '39.jpg', 'Hộp "Blue Diamonds" của Chocolate Graphics bao gồm 16 viên sô-cô-la tươi được chế tác theo hình dạng khác nhau.', '<p>Hộp &quot;Blue Diamonds&quot; của Chocolate Graphics bao gồm 16 vi&ecirc;n s&ocirc;-c&ocirc;-la tươi được chế t&aacute;c theo h&igrave;nh dạng kh&aacute;c nhau. Mỗi vi&ecirc;n cũng ẩn chứa một d&ograve;ng hương vị ri&ecirc;ng biệt như: hạt dẻ, cam, tr&agrave; xanh, rượu bailey, hạt m&acirc;m x&ocirc;i, hạnh nh&acirc;n, dừa, bột cacao, rượu rhum, bạc h&agrave;, signature, c&agrave; ph&ecirc;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 280000, 0),
(45, 6, 'beautiful', '40.jpg', 'Chơi trò chơi, hát những bài hát, thưởng thức rất nhiều học vui vẻ với người bạn dễ thương...', '<p>Chơi tr&ograve; chơi, h&aacute;t những b&agrave;i h&aacute;t, thưởng thức rất nhiều học vui vẻ với người bạn dễ thương n&agrave;y.</p>\r\n\r\n<p>Ch&uacute; ch&oacute; Puppy c&oacute; hai chế độ chơi tương t&aacute;c với c&aacute;c b&agrave;i h&aacute;t phổ biến ABC song, 1-2-3, m&agrave;u sắc v&agrave; c&aacute;c bộ phận của cơ thể, c&ugrave;ng với c&aacute;c b&agrave;i h&aacute;t y&ecirc;u th&iacute;ch v&agrave; c&aacute;c tr&ograve; chơi, bao gồm Itsy-Bitsy Spider, Pat-a-Cake, This Little Puppy Went to Market, Head Shoulders Knees And Toes v&agrave; nhiều hơn nữa.</p>\r\n\r\n<p>Vừa học tiếng Anh vừa chơi tr&ograve; chơi trẻ em v&agrave; ca h&aacute;t h&agrave;ng ng&agrave;y!</p>\r\n\r\n<p>B&eacute; y&ecirc;u sẽ th&iacute;ch ca h&aacute;t, nhảy m&uacute;a v&agrave; chơi với ch&uacute; ch&oacute; Puppy đ&aacute;ng y&ecirc;u</p>\r\n\r\n<p><img alt="" src="http://media.bizwebmedia.net/Sites/114777/data/images/2015/4/2027227cho_biet_hat__1.jpg?0" style="height:600px; width:600px" /></p>\r\n\r\n<p>Ch&uacute; ch&oacute; Puppy đ&aacute;ng y&ecirc;u gi&uacute;p b&eacute; ph&aacute;t triển cảm gi&aacute;c &acirc;u yếm, y&ecirc;u thương, &ocirc;m ấp v&agrave; thể hiện t&igrave;nh bạn</p>\r\n\r\n<p>Gi&uacute;p b&eacute; t&igrave;m hiểu về c&aacute;c bộ phận của cơ thể.</p>\r\n\r\n<p>Giới thiệu v&agrave; dạy b&eacute; học bảng chữ c&aacute;i, m&agrave;u sắc v&agrave; đếm số</p>\r\n\r\n<p>Gi&uacute;p con hiểu được c&aacute;c kết nối giữa c&aacute;c từ ngữ v&agrave; h&igrave;nh ảnh</p>\r\n\r\n<p>Tr&aacute;i tim của ch&uacute; ch&oacute; ph&aacute;t s&aacute;ng theo từng điệu nhạc, gi&uacute;p con biết y&ecirc;u thương v&agrave; thể hiện t&igrave;nh y&ecirc;u thương nồng n&agrave;n l&agrave; như thế n&agrave;o, khi c&oacute; một ch&uacute; ch&oacute; trung th&agrave;nh b&ecirc;n con từ tấm b&eacute;</p>\r\n', 250000, 0),
(46, 6, 'Spring Summer', '41.jpg', 'Với kiểu dáng trẻ trung cùng thiết kế mặt số dạ quang sáng tạo và gam vàng thanh lịch,...', '<p>Với kiểu d&aacute;ng trẻ trung c&ugrave;ng thiết kế mặt số dạ quang s&aacute;ng tạo v&agrave; gam v&agrave;ng thanh lịch, đồng hồ đeo tay sẽ đem lại vẻ ngo&agrave;i thời trang v&agrave; năng động cho c&aacute;c bạn. H&atilde;y kết hợp c&aacute;c trang phục c&ugrave;ng m&agrave;u ton sur ton để bạn tr&ocirc;ng c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch hơn nữa.</p>\r\n\r\n<p>Chất liệu nhựa tổng hợp, m&agrave;u trắng. Quai c&oacute; thiết kế khe hở d&ugrave;ng để điều chỉnh k&iacute;ch thước đeo tay.</p>\r\n\r\n<p>Mặt tr&ograve;n to bản. C&oacute; 1 n&uacute;t chỉnh giờ v&agrave; 4 n&uacute;t đ&egrave;n dạ quang.</p>\r\n\r\n<p>Chống thấm nước. Chiều d&agrave;i 25 cm. Chiều rộng d&acirc;y quai l&agrave; 2 cm.<img alt="" src="http://media.bizwebmedia.net/Sites/114777/data/images/2015/4/5531990dong_ho_3__2.jpg?0" style="height:1100px; width:1100px" /></p>\r\n', 140000, 1),
(47, 4, 'Frye', '42.jpg', 'Sắc màu tình yêu không thể thiếu cho ngày cưới của bạn...', '<p>Mẫu thiết kế gồm c&oacute;:&nbsp;</p>\r\n\r\n<p>- Hoa c&aacute;t tường t&iacute;m, hồng, xanh, trắng&nbsp;</p>\r\n\r\n<p>- Hoa cẩm chướng hồng phấn</p>\r\n\r\n<p>- Phụ liệu kh&aacute;c</p>\r\n', 450000, 0),
(48, 4, 'Hoka One One', '34.jpg', '', '<p>B&oacute; hoa cưới với kiểu b&oacute; tr&ograve;n, sử dụng hoa hồng nhiều m&agrave;u.</p>\r\n', 37000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `id_tt` int(11) NOT NULL,
  `tentt` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydang` date NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL,
  `mota` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`id_tt`, `tentt`, `ngaydang`, `hinhanh`, `mota`, `noidung`) VALUES
(1, '10 loại socola ngon nhất thế giới', '2016-04-14', '24.jpg', 'Bạn đang muốn chọn một loại chocolate tuyệt ngon dành tặng người yêu? Vậy hãy cùng xem những gợi ý dưới đây từ Quà Tặng Phụ Nữ nhé! \r\nTừ những thanh chocolate đen nguyên chất, cho tới kẹo chocolate có nhân rượu màu, hay những thỏi chocolate đắng, tất cả đều ngon đến ngỡ ngàng. Bạn sẽ chẳng bao giờ hối tiếc khi lỡ đam mê các loại bánh kẹo của những hãng này:', '1. Teuscher (Zurich, Thụy Sĩ)\r\nChocolate Teuscher được bắt đầu sản xuất từ hơn 70 năm trước, tại một thị trấn nhỏ trong dãy Alps (Thụy Sĩ). Dolf Teuscher đã đi khắp thế giới để tìm những loại ca cao ngon nhất, cũng như tìm ra các loại bột hạnh nhân, hoa quả, các loại hạt và phụ liệu phù hợp để có thể làm được những viên kẹo của riêng mình. Sau nhiều năm thử nghiệm, ông đã hòa trộn được những thành phần ấy trong công thức làm chocolate nổi tiếng ngày nay.\r\nChocolate Teuscher hiện giờ có hơn 100 loại khác nhau, tất cả đều có chung một công thức nguyên thủy được truyền lại từ đời bố sang đời con.\r\nChỉ những loại thành phần tự nhiên đắt giá nhất mới được sử dụng, và tuyệt đối không có một chút hóa chất, phụ gia hay chất bảo quản nào được thêm vào. Hàng tuần, những thanh chocolate từ cửa hàng của Teuscher được chuyển đi khắp thế giới.\r\n\r\n2. Vosges Haut-Chocolat (Chicago, Illinois, Mỹ)\r\nBà chủ Katrina Markoff, cũng là nghệ nhân làm chocolate rất kỹ tính trong việc lựa chọn các loại phụ liệu, các loại hoa, cũng như các loại chocolate để đưa vào gian bếp làm bánh của hãng Vosges. Bà đã học nghệ thuật làm chocolate tại hàng làm bánh Le Cordon Bleu ở Paris (Pháp).\r\n\r\n3. Chocolate Scharffen Berger (Berkeley, California, Mỹ)\r\nNổi tiếng với những thanh chocolate đen, Scharffen Berger Maker là nhà sản xuất "kẹo đen" hàng đầu thế giới. Các quy trình sản xuất được thực hiện độc lập, để bảo đảm rằng hương vị chocolate ở đây không giống bất kỳ nơi nào khác.\r\nNhững thanh chocolate được làm từ loại ca cao tốt nhất thế giới, cùng quy trình kiểm nghiệm cẩn trọng và cách rang xay độc đáo. Tất cả những viên chocolate được sản xuất theo từng mẻ nhỏ, bằng phương pháp hoàn toàn thủ công.\r\nCùng với loại chocolate ăn ngay thường gặp, Scharffen Berger còn có cả loại chocolate thực phẩm (hay còn gọi là chocolate đắng).\r\n\r\n4. Hãng chocolate Jacques Torres (New York, Mỹ)\r\nNếu đặt chân vào cửa hàng chocolate Jacques Torres, bạn sẽ cảm thấy như thể mình đang bước vào một cửa hàng bán đồ chuyên dụng nhỏ ở châu Âu. Rất nhiều khách hàng đã so sánh trải nghiệm này với cảm giác khi xem bộ phim Chocolat Jacques được làm thủ công từ những thanh chocolate tươi.\r\nHãy nếm luôn tại đây, những chiếc ghế trong cửa hàng luôn được chào đón bạn ngồi xuống, nhấm nháp từng ngụm chocolate nóng, và thưởng thức những chiếc bánh nướng nhân chocolate mới làm, hoặc đặt mua một gói mang về.\r\nKhách đến cửa hàng sẽ được xem tận mắt quá trình làm những viên kẹo sô cô la qua khung cửa kính. Có tất cả năm cửa hàng chocolate Jacques Torres ở NewYork và một cửa hàng ở Harrah thành phố Atlantic.\r\n\r\n5. Hãng bánh kẹo Norman Love (Ft. Myers, Florida, Mỹ)\r\n“Chocolate là niềm đam mê của tôi” - đó là lời của Norman Love, người luôn mơ về việc làm ra những thanh chocolate không chỉ hấp dẫn mà còn thực sự ngon lành. Ông Love và một cộng sự đã hoàn thiện kỹ thuật vẽ màu cho từng viên kẹo hoặc vẽ bằng tay một cách thủ công, hoặc dùng cách sơn airbrush.\r\nNhững khuôn làm kẹo sau khi sơn vẽ sẽ được rót đầy những loại chocolate hàng đầu của Bỉ, Pháp và Thụy Sĩ. Kẹo chocolate bí ngô trắng là loại hấp dẫn nhất.\r\nNhững loại kẹo khác của Norman Love cũng đều có thành phần rất tinh khiết như quả mâm xôi, chuối, gừng, caramel, chanh leo, hạt dẻ…\r\n\r\n6. Valrhona (Pháp)\r\nHãng Valrhona đã không ngừng tạo ra những loại chocolate ngon bậc nhất thế giới từ những năm 1922. Hạt ca cao được hãng đặt mua trực tiếp từ những đồn điền hàng đầu ở Nam Mỹ, Caribê, và khu vực Thái Bình Dương.\r\nValrhone cũng là một trong những hãng sản xuất chocolate đầu tiên giới thiệu sản phẩm của mình giống như các hãng rượu đã làm. Những thanh chocolate được gắn nhãn như: grand cru (theo vùng đất có nguyên liệu tốt nhất), vintage (theo độ tuổi sản phẩm), single origins (có nguồn gốc sản phẩm từ một vùng đơn lẻ), hay single estate …\r\nTừ năm 2008, hãng này còn giới thiệu loại chocolate Xocopili có vị cay và mặn.\r\n\r\n7. Hãng chocolate Godiva (Brussels, Bỉ và trên toàn thế giới)\r\nNhững thanh chocolate đầu tiên của hãng Godiva được làm vào năm 1920, trong một cửa hàng làm chocolate và bánh kẹo của gia đình nhà Draps ở thành phố Brussels, nước Bỉ.\r\nNăm 14 tuổi, Joseph Draps bắt đầu tham gia vào công việc kinh doanh của gia đình. Sau nhiều năm, ông đã phát huy hết năng lực và sực sáng tạo của mình trong vai trò một nghệ nhân làm chocolate, cũng như một doanh nhân tài năng.\r\nÔng quyết định tạo ra hàng loạt những loại chocolate nổi tiếng, và đặt cho chúng những cái tên rất dễ gợi nhớ. Cũng chính ông đã chọn tên gọi “Godiva” và đặt những viên chocolate của mình trong những chiếc hộp bằng vàng khiến ai cũng có thể nhận ra ngay tức thì. Chất lượng tuyệt hảo của chocolate Godiva được ghi nhận bằng việc họ được chọn là nhà cung cấp chính cho toàn nước Bỉ.\r\nGodiva hiện vẫn tiếp tục là hãng sản xuất chocolate danh tiếng nhất thế giới.\r\n\r\n8. Chocolate Richard Donnelly (Santa Cruz, California, Mỹ)\r\nNhững thanh chocolate của hãng này không giống bất kỳ loại chocolate nào. Richard Donnelly rất thích tạo ra những trải nghiệm mới bằng cách kết hợp những vị mạnh và gắt nhất. Ông dùng các loại chocolate của Bỉ và Pháp, trong thành phần kết hợp có các hương vị như oải hương, ớt hun khói, nghệ tây, bạch đấu khấu, trà Earl Grey.\r\nNhững sáng tạo độc đáo này đã giúp cho Donnelly giành được giải thưởng “Thợ thủ công bậc thầy” tại triển lãm chocolate toàn châu Âu danh giá ở thành phố Perugia, nước Ý. Cần nhớ rằng, ở thời điểm đó, cửa hàng của Donnelly mới chỉ có mười năm kinh nghiệm trên thương trường.\r\nĐể bảo đảm những thanh chocolate của mình luôn có chất lượng tốt nhất, cũng như luôn tươi mới nhất, hãng này chỉ sản xuất tối đa mỗi ngày 22,5kg chocolate. Nếu bạn muốn có những trải nghiệm đột phá từ những loại hương liệu độc đáo khác thường, hãy thử loại chocolate trắng với nhân hạt macadamia hay loại chocolate caramel với hương vani mật ong.\r\nNhững lợi socola ngon nhất thế giới \r\n\r\n9. Richart (Paris, Pháp)\r\nChú trọng vào chất lượng sản phẩm, hãng chocolate Richart của Pháp bảo đảm rằng bạn sẽ được thưởng thức những thanh chocolate nguyên chất nhất làm từ các loại hương liệu thành phần nguyên chất nhất. Những thanh chocolate của hãng này được làm theo công thức do chính gia đình nhà Richart đã phát triển và thử nghiệm.\r\nGia đình này nổi tiếng vì đã giành được bảy lần huy chương Ruban Bleu dành cho hãng sản xuất bánh kẹo uy tín nhất nước Pháp.\r\nĐã đạt đến đỉnh cao trong nghệ thuật làm chocolate, hãng Richart hiện giờ đang tập trung vào hướng thay đổi các loại hương liệu gia giảm, cũng như chú trọng vào việc tạo ra các sản phẩm có màu sắc và thiết kế đặc trưng.\r\nMột hộp chocolate đủ vị có giá đủ khiến bạn có thể giật mình. Bạn có sẵn sàng chi 850 USD để có được bảy phần chocolate đóng trong hộp gỗ, kèm theo cả đồng hồ đo nhiệt độ và độ ẩm?\r\n\r\n10. Puccini Bomboni (Amsterdam, Hà Lan)\r\nBạn cần phải đến Hà Lan để thưởng thức loại chocolate ngon nhất của đất nước này. Lý do là bởi hãng không hề có địa chỉ phân phối nào khác. Puccina Bomboni ban đầu vốn là một nhà hàng và hiệu cà phê nổi tiếng. Những người chủ của hãng sô cô la này tự tay làm từng mẻ chocolate ngay tại đây.\r\nSự kết hợp độc đáo giữa chocolate và các loại hương liệu, tất cả cùng được pha chế theo những công thức mới là điểm mang lại phong cách cho loại chocolate này. Mặc dù không phong phú về chủng loại, thế nhưng, chất lượng của chocolate Puccini Bomboni thực sự rất hấp dẫn.'),
(5, 'Gợi ý chọn hoa làm quà tặng', '2016-04-25', '7.jpg', 'Tặng hoa là gửi đi một thông điệp ý nghĩa thường mang lại cảm xúc của tình yêu và hạnh phúc bằng hương thơm và vẻ đẹp tuyệt đối của những bông hoa. Kèm theo hoa những tấm thiệp chân thành tự làm, sôcôla và các quà tặng thủ công khác. ', '<p>Tặng hoa l&agrave; gửi đi một th&ocirc;ng điệp &yacute; nghĩa thường mang lại cảm x&uacute;c của t&igrave;nh y&ecirc;u v&agrave; hạnh ph&uacute;c bằng hương thơm v&agrave; vẻ đẹp tuyệt đối của những b&ocirc;ng hoa. K&egrave;m theo hoa những tấm thiệp ch&acirc;n th&agrave;nh tự l&agrave;m, s&ocirc;c&ocirc;la v&agrave; c&aacute;c qu&agrave; tặng thủ c&ocirc;ng kh&aacute;c. X&aacute;c định loại th&ocirc;ng điệp bạn muốn gửi trước khi lựa chọn b&oacute; hoa. Hoa hồng m&agrave;u đỏ v&agrave; m&agrave;u hồng thường gửi đến một đối tượng l&atilde;ng mạn, trong khi hoa hồng hoặc hoa kh&aacute;c m&agrave;u v&agrave;ng gửi đến cho bạn b&egrave;.<img alt="" src="https://bizweb.dktcdn.net/100/037/483/files/0808539tinh-yeu-ngot-ngao-1-2a5dd5f0-a360-41cb-8169-77bbd9fa37a8.jpg?v=1449541567150" style="height:500px; width:500px" /></p>\r\n\r\n<p>Những b&ocirc;ng hoa nhiệt đới c&oacute; một sự tinh tế kỳ lạ. Những b&ocirc;ng hoa n&agrave;y kỳ lạ v&agrave; c&oacute; c&aacute;c đốm, nhưng h&igrave;nh dạng tuyệt đẹp. Mua b&oacute; hoa n&agrave;y cho một người bạn, th&agrave;nh vi&ecirc;n gia đ&igrave;nh hoặc bạn đời. T&igrave;m kiếm c&aacute;c kiểu b&oacute; hoa huong duong c&oacute; th&ecirc;m những b&ocirc;ng hoa rực rỡ, chẳng hạn như hoa huệ c&oacute;c, hoa lan v&agrave; hoa d&acirc;m bụt đầy m&agrave;u sắc. Bạn c&oacute; thể tập trung v&agrave;o một loại hoa nhiệt đới hoặc kết hợp bằng một số lo&agrave;i nổi bật.</p>\r\n\r\n<p>Hoa hồng bảy sắc cầu vồng</p>\r\n\r\n<p>Mua một b&oacute; hoa hồng bảy sắc cầu vồng cho một người n&agrave;o đ&oacute; m&agrave; bạn quan t&acirc;m s&acirc;u sắc. B&oacute; hoa n&agrave;y bao gồm nhiều loại hoa cam tu cau, v&igrave; vậy c&oacute; thể gửi đến một người y&ecirc;u hoặc người bạn. Kết hợp hoa hồng v&agrave;ng, hồng phấn, đỏ, hồng đậm, kem v&agrave; trắng trong b&oacute; hoa. Sự kết hợp n&agrave;y thường kh&ocirc;ng được t&igrave;m thấy tại c&aacute;c cửa h&agrave;ng hoa, v&igrave; vậy bạn c&oacute; thể sẽ cần phải y&ecirc;u cầu người b&aacute;n đặt c&aacute;c m&agrave;u sắc kh&aacute;c nhau v&agrave;o b&oacute; hoa trang tr&iacute; n&agrave;y. K&egrave;m theo s&ocirc;c&ocirc;la v&agrave; b&oacute;ng bay nếu ng&acirc;n s&aacute;ch của bạn cho ph&eacute;p.</p>\r\n'),
(7, 'Thuật phong thủy và quà tặng', '2016-04-25', '6.jpg', 'Người ta thường có câu: “Của cho không bằng cách cho”, ý nói sự khôn khéo và tinh tế trong giao tiếp là điều quan trọng hơn cả giá trị vật chất mà con người ta dành cho nhau. Và việc tặng quà cũng không là ngoại lệ.', '<p>Người ta thường c&oacute; c&acirc;u: &ldquo;Của cho kh&ocirc;ng bằng c&aacute;ch cho&rdquo;, &yacute; n&oacute;i sự kh&ocirc;n kh&eacute;o v&agrave; tinh tế trong giao tiếp l&agrave; điều quan trọng hơn cả gi&aacute; trị vật chất m&agrave; con người ta d&agrave;nh cho nhau. V&agrave; việc tặng qu&agrave; cũng kh&ocirc;ng l&agrave; ngoại lệ.</p>\r\n\r\n<p><img alt="" src="https://bizweb.dktcdn.net/100/037/483/files/url-1.jpg?v=1449476169647" style="height:334px; width:500px" /></p>\r\n\r\n<p>Bạn h&atilde;y l&agrave;m thế n&agrave;o để cho m&oacute;n qu&agrave; của &nbsp;m&igrave;nh trở n&ecirc;n thật &yacute; nghĩa trước người nhận, v&agrave; cũng đừng qu&ecirc;n tạo cho người nhận cảm gi&aacute;c vui vẻ v&agrave;&nbsp;kh&ocirc;ng miễn cưỡng.</p>\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD PRIMARY KEY (`id_dh`,`id_sp`);

--
-- Indexes for table `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`id_dh`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id_gh`);

--
-- Indexes for table `gioithieu`
--
ALTER TABLE `gioithieu`
  ADD PRIMARY KEY (`id_gt`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id_kh`);

--
-- Indexes for table `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id_lh`);

--
-- Indexes for table `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`id_loaisp`);

--
-- Indexes for table `phantrang`
--
ALTER TABLE `phantrang`
  ADD PRIMARY KEY (`id_pt`);

--
-- Indexes for table `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`id_qc`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sp`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`id_tt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dathang`
--
ALTER TABLE `dathang`
  MODIFY `id_dh` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id_gh` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gioithieu`
--
ALTER TABLE `gioithieu`
  MODIFY `id_gt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id_kh` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id_lh` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `loaisp`
--
ALTER TABLE `loaisp`
  MODIFY `id_loaisp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `phantrang`
--
ALTER TABLE `phantrang`
  MODIFY `id_pt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quangcao`
--
ALTER TABLE `quangcao`
  MODIFY `id_qc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `id_tt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
