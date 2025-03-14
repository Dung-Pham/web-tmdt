-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 14, 2025 lúc 05:19 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ie104_group2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_login_name` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_full_name` varchar(100) NOT NULL,
  `admin_avt_img` varchar(100) DEFAULT NULL,
  `admin_birth` date NOT NULL,
  `admin_sex` tinyint(1) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_phone` varchar(10) NOT NULL,
  `admin_address` text DEFAULT NULL,
  `admin_role` varchar(100) DEFAULT 'Owner',
  `admin_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_login_name`, `admin_password`, `admin_name`, `admin_full_name`, `admin_avt_img`, `admin_birth`, `admin_sex`, `admin_email`, `admin_phone`, `admin_address`, `admin_role`, `admin_active`) VALUES
(1, '21522436', '$2a$08$gacaZP8P7lcQeHoiW9fgkOr47/Y0vHv3HOixU1rELCc6rkv0oDw9K', 'Nhung', 'Nguyễn Thị Hồng Nhung', 'admin_1.jpg', '2003-04-02', 1, '21522436@gmail.techtwo.vn', '0987296708', 'Ký túc xá khu A: Đường Tạ Quang Bửu, Khu phố 6, Phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', 'Owner', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `customer_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`customer_id`, `product_variant_id`, `cart_quantity`, `cart_added_date`) VALUES
(1, 15, 1, '2023-12-18 18:46:34'),
(1, 40, 1, '2023-12-18 18:47:38'),
(1, 54, 1, '2025-03-09 23:42:04'),
(1, 58, 1, '2023-12-18 18:25:08'),
(1, 62, 1, '2023-12-18 18:14:02'),
(1, 72, 1, '2023-12-18 18:25:16'),
(3, 3, 3, '2023-11-01 04:40:58'),
(4, 32, 3, '2023-11-26 19:45:13'),
(5, 22, 2, '2023-11-26 19:45:13'),
(5, 31, 2, '2023-11-26 19:45:13'),
(6, 4, 2, '2023-11-26 19:45:13'),
(6, 19, 2, '2023-11-26 19:45:13'),
(7, 7, 1, '2023-11-26 19:45:13'),
(8, 3, 10, '2023-11-26 19:45:13'),
(8, 24, 3, '2023-11-26 19:45:13'),
(10, 11, 5, '2023-11-26 19:45:13'),
(10, 28, 1, '2023-11-26 19:45:13'),
(13, 34, 1, '2023-12-15 14:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(100) NOT NULL,
  `categorry_type` varchar(50) NOT NULL DEFAULT 'Điện máy',
  `category_added_date` date NOT NULL DEFAULT current_timestamp(),
  `category_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_img`, `categorry_type`, `category_added_date`, `category_is_display`) VALUES
(1, 'Áo phông', 'ao_phong.png', 'Áo', '2023-11-17', 1),
(2, 'Áo sơ mi', 'ao_so_mi.png', 'Áo', '2023-11-17', 1),
(3, 'Hoodie và Áo nỉ', 'hoodie.png', 'Áo', '2023-11-17', 1),
(4, 'Áo khoác và Áo Vest', 'ao_khoac.png', 'Áo', '2023-11-17', 1),
(5, 'Áo Len và Cardigans', 'ao_len.png', 'Áo', '2023-11-17', 1),
(6, 'Quần dài', 'quan_dai.png', 'Quần', '2023-11-17', 1),
(7, 'Quần Short', 'quan_short.png', 'Quần', '2023-11-17', 1),
(8, 'Chân Váy', 'chan_vay.png', 'Quần', '2023-11-17', 1),
(9, 'Denim', 'denim.png', 'Quần', '2023-11-17', 1),
(10, 'Váy nữ', 'vay_nu.png', 'Váy', '2023-11-17', 1),
(11, 'Phụ kiện tóc', 'phu_kien.png', 'Phụ kiện và túi ví nữ', '2023-11-17', 1),
(12, 'Túi ví nữ', 'tui_vi.png', 'Phụ kiện và túi ví nữ', '2023-11-17', 1),
(13, 'Giày nữ', 'giay.png', 'Giày', '2023-11-17', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 31),
(12, 32),
(13, 33);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_description` text DEFAULT NULL,
  `discount_start_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_end_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_amount` float NOT NULL,
  `discount_is_display` tinyint(1) NOT NULL DEFAULT 1,
  `discount_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`discount_id`, `discount_name`, `discount_description`, `discount_start_date`, `discount_end_date`, `discount_amount`, `discount_is_display`, `discount_img`) VALUES
(1, 'Black Friday', 'Chương trình giảm giá Black Friday', '2023-11-23', '2023-11-30', 10, 1, ''),
(2, 'Vui Tết', 'Chương trình giảm giá dịp Tết', '2024-01-01', '2024-03-01', 15, 1, ''),
(3, 'Vui Trung Thu', 'Chương trình giảm giá dịp Trung Thu', '2023-09-25', '2023-09-30', 20, 1, ''),
(4, 'Back to school', 'Chương trình giảm giá cho học sinh, sinh viên back to school', '2023-11-01', '2024-11-30', 12.5, 1, ''),
(5, 'Kỷ niệm 5 năm thành lập', 'Chương trình giảm giá kỷ niệm 5 năm thành lập của TechTwo', '2023-11-01', '2024-02-29', 10, 1, ''),
(6, '05/05', 'Chương trình giảm giá ngày đôi 05/05', '2023-05-01', '2023-05-31', 18, 1, ''),
(7, '06/06', 'Chương trình giảm giá ngày đôi 06/06', '2023-06-01', '2023-06-30', 15, 1, ''),
(8, '09/09', 'Chương trình giảm giá ngày đôi 09/09', '2023-09-01', '2023-09-30', 10, 1, ''),
(9, '10/10', 'Chương trình giảm giá ngày đôi 10/10', '2023-10-01', '2023-12-31', 12, 1, ''),
(10, '11/11', 'Chương trình giảm giá ngày đôi 11/11', '2023-11-01', '2023-12-31', 10, 1, ''),
(11, '12/12', 'Chương trình giảm giá ngày đôi 12/12', '2023-11-30', '2023-12-13', 12, 1, ''),
(12, '1/1', 'Chương trình giảm giá ngày đôi 1/1', '2023-12-27', '2024-01-02', 11, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL DEFAULT current_timestamp(),
  `feedback_rate` int(11) NOT NULL DEFAULT 5,
  `feedback_content` text DEFAULT 'Bạn chưa để lại lời nhận xét nào',
  `feedback_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `product_variant_id`, `customer_id`, `order_id`, `feedback_date`, `feedback_rate`, `feedback_content`, `feedback_is_display`) VALUES
(1, 1, 1, 1, '2023-11-02', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(2, 11, 2, 2, '2023-11-02', 4, 'Sản phẩm tốt, nhưng thời gian giao hàng hơi lâu.', 1),
(3, 12, 3, 3, '2023-11-02', 3, 'Sản phẩm bình thường, không quá xuất sắc.', 1),
(5, 4, 5, 5, '2023-11-05', 5, 'Sản phẩm quá tuyệt vời, không có chỗ nào để chê, shop xứng đáng 10 điểm không có nhưng', 1),
(6, 5, 6, 6, '2023-11-07', 4, 'Sản phẩm nhìn chung là tốt tuy nhiên chưa đáp ứng hoàn tòa yêu cầu của tôi', 1),
(7, 4, 7, 7, '2023-11-22', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(8, 9, 8, 8, '2023-11-21', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(9, 12, 8, 9, '2023-11-19', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(10, 24, 8, 10, '2023-11-18', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(11, 16, 9, 11, '2023-11-26', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(12, 11, 9, 12, '2023-11-19', 5, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(13, 10, 10, 13, '2023-11-25', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(14, 22, 10, 14, '2023-11-25', 5, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(500, 2, 5, 8, '2023-12-04', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(501, 14, 2, 3, '2023-12-04', 4, 'Không tệ	 nhưng cần cải thiện một chút.', 1),
(502, 57, 9, 10, '2023-12-04', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(503, 36, 4, 12, '2023-12-04', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(504, 73, 1, 6, '2023-12-04', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(505, 5, 8, 11, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(506, 21, 3, 7, '2023-12-04', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(507, 46, 6, 9, '2023-12-04', 4, 'Sản phẩm có thể cải thiện thêm một số tính năng.', 1),
(508, 64, 10, 13, '2023-12-04', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(509, 78, 7, 5, '2023-12-04', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(510, 15, 2, 4, '2023-12-04', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(511, 39, 4, 8, '2023-12-04', 5, 'Một sự mua sắm trực tuyến tuyệt vời!', 1),
(512, 55, 9, 12, '2023-12-04', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(513, 68, 1, 10, '2023-12-04', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(515, 11, 7, 13, '2023-12-04', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(516, 29, 3, 11, '2023-12-04', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(517, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(518, 61, 10, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(519, 74, 1, 5, '2023-12-04', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(520, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(521, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(522, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(523, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(525, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(526, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(527, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(528, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(529, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(530, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(531, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(532, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(533, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(534, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(535, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(536, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(537, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(539, 13, 4, 11, '2023-12-04', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(540, 27, 9, 5, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(541, 5, 3, 2, '2023-12-04', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(542, 18, 6, 8, '2023-12-04', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(543, 63, 9, 10, '2023-12-04', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(544, 41, 2, 4, '2023-12-04', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(545, 27, 7, 12, '2023-12-04', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(546, 8, 5, 6, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(547, 32, 3, 11, '2023-12-04', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(548, 54, 10, 9, '2023-12-04', 4, 'Rất hài lòng với chất lượng dịch vụ.', 1),
(549, 69, 1, 5, '2023-12-04', 5, 'Sản phẩm đáng giá tiền.', 1),
(550, 77, 8, 7, '2023-12-04', 4, 'Sản phẩm đúng như mô tả.', 1),
(551, 15, 2, 4, '2023-12-04', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(552, 39, 4, 8, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(553, 55, 9, 12, '2023-12-04', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(554, 68, 1, 10, '2023-12-04', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(556, 11, 7, 13, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(557, 29, 3, 11, '2023-12-04', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(558, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(559, 61, 10, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(560, 74, 1, 5, '2023-12-04', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(561, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(562, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(563, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(564, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(566, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(567, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(568, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(569, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(570, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(571, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(572, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(573, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(574, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(575, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(576, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(577, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(578, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(580, 13, 4, 11, '2023-12-04', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(581, 27, 9, 5, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(582, 5, 3, 2, '2023-12-04', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(583, 18, 6, 8, '2023-12-04', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(584, 63, 9, 10, '2023-12-04', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(585, 41, 2, 4, '2023-12-04', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(586, 27, 7, 12, '2023-12-04', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(587, 8, 5, 6, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(588, 32, 3, 11, '2023-12-04', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(589, 69, 1, 5, '2023-12-04', 5, 'Sản phẩm đáng giá tiền.', 1),
(590, 77, 8, 7, '2023-12-04', 4, 'Sản phẩm đúng như mô tả.', 1),
(591, 15, 2, 4, '2023-12-04', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(592, 39, 4, 8, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(593, 55, 9, 12, '2023-12-04', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(594, 68, 1, 10, '2023-12-04', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(596, 11, 7, 13, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(597, 29, 3, 11, '2023-12-04', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(598, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(599, 61, 10, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(600, 74, 1, 5, '2023-12-04', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(601, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(602, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(603, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(604, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(606, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(607, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(608, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(609, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(610, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(611, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(612, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(613, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(614, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(615, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(616, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(617, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(618, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(620, 1, 5, 8, '2023-12-05', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(621, 15, 2, 3, '2023-12-05', 4, 'Không tệ	 nhưng cần cải thiện một chút.', 1),
(622, 34, 9, 10, '2023-12-05', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(623, 33, 4, 12, '2023-12-05', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(624, 12, 1, 6, '2023-12-05', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(625, 51, 8, 11, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(626, 34, 3, 7, '2023-12-05', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(627, 23, 6, 9, '2023-12-05', 4, 'Sản phẩm có thể cải thiện thêm một số tính năng.', 1),
(628, 22, 10, 13, '2023-12-05', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(629, 18, 7, 5, '2023-12-05', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(630, 25, 2, 4, '2023-12-05', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(631, 49, 4, 8, '2023-12-05', 5, 'Một sự mua sắm trực tuyến tuyệt vời!', 1),
(632, 55, 9, 12, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(633, 48, 1, 10, '2023-12-05', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(634, 12, 5, 6, '2023-12-05', 5, 'Không có gì để chê	 tôi rất hài lòng!', 1),
(635, 11, 7, 13, '2023-12-05', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(636, 39, 3, 11, '2023-12-05', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(637, 43, 6, 7, '2023-12-05', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(638, 41, 10, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(639, 44, 1, 5, '2023-12-05', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(640, 28, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(641, 24, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(642, 19, 2, 10, '2023-12-05', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(643, 17, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(644, 12, 3, 8, '2023-12-05', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(645, 26, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(646, 11, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(647, 14, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(648, 29, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(649, 26, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(650, 32, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(651, 48, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(652, 43, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(653, 37, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(654, 49, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(655, 45, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(656, 42, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(657, 40, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(658, 43, 1, 7, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(659, 33, 4, 11, '2023-12-05', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(660, 57, 9, 5, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(661, 3, 3, 2, '2023-12-05', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(662, 28, 6, 8, '2023-12-05', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(663, 33, 9, 10, '2023-12-05', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(664, 11, 2, 4, '2023-12-05', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(665, 17, 7, 12, '2023-12-05', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(666, 56, 5, 6, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(667, 33, 3, 11, '2023-12-05', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(668, 52, 10, 9, '2023-12-05', 4, 'Rất hài lòng với chất lượng dịch vụ.', 1),
(669, 57, 1, 5, '2023-12-05', 5, 'Sản phẩm đáng giá tiền.', 1),
(670, 34, 8, 7, '2023-12-05', 4, 'Sản phẩm đúng như mô tả.', 1),
(671, 17, 2, 4, '2023-12-05', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(672, 29, 4, 8, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(673, 19, 9, 12, '2023-12-05', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(674, 76, 1, 10, '2023-12-05', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(675, 44, 5, 6, '2023-12-05', 5, 'Không có gì để phàn nàn	 sản phẩm tốt.', 1),
(676, 46, 7, 13, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(677, 32, 3, 11, '2023-12-05', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(678, 56, 6, 7, '2023-12-05', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(679, 67, 10, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(680, 45, 1, 5, '2023-12-05', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(681, 61, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(682, 39, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(683, 51, 2, 10, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(684, 62, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(685, 1, 3, 8, '2023-12-05', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(686, 9, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(687, 10, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(688, 4, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(689, 5, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(690, 6, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(691, 7, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(692, 8, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(693, 4, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(694, 37, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(695, 32, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(696, 45, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(697, 11, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(698, 38, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(699, 67, 1, 7, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(700, 10, 4, 11, '2023-12-05', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(701, 11, 9, 5, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(702, 19, 3, 2, '2023-12-05', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(703, 20, 6, 8, '2023-12-05', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(704, 49, 9, 10, '2023-12-05', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(705, 50, 2, 4, '2023-12-05', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(706, 61, 7, 12, '2023-12-05', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(707, 62, 5, 6, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(708, 58, 3, 11, '2023-12-05', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(709, 52, 1, 5, '2023-12-05', 5, 'Sản phẩm đáng giá tiền.', 1),
(710, 75, 8, 7, '2023-12-05', 4, 'Sản phẩm đúng như mô tả.', 1),
(711, 71, 2, 4, '2023-12-05', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(713, 55, 9, 12, '2023-12-05', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(714, 68, 1, 10, '2023-12-05', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(716, 11, 7, 13, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(717, 29, 3, 11, '2023-12-05', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(718, 43, 6, 7, '2023-12-05', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(719, 61, 10, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(720, 74, 1, 5, '2023-12-05', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(721, 8, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(722, 34, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(723, 59, 2, 10, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(724, 67, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(726, 16, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(727, 41, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(728, 54, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(729, 69, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(730, 76, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(731, 22, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(732, 48, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(733, 63, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(734, 77, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(735, 9, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(736, 35, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(737, 52, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(738, 70, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(740, 33, 1, 4, '2023-12-17', 5, 'Nhung nguyễn test', 1),
(741, 6, 1, 1, '2023-12-17', 2, 'Máy giặt tồi quá', 1),
(742, 23, 1, 1, '2023-12-17', 1, 'Mới mua một ngày mà hỏng', 1),
(743, 62, 1, 1, '2023-12-17', 5, 'Hàng tốt, giá rẻ', 1),
(756, 9, 1, 42, '2023-12-17', 3, 'Bạn không để lại lời nhận xét nào', 1),
(757, 17, 1, 42, '2023-12-17', 4, 'Sản phẩm tốt quá nè', 1),
(758, 18, 1, 42, '2023-12-17', 2, 'Bạn không để lại lời nhận xét nào', 1),
(759, 44, 1, 42, '2023-12-17', 4, 'Bạn không để lại lời nhận xét nào', 1),
(760, 62, 1, 5, '2023-12-17', 5, 'Sản phẩm tuyệt vời', 1);

--
-- Bẫy `feedbacks`
--
DELIMITER $$
CREATE TRIGGER `insert_after_feedbacks` AFTER INSERT ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE avg_rate DECIMAL(10, 1) ;
    DECLARE product_id INT(11) ;
    DECLARE product_variant_id INT(11);
   
    SET product_variant_id = NEW.product_variant_id;
    
    SET product_id = (SELECT product_variants.product_id 
    FROM product_variants 
    WHERE product_variants.product_variant_id = product_variant_id);
    
    SET avg_rate =  (SELECT AVG(feedbacks.feedback_rate) 
     FROM feedbacks, product_variants 
     WHERE feedbacks.product_variant_id = product_variants.product_variant_id 
     AND product_variants.product_id = product_id 
     GROUP BY product_variants.product_id);
    
    UPDATE products 
    SET products.product_rate = avg_rate
    WHERE products.product_id = product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback_imgs`
--

CREATE TABLE `feedback_imgs` (
  `feedback_img_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `feedback_img_name` varchar(100) NOT NULL,
  `feedback_img_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback_imgs`
--

INSERT INTO `feedback_imgs` (`feedback_img_id`, `feedback_id`, `feedback_img_name`, `feedback_img_is_display`) VALUES
(1, 1, 'fb_1_1.png', 1),
(2, 1, 'fb_1_2.png', 1),
(3, 1, 'fb_1_3.png', 1),
(4, 1, 'fb_1_4.png', 1),
(5, 2, 'fb_2_1.png', 1),
(6, 2, 'fb_2_2.png', 1),
(7, 2, 'fb_2_3.png', 1),
(8, 3, 'fb_3_1.png', 1),
(9, 3, 'fb_3_2.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_title` varchar(100) NOT NULL,
  `notification_subtitle` text DEFAULT NULL,
  `notification_content` text NOT NULL,
  `notification_date` date NOT NULL DEFAULT current_timestamp(),
  `notification_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_type_id`, `notification_title`, `notification_subtitle`, `notification_content`, `notification_date`, `notification_is_display`) VALUES
(1, 1, 'Đơn hàng mới', 'Bạn có một đơn hàng mới đang chờ xử lý.', 'Đơn hàng mới đã được đặt thành công. Vui lòng kiểm tra và xử lý đơn hàng.', '2023-11-02', 1),
(2, 2, 'Đơn hàng đã được vận chuyển', 'Đơn hàng của bạn đã được vận chuyển và đang trên đường đến tay bạn.', 'Đơn hàng đã được vận chuyển thành công. Bạn có thể theo dõi trạng thái đơn hàng tại đây.', '2023-11-02', 1),
(3, 3, 'Đơn hàng đã được giao', 'Đơn hàng của bạn đã được giao đến địa chỉ của bạn.', 'Đơn hàng đã được giao thành công. Vui lòng kiểm tra và xác nhận đơn hàng.', '2023-11-02', 1),
(4, 4, 'Thanh toán đã được nhận', 'Thanh toán của bạn cho đơn hàng đã được nhận.', 'Thanh toán đã được nhận thành công. Vui lòng kiểm tra email của bạn để biết thêm chi tiết.', '2023-11-02', 1),
(5, 5, 'Phản hồi đã được nhận', 'Bạn đã nhận được phản hồi từ khách hàng.', 'Khách hàng đã phản hồi về sản phẩm của bạn. Vui lòng kiểm tra và xử lý phản hồi này.', '2023-11-02', 1),
(6, 6, 'Giảm giá 50% cho tất cả sản phẩm', 'Cơ hội mua sắm tuyệt vời!', 'Từ ngày 03/11/2023 đến ngày 09/11/2023, chúng tôi giảm giá 50% cho tất cả sản phẩm. Đây là cơ hội tuyệt vời để bạn mua sắm với giá ưu đãi.', '2023-11-02', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification_types`
--

CREATE TABLE `notification_types` (
  `notification_type_id` int(11) NOT NULL,
  `notification_type_name` varchar(100) NOT NULL,
  `notification_type_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `notification_types`
--

INSERT INTO `notification_types` (`notification_type_id`, `notification_type_name`, `notification_type_img`) VALUES
(1, 'Order placed', 'order_placed.jpg'),
(2, 'Order shipped', 'order_shipped.jpg'),
(3, 'Order delivered', 'order_delivered.jpg'),
(4, 'Payment received', 'payment_received.jpg'),
(5, 'Feedback received', 'feedback_received.jpg'),
(6, 'Sale', 'sale.jpg'),
(7, 'Lucky Customer', 'lucky_customer.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 1,
  `order_name` varchar(100) NOT NULL,
  `order_phone` varchar(10) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_delivery_date` date NOT NULL,
  `order_delivery_address` varchar(100) NOT NULL,
  `order_note` text NOT NULL,
  `order_total_before` int(11) DEFAULT 0,
  `order_total_after` int(11) NOT NULL DEFAULT 0,
  `paying_method_id` int(11) NOT NULL DEFAULT 1,
  `order_paying_date` date NOT NULL,
  `order_is_paid` tinyint(1) NOT NULL,
  `order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy') DEFAULT 'Chờ thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `staff_id`, `order_name`, `order_phone`, `order_date`, `order_delivery_date`, `order_delivery_address`, `order_note`, `order_total_before`, `order_total_after`, `paying_method_id`, `order_paying_date`, `order_is_paid`, `order_status`) VALUES
(1, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', NULL, 0, 1, '2023-11-30', 1, 'Hoàn thành'),
(2, 2, 2, 'Trần Thị Bình', '0987654322', '2023-11-02', '2023-11-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', NULL, 0, 1, '2023-11-30', 1, 'Hoàn thành'),
(3, 3, 3, 'Lê Quang Yên', '0987654323', '2023-11-02', '2023-11-06', '789 Tran Hung Dao Street, Ward 6, District 1, Ho Chi Minh City', 'Đóng gói kỹ', NULL, 0, 1, '2023-11-30', 1, 'Hoàn thành'),
(4, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', NULL, 0, 1, '2023-11-30', 1, 'Hoàn thành'),
(5, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', NULL, 0, 1, '2023-11-30', 0, 'Hoàn thành'),
(6, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-06', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Đóng gói kỹ', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(7, 7, 3, 'Phan Thanh Danh', '0987654327', '2023-11-20', '2023-11-22', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', '', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(8, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-19', '2023-11-21', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau giờ hành chính', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(9, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-16', '2023-11-18', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao giờ hành chính', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(10, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-16', '2023-11-17', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 10h sáng', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(11, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-25', '2023-11-26', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 1h chiều', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(12, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-16', '2023-11-18', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao gấp', NULL, 0, 1, '2023-11-30', 0, 'Đã hủy'),
(13, 2, 3, 'Trần Thị Bình', '0987654322', '2023-11-23', '2023-11-25', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Tránh rơi vỡ đơn hàng của tôi', NULL, 0, 1, '2023-11-30', 1, 'Hoàn thành'),
(14, 2, 3, 'Trần Thị Bình', '0987654322', '2023-11-24', '2023-11-25', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao  hỏa tốc cho  tôi', NULL, 0, 1, '2023-11-30', 1, 'Đang giao hàng'),
(39, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-05', '0000-00-00', 'tới nhà Nhung nguyễn Phường 4 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(40, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'KTX Khu A Phường 4 Quận 4 Hồ Chí Minh', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(41, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'KTX khu A Phường 7 Quận 2 Vũng Tàu', '', NULL, 0, 1, '0000-00-00', 1, 'Đang giao hàng'),
(42, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'Tới nhà Nhung Phường 4 Quận 4 Hồ Chí Minh', '', 465000, 465000, 1, '0000-00-00', 1, 'Hoàn thành'),
(43, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Nhung Nguyễn Phường Tân Hưng Quận 7 Hồ Chí Minh', 'Boom hàng', 185000, 185000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(44, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Nhung mua Phường Tân Thuận Đông Quận 7 Hồ Chí Minh', 'Không mua', NULL, 0, 2, '0000-00-00', 0, 'Đã hủy'),
(45, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'yến bom hàng Phường 1 Quận 8 Hồ Chí Minh', 'Đừng có gửi', NULL, 0, 2, '0000-00-00', 0, 'Đã hủy'),
(46, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Tới ngõ nhỏ Phường 16 Quận 5 Hồ Chí Minh', 'Kiểm hàng trước', 750000, 750000, 1, '0000-00-00', 1, 'Hoàn thành'),
(47, 1, 1, 'Lý Phi Lân', '0987654321', '2023-12-18', '0000-00-00', 'KTX b Phường 2 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(48, 1, 1, 'Hương vi', '0987654321', '2023-12-18', '0000-00-00', 'Hương vi nhà bà tám Phường 2 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(49, 1, 1, 'Lê Đức Mạnh', '0987654321', '2023-12-18', '0000-00-00', 'Tới nhà chòi Phường An Phú Quận 2 Hồ Chí Minh', 'Giao tận tay', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(50, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'KTX khu A Phường Tân Thuận Đông Quận 7 Hồ Chí Minh', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_detail_quantity` int(11) NOT NULL,
  `order_detail_price_before` int(11) DEFAULT 0,
  `order_detail_price_after` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_variant_id`, `order_detail_quantity`, `order_detail_price_before`, `order_detail_price_after`) VALUES
(1, 6, 2, 235000, 235000),
(1, 23, 2, 150000, 150000),
(1, 62, 1, NULL, NULL),
(2, 37, 3, 35000, 35000),
(2, 59, 2, NULL, NULL),
(3, 14, 2, 185000, 185000),
(4, 33, 2, 175000, 175000),
(5, 62, 2, NULL, NULL),
(6, 67, 2, NULL, NULL),
(7, 12, 2, 165000, 165000),
(8, 72, 2, NULL, NULL),
(9, 23, 3, 150000, 150000),
(10, 13, 1, 200000, 200000),
(11, 59, 2, NULL, NULL),
(12, 33, 2, 175000, 175000),
(13, 11, 2, 170000, 170000),
(14, 33, 10, 175000, 175000),
(14, 60, 1, NULL, NULL),
(39, 1, 1, 105000, 105000),
(40, 44, 1, 155000, 155000),
(40, 73, 1, NULL, NULL),
(41, 25, 1, 110000, 110000),
(42, 9, 1, 175000, 175000),
(42, 17, 1, 135000, 135000),
(42, 18, 1, 170000, 170000),
(42, 44, 1, 155000, 155000),
(43, 15, 3, 210000, 210000),
(43, 16, 1, 185000, 185000),
(44, 63, 1, NULL, NULL),
(45, 63, 1, NULL, NULL),
(46, 16, 4, 185000, 185000),
(46, 18, 1, 170000, 170000),
(46, 26, 1, 130000, 130000),
(46, 41, 1, 250000, 250000),
(47, 50, 2, 150000, 150000),
(48, 77, 1, NULL, NULL),
(49, 42, 4, 200000, 200000),
(50, 36, 1, 25000, 25000),
(51, 52, 1, 180000, 180000);

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `delete_before_order_details` BEFORE DELETE ON `order_details` FOR EACH ROW BEGIN
    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(order_detail_price_after * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        ),
        order_total_before = (
            SELECT SUM(order_detail_price_before * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        )
    WHERE order_id = OLD.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_before_order_details` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_before_order_details` BEFORE UPDATE ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paying_methods`
--

CREATE TABLE `paying_methods` (
  `paying_method_id` int(11) NOT NULL,
  `paying_method_name` varchar(100) NOT NULL,
  `paying_method_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `paying_methods`
--

INSERT INTO `paying_methods` (`paying_method_id`, `paying_method_name`, `paying_method_is_display`) VALUES
(1, 'Ví điện tử MoMo', 1),
(2, 'Thẻ ngân hàng', 1),
(3, 'Thẻ tín dụng', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_avt_img` varchar(100) NOT NULL,
  `product_rate` float NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_period` int(11) DEFAULT NULL,
  `product_view_count` int(11) DEFAULT NULL,
  `product_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(1, 1, 'Áo thun xếp ly đơn giản buộc nơ phía trước', 17, 'P1_avt.jpg', 4.7, '<p><strong><em>Áo thun xếp ly đơn giản buộc nơ phía trước cho nữ</em></strong></p>\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Buộc phía trước</p>\n<p>- Ruched</p>\n<p>- Xếp ly</p>\n<p>- Mềm mại và thoải mái</p>\n<p><strong>MÔ TẢ</strong></p>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Elastane</p>\n<p>- Loại phù hợp: Slim Fit</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng cao</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n<h3>GÓI BAO GỒM</h3>\n<p>1x áo phông</p>\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.</p>', 36, 1000, 1),
(2, 1, 'Áo thun nơ Jacquard trơn dễ thương cho nữ', 5, 'P2_avt.jpg', 4, '<p><strong><em>Áo thun nơ Jacquard trơn dễ thương cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Jacquard</p>\n<p>- Cung</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Dễ thương</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1x áo phông</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 36, 1200, 1),
(3, 1, 'Áo thun phối hoa màu trơn thời trang thường ngày cho nữ', 11, 'P3_avt.jpg', 4, '<p><strong><em>Áo thun phối hoa màu trơn thời trang thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hoa</p>\n<p>- Xếp nếp</p>\n<p>- Mát mẻ và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Elastane</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 Áo thun</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 950, 1),
(4, 1, 'Áo thun nơ vai bất đối xứng đơn giản thanh lịch dành cho nữ', 4, 'P4_avt.jpg', 4.5, '<p><strong><em>Áo thun nơ vai bất đối xứng đơn giản thanh lịch dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Không đối xứng</p>\n<p>- Vai lạnh</p>\n<p>- Nơ</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Slim Fit</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng cao</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1x áo phông</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 36, 1100, 1),
(5, 1, 'Áo thun dây rút họa tiết chữ cái thường ngày cho nữ', 17, 'P5_avt.jpg', 4, '<p><strong><em>Áo thun dây rút họa tiết chữ cái thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây rút</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Chữ</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Độ vừa vặn: Ôm vừa vặn</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Co giãn trung bình</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo thun</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 36, 850, 1),
(6, 2, 'Áo sơ mi kiểu không đối xứng nút trước màu trơn thanh lịch cho nữ', 6, 'P6_avt.jpg', 3, '<p><strong><em>Áo sơ mi kiểu không đối xứng nút trước màu trơn thanh lịch cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Mặt trước có nút</p>\n<p>- Bất đối xứng</p>\n<p>- Cảm giác tay mịn màng</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Độ vừa vặn: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1, 1),
(7, 2, 'Áo sơ mi họa tiết hoa Ditsy giản dị cho nữ', 3, 'P7_avt.jpg', 5, '<p><strong><em>Áo sơ mi họa tiết hoa Ditsy giản dị cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hoa văn</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Hoa nhí</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1200, 1),
(8, 2, 'Áo sọc cài nút thông thường cho nữ', 3, 'P8_avt.jpg', 4, '<p><strong><em>Áo sọc cài nút thông thường cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nút</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: sọc</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Loại váy: </p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 950, 1),
(9, 2, 'Áo kiểu nơ diềm xếp nếp dễ thương cho nữ', 18, 'P9_avt.jpg', 4.6, '<p><strong><em>Áo kiểu nơ diềm xếp nếp dễ thương cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Diềm lửa</p>\n<p>- Nơ</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: dễ thương</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1100, 1),
(10, 2, 'Áo kiểu có áo trễ vai tay bồng cổ lai bèo xếp nếp họa tiết hoa nhí thường ngày cho nữ', 1, 'P10_avt.jpg', 4.3, '<p><strong><em>Áo kiểu có áo trễ vai tay bồng cổ lai bèo xếp nếp họa tiết hoa nhí thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Viền xếp nếp</p>\n<p>- Cổ áo</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Hoa nhí</p>\n<p>- Phong cách: Thường ngày</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 850, 1),
(11, 3, 'Áo nỉ trơn khóa kéo đơn giản cho nữ', 5, 'P11_avt.jpg', 4.2, '<p><strong><em>Áo nỉ trơn khóa kéo đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây kéo</p>\n<p>- Mềm mại và thoải mái</p>\n<p>- Zip bên</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng trung bình</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo len</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1, 1),
(12, 3, 'Áo nỉ ren cổ bẻ khâu vải tương phản Preppy dành cho nữ', 1, 'P12_avt.jpg', 4.6, '<p><strong><em>Áo nỉ ren cổ bẻ khâu vải tương phản Preppy dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Khâu vải</p>\n<p>- Cổ áo tương phản</p>\n<p>- Ren</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Patchwork</p>\n<p>- Phong cách: Preppy</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng trung bình</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo len</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1200, 1),
(13, 3, 'Áo nỉ họa tiết chữ cho nữ', 21, 'P13_avt.jpg', 4, '<p><strong><em>Áo nỉ họa tiết chữ cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Đường may</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Chữ</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1, 1),
(14, 4, 'Áo khoác đinh tán trơn khóa kéo đơn giản cho nữ', 8, 'P14_avt.jpg', 4, '<p><strong><em>Áo khoác đinh tán trơn khóa kéo đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây kéo</p>\n<p>- Gai</p>\n<p>- Gloss cao</p>\n<p>- Zip phía trước</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo khoác</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1200, 1),
(15, 4, 'Áo blaze có túi nút màu trơn phong cách thanh lịch cho nữ', 33, 'P15_avt.jpg', 4, '<p><strong><em>Áo blazer có túi nút màu trơn phong cách thanh lịch cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nút</p>\n<p>- Túi</p>\n<p>- Nhẹ và thoáng khí</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo khoác Blazer</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1, 1),
(16, 4, 'Áo khoác họa tiết trơn thông thường cho nữ', 43, 'P16_avt.jpg', 4, '<p><strong><em>Áo khoác họa tiết trơn thông thường cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Mô hình</p>\n<p>- Thân thiện với làn da và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Không giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo khoác</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1200, 1),
(17, 5, 'Áo cardigan tay dài cột dây màu trơn thường ngày cho nữ áo kiểu cardigan croptop', 38, 'P17_avt.jpg', 4.3, '<p><strong><em>Áo cardigan tay dài cột dây màu trơn thường ngày cho nữ áo kiểu cardigan croptop</em></strong></p>\n\n<h3>ĐẶC ĐIỂM SẢN PHẨM</h3>\n<p>- Cột dây</p>\n<p>- Tay dài</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Họa tiết: Màu trơn</p>\n<p>- Phong cách: Thường ngày</p>\n<p>- Có size lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Kiểu dáng: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Co giãn: Co giãn vừa</p>\n<p>- Vùng xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo cardigan</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 30, 1, 1),
(18, 5, 'Áo len Loose Jacquard trơn giản dị dành cho nữ', 38, 'P18_avt.jpg', 3.5, '<p><strong><em>Áo len Loose Jacquard trơn giản dị dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Jacquard</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 30% Polyester + 20% sợi Tencel + 30% Acrylic + 10% Cotton + 10% Viscose</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng cao</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x áo len</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1200, 1),
(19, 6, 'Quần dài màu trơn bất đối xứng phong cách cổ điển cho nữ', 1, 'P19_avt.jpg', 4, '<p><strong><em>Quần dài màu trơn bất đối xứng phong cách cổ điển cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Bất đối xứng</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Cổ điển</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1, 1),
(20, 6, 'Quần xếp ly nơ màu trơn phong cách thanh lịch cho nữ', 7, 'P20_avt.jpg', 4, '<p><strong><em>Quần xếp ly nơ màu trơn phong cách thanh lịch cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nơ</p>\n<p>- Xếp ly</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1200, 1),
(21, 6, 'Quần phối nơ màu trơn phong cách thường ngày cho nữ', 15, 'P21_avt.jpg', 5, '<p><strong><em>Quần phối nơ màu trơn phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nơ</p>\n<p>- Mát mẻ và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1, 1),
(22, 7, 'Quần short cài nút màu trơn thường ngày cho nữ', 13, 'P22_avt.jpg', 4.8, '<p><strong><em>Quần short cài nút màu trơn thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nút</p>\n<p>- Kết cấu tinh tế</p>\n<p>(Không có thắt lưng)</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần short</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1200, 1),
(23, 7, 'Quần short giả có túi xếp nếp phong cách thường ngày dành cho nữ', 19, 'P23_avt.jpg', 2.5, '<p><strong><em>Quần short giả có túi xếp nếp phong cách thường ngày dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Xếp ly</p>\n<p>- Túi giả</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần short</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 0, 1),
(24, 7, 'Quần short denim nơ lưng trơn đơn giản cho nữ', 14, 'P24_avt.jpg', 5, '<p><strong><em>Quần short denim nơ lưng trơn đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Cung trở lại</p>\n<p>- Khó khăn</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x Quần short</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1050, 1),
(25, 8, 'Váy có cấu trúc dây kéo trơn thông thường cho nữ ', 16, 'P25_avt.jpg', 4, '<p><strong><em>Váy có cấu trúc dây kéo trơn thông thường cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây kéo</p>\n<p>- Dòng cấu trúc</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Loại váy: </p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 36, 1250, 1),
(26, 8, 'Váy xếp ly ren trơn đơn giản cho nữ', 20, 'P26_avt.jpg', 4, '<p><strong><em>Váy xếp ly ren trơn đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren lên</p>\n<p>- Xếp ly</p>\n<p>- Draped</p>\n<p>- Kết cấu tốt</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 950, 1),
(27, 8, 'Chân váy xẻ tà màu trơn phong cách thanh lịch dành cho nữ', 1, 'P27_avt.jpg', 5, '<p><strong><em>Chân váy xẻ tà màu trơn phong cách thanh lịch dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Xẻ tà</p>\n<p>- Kết cấu tốt</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Kiểu dáng: Dáng chữ A</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Chân váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1200, 1),
(28, 9, 'Quần jean bỏ túi bất đối xứng trơn kiểu cổ điển cho nữ', 42, 'P28_avt.jpg', 4, '<p><strong><em>Quần jean bỏ túi bất đối xứng trơn kiểu cổ điển cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Không đối xứng</p>\n<p>- Túi bỏ túi</p>\n<p>- Kết cấu tốt</p>\n<p>- Có túi</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Cổ điển</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Bông</p>\n<p>- Thành phần: 70% Cotton + 30% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x Jean</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1),
(29, 9, 'Quần jean phối quần ống rộng bò đường họa tiết rách chắp vá màu trơn phong cách thường ngày cho nữ', 1, 'P29_avt.jpg', 4.8, '<p><strong><em>Quần jean phối quần ống rộng bò đường họa tiết rách chắp vá màu trơn phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Phối đường họa tiết rách</p>\n<p>- Chắp vá</p>\n<p>- Chắc chắn</p>\n<p>- Có túi</p>\n<p>- Nút</p>\n<p>- Tôn dáng</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Cotton</p>\n<p>- Thành phần: 65% Cotton + 35% Terylen</p>\n<p>- Độ vừa vặn: Vừa vặn</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần jean</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 400, 1),
(30, 9, 'Quần jean ống cạp cao rộng viền thô có túi phối nút thời trang thường ngày cho nữ', 1, 'P30_avt.jpg', 4.8, '<p><strong><em>Quần jean ống cạp cao rộng viền thô có túi phối nút thời trang thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Viền thô</p>\n<p>- Mặt trước có nút</p>\n<p>- Túi</p>\n<p>- Cảm giác tay mịn màng</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thường ngày</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Quần jean</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1),
(31, 10, 'Váy xếp ly trơn đơn giản cho nữ', 2, 'P31_avt.jpg', 4.3, '<p><strong><em>Váy xếp ly trơn đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Plication</p>\n<p>- Kết cấu tốt</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Loại váy: Loe</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Loại phù hợp: Slim Fit</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng nhẹ</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1),
(32, 10, 'Váy cắt may đơn giản thông thường cho nữ', 34, 'P32_avt.jpg', 4.6, '<p><strong><em>Váy cắt may đơn giản thông thường cho nữ</em></strong></p>\n\n<h3>Điểm nổi bật</h3>\n<p>- Cắt ra</p>\n<p>- Vải sắc nét</p>\n\n<h3>Mô TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Loại váy: A Line</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Tuyệt đối: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1000, 1),
(33, 10, 'Đầm chữ A chắp vá thắt nơ viền nhún bèo phong cách dự tiệc Giáng sinh dễ thương cho nữ', 34, 'P33_avt.jpg', 4.4, '<p><strong><em>Đầm chữ A chắp vá thắt nơ viền nhún bèo phong cách dự tiệc Giáng sinh dễ thương cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nơ</p>\n<p>- Viền xếp nếp</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Chắp vá</p>\n<p>- Phong cách: Dễ thương</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Đầm</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1000, 1),
(34, 11, 'Dây buộc tóc họa tiết trái cây phong cách thường ngày cho nữ', 32, 'P34_avt.jpg', 4.9, '<p><strong><em>Dây buộc tóc họa tiết trái cây phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Trái cây</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Trái cây & Rau quả</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Dây buộc tóc</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 199, 123, 1),
(35, 11, 'Kẹp tóc hình bướm thanh lịch cho nữ', 1, 'P35_avt.jpg', 5, '<p><strong><em>Kẹp tóc hình bướm thanh lịch cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Bướm</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Bướm</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Chất liệu: Khác</p>\n<p>- Thành phần: 100% Khác</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>HƯỚNG DẪN CHĂM SÓC</h3>\n<p>- Giữ các vật liệu như da, chất liệu tổng hợp và phụ kiện kim loại tránh tiếp xúc trực tiếp hoặc quá mức với độ ẩm, chất lỏng, nhiệt độ và ánh sáng mặt trời. Việc tiếp xúc với các yếu tố này có thể gây hao mòn vĩnh viễn.</p>\n<p>- Ma sát quá mức và tiếp xúc với các chất nhờn, chẳng hạn như mỹ phẩm hoặc dung môi, có thể gây hư hỏng, phai màu hoặc chuyển màu trên các bề mặt và quần áo sáng màu.</p>\n<p>- Dùng khăn mềm, ẩm để lau sạch vết bẩn, bụi bẩn.</p>\n<p>- Khi không sử dụng, hãy cất vào hộp hoặc túi đựng chống bụi ở nơi khô ráo, thoáng mát.</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Kẹp tóc</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1000, 1),
(36, 11, 'Kẹp tóc nơ màu trơn thường ngày cho nữ', 6, 'P36_avt.jpg', 4, '<p><strong><em>Kẹp tóc nơ màu trơn thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nơ</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>MẸO BẢO DƯỠNG & CHĂM SÓC</h3>\n<p>- Đừng đeo đồ trang sức khi đến phòng tập thể dục. Mồ hôi có thể làm dính bẩn và trang sức có thể va đập vào thiết bị luyện tập.</p>\n<p>- Tháo đồ trang sức của bạn vào buổi tối trước khi đi ngủ vì việc cọ xát liên tục vào ga trải giường của bạn theo thời gian sẽ làm hỏng các móc cài, các mắt xích mỏng manh và các chi tiết đẹp.</p>\n<p>- Thường xuyên làm sạch nhẫn, vòng tay hoặc dây chuyền tại nhà bằng bàn chải đánh răng mềm sau khi ngâm trong nước ấm và một ít xà phòng rửa bát. Lau khô nhẹ nhàng bằng khăn lau trang sức.</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Kẹp tóc</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 800, 1),
(37, 12, 'Ví phong cách tranh sơn dầu hoa Ditsy thanh lịch dành cho nữ', 3, 'P37_avt.jpg', 4, '<p><strong><em>Ví phong cách tranh sơn dầu hoa Ditsy thanh lịch dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hoa</p>\n<p>- Phong cách sơn dầu</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Ditsy Floral</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Loại đóng cửa: Những người khác</p>\n<p>- Cấu trúc túi: </p>\n<p>- Loại túi: Khác</p>\n<p>- Chất liệu: Khác</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>HƯỚNG DẪN CHĂM SÓC</h3>\n<p>- Giữ các vật liệu như da, chất tổng hợp và các phụ kiện kim loại tránh tiếp xúc trực tiếp hoặc quá nhiều với độ ẩm, chất lỏng, nhiệt và ánh sáng mặt trời. Tiếp xúc với các yếu tố này có thể gây ra hao mòn vĩnh viễn.</p>\n<p>- Ma sát quá mức và tiếp xúc với các chất có dầu, chẳng hạn như mỹ phẩm hoặc dung môi, có thể gây hư hỏng, phai màu hoặc chuyển màu sang các bề mặt và quần áo có màu sáng.</p>\n<p>- Dùng khăn ẩm mềm để lau sạch vết bẩn, bụi bẩn.</p>\n<p>- Khi không sử dụng, bảo quản đồ trong hộp hoặc túi đựng bụi bảo vệ nơi khô ráo, thoáng mát.</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Túi</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1),
(38, 12, 'Túi đeo vai nhỏ Plain Pearls dành cho nữ', 24, 'P38_avt.jpg', 4, '<p><strong><em>Túi đeo vai nhỏ Plain Pearls dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ngọc trai</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Loại đóng cửa: dây kéo</p>\n<p>- Cấu trúc túi: Ngăn chính</p>\n<p>- Loại túi: Túi tote đeo vai</p>\n<p>- Chất liệu: PU</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>HƯỚNG DẪN CHĂM SÓC</h3>\n<p>- Giữ các vật liệu như da, chất tổng hợp và các phụ kiện kim loại tránh tiếp xúc trực tiếp hoặc quá nhiều với độ ẩm, chất lỏng, nhiệt và ánh sáng mặt trời. Tiếp xúc với các yếu tố này có thể gây ra hao mòn vĩnh viễn.</p>\n<p>- Ma sát quá mức và tiếp xúc với các chất có dầu, chẳng hạn như mỹ phẩm hoặc dung môi, có thể gây hư hỏng, phai màu hoặc chuyển màu sang các bề mặt và quần áo có màu sáng.</p>\n<p>- Dùng khăn ẩm mềm để lau sạch vết bẩn, bụi bẩn.</p>\n<p>- Khi không sử dụng, bảo quản đồ trong hộp hoặc túi đựng bụi bảo vệ nơi khô ráo, thoáng mát.</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Túi</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1),
(39, 12, 'Túi đeo vai kiểu đám mây thắt nơ màu trơn phong cách thường ngày cho nữ', 24, 'P39_avt.jpg', 5, '<p><strong><em>Túi đeo vai kiểu đám mây thắt nơ màu trơn phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nơ</p>\n<p>- Nút thắt</p>\n<p>- Túi đám mây</p>\n<p>- Trái tim nữ tính</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Cách đóng mở: Đóng bằng nút</p>\n<p>- Cấu trúc túi: Ngăn chính</p>\n<p>- Loại túi: Túi thời trang</p>\n<p>- Chất liệu: Khác</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>HƯỚNG DẪN CHĂM SÓC</h3>\n<p>- Giữ các vật liệu như da, chất liệu tổng hợp và phụ kiện kim loại tránh tiếp xúc trực tiếp hoặc quá mức với độ ẩm, chất lỏng, nhiệt độ và ánh sáng mặt trời. Việc tiếp xúc với các yếu tố này có thể gây hao mòn vĩnh viễn.</p>\n<p>- Ma sát quá mức và tiếp xúc với các chất nhờn, chẳng hạn như mỹ phẩm hoặc dung môi, có thể gây hư hỏng, phai màu hoặc chuyển màu trên các bề mặt và quần áo sáng màu.</p>\n<p>- Dùng khăn mềm, ẩm để lau sạch vết bẩn, bụi bẩn.</p>\n<p>- Khi không sử dụng, hãy cất vào hộp hoặc túi đựng chống bụi ở nơi khô ráo, thoáng mát.</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Túi</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 200, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(40, 13, 'Giày sneaker đế dày vải lưới thoáng khí buộc dây màu trơn tương phản phong cách thường ngày cho nữ', 13, 'P40_avt.jpg', 4, '<p><strong><em>Giày sneaker đế dày vải lưới thoáng khí buộc dây màu trơn tương phản phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren lên</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: </p>\n<p>- Chất liệu: Khác</p>\n<p>- Thành phần: 100% Khác</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Giày thể thao</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 100, 1),
(41, 13, 'Giày bốt thời trang đế dày có dây buộc đơn giản cho nữ', 14, 'P41_avt.jpg', 4.3, '<p><strong><em>Giày bốt thời trang đế dày có dây buộc đơn giản cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren lên</p>\n<p>- Đáy dày đỉnh cao</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: </p>\n<p>- Chất liệu: Khác</p>\n<p>- Thành phần: 100% Khác</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Khởi động</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 100, 1),
(42, 13, 'Giày lười đế dày màu trơn phong cách Mary Jane dễ thương cho nữ', 40, 'P42_avt.jpg', 4, '<p><strong><em>Giày lười đế dày màu trơn phong cách Mary Jane dễ thương cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Giày Mary Jane đế dày</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Dễ thương</p>\n<p>- Chất liệu: Khác</p>\n<p>- Thành phần: 100% Khác</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Đôi giày</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 100, 1),
(43, 1, 'Áo thun có dây buộc màu trơn phong cách thường ngày cho nữ', 7, 'P43_avt.jpg', 4.7, '<p><strong><em>Áo thun có dây buộc màu trơn phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây buộc</p>\n<p>- Mát mẻ và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Co giãn nhẹ</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo thun</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1000, 1),
(44, 1, 'Áo thun tay ngắn phối cúc màu khối trơn cơ bản cho nữ', 9, 'P44_avt.jpg', 4.3, '<p><strong><em>Áo thun tay ngắn phối cúc màu khối trơn cơ bản cho nữ</em></strong></p>\n\n<h3>ĐẶC ĐIỂM NỔI BẬT</h3>\n<p>- Khối màu</p>\n<p>- Nút</p>\n<p>- Tay ngắn</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Họa tiết: Màu trơn</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Có size lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần chất liệu: 97% Polyester + 3% Spandex</p>\n<p>- Kiểu dáng: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Co giãn nhẹ</p>\n<p>- Vùng xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo thun</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1200, 1),
(45, 1, 'Áo thun cơ bản thêu họa tiết màu trơn thường ngày cho nữ', 22, 'P45_avt.jpg', 4.7, '<p><strong><em>Áo thun cơ bản thêu họa tiết màu trơn thường ngày cho nữ</em></strong></p>\n\n<h3>Điểm nổi bật</h3>\n<p>- Thêu</p>\n<p>- Cơ bản</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>Mô TẢ</h3>\n<p>- Mô hình: Đồng bằng</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Elastane</p>\n<p>- Loại phù hợp: Lỏng lẻo</p>\n<p>- Tuyệt đối: Không</p>\n<p>- Căng: Căng trung bình</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x T-shirt</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1500, 1),
(46, 1, 'Áo thun màu trơn có họa tiết phong cách thường ngày cho nữ', 23, 'P46_avt.jpg', 4, '<p><strong><em>Áo thun màu trơn có họa tiết phong cách thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hoa văn</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Spandex</p>\n<p>- Độ vừa vặn: Ôm vừa vặn</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Co giãn trung bình</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo thun</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 900, 1),
(47, 2, 'Áo ren kẻ sọc thông thường cho nữ', 25, 'P47_avt.jpg', 4.3, '<p><strong><em>Áo ren kẻ sọc thông thường cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren lên</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Kẻ sọc</p>\n<p>- Phong cách: Giản dị</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo Blouse</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1300, 1),
(48, 2, 'Áo sơ mi kim loại cài nút sọc dễ thương cho nữ', 1, 'P48_avt.jpg', 4, '<p><strong><em>Áo sơ mi kim loại cài nút sọc dễ thương cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Nút phía trước</p>\n<p>- Kim loại</p>\n<p>- Kết cấu tốt</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Sọc</p>\n<p>- Phong cách: Dễ thương</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Slim Fit</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 500, 1),
(49, 2, 'Áo kiểu cổ lật họa tiết sọc hình học phong cách thường ngày thời trang Mỹ cổ điển dành cho nữ', 8, 'P49_avt.jpg', 5, '<p><strong><em>Áo kiểu cổ lật họa tiết sọc hình học phong cách thường ngày thời trang Mỹ cổ điển dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hình học</p>\n<p>- Áo polo</p>\n<p>- Dáng rộng</p>\n<p>- Thời trang Mỹ cổ điển</p>\n<p>- Nhẹ và thoáng khí</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Sọc</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 18, 2400, 1),
(50, 2, 'Áo sơ mi kiểu tay phồng cột dây màu trơn thường ngày cho nữ', 38, 'P50_avt.jpg', 3, '<p><strong><em>Áo sơ mi kiểu tay phồng cột dây màu trơn thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Dây buộc</p>\n<p>- Tay áo phồng</p>\n<p>- Cảm giác tay mịn màng</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Thường ngày</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Dáng rộng</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 2500, 1),
(51, 2, 'Áo ren buộc nơ hoa dễ thương phía trước cho nữ', 33, 'P51_avt.jpg', 4, '<p><strong><em>Áo ren buộc nơ hoa dễ thương phía trước cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Buộc phía trước</p>\n<p>- Buộc phía trước</p>\n<p>- Ren</p>\n<p>- Kết cấu tốt</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Ditsy Floral</p>\n<p>- Phong cách: Dễ thương</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 95% Polyester + 5% Thun</p>\n<p>- Loại phù hợp: Lỏng lẻo</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Không giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 2200, 1),
(52, 4, 'Áo khoác denim có túi phía trước màu trơn có nút thời trang thường ngày cho nữ', 6, 'P52_avt.jpg', 4.2, '<p><strong><em>Áo khoác denim có túi phía trước màu trơn có nút thời trang thường ngày cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Mặt trước có nút</p>\n<p>- Túi</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Màu trơn</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo khoác</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 2200, 1),
(53, 4, 'Áo khoác ren trơn thanh lịch dành cho nữ', 6, 'P53_avt.jpg', 4, '<p><strong><em>Áo khoác ren trơn thanh lịch dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren ren</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Áo khoác</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1800, 1),
(54, 10, 'Đầm họa tiết hoa thắt nơ lưng phong cách thanh lịch cho nữ', 7, 'P54_avt.jpg', 4, '<p><strong><em>Đầm họa tiết hoa thắt nơ lưng phong cách thanh lịch cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Hoa</p>\n<p>- Nơ sau lưng</p>\n<p>- Dây buộc</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Hoa</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Kiểu dáng: Xòe</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Đầm</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1600, 1),
(55, 10, 'Đầm thêu hoa nhí phong cách thường ngày dành cho nữ', 13, 'P55_avt.jpg', 4, '<p><strong><em>Đầm thêu hoa nhí phong cách thường ngày dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Thêu</p>\n<p>- Mát mẻ và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Hoa văn: Hoa nhí</p>\n<p>- Phong cách: Ngày thường</p>\n<p>- Loại trang phục: Khác</p>\n<p>- Kích thước lớn: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Độ vừa vặn: Vừa vặn thông thường</p>\n<p>- Vải xuyên thấu: Không</p>\n<p>- Độ co giãn: Không co giãn</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Đầm</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 24, 1500, 1),
(56, 10, 'Váy vải trơn hở vai thanh lịch dành cho nữ', 40, 'P56_avt.jpg', 4.5, '<p><strong><em>Váy vải trơn hở vai thanh lịch dành cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Vai lạnh</p>\n<p>- Khâu vải</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Trơn</p>\n<p>- Phong cách: Thanh lịch</p>\n<p>- Loại váy: A Line</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Căng: Căng nhẹ</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1400, 1),
(57, 10, 'Đầm xòe ren trơn phong cách Boho cho nữ', 14, 'P57_avt.jpg', 5, '<p><strong><em>Đầm xòe ren trơn phong cách Boho cho nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Ren lên</p>\n<p>- Xù xù</p>\n<p>- Mềm mại và thoải mái</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Trơn</p>\n<p>- Phong cách: Boho</p>\n<p>- Loại váy: A Line</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Phù hợp thường xuyên</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 1300, 1),
(58, 3, 'Đầm xòe họa tiết hoa phong cách Boho Ditsy cho Nữ', 3, 'P58_avt.jpg', 4, '<p><strong><em>Đầm xòe họa tiết hoa phong cách Boho Ditsy cho Nữ</em></strong></p>\n\n<h3>ĐIỂM NỔI BẬT</h3>\n<p>- Mô hình</p>\n<p>- Khói</p>\n<p>- Kết cấu tốt</p>\n<p>- Dây đeo có thể điều chỉnh</p>\n\n<h3>MÔ TẢ</h3>\n<p>- Mô hình: Ditsy Floral</p>\n<p>- Phong cách: Boho</p>\n<p>- Loại váy: A Line</p>\n<p>- Cộng với kích thước: Không</p>\n<p>- Chất liệu: Polyester</p>\n<p>- Thành phần: 100% Polyester</p>\n<p>- Loại phù hợp: Slim Fit</p>\n<p>- Trong suốt: Không</p>\n<p>- Kéo dài: Không căng</p>\n<p>- Xuất xứ: Trung Quốc đại lục</p>\n\n<h3>GÓI HÀNG BAO GỒM</h3>\n<p>1 x Váy</p>\n\n<h3>Ghi chú mua hàng</h3>\n<p>\n    Xin vui lòng tham khảo chiều cao của bạn và biểu đồ kích thước trước khi mua. Có 2-3% sự khác biệt theo phép đo thủ công. \n    Tất cả các hình ảnh sản phẩm trong cửa hàng này là 100% chụp thật. Do ánh sáng và màn hình khác nhau, sự khác biệt màu sắc tinh tế và lỗi thực là bình thường.\n    Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!!\n</p>\n<p>\n    Nếu bạn có bất kỳ câu hỏi nào, hãy trò chuyện với chúng tôi và chúng tôi sẽ trả lời trong thời gian sớm nhất.\n</p>', 12, 100, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `product_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_detail_name` varchar(100) NOT NULL,
  `product_detail_value` text DEFAULT NULL,
  `product_detail_unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`product_detail_id`, `product_id`, `product_detail_name`, `product_detail_value`, `product_detail_unit`) VALUES
(1, 1, 'Phong cách', 'Giản dị', NULL),
(2, 1, 'Chất liệu', '95%Polyester+5%Elastane', NULL),
(3, 1, 'Cổ áo', 'Cổ vuông', NULL),
(4, 1, 'Chiều dài tay áo', 'Tay áo dài', NULL),
(5, 1, 'Xuất xứ', 'Trung Quốc', NULL),
(6, 2, 'Phong cách', 'Dẽ thương', NULL),
(7, 2, 'Chất liệu', '100%Polyester', NULL),
(8, 2, 'Cổ áo', 'Cổ chữ V', NULL),
(9, 2, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(10, 2, 'Xuất xứ', 'Trung Quốc', NULL),
(11, 3, 'Phong cách', 'Ngày thường', NULL),
(12, 3, 'Chất liệu', '95%Polyester+5%Elastane', NULL),
(13, 3, 'Cổ áo', 'Cổ tròn', NULL),
(14, 3, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(15, 3, 'Xuất xứ', 'Trung Quốc', NULL),
(16, 4, 'Phong cách', 'Thanh lịch', NULL),
(17, 4, 'Chất liệu', '100%Polyester', NULL),
(18, 4, 'Cổ áo', 'Cổ không đối xứng ', NULL),
(19, 4, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(20, 4, 'Xuất xứ', 'Trung Quốc', NULL),
(21, 5, 'Phong cách', 'Ngày thường', NULL),
(22, 5, 'Chất liệu', '95%Polyester+5%Spandex', NULL),
(23, 5, 'Cổ áo', 'Cổ tròn', NULL),
(24, 5, 'Chiều dài tay áo', 'Tay ngắn', NULL),
(25, 5, 'Xuất xứ', 'Trung Quốc', NULL),
(26, 6, 'Phong cách', 'Thanh lịch', NULL),
(27, 6, 'Chất liệu', '95% Polyester + 5% Spandex', NULL),
(28, 6, 'Cổ áo', 'Cổ sơ mi', NULL),
(29, 6, 'Chiều dài tay áo', 'Dài tay', NULL),
(30, 6, 'Xuất xứ', 'Trung Quốc', NULL),
(31, 7, 'Phong cách', 'Ngày thường', NULL),
(32, 7, 'Chất liệu ', '100%Polyester', NULL),
(33, 7, 'Cổ áo', 'Cổ tròn', NULL),
(34, 7, 'Chiều dài tay áo', 'Tay dài', NULL),
(35, 7, 'Xuất xứ', 'Trung Quốc', NULL),
(36, 8, 'Phong cách', 'Giản dị', NULL),
(37, 8, 'Chất liệu', '100%Polyester', NULL),
(38, 8, 'Cổ áo', 'Cổ tròn', NULL),
(39, 8, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(40, 8, 'Xuất xứ', 'Trung Quốc', NULL),
(41, 9, 'Phong cách', 'Dễ thương', NULL),
(42, 9, 'Chất liệu ', '100%Polyester', NULL),
(43, 9, 'Cổ áo', 'Cổ tròn', NULL),
(44, 9, 'Chiều dài tay áo', 'Dài tay', NULL),
(45, 9, 'Xuất xứ', 'Trung Quốc', NULL),
(46, 10, 'Phong cách', 'Thường ngày', NULL),
(47, 10, 'Chất liệu', '100% Polyester', NULL),
(48, 10, 'Cổ áo', 'Trễ vai', NULL),
(49, 10, 'Chiều dài tay áo', 'Tay ngắn', NULL),
(50, 10, 'Xuất xứ', 'Trung Quốc', NULL),
(51, 11, 'Phong cách', 'Giản dị', NULL),
(52, 11, 'Chất liệu', '100%Polyester', NULL),
(53, 11, 'Cổ áo', 'Cổ sơ mi', NULL),
(54, 11, 'Chiều dài tay áo', 'Tay dài', NULL),
(55, 11, 'Xuất xứ', 'Trung Quốc', NULL),
(56, 12, 'Phong cách', 'Preppy', NULL),
(57, 12, 'Chất liệu', '100%Polyester', NULL),
(58, 12, 'Cổ áo', 'Cổ sơ mi', NULL),
(59, 12, 'Chiều dài tay áo', 'Tay dài', NULL),
(60, 12, 'Xuất xứ', 'Trung Quốc', NULL),
(61, 13, 'Phong cách', 'Ngày thường', NULL),
(62, 13, 'Chất liệu', '100%Polyester', NULL),
(63, 13, 'Cổ áo', 'Cổ mũ', NULL),
(64, 13, 'Chiều dài tay áo', 'Tay dài', NULL),
(65, 13, 'Xuất xứ', 'Trung Quốc', NULL),
(66, 14, 'Phong cách', 'Giản dị', NULL),
(67, 14, 'Chất liệu', '100%Polyester', NULL),
(68, 14, 'Cổ áo', 'Cổ khuy', NULL),
(69, 14, 'Chiều dài tay áo', 'Tay dài', NULL),
(70, 14, 'Xuất xứ', 'Trung Quốc', NULL),
(71, 15, 'Phong cách', 'Thanh lịch', NULL),
(72, 15, 'Chất liệu', '100%Polyester', NULL),
(73, 15, 'Cổ áo', 'Cổ sơ mi', NULL),
(74, 15, 'Chiều dài tay áo', 'Tay dài', NULL),
(75, 15, 'Xuất xứ', 'Trung Quốc', NULL),
(76, 16, 'Phong cách', 'Giản dị', NULL),
(77, 16, 'Chất liệu', '100%Polyester', NULL),
(78, 16, 'Cổ áo', 'Cổ tròn', NULL),
(79, 16, 'Chiều dài tay áo', 'Tay dài', NULL),
(80, 16, 'Xuất xứ', 'Trung Quốc', NULL),
(81, 17, 'Phong cách', 'Thường ngày', NULL),
(82, 17, 'Chất liệu', '95%Polyester+5%Spandex', NULL),
(83, 17, 'Cổ áo', 'Cổ tròn', NULL),
(84, 17, 'Chiều dài tay áo', 'Tay dài', NULL),
(85, 17, 'Xuất xứ', 'Trung Quốc', NULL),
(86, 18, 'Phong cách', 'Giản dị', NULL),
(87, 18, 'Chất liệu', '30% Polyester + 20% sợi Tencel + 30% Acrylic + 10% Cotton + 10% Viscose', NULL),
(88, 18, 'Cổ áo', 'Cổ tròn', NULL),
(89, 18, 'Chiều dài tay áo', 'Tay dài', NULL),
(90, 18, 'Xuất xứ', 'Trung Quốc', NULL),
(91, 19, 'Phong cách', 'Cổ điển', NULL),
(92, 19, 'Chất liệu', '100%Polyester', NULL),
(93, 19, 'Kiểu dáng quần', 'Đứng', NULL),
(94, 19, 'Chiều dài quần', 'Dài', NULL),
(95, 19, 'Xuất xứ', 'Trung Quốc', NULL),
(96, 20, 'Phong cách', 'Cá tính', NULL),
(97, 20, 'Chất liệu', '100%Polyester', NULL),
(98, 20, 'Kiểu dáng quần', 'Ống rộng', NULL),
(99, 20, 'Chiều dài quần', 'Dài', NULL),
(100, 20, 'Xuất xứ', 'Trung Quốc', NULL),
(101, 21, 'Phong cách', 'Thường ngày', NULL),
(102, 21, 'Chất liệu', '100%Polyester', NULL),
(103, 21, 'Kiểu dáng quần', 'Đứng', NULL),
(104, 21, 'Chiều dài quần', 'Dài', NULL),
(105, 21, 'Xuất xứ', 'Trung Quốc', NULL),
(106, 22, 'Phong cách', 'Thường ngày', NULL),
(107, 22, 'Chất liệu', '100%Polyester', NULL),
(108, 22, 'Kiểu dáng quần', 'Ống rôgnj', NULL),
(109, 22, 'Chiều dài quần', 'Quần ngắn', NULL),
(110, 22, 'Xuất xứ', 'Trung Quốc', NULL),
(111, 23, 'Phong cách', 'Ngày thường', NULL),
(112, 23, 'Chất liệu ', '100%Polyester', NULL),
(113, 23, 'Kiểu dáng quần', 'Quần đùi', NULL),
(114, 23, 'Chiều dài quần', 'Ngắn', NULL),
(115, 23, 'Xuất xứ', 'Trung Quốc', NULL),
(116, 24, 'Phong cách', 'Thường ngày', NULL),
(117, 24, 'Chất liệu', '100%Polyester', NULL),
(118, 24, 'Kiểu dáng quần', 'Quần đùi', NULL),
(119, 24, 'Chiều dài quần', 'Ngắn', NULL),
(120, 24, 'Xuất xứ', 'Trung Quốc', NULL),
(121, 25, 'Phong cách', 'Giản dị', NULL),
(122, 25, 'Chất liệu', '100%Polyester', NULL),
(123, 25, 'Kiểu váy', 'Chữ A', NULL),
(124, 25, 'Chiều dài váy', 'Ngắn', NULL),
(125, 25, 'Xuất xứ', 'Trung Quốc', NULL),
(126, 26, 'Phong cách', 'Giản dị', NULL),
(127, 26, 'Chất liệu', '100%Polyester', NULL),
(128, 26, 'Kiểu váy', 'Flared', NULL),
(129, 26, 'Chiều dài váy', 'Ngắn', NULL),
(130, 26, 'Xuất xứ', 'Trung Quốc', NULL),
(131, 27, 'Phong cách', 'Thanh lịch', NULL),
(132, 27, 'Chất liệu', '100%Polyester', NULL),
(133, 27, 'Kiểu váy', 'Váy bút chì', NULL),
(134, 27, 'Chiều dài váy', 'Dài', NULL),
(135, 27, 'Xuất xứ', 'Trung Quốc', NULL),
(136, 28, 'Phong cách', 'Cổ điển', NULL),
(137, 28, 'Chất liệu', '70%Cotton+30%Polyester', NULL),
(138, 28, 'Kiểu dáng ', 'Dáng rộng', NULL),
(139, 28, 'Chiều dài', 'Quần dài', NULL),
(140, 28, 'Xuất xứ', 'Trung Quốc', NULL),
(141, 29, 'Phong cách', 'Giản dị', NULL),
(142, 29, 'Chất liệu', '65%Cotton+35%Terylene', NULL),
(143, 29, 'Kiểu dáng', 'Quần ống rộng', NULL),
(144, 29, 'Chiều dài', 'Dài', NULL),
(145, 29, 'Xuất xứ', 'Trung Quốc', NULL),
(146, 30, 'Phong cách', 'Thường ngày', NULL),
(147, 30, 'Chất liệu', '100%Polyester', NULL),
(148, 30, 'Kiểu dáng', 'Dáng rộng', NULL),
(149, 30, 'Chiều dài', 'Dài', NULL),
(150, 30, 'Xuất xứ', 'Trung Quốc', NULL),
(151, 31, 'Phong cách', 'Giản dị', NULL),
(152, 31, 'Chất liệu', '95% Polyester + 5% Spandex', NULL),
(153, 31, 'Kiểu váy', 'Váy dáng xòe', NULL),
(154, 31, 'Cổ áo', 'Trễ vai', NULL),
(155, 31, 'Xuất xứ', 'Trung Quốc', NULL),
(156, 32, 'Phong cách', 'Cá tính', 'Max300 GB/s memory bandwidth'),
(157, 32, 'Chất liệu', '100%Polyester', NULL),
(158, 32, 'Kiểu váy', 'Váy chữ A', NULL),
(159, 32, 'Cổ áo', 'Cổ kiểu nơ', NULL),
(160, 32, 'Xuất xứ', 'Trung Quốc', NULL),
(161, 33, 'Phong cách', 'Dễ thương', NULL),
(162, 33, 'Chất liệu', '100%Polyester', NULL),
(163, 33, 'Kiểu váy', 'Chứ A ngắn', NULL),
(164, 33, 'Cổ áo', 'Cổ nơ chữ V', NULL),
(165, 33, 'Xuất xứ', 'Trung Quốc', NULL),
(166, 34, 'Phong cách', 'Ngày thường', NULL),
(167, 34, 'Chất liệu', '100%Polyester', NULL),
(168, 34, 'Hoa văn', 'Trái cây và hoa', NULL),
(169, 34, 'Xuất xứ', 'Trung Quốc', NULL),
(170, 35, 'Phong cách', 'Thanh lịch', NULL),
(171, 35, 'Chất liệu', '100%Khác', NULL),
(172, 35, 'Hoa văn', 'Bướm', NULL),
(173, 35, 'Xuất xứ', 'Trung Quốc', NULL),
(174, 36, 'Phong cách', 'Ngày thường', NULL),
(175, 36, 'Chất liệu', 'Polyester', NULL),
(176, 36, 'Hoa văn', 'Màu trơn', NULL),
(177, 36, 'Xuất xứ', 'Trung Quốc', NULL),
(178, 37, 'Phong cách', 'Thanh lịch', NULL),
(179, 37, 'Chất liệu', 'Khác', NULL),
(180, 37, 'Hoa văn', 'Ditsy Floral', NULL),
(181, 37, 'Kiểu dáng', 'Ví cầm tay', NULL),
(182, 37, 'Xuất xứ', 'Trung Quốc', NULL),
(183, 38, 'Phong cách', 'Thanh lịch', NULL),
(184, 38, 'Chất liệu', 'Polyester', NULL),
(185, 38, 'Hoa văn ', ' Plain Pearls', NULL),
(186, 38, 'Kiểu dáng', 'Túi đeo vai', NULL),
(187, 38, 'Xuất xứ', 'Trung Quốc', NULL),
(188, 39, 'Phong cách', 'Dễ thương', NULL),
(189, 39, 'Chất liệu ', 'Khác', NULL),
(190, 39, 'Hoa Văn', 'Đám mây', NULL),
(191, 39, 'Kiểu dáng', 'Túi đeo vai', NULL),
(192, 39, 'Xuất xứ', 'Trung Quốc', NULL),
(193, 40, 'Phong cách', 'Ngày thường', NULL),
(194, 40, 'Chất liệu', 'Khác', NULL),
(195, 40, 'Kiểu dáng', 'Đế cao 4cm', NULL),
(196, 40, 'Xuất xứ', 'Trung Quốc', NULL),
(197, 41, 'Phong cách', 'Cá tính', NULL),
(198, 41, 'Chất liệu', 'Da bóng', NULL),
(199, 41, 'Kiểu dáng', 'Boots cao cổ', NULL),
(200, 41, 'Xuất xứ', 'Trung Quốc', NULL),
(201, 42, 'Phong cách', 'Dễ thương', NULL),
(202, 42, 'Chất liệu', 'Da bóng', NULL),
(203, 42, 'Kiểu dáng', 'Giày Mary Jane đế cao 3cm', NULL),
(204, 42, 'Xuất xứ', 'Trung Quốc', NULL),
(205, 43, 'Phong cách', 'Ngày thường', NULL),
(206, 43, 'Chất liệu', '95% Polyester + 5% Spandex', NULL),
(207, 43, 'Cổ áo', 'Cổ chữ V', NULL),
(208, 43, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(209, 43, 'Xuất xứ ', 'Trung Quốc', NULL),
(210, 44, 'Phong cách', 'Giản dị', NULL),
(211, 44, 'Chất liệu', '97% Polyester + 3% Spandex', NULL),
(212, 44, 'Cổ áo', 'Cổ sơ mi', NULL),
(213, 44, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(214, 44, 'Xuất xứ', 'Trung Quốc', NULL),
(215, 45, 'Phong cách', 'Ngày thường', NULL),
(216, 45, 'Chất liệu', '95%Polyester+5%Elastane', NULL),
(217, 45, 'Cổ áo', 'Cổ chữ V', NULL),
(218, 45, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(219, 45, 'Xuất xứ', 'Trung Quốc', NULL),
(220, 46, 'Phong cách', 'Dễ thương', NULL),
(221, 46, 'Chất liệu', '95%Polyester+5%Spandex', NULL),
(222, 46, 'Cổ áo', 'Cổ tròn', NULL),
(223, 46, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(224, 46, 'Xuất xứ', 'Trung Quốc', NULL),
(225, 47, 'Phong cách', 'Dễ Thương', NULL),
(226, 47, 'Chất liệu', '100%Polyester', NULL),
(227, 47, 'Cổ áo', 'Cổ buộc nơ', NULL),
(228, 47, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(229, 47, 'Xuất xứ', 'Trung Quốc', NULL),
(230, 48, 'Phong cách', 'Ngày thường', NULL),
(231, 48, 'Chất liệu', '100%Polyester', NULL),
(232, 48, 'Cổ áo', 'Cổ sơ mi', NULL),
(233, 48, 'Chiều dài tay áo', 'Ngắn tay', NULL),
(234, 48, 'Xuất xứ', 'Trung Quốc', NULL),
(235, 49, 'Phong cách', 'Ngày thường', NULL),
(236, 49, 'Chất liệu', '100%Polyester', NULL),
(237, 49, 'Cổ áo', 'Cổ sơ mi', NULL),
(238, 49, 'Chiều dài tay áo', 'Dài tay', NULL),
(239, 49, 'Xuất xứ', 'Trung Quốc', NULL),
(240, 50, 'Phong cách', 'Dễ thương', NULL),
(241, 50, 'Chất liệu', '100%Polyester', NULL),
(242, 50, 'Cổ áo', 'Cổ sơ mi', NULL),
(243, 50, 'Chiều dài tay áo', 'Dài tay phồng', NULL),
(244, 50, 'Xuất xứ', 'Trung Quốc', NULL),
(245, 51, 'Phong cách', 'Dễ thương', NULL),
(246, 51, 'Chất liệu', '95%Polyester+5%Spandex', NULL),
(247, 51, 'Cổ áo', 'Cổ tròn nơ', NULL),
(248, 51, 'Chiều dài tay áo', 'Tay dài', NULL),
(249, 51, 'Xuất xứ', 'Trung Quốc', NULL),
(250, 52, 'Phong cách', 'Cá tính', NULL),
(251, 52, 'Chất liệu', '100%Polyester', NULL),
(252, 52, 'Cổ áo', 'Cổ tròn', NULL),
(253, 52, 'Chiều dài tay áo', 'Không có tay áo', NULL),
(254, 52, 'Xuất xứ', 'Trung Quốc', NULL),
(255, 53, 'Phong cách', 'Thanh lịch', NULL),
(256, 53, 'Chất liệu', '100%Polytester', NULL),
(257, 53, 'Cổ áo', 'Cổ vest có nơ', NULL),
(258, 53, 'Chiều dài tay áo', 'Tay dài', NULL),
(259, 53, 'Xuất xứ', 'Trung Quốc', NULL),
(260, 54, 'Phong cách', 'Thanh lịch', NULL),
(261, 54, 'Chất liệu', '100%Polyester', NULL),
(262, 54, 'Kiểu váy', 'Váy xòe hở lưng', NULL),
(263, 54, 'Xuất xứ', 'Trung Quốc', NULL),
(264, 55, 'Phong cách', 'Thanh lịch', NULL),
(265, 55, 'Chất liệu', '100%Polyester', NULL),
(266, 55, 'Kiểu váy', 'Váy chữ A', NULL),
(267, 55, 'Hoa văn', 'Hoa nhí', NULL),
(268, 55, 'Xuất xứ', 'Trung Quốc', NULL),
(269, 56, 'Phong cách', 'Thanh lịch', NULL),
(270, 56, 'Chất liệu', '100%Polyester', NULL),
(271, 56, 'Cổ váy', 'Hở vai', NULL),
(272, 56, 'Kiểu váy', 'Váy xòe', NULL),
(273, 56, 'Xuất xứ', 'Trung Quốc', NULL),
(274, 57, 'Phong cách', 'Boho', NULL),
(275, 57, 'Chất liệu', '100%Polyester', NULL),
(276, 57, 'Kiểu váy', 'Váy chữ A dài', NULL),
(277, 57, 'Xuất xứ', 'Trung Quốc', NULL),
(278, 58, 'Phong cách', 'Boho', NULL),
(279, 58, 'Chất liệu', '100%Polyester', NULL),
(280, 58, 'Hoa văn', 'Disty Flora', NULL),
(281, 58, 'KIểu váy', 'Chữ A xẻ tà', NULL),
(282, 58, 'Xuất xứ', 'Trung Quốc', NULL),
(283, 58, 'Remote thông minh', 'Magic Remote', NULL),
(284, 58, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Screen Share', NULL),
(285, 58, 'Kích thước', 'Ngang 167.8 cm - Cao 104.5 cm - Dày 37.8 cm', NULL),
(286, 58, 'Năm ra mắt', '2022', NULL),
(287, 58, 'Hãng', 'LG', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_imgs`
--

CREATE TABLE `product_imgs` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_imgs`
--

INSERT INTO `product_imgs` (`image_id`, `product_id`, `image_name`, `image_is_display`) VALUES
(1, 1, 'P1_1.jpg', 1),
(2, 1, 'P1_2.jpg', 1),
(3, 1, 'P1_3.jpg', 1),
(4, 2, 'P2_1.jpg', 1),
(5, 2, 'P2_2.jpg', 1),
(6, 2, 'P2_3.jpg', 1),
(7, 3, 'P3_1.jpg', 1),
(8, 3, 'P3_2.jpg', 1),
(9, 3, 'P3_3.jpg', 1),
(10, 3, 'P3_4.jpg', 1),
(11, 3, 'P3_5.jpg', 1),
(12, 4, 'P4_1.jpg', 1),
(13, 4, 'P4_2.jpg', 1),
(14, 4, 'P4_3.jpg', 1),
(15, 5, 'P5_1.jpg', 1),
(16, 5, 'P5_2.jpg', 1),
(17, 5, 'P5_3.jpg', 1),
(18, 6, 'P6_1.jpg', 1),
(19, 6, 'P6_2.jpg', 1),
(20, 6, 'P6_3.jpg', 1),
(21, 7, 'P7_1.jpg', 1),
(22, 7, 'P7_2.jpg', 1),
(23, 7, 'P7_3.jpg', 1),
(24, 8, 'P8_1.jpg', 1),
(25, 8, 'P8_2.jpg', 1),
(26, 8, 'P8_3.jpg', 1),
(27, 9, 'P9_1.jpg', 1),
(28, 9, 'P9_2.jpg', 1),
(29, 9, 'P9_3.jpg', 1),
(30, 10, 'P10_1.jpg', 1),
(31, 10, 'P10_2.jpg', 1),
(32, 10, 'P10_3.jpg', 1),
(33, 11, 'P11_1.jpg', 1),
(34, 11, 'P11_2.jpg', 1),
(35, 11, 'P11_3.jpg', 1),
(36, 12, 'P12_1.jpg', 1),
(37, 12, 'P12_2.jpg', 1),
(38, 12, 'P12_3.jpg', 1),
(39, 13, 'P13_1.jpg', 1),
(40, 13, 'P13_2.jpg', 1),
(41, 13, 'P13_3.jpg', 1),
(42, 14, 'P14_1.jpg', 1),
(43, 14, 'P14_2.jpg', 1),
(44, 14, 'P14_3.jpg', 1),
(45, 15, 'P15_1.jpg', 1),
(46, 15, 'P15_2.jpg', 1),
(47, 15, 'P15_3.jpg', 1),
(48, 16, 'P16_1.jpg', 1),
(49, 16, 'P16_2.jpg', 1),
(50, 16, 'P16_3.jpg', 1),
(51, 17, 'P17_1.jpg', 1),
(52, 17, 'P17_2.jpg', 1),
(53, 17, 'P17_3.jpg', 1),
(54, 18, 'P18_1.jpg', 1),
(55, 18, 'P18_2.jpg', 1),
(56, 18, 'P18_3.jpg', 1),
(57, 19, 'P19_1.jpg', 1),
(58, 19, 'P19_2.png', 1),
(59, 19, 'P19_3.png', 1),
(60, 20, 'P20_1.jpg', 1),
(61, 20, 'P20_2.jpg', 1),
(62, 20, 'P20_3.jpg', 1),
(63, 21, 'P21_1.jpg', 1),
(64, 21, 'P21_2.gif', 1),
(65, 21, 'P21_3.jpg', 1),
(66, 22, 'P22_1.jpg', 1),
(67, 22, 'P22_2.gif', 1),
(68, 22, 'P22_3.jpg', 1),
(69, 23, 'P23_1.jpg', 1),
(70, 23, 'P23_2.jpg', 1),
(71, 23, 'P23_3.gif', 1),
(72, 24, 'P24_1.jpg', 1),
(73, 24, 'P24_2.jpg', 1),
(74, 24, 'P24_3.jpg', 1),
(75, 25, 'P25_1.jpg', 1),
(76, 25, 'P25_2.jpg', 1),
(77, 25, 'P25_3.jpg', 1),
(78, 26, 'P26_1.jpg', 1),
(79, 26, 'P26_2.gif', 1),
(80, 26, 'P26_3.jpg', 1),
(81, 27, 'P27_1.jpg', 1),
(82, 27, 'P27_2.jpg', 1),
(83, 27, 'P27_3.jpg', 1),
(84, 28, 'P28_1.jpg', 1),
(85, 28, 'P28_2.jpg', 1),
(86, 28, 'P28_3.jpg', 1),
(87, 29, 'P29_1.jpg', 1),
(88, 29, 'P29_2.jpg', 1),
(89, 29, 'P29_3.jpg', 1),
(90, 30, 'P30_1.jpg', 1),
(91, 30, 'P30_2.jpg', 1),
(92, 30, 'P30_3.jpg', 1),
(93, 31, 'P31_1.jpg', 1),
(94, 31, 'P31_2.jpg', 1),
(95, 31, 'P31_3.jpg', 1),
(96, 32, 'P32_1.jpg', 1),
(97, 32, 'P32_2.jpg', 1),
(98, 32, 'P32_3.jpg', 1),
(99, 33, 'P33_1.jpg', 1),
(100, 33, 'P33_2.jpg', 1),
(101, 33, 'P33_3.jpg', 1),
(102, 34, 'P34_1.jpg', 1),
(103, 34, 'P34_2.jpg', 1),
(104, 34, 'P34_3.jpg', 1),
(105, 35, 'P35_1.jpg', 1),
(106, 35, 'P35_2.jpg', 1),
(107, 35, 'P35_3.jpg', 1),
(108, 36, 'P36_1.jpg', 1),
(109, 36, 'P36_2.jpg', 1),
(110, 36, 'P36_3.jpg', 1),
(111, 37, 'P37_1.jpg', 1),
(112, 37, 'P37_2.jpg', 1),
(113, 37, 'P37_3.jpg', 1),
(114, 38, 'P38_1.jpg', 1),
(115, 38, 'P38_2.jpg', 1),
(116, 38, 'P38_3.jpg', 1),
(117, 39, 'P39_1.jpg', 1),
(118, 39, 'P39_2.jpg', 1),
(119, 39, 'P39_3.jpg', 1),
(120, 40, 'P40_1.jpg', 1),
(121, 40, 'P40_2.jpg', 1),
(122, 40, 'P40_3.jpg', 1),
(123, 41, 'P41_1.jpg', 1),
(124, 41, 'P41_2.jpg', 1),
(125, 41, 'P41_3.jpg', 1),
(126, 42, 'P42_1.jpg', 1),
(127, 42, 'P42_2.jpg', 1),
(128, 42, 'P42_3.jpg', 1),
(129, 43, 'P43_1.jpg', 1),
(130, 43, 'P43_2.jpg', 1),
(131, 43, 'P43_3.jpg', 1),
(132, 44, 'P44_1.jpg', 1),
(133, 44, 'P44_2.jpg', 1),
(134, 44, 'P44_3.jpg', 1),
(135, 45, 'P45_1.jpg', 1),
(136, 45, 'P45_2.jpg', 1),
(137, 45, 'P45_3.jpg', 1),
(138, 46, 'P46_1.jpg', 1),
(139, 46, 'P46_2.jpg', 1),
(140, 46, 'P46_3.jpg', 1),
(141, 47, 'P47_1.jpg', 1),
(142, 47, 'P47_2.jpg', 1),
(143, 47, 'P47_3.jpg', 1),
(144, 48, 'P48_1.jpg', 1),
(145, 48, 'P48_2.jpg', 1),
(146, 48, 'P48_3.jpg', 1),
(147, 49, 'P49_1.jpg', 1),
(148, 49, 'P49_2.jpg', 1),
(149, 49, 'P49_3.jpg', 1),
(150, 50, 'P50_1.jpg', 1),
(151, 50, 'P50_2.jpg', 1),
(152, 50, 'P50_3.jpg', 1),
(153, 51, 'P51_1.jpg', 1),
(154, 51, 'P51_2.jpg', 1),
(155, 51, 'P51_3.jpg', 1),
(156, 52, 'P52_1.jpg', 1),
(157, 52, 'P52_2.jpg', 1),
(158, 52, 'P52_3.jpg', 1),
(159, 53, 'P53_1.jpg', 1),
(160, 53, 'P53_2.jpg', 1),
(161, 53, 'P53_3.jpg', 1),
(162, 54, 'P54_1.jpg', 1),
(163, 54, 'P54_2.jpg', 1),
(164, 54, 'P54_3.jpg', 1),
(165, 55, 'P55_1.jpg', 1),
(166, 55, 'P55_2.jpg', 1),
(167, 55, 'P55_3.jpg', 1),
(168, 56, 'P56_1.jpg', 1),
(169, 56, 'P56_2.jpg', 1),
(170, 56, 'P56_3.jpg', 1),
(171, 57, 'P57_1.jpg', 1),
(172, 57, 'P57_2.jpg', 1),
(173, 57, 'P57_3.jpg', 1),
(174, 58, 'P58_1.jpg', 1),
(175, 58, 'P58_2.jpg', 1),
(176, 58, 'P58_3.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `product_variant_name` varchar(100) NOT NULL,
  `product_variant_price` float NOT NULL,
  `product_variant_available` int(11) NOT NULL,
  `product_variant_is_stock` tinyint(1) DEFAULT NULL,
  `product_variant_is_bestseller` tinyint(1) DEFAULT NULL,
  `product_variant_added_date` date NOT NULL DEFAULT current_timestamp(),
  `product_variant_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`product_variant_id`, `product_id`, `discount_id`, `product_variant_name`, `product_variant_price`, `product_variant_available`, `product_variant_is_stock`, `product_variant_is_bestseller`, `product_variant_added_date`, `product_variant_is_display`) VALUES
(1, 1, 1, 'Đỏ', 105000, 100, 1, 1, '2023-11-18', 1),
(2, 2, 1, 'Đen', 112000, 200, 1, 0, '2023-11-18', 1),
(3, 3, 1, 'Trắng', 120000, 100, 1, 1, '2023-11-18', 1),
(4, 4, 1, 'Hồng', 100000, 200, 1, 0, '2023-11-18', 1),
(5, 5, 1, 'Be', 150000, 100, 1, 1, '2023-11-18', 1),
(6, 6, 2, 'Trắng', 235000, 100, 1, 1, '2023-11-18', 1),
(7, 7, 2, 'Be', 170000, 100, 1, 1, '2023-11-18', 1),
(8, 8, 2, 'Xanh lam', 115000, 100, 1, 1, '2023-11-18', 1),
(9, 9, 2, 'Xanh', 175000, 100, 1, 1, '2023-11-18', 1),
(10, 10, 2, 'Hồng', 160000, 100, 1, 1, '2023-11-18', 1),
(11, 11, 3, 'Xám', 170000, 100, 1, 1, '2023-11-18', 1),
(12, 12, 3, 'Xanh đậm', 165000, 100, 1, 1, '2023-11-18', 1),
(13, 13, 4, 'Xám', 200000, 100, 1, 1, '2023-11-18', 1),
(14, 14, 4, 'Nâu', 185000, 100, 1, 1, '2023-11-18', 1),
(15, 15, 5, 'Be', 210000, 100, 1, 1, '2023-11-18', 1),
(16, 16, 5, 'Xanh lá', 185000, 100, 1, 1, '2023-11-18', 1),
(17, 17, 6, 'Trắng', 135000, 100, 1, 1, '2023-11-18', 1),
(18, 18, 6, 'Hồng', 170000, 100, 1, 1, '2023-11-18', 1),
(19, 19, 6, 'Xám', 150000, 100, 1, 0, '2023-11-18', 1),
(20, 20, 6, 'Xám', 160000, 100, 1, 0, '2023-11-18', 1),
(21, 21, 7, 'Xám', 195000, 100, 1, 1, '2023-11-18', 1),
(22, 22, 7, 'Nâu', 140000, 100, 1, 1, '2023-11-18', 1),
(23, 23, 9, 'Xám', 150000, 100, 1, 1, '2023-11-18', 1),
(24, 24, 9, 'Xám', 120000, 100, 1, 1, '2023-11-18', 1),
(25, 25, 10, 'Nâu', 110000, 100, 1, 1, '2023-11-18', 1),
(26, 26, 1, 'Be', 130000, 120, 1, 0, '2023-12-02', 1),
(27, 27, 1, 'Đen', 150000, 24, 1, 0, '2023-12-02', 1),
(28, 28, 9, 'Xanh lam', 200000, 100, 1, 1, '2023-12-02', 1),
(29, 29, 2, 'Đen', 240000, 50, 1, 1, '2023-12-02', 1),
(30, 30, 6, 'Trắng', 265000, 10, 1, 1, '2023-12-02', 1),
(31, 31, 6, 'Trắng', 160000, 10, 1, 1, '2023-12-02', 1),
(32, 32, 11, 'Trắng', 175000, 10, 1, 1, '2023-12-02', 1),
(33, 33, 2, 'Đỏ', 175000, 10, 1, 1, '2023-12-02', 1),
(34, 34, 2, 'Nhiêu màu', 10000, 10, 1, 1, '2023-12-02', 1),
(35, 35, 1, 'Trắng hồng', 8000, 100, 1, 1, '2023-11-19', 1),
(36, 36, 1, 'Nhiều màu', 25000, 100, 1, 1, '2023-11-19', 1),
(37, 37, 1, 'Nhiều màu', 35000, 100, 1, 1, '2023-11-19', 1),
(38, 38, 1, 'Trắng', 120000, 100, 1, 1, '2023-11-19', 1),
(39, 39, 3, 'Trắng', 100000, 100, 1, 1, '2023-11-19', 1),
(40, 40, 3, 'Nâu', 145000, 100, 1, 1, '2023-11-19', 1),
(41, 41, 4, 'Đen', 250000, 100, 1, 1, '2023-11-19', 1),
(42, 42, 4, 'Đen', 200000, 100, 1, 1, '2023-11-19', 1),
(43, 43, 4, 'Be', 115000, 100, 1, 1, '2023-11-19', 1),
(44, 44, 4, 'Đen', 155000, 100, 1, 1, '2023-11-19', 1),
(45, 45, 5, 'Trắng', 125000, 50, 1, 1, '2023-11-19', 1),
(46, 46, 2, 'Hồng', 95000, 100, 1, 1, '2023-11-19', 1),
(47, 47, 2, 'Hồng', 120000, 100, 1, 1, '2023-11-19', 1),
(48, 48, 3, 'Trắng', 160000, 100, 1, 1, '2023-11-19', 1),
(49, 49, 3, 'Đen trắng', 150000, 100, 1, 1, '2023-11-19', 1),
(50, 50, 3, 'Xanh lam', 150000, 100, 1, 1, '2023-11-19', 1),
(51, 51, 4, 'Hồng ', 145000, 100, 1, 1, '2023-11-19', 1),
(52, 52, 5, 'Xanh lam nhạt', 180000, 50, 1, 1, '2023-11-19', 1),
(53, 53, 5, 'Xám', 270000, 50, 1, 1, '2023-11-19', 1),
(54, 54, 11, 'Xanh lam', 180000, 100, 1, 1, '2023-12-02', 1),
(55, 55, 11, 'Hồng be', 190000, 100, 1, 0, '2023-12-02', 1),
(56, 56, 5, 'Xanh lam nhạt', 175000, 10, 1, 0, '2023-12-02', 1),
(57, 57, 2, 'Hồng đỏ', 165000, 10, 1, 0, '2023-12-02', 1),
(58, 58, 2, 'Xám đen', 190000, 10, 1, 0, '2023-12-02', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_role` varchar(100) NOT NULL,
  `staff_description` text DEFAULT NULL,
  `staff_added_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `staffs`
--

INSERT INTO `staffs` (`staff_id`, `user_id`, `staff_role`, `staff_description`, `staff_added_date`) VALUES
(1, 11, 'Giám đốc', 'Chịu trách nhiệm quản lý chung công ty', '2023-11-27'),
(2, 12, 'Trưởng phòng kinh doanh', 'Chịu trách nhiệm quản lý hoạt động kinh doanh của công ty', '2023-11-27'),
(3, 13, 'Nhân viên kinh doanh', 'Chịu trách nhiệm bán hàng và phát triển khách hàng', '2023-11-27'),
(4, 14, 'Nhân viên kỹ thuật', 'Chịu trách nhiệm hỗ trợ kỹ thuật cho khách hàng', '2023-11-27'),
(5, 15, 'Nhân viên chăm sóc khách hàng', 'Chịu trách nhiệm chăm sóc khách hàng và giải quyết các vấn đề của khách hàng', '2023-11-27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_logo`) VALUES
(1, 'Samsung', 'samung.png'),
(2, 'Sony', 'sony.png'),
(3, 'LG', 'lg.png'),
(4, 'Casper', 'casper.png'),
(5, 'TCL', 'tcl.png'),
(6, 'Sharp', 'sharp.png'),
(7, 'TOSHIBA', 'toshiba.png'),
(8, 'Xiaomi', 'xiaomi.png'),
(9, 'AQUA', 'aqua.png'),
(10, 'Panasonic', 'panasonic.png'),
(11, 'Funiki', 'funiki.png'),
(12, 'BOSCH', 'bosch.png'),
(13, 'BlueStone', 'blustone.png'),
(14, 'Kangaroo', 'kangaroo.png'),
(15, 'Philips', 'philips.png'),
(16, 'Pramie', 'pramie.png'),
(17, 'Media', 'media.png'),
(18, 'Whirlpool', 'whirlpool.png'),
(19, 'Ferroli', 'ferroli.png'),
(20, 'Smeg', 'smeg.png'),
(21, 'iPhone', 'iphone.png'),
(22, 'OPPO\r\n', 'oppo.png'),
(23, 'vivo', 'vivo.png'),
(24, 'SunHouse', 'sunhouse.png'),
(25, 'realme', 'realme.png'),
(26, 'beko', 'beko.png'),
(27, 'HITACHI', 'hitachi.png'),
(28, 'Bear', 'bear.png'),
(29, 'CRYSTAL', 'crystal.png'),
(30, 'LOCK&LOCK', 'lockvslock.png'),
(31, 'CUCKOO', 'cuckoo.png'),
(32, 'hp', 'hp.png'),
(33, 'Lenovo', 'lenovo.png'),
(34, 'MacBook', 'macbook.png'),
(35, 'msi', 'msi.png'),
(36, 'DELL', 'dell.png'),
(37, 'ASUS', 'asus.png'),
(38, 'iPad', 'ipad.png'),
(39, 'Masstel', 'masstel.png'),
(40, 'Hafele', 'hafele.png'),
(41, 'DAIKIN', 'daikin.png'),
(42, 'Nagakawa', 'nagakawa.png'),
(43, 'Acer', 'acer.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_avt_img` varchar(100) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_sex` enum('Nữ','Nam') DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` char(10) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_register_date` date NOT NULL DEFAULT current_timestamp(),
  `user_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_login_name`, `user_password`, `user_name`, `user_avt_img`, `user_birth`, `user_sex`, `user_email`, `user_phone`, `user_address`, `user_register_date`, `user_active`) VALUES
(1, '0987654321', '$2a$08$z6uK/g62SytTVamrrt.9J.C3uDPoqNVN.fl0ZVARVuDu.WAtQcuv2', 'Phan Nguyễn Hải Yến', 'user1.png', '2023-12-05', 'Nữ', 'haiyen@gmail.com', '0987654321', 'An Bình, Dĩ An, Bình Dương', '2023-08-01', 1),
(2, '0987654322', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thị Bình', 'user2.png', '1991-02-02', 'Nữ', 'user2@example.com', '0987654322', 'TP. Hồ Chí Minh', '2023-01-01', 1),
(3, '0987654323', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Quang Yên', 'user3.png', '1990-01-01', 'Nam', 'user3@example.com', '0987654323', 'Hà Nội', '2023-01-01', 1),
(4, '0987654324', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trương Quang Phú', 'user4.png', '1990-01-01', 'Nam', 'user4@example.com', '0987654324', 'Hải Dương', '2023-01-01', 1),
(5, '0987654325', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thiên Lộc', 'user5.png', '1990-01-01', 'Nam', 'user5@example.com', '0987654325', 'Hà Nội', '2023-01-01', 1),
(6, '0987654326', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Phú Cường', 'user6.png', '1999-03-03', 'Nam', 'user6@example.com', '0987654326', 'Đà Nẵng', '2023-01-01', 1),
(7, '0987654327', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Phan Thanh Danh', 'user7.png', '1999-03-03', 'Nam', 'user7@example.com', '0987654327', 'Đồng Nai', '2023-01-01', 1),
(8, '0987654328', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Mai Văn Tiên', 'user8.png', '1999-03-03', 'Nam', 'user8@example.com', '0987654328', 'Đà Nẵng', '2023-01-01', 1),
(9, '0987654329', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Tô Thanh Lộc', 'user9.png', '1999-03-03', 'Nam', 'user9@example.com', '0987654329', 'Bình Phước', '2023-01-01', 1),
(10, '0987654330', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Nhựt Tiến', 'user10.png', '1999-03-03', 'Nam', 'user10@example.com', '0987654330', 'Cần Thơ', '2023-01-01', 1),
(11, '0987654331', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lý Văn Nghĩa', 'user11.png', '1999-03-03', 'Nam', 'user11@example.com', '0987654331', '', '2023-01-01', 1),
(12, '0987654332', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Hồ Thị Mai', 'user12.png', '1999-03-03', 'Nữ', 'user12@example.com', '0987654332', 'Bình Dương', '2023-01-01', 1),
(13, '0987654333', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Bích Tuyền', 'user13.png', '1999-03-03', 'Nữ', 'user13@example.com', '0987654333', 'Bình Dương', '2023-01-01', 1),
(14, '0987654334', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Hồng Bảo Trinh', 'user14.png', '1999-03-03', 'Nữ', 'user14@example.com', '0987654334', 'Bình Dương', '2023-01-01', 1),
(15, '0987654335', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Hoàng PHương Linh', 'user15.png', '1999-03-03', 'Nữ', 'user15@example.com', '0987654335', 'Bình Dương', '2023-01-01', 1),
(31, '0987296708', '$2a$08$YzCffpozMPsdIMzoZ21M7.lbdOBdOgCobDdKZaZpU8u6RgUeb9zUm', 'Hồng Nhung', NULL, NULL, NULL, NULL, '0987296708', NULL, '2023-12-15', 1),
(32, '0997654321', '$2a$08$m34kubjtYr2Hd5YufiNuUOTkGX92FjTKJ6dklXfgFKiWdCA7fRc.e', 'Hồng Nhung', NULL, NULL, NULL, NULL, '0997654321', NULL, '2023-12-15', 1),
(33, '0887654321', '$2a$08$EX.tL8w9RDCIXlHXR8/yIuzFkaUFqPDiNuE7vZJCNxzD5u1f5KzcK', 'Linh Phương', NULL, NULL, NULL, NULL, '0887654321', NULL, '2023-12-15', 1);

--
-- Bẫy `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO customers (user_id)
    VALUES (NEW.user_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_notification`
--

CREATE TABLE `user_notification` (
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_notification_is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_notification`
--

INSERT INTO `user_notification` (`user_id`, `notification_id`, `user_notification_is_read`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(3, 6, 0),
(4, 6, 0),
(5, 6, 0),
(6, 6, 0),
(7, 6, 0),
(8, 6, 0),
(9, 6, 0),
(10, 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_cart` (
`customer_id` int(11)
,`cart_quantity` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_cate_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_cate_admin` (
`category_id` int(11)
,`category_name` varchar(100)
,`category_img` varchar(100)
,`categorry_type` varchar(50)
,`category_added_date` date
,`category_is_display` tinyint(1)
,`product_count` bigint(21)
,`revenue` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_count_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_count_cart` (
`customer_id` int(11)
,`user_id` int(11)
,`count_cart` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `view_dashboard` (
`customer_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_discounts`
-- (See below for the actual view)
--
CREATE TABLE `view_discounts` (
`discount_id` int(11)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
,`discount_is_display` tinyint(1)
,`discount_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_revenue`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_revenue` (
`year` int(4)
,`month` int(2)
,`order_success` bigint(21)
,`revenue` decimal(32,0)
,`order_cancel` bigint(21)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_getchart_top5_product`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_top5_product` (
`product_variant_id` int(11)
,`quantity_sold` decimal(32,0)
,`revenue` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_notifications`
-- (See below for the actual view)
--
CREATE TABLE `view_notifications` (
`notification_id` int(11)
,`notification_type_id` int(11)
,`notification_title` varchar(100)
,`notification_subtitle` text
,`notification_content` text
,`notification_date` date
,`notification_is_display` tinyint(1)
,`user_id` int(11)
,`user_notification_is_read` tinyint(1)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order`
-- (See below for the actual view)
--
CREATE TABLE `view_order` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_orders` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_order_detail` (
`order_id` int(11)
,`product_variant_id` int(11)
,`order_detail_quantity` int(11)
,`order_detail_price_before` int(11)
,`order_detail_price_after` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_variant_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_products_admin` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
,`product_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_info`
-- (See below for the actual view)
--
CREATE TABLE `view_products_info` (
`product_id` int(11)
,`category_id` int(11)
,`product_name` varchar(100)
,`supplier_id` int(11)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_description` text
,`product_period` int(11)
,`product_view_count` int(11)
,`product_is_display` tinyint(1)
,`product_variant_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_products_resume`
-- (See below for the actual view)
--
CREATE TABLE `view_products_resume` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_price` float
,`product_lastdate_added` date
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_feedbacks`
-- (See below for the actual view)
--
CREATE TABLE `view_product_feedbacks` (
`product_variant_name` varchar(100)
,`product_id` int(11)
,`feedback_id` int(11)
,`product_variant_id` int(11)
,`customer_id` int(11)
,`order_id` int(11)
,`feedback_date` date
,`feedback_rate` int(11)
,`feedback_content` text
,`feedback_is_display` tinyint(1)
,`feedback_img_id` int(11)
,`feedback_img_name` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variants`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variants` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_product_variant_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variant_detail` (
`product_variant_id` int(11)
,`product_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_stock` tinyint(1)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_added_date` date
,`product_variant_is_display` tinyint(1)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`user_id` int(11)
,`user_login_name` varchar(100)
,`user_password` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
,`user_birth` varchar(10)
,`user_sex` enum('Nữ','Nam')
,`user_email` varchar(100)
,`user_phone` char(10)
,`user_address` varchar(255)
,`user_register_date` date
,`user_active` tinyint(1)
,`customer_id` int(11)
,`staff_id` int(11)
,`staff_role` varchar(100)
,`staff_description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cart`
--
DROP TABLE IF EXISTS `view_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cart`  AS SELECT `carts`.`customer_id` AS `customer_id`, `carts`.`cart_quantity` AS `cart_quantity`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description` FROM (`carts` left join `view_product_variants` on(`carts`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ORDER BY `carts`.`cart_added_date` DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_cate_admin`
--
DROP TABLE IF EXISTS `view_cate_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cate_admin`  AS SELECT `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `categories`.`category_img` AS `category_img`, `categories`.`categorry_type` AS `categorry_type`, `categories`.`category_added_date` AS `category_added_date`, `categories`.`category_is_display` AS `category_is_display`, coalesce(`product_counts`.`product_count`,0) AS `product_count`, coalesce(sum(`order_details`.`order_detail_price_after`),0) AS `revenue` FROM ((`categories` left join (select `products`.`category_id` AS `category_id`,count(0) AS `product_count` from `products` group by `products`.`category_id`) `product_counts` on(`categories`.`category_id` = `product_counts`.`category_id`)) left join `order_details` on(`order_details`.`product_variant_id` in (select `view_products_resume`.`product_variant_id` from (`view_products_resume` join `orders`) where `view_products_resume`.`category_id` = `categories`.`category_id` and `orders`.`order_id` = `order_details`.`order_id` and `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành'))) GROUP BY `categories`.`category_id`, `categories`.`category_name` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_count_cart`
--
DROP TABLE IF EXISTS `view_count_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_count_cart`  AS SELECT `customers`.`customer_id` AS `customer_id`, `users`.`user_id` AS `user_id`, count(`carts`.`product_variant_id`) AS `count_cart` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`customer_id`)) left join `carts` on(`carts`.`customer_id` = `customers`.`customer_id`)) GROUP BY `customers`.`customer_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_dashboard`
--
DROP TABLE IF EXISTS `view_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dashboard`  AS SELECT `dashboard_customer`.`customer_count` AS `customer_count`, sum(`dashboard_order`.`quantity_sold`) AS `quantity_sold`, sum(`dashboard_order`.`revenue`) AS `revenue` FROM ((select count(0) AS `customer_count` from `customers`) `dashboard_customer` join (select count(0) AS `quantity_sold`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành' group by `orders`.`order_id`) `dashboard_order`) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_discounts`
--
DROP TABLE IF EXISTS `view_discounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_discounts`  AS SELECT `discounts`.`discount_id` AS `discount_id`, `discounts`.`discount_name` AS `discount_name`, `discounts`.`discount_description` AS `discount_description`, `discounts`.`discount_start_date` AS `discount_start_date`, `discounts`.`discount_end_date` AS `discount_end_date`, `discounts`.`discount_amount` AS `discount_amount`, `discounts`.`discount_is_display` AS `discount_is_display`, `discounts`.`discount_img` AS `discount_img` FROM `discounts` WHERE cast(`discounts`.`discount_end_date` as date) > current_timestamp() AND cast(`discounts`.`discount_start_date` as date) < current_timestamp() AND `discounts`.`discount_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_revenue`
--
DROP TABLE IF EXISTS `view_getchart_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_revenue`  AS SELECT `success`.`year` AS `year`, `success`.`month` AS `month`, `success`.`order_success` AS `order_success`, `success`.`revenue` AS `revenue`, `cancel`.`order_cancel` AS `order_cancel` FROM ((select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_success`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `success` left join (select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_cancel` from `orders` where `orders`.`order_status` = 'Đã hủy' group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `cancel` on(`cancel`.`year` = `success`.`year` and `cancel`.`month` = `success`.`month`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_getchart_top5_product`
--
DROP TABLE IF EXISTS `view_getchart_top5_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_top5_product`  AS SELECT `order_details`.`product_variant_id` AS `product_variant_id`, sum(`order_details`.`order_detail_quantity`) AS `quantity_sold`, sum(`order_details`.`order_detail_price_after` * `order_details`.`order_detail_quantity`) AS `revenue` FROM (`orders` left join `order_details` on(`order_details`.`order_id` = `orders`.`order_id`)) WHERE `orders`.`order_status` = 'Hoàn thành' GROUP BY `order_details`.`product_variant_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_notifications`
--
DROP TABLE IF EXISTS `view_notifications`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_notifications`  AS SELECT `notifications`.`notification_id` AS `notification_id`, `notifications`.`notification_type_id` AS `notification_type_id`, `notifications`.`notification_title` AS `notification_title`, `notifications`.`notification_subtitle` AS `notification_subtitle`, `notifications`.`notification_content` AS `notification_content`, `notifications`.`notification_date` AS `notification_date`, `notifications`.`notification_is_display` AS `notification_is_display`, `user_notification`.`user_id` AS `user_id`, `user_notification`.`user_notification_is_read` AS `user_notification_is_read` FROM (`notifications` left join `user_notification` on(`notifications`.`notification_id` = `user_notification`.`notification_id`)) WHERE `notifications`.`notification_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order`
--
DROP TABLE IF EXISTS `view_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_orders`
--
DROP TABLE IF EXISTS `view_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order_detail`
--
DROP TABLE IF EXISTS `view_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_detail`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_variant_id` AS `product_variant_id`, `order_details`.`order_detail_quantity` AS `order_detail_quantity`, `order_details`.`order_detail_price_before` AS `order_detail_price_before`, `order_details`.`order_detail_price_after` AS `order_detail_price_after`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_variant_name` AS `product_variant_name` FROM (`order_details` left join `view_product_variants` on(`order_details`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_admin`
--
DROP TABLE IF EXISTS `view_products_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_admin`  AS SELECT `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description`, count(`view_product_variants`.`product_variant_id`) AS `product_count`, sum(`r`.`quantity_sold`) AS `quantity_sold`, sum(`r`.`revenue`) AS `revenue` FROM (`view_product_variants` left join (select `order_details`.`product_variant_id` AS `product_variant_id`,count(`order_details`.`product_variant_id`) AS `quantity_sold`,sum(`order_details`.`order_detail_price_after`) AS `revenue` from (`orders` left join `order_details` on(`orders`.`order_id` = `order_details`.`order_id`)) where `orders`.`order_is_paid` <> 0 and `orders`.`order_status` = 'Hoàn thành' group by `order_details`.`product_variant_id`) `r` on(`view_product_variants`.`product_variant_id` = `r`.`product_variant_id`)) GROUP BY `view_product_variants`.`product_id` ORDER BY sum(`r`.`revenue`) DESC ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_info`
--
DROP TABLE IF EXISTS `view_products_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_info`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`category_id` AS `category_id`, `products`.`product_name` AS `product_name`, `products`.`supplier_id` AS `supplier_id`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_description` AS `product_description`, `products`.`product_period` AS `product_period`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_is_display` AS `product_is_display`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available` FROM (`products` join `product_variants`) WHERE `products`.`product_id` = `product_variants`.`product_id` AND `product_variants`.`product_variant_is_stock` = 1 AND `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_products_resume`
--
DROP TABLE IF EXISTS `view_products_resume`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_resume`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `a`.`product_variant_id` AS `product_variant_id`, `c`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `a`.`min_price` AS `product_variant_price`, `b`.`max_date` AS `product_lastdate_added`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((select `product_variants`.`product_id` AS `product_id`,max(`product_variants`.`product_variant_added_date`) AS `max_date` from `product_variants` group by `product_variants`.`product_id`) `b` left join (((`products` left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`discount_id` AS `discount_id`,`product_variants`.`product_variant_id` AS `product_variant_id`,min(`product_variants`.`product_variant_price`) AS `min_price` from `product_variants` group by `product_variants`.`product_id`) `a` on(`products`.`product_id` = `a`.`product_id`)) left join `view_discounts` on(`a`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) on(`products`.`product_id` = `b`.`product_id`)) left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller` from `product_variants` where `product_variants`.`product_variant_is_bestseller` = 1 group by `product_variants`.`product_id`) `c` on(`products`.`product_id` = `c`.`product_id`)) WHERE `products`.`product_is_display` = 1 GROUP BY `products`.`product_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_feedbacks`
--
DROP TABLE IF EXISTS `view_product_feedbacks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_feedbacks`  AS SELECT `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_id` AS `product_id`, `feedbacks`.`feedback_id` AS `feedback_id`, `feedbacks`.`product_variant_id` AS `product_variant_id`, `feedbacks`.`customer_id` AS `customer_id`, `feedbacks`.`order_id` AS `order_id`, `feedbacks`.`feedback_date` AS `feedback_date`, `feedbacks`.`feedback_rate` AS `feedback_rate`, `feedbacks`.`feedback_content` AS `feedback_content`, `feedbacks`.`feedback_is_display` AS `feedback_is_display`, `feedback_imgs`.`feedback_img_id` AS `feedback_img_id`, `feedback_imgs`.`feedback_img_name` AS `feedback_img_name`, `view_user`.`user_name` AS `user_name`, `view_user`.`user_avt_img` AS `user_avt_img` FROM (((`product_variants` left join `feedbacks` on(`product_variants`.`product_variant_id` = `feedbacks`.`product_variant_id`)) left join `feedback_imgs` on(`feedbacks`.`feedback_id` = `feedback_imgs`.`feedback_id`)) left join `view_user` on(`view_user`.`customer_id` = `feedbacks`.`customer_id`)) WHERE `feedbacks`.`feedback_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variants`
--
DROP TABLE IF EXISTS `view_product_variants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variants`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_period` AS `product_period`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((`products` left join `product_variants` on(`products`.`product_id` = `product_variants`.`product_id`)) left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) WHERE `categories`.`category_id` = `products`.`category_id` AND `products`.`product_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_product_variant_detail`
--
DROP TABLE IF EXISTS `view_product_variant_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variant_detail`  AS SELECT `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_id` AS `product_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_stock` AS `product_variant_is_stock`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `product_variants`.`product_variant_added_date` AS `product_variant_added_date`, `product_variants`.`product_variant_is_display` AS `product_variant_is_display`, `view_discounts`.`discount_name` AS `discount_name`, `view_discounts`.`discount_description` AS `discount_description`, `view_discounts`.`discount_start_date` AS `discount_start_date`, `view_discounts`.`discount_end_date` AS `discount_end_date`, `view_discounts`.`discount_amount` AS `discount_amount` FROM (`product_variants` left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) WHERE `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `users`.`user_id` AS `user_id`, `users`.`user_login_name` AS `user_login_name`, `users`.`user_password` AS `user_password`, `users`.`user_name` AS `user_name`, `users`.`user_avt_img` AS `user_avt_img`, date_format(`users`.`user_birth`,'%d/%m/%Y') AS `user_birth`, `users`.`user_sex` AS `user_sex`, `users`.`user_email` AS `user_email`, `users`.`user_phone` AS `user_phone`, `users`.`user_address` AS `user_address`, `users`.`user_register_date` AS `user_register_date`, `users`.`user_active` AS `user_active`, `customers`.`customer_id` AS `customer_id`, `staffs`.`staff_id` AS `staff_id`, `staffs`.`staff_role` AS `staff_role`, `staffs`.`staff_description` AS `staff_description` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`user_id`)) left join `staffs` on(`users`.`user_id` = `staffs`.`user_id`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_login_name` (`admin_login_name`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`customer_id`,`product_variant_id`),
  ADD KEY `fk_product_varants_id` (`product_variant_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customers_users` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_product_variant_id` (`product_variant_id`);

--
-- Chỉ mục cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD PRIMARY KEY (`feedback_img_id`),
  ADD KEY `fk_feedback_id` (`feedback_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_notification_types` (`notification_type_id`);

--
-- Chỉ mục cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`notification_type_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_customers` (`customer_id`),
  ADD KEY `fk_orders_staffs` (`staff_id`),
  ADD KEY `fk_paying_method_id` (`paying_method_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_variant_id`),
  ADD KEY `fk_product_variants_id` (`product_variant_id`);

--
-- Chỉ mục cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  ADD PRIMARY KEY (`paying_method_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_categories` (`category_id`),
  ADD KEY `fk_products_suppliers` (`supplier_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_detail_id`,`product_id`),
  ADD KEY `fk_product_details_products` (`product_id`);

--
-- Chỉ mục cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_product_imgs_products` (`product_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`product_variant_id`,`product_id`) USING BTREE,
  ADD KEY `fk_product_variants_products` (`product_id`),
  ADD KEY `fk_products_variants_discounts` (`discount_id`);

--
-- Chỉ mục cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_staffs_users` (`user_id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`user_id`,`notification_id`),
  ADD KEY `fk_user_notification_notifications` (`notification_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `notification_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `paying_methods`
--
ALTER TABLE `paying_methods`
  MODIFY `paying_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `product_variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`),
  ADD CONSTRAINT `fk_product_varants_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD CONSTRAINT `fk_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`feedback_id`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_notification_types` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`notification_type_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_orders_staffs` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_paying_method_id` FOREIGN KEY (`paying_method_id`) REFERENCES `paying_methods` (`paying_method_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`),
  ADD CONSTRAINT `fk_product_variants_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_products_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `fk_product_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `fk_product_imgs_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_variants_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_products_variants_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Các ràng buộc cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `fk_staffs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_user_notification_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `fk_user_notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
