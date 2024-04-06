-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 06, 2024 lúc 12:24 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `figure`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'Chưa xác nhận',
  `notes` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bill_id`, `total_amount`, `bill_date`, `status`, `notes`, `user_id`) VALUES
(1, 2000000.00, '2024-03-04 08:23:57', 'Đã xác nhận', NULL, 3),
(7, 17600000.00, '2024-03-07 12:49:46', 'Chưa xác nhận', '', 3),
(9, 4800000.00, '2024-03-07 13:10:57', 'Đã hủy đơn', '', 12),
(10, 15000000.00, '2024-03-08 01:15:47', 'Đã xác nhận', '', 14),
(11, 3340000.00, '2024-03-09 16:31:19', 'Chưa xác nhận', 'Giao hàng nhanh', 3),
(12, 21270000.00, '2024-03-12 14:43:58', 'Chưa xác nhận', '', 3),
(13, 8500000.00, '2024-03-12 14:44:28', 'Chưa xác nhận', '', 3),
(14, 5000000.00, '2024-03-12 14:46:00', 'Chưa xác nhận', '', 3),
(15, 5000000.00, '2024-03-17 07:54:01', 'Chưa xác nhận', '', 3),
(16, 6900000.00, '2024-03-17 07:54:45', 'Chưa xác nhận', '', 3),
(17, 12000000.00, '2024-03-17 07:56:34', 'Chưa xác nhận', '', 3),
(18, 3600000.00, '2024-03-17 08:14:01', 'Chưa xác nhận', '', 3),
(19, 6700000.00, '2024-03-17 08:15:41', 'Chưa xác nhận', '', 3),
(20, 8500000.00, '2024-03-17 08:16:18', 'Chưa xác nhận', '', 3),
(21, 3500000.00, '2024-03-17 13:49:51', 'Chưa xác nhận', '', 3),
(22, 2700000.00, '2024-03-17 13:53:40', 'Chưa xác nhận', '', 3),
(23, 2900000.00, '2024-03-17 14:05:22', 'Chưa xác nhận', '', 3),
(24, 2100000.00, '2024-04-06 07:42:30', 'Chưa xác nhận', '', 3),
(25, 6900000.00, '2024-04-06 07:43:16', 'Chưa xác nhận', '', 3),
(26, 3700000.00, '2024-04-06 08:53:18', 'Chưa xác nhận', '', 3),
(27, 2900000.00, '2024-04-06 08:59:36', 'Chưa xác nhận', '', 3),
(28, 5400000.00, '2024-04-06 09:04:34', 'Chưa xác nhận', '', 3),
(29, 1230000.00, '2024-04-06 09:07:53', 'Chưa xác nhận', '', 3),
(31, 6700000.00, '2024-04-06 09:21:57', 'Chưa xác nhận', '', 3),
(32, 6700000.00, '2024-04-06 09:22:21', 'Chưa xác nhận', '', 3),
(33, 6450000.00, '2024-04-06 09:53:18', 'Chưa xác nhận', '', 3),
(34, 5000000.00, '2024-04-06 10:01:02', 'Chưa xác nhận', '', 3),
(37, 3600000.00, '2024-04-06 10:16:32', 'Chưa xác nhận', '', 3),
(38, 2400000.00, '2024-04-06 10:23:30', 'Chưa xác nhận', '', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `detail_id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `bill_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_details`
--

INSERT INTO `bill_details` (`detail_id`, `bill_id`, `product_id`, `bill_quantity`) VALUES
(1, 1, 22, 1),
(4, 7, 26, 2),
(5, 7, 27, 2),
(8, 9, 29, 1),
(9, 9, 19, 1),
(10, 10, 8, 1),
(11, 11, 40, 2),
(12, 11, 42, 1),
(13, 11, 30, 1),
(14, 12, 40, 1),
(15, 12, 55, 1),
(16, 12, 66, 1),
(17, 12, 34, 2),
(18, 12, 49, 1),
(19, 13, 69, 1),
(20, 14, 64, 1),
(21, 15, 17, 1),
(22, 16, 70, 1),
(23, 17, 66, 1),
(24, 17, 63, 1),
(25, 18, 56, 1),
(26, 19, 65, 1),
(27, 20, 69, 1),
(28, 21, 51, 1),
(29, 22, 9, 1),
(30, 23, 3, 1),
(31, 24, 34, 2),
(32, 25, 70, 1),
(33, 26, 67, 1),
(34, 27, 3, 1),
(35, 28, 15, 1),
(36, 29, 44, 1),
(38, 31, 65, 1),
(39, 32, 65, 1),
(40, 33, 17, 1),
(41, 33, 45, 1),
(42, 34, 64, 1),
(46, 37, 56, 1),
(47, 38, 30, 1),
(48, 38, 32, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `catalog_id` int(32) NOT NULL,
  `catalogName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`catalog_id`, `catalogName`) VALUES
(1, 'Resin'),
(2, 'Nendoroid'),
(3, 'Scale'),
(4, 'Card'),
(5, 'PVC');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `characters`
--

CREATE TABLE `characters` (
  `character_id` int(32) NOT NULL,
  `character_img` varchar(2000) DEFAULT NULL,
  `character_name` varchar(255) NOT NULL,
  `character_info1` text DEFAULT NULL,
  `character_info2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `characters`
--

INSERT INTO `characters` (`character_id`, `character_img`, `character_name`, `character_info1`, `character_info2`) VALUES
(1, 'https://file.hstatic.net/200000462939/collection/d9u4f54-92a1cc46-0d10-46f4-b39d-cdc830c4daa3_6772292ba8754b0c8183661721b05c7a.gif', 'Hatsune Miku', 'Hatsune Miku trong tiếng nhật có nghĩa là \"Âm nhạc của tương lai\", đây là vocaloid do Hãng Crypton Future Media (CFM) sản xuất và hiện nay Hatsune Miku dẫn đầu cho một xu hướng âm nhạc mới: những ca sĩ được tạo ra từ máy tính và trở thành biểu tượng của những người hâm mộ truyện tranh tại Nhật Bản.', 'Hatsune Miku là ca sĩ ảo được tạo ra bởi sự kết hợp giữa hai phần mềm: Vocaloid của hãng Yamaha và chương trình đồ họa MikuMikuDance. Miku là một cô gái 16 tuổi, cao 1m58, nặng 42 kg, thích ca hát, nhảy múa, yêu màu xanh lá cây. Hiện tại trên kênh YouTube chính thức của Miku có trên 500 nghìn lượt đăng kí, trung bình có 16 triệu lượt người xem và có rất nhiều bài hát của Miku đã thành hit ở Nhật Bản.'),
(2, 'https://file.hstatic.net/200000462939/collection/okaafwz_ee06082524804c80994d547728d1c267.gif', 'Elaina', 'Elaina (Tiếng Nhật: イレイナ) là nhân vật chính của câu truyện. Một thiếu nữ tài năng, sớm đoạt được danh hiệu cao quý nhất trong giới pháp sư, phù thủy, từ khi còn rất trẻ.\r\nElaina có mái tóc màu xám tro dài tới ngang hông cùng một cặp mắt lưu ly sáng trong. Cô thường mặc một chiếc áo choàng đen cùng mũ tam giác đen chóp nhọn mà mẹ để lại, trên ngực đeo một chiếc huy hiệu chứng nhận phù thủy hình ngôi sao. Trên đường du hành, Elaina cũng có thể thay trang phục tùy theo thời tiết từng vùng, và tùy hoàn cảnh. Ngoại trừ vào những mùa thời tiết lạnh thì cô có xu hướng sở thích mặc áo sát nách, điều này có thể thấy qua các trang phục cô mặc xuyên suốt qua các tập truyện. Cô có thể cải trang hay dùng phép thuật biến hình thành người hoặc thậm chí là con vật khác.', 'Thường được nhiều người mô tả là xinh xắn, dễ thương. Bản thân Elaina cũng rất tự tin về ngoại hình của mình, thể hiện rõ qua những câu độc thoại mà cô miêu tả bản thân. Tuy nhiên, thỉnh thoảng cô cũng hay bị châm chọc vì chiều cao và vòng một khiêm tốn.'),
(3, 'https://file.hstatic.net/200000462939/collection/7285b433d5b22a115d5f4e3fe4bbb53e_874e4034c81c4883a862c596cd522934.gif', 'Tokisaki Kurumi', 'Tokisaki Kurumi là Tinh linh thứ ba xuất hiện trong Chính truyện Date A Live. Do những hành động tàn bạo của mình mà cô còn được coi là Tinh linh tồi tệ nhất.', 'Tokisaki Kurumi được Shidou miêu tả là có \"một vẻ đẹp đáng kinh ngạc\". Cô luôn thể hiện dáng vẻ thanh lịch và cư xử rất đúng mực trước mọi người lúc bình thường, cũng như đôi lúc khi ở dạng Tinh linh. Cô có màu da hơi tối, mái tóc dài được buộc hai bên. Mắt bên phải của cô có màu đỏ trong khi mắt bên trái có hình dạng của một chiếc đồng hồ với nền vàng, bao gồm cả số và kim trên đồng hồ. Phần tóc mái của cô khi bình thường sẽ dài hơn ở phía bên trái để che đi mắt trái của cô.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imglist`
--

CREATE TABLE `imglist` (
  `imglist_id` int(32) NOT NULL,
  `product_id` int(32) NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `imglist`
--

INSERT INTO `imglist` (`imglist_id`, `product_id`, `img_path`) VALUES
(4, 14, '../assets/img/upload/47414bf3-c275-4f2a-baaa-5678445683ef_fd6362dda9904988820d742a5b71ce24_master.webp'),
(5, 14, '../assets/img/upload/c607abac-749f-4694-80af-aa62cda2d902_c3e54932d475479589c76fbe8d0505ac_master.webp'),
(6, 14, '../assets/img/upload/e0462467-9fe5-4829-be91-93bed06f89e0_b56f9e8204ec4836a72a517a21f54c6c_master.webp'),
(7, 15, '../assets/img/upload/311673e8-e7fc-424e-a4b1-b48ae6ffd2ce_435be9aab39a4beabfd3997fcd6e630e_master.webp'),
(8, 15, '../assets/img/upload/709950a9-82f4-4b06-be46-83c369ccf20b_f7416eac97fb4942a988c1276d3a9764_master.webp'),
(9, 15, '../assets/img/upload/e994a804-fa62-4ff1-83d4-2c48dc3cd9bd_7d3c7aabc86544cea5a872e2b7e4a093_master.webp'),
(10, 16, '../assets/img/upload/0e8f5371-3a85-4d15-9986-9b0d967fe939_2986f9da4ce4417691fb1c295cc33964_master.webp'),
(11, 16, '../assets/img/upload/1c26666e-b654-4d5f-a8ee-0ec179a1ae2e_5df82b9ef06e47419c4aff0bd2a4f5fd_master.webp'),
(12, 16, '../assets/img/upload/376ad2e5-c448-4d15-bde8-3be3b0d16112_7c9063aae4f2412eb29a93bd952910c8_master.webp'),
(13, 17, '../assets/img/upload/6db933fd-ae4c-45e4-ac0a-6705a43f2bbd_d75163e32fcd491e99d168d7d2376af3_master.webp'),
(14, 17, '../assets/img/upload/64a843e1-b7cc-4a50-a28d-d06d3f28998d_baca2156e57743a299d5648aad22bfcc_master.webp'),
(15, 17, '../assets/img/upload/2706a87d-40a8-4d62-9ca0-63baba373ad6_d25efc4cb1c648e086a4c7ad8c7847ad_master.webp'),
(16, 18, '../assets/img/upload/62728f93-a502-4f11-8dac-47b3c6c76219_22aee2f568124245b5c089fb1dfb3235_master.webp'),
(17, 19, '../assets/img/upload/2a0bc605-c43a-4535-840b-cf536af019ae_d98b05513e55473b8bf7f4bb651324a2_master.webp'),
(18, 19, '../assets/img/upload/596ff5ba-f1d9-46c9-ad64-3cb76318ede8_971b77b2e2794be585c416df18fabcb1_master.webp'),
(19, 19, '../assets/img/upload/3277c954-e361-4670-84b0-4627680fea91_e55f49cf3207417d9cfc0d54d33e9718_master.webp'),
(20, 20, '../assets/img/upload/0aab995e-515c-4099-b44c-043d9e749b25_cb6c8fe02afe4eab9f97802357739dad_master.webp'),
(21, 20, '../assets/img/upload/5d17eec8-25f3-4b58-8404-07c43fe1043b_dc62a07aec7b4069ba271e9b4b351476_master.webp'),
(22, 20, '../assets/img/upload/24d804ae-b466-4110-a2be-0d3add652913_b2509ae856e14cb88b3b5f543b7fa662_master.webp'),
(23, 20, '../assets/img/upload/608ff965-84c1-475b-b61c-5471fecc4bbd_ebaae0ae7068469aa775a573f69c1ce5_master.webp'),
(24, 20, '../assets/img/upload/779c7a9f-7f5c-4a8c-ade6-e2e749a9a0fc_b61557caaeb6470c982ba199e3e51118_master.webp'),
(25, 21, '../assets/img/upload/2a63ce1d-7008-4202-9284-630ec9e446cc_00bb077106654223b7444b2ff2be1102_master.jpg'),
(26, 21, '../assets/img/upload/6f23cd10-b5cb-44ad-991f-73929f76fd11_c3c89c322a184d70bbcaf25dc582331d_master.webp'),
(27, 21, '../assets/img/upload/21bcfacf-27e9-4da6-96c3-36080791e19e_75a042a921234b5e94b7e1dc96076d73_master.webp'),
(28, 21, '../assets/img/upload/50ceb6d4-02c6-4c3e-86d6-26e53a950c2c_80e2e451cfe34587bcda29e2774822df_master.webp'),
(29, 22, '../assets/img/upload/6c81d1f9-c33a-4c95-83bd-b8befeb1d474_914a9aac7ae944339a5704f5ba09fac7_master.webp'),
(30, 22, '../assets/img/upload/6d26cf28-975f-4247-883c-71ec8118e498_c94a2958c503415ca806c16a74db6e38_master.webp'),
(31, 22, '../assets/img/upload/7306df1b-e713-41cb-93fa-d0d5657cf661_d8f45dc91ca84c299c30d0d1fab35649_master.webp'),
(32, 22, '../assets/img/upload/050735ea-7593-428d-be23-fdbb05251e59_bee1293d0377467aa482d90a6cc2ecc6_master.webp'),
(33, 23, '../assets/img/upload/9bf757a7-bf84-4d59-882e-bac59ed9500a_ae7d2499450649d6af3878b0d5360667_master.jpg'),
(34, 23, '../assets/img/upload/14d13aa3-6b03-4b4c-a70c-5a2c11f205cc_3bd42f68616f49dd9390efd9d4fc4c19_master.webp'),
(35, 23, '../assets/img/upload/7119fa09-8a4c-41e4-9c98-6f331b0a74a4_4c6c506392ab42f680e0cbd049b91db4_master.webp'),
(36, 24, '../assets/img/upload/37d62153-ee7f-42cb-a89e-c601ecf3ea41_934be11462524549af9b76e028bdf385_master.webp'),
(37, 24, '../assets/img/upload/708d9307-14a2-4606-a5a4-763a4e18fa64_8494182790714c50b1529152766ee91e_master.webp'),
(38, 25, '../assets/img/upload/7b9fd619-e1bc-4452-a149-e51fc837618a_1012f499d963475b80e2be087f52e0bb_master.webp'),
(39, 25, '../assets/img/upload/191dd725-1f12-467e-beef-6f58ec0a136e_f27966ad60604c9387e2d3203acccc34_master.webp'),
(40, 25, '../assets/img/upload/1219fa9e-2d27-447f-a4db-0f89938d9600_c47fd26277ef454ebbd18b9511d60b82_master.webp'),
(41, 26, '../assets/img/upload/2df8ed1c-6050-4f31-a02f-4123c8e1e337_7d46d8aa15414d9d97f3c7d40f5a6270_master.webp'),
(42, 26, '../assets/img/upload/12d87a63-2e29-4bfe-9694-1c594daf6a78_08b65444b7494a64b9d4f89dfd5c52f3_master.webp'),
(43, 26, '../assets/img/upload/a52b5b69-1769-45af-8d65-ac9a09d42c6f_4f696d5bab8044a1b6ab45854f12e92a_master.webp'),
(44, 26, '../assets/img/upload/b0da0fca-6944-45c4-8282-eb1624942ab9_43a3ef73fa074b94a552685f73314e38_master.webp'),
(45, 27, '../assets/img/upload/8cee67ff-621e-4182-a7af-abb37a4f1e8f_a607bdaeb033432e9d14566180779325_master.webp'),
(46, 27, '../assets/img/upload/5897ce6e-2604-497a-b500-524a595c6f67_72417bd3af4f4fc68843bb8589654931_master.webp'),
(47, 27, '../assets/img/upload/2617259b-8e50-45d1-84b0-2e031395d081_2248abaaa3b440fcacb733a78e67a8fa_master.webp'),
(48, 27, '../assets/img/upload/a4c5c167-861e-483d-b584-adf41c81d89f_8cbe2f8cb0cf44cf923db427e46fe241_master.webp'),
(49, 28, '../assets/img/upload/4fb760f3-8709-43e2-8d90-1c8f855b2876_2ca9064f07524586ae9e60fa0197e692_master.webp'),
(50, 28, '../assets/img/upload/50ec7883-7373-4c64-970c-a20b20390346_e83f03f467dd42abb8777e0839ce451c_master.webp'),
(51, 28, '../assets/img/upload/749df1fe-e642-449f-a6d4-e83568a21219_8a21cb34281049c8a3fb605c83a71020_master.webp'),
(52, 29, '../assets/img/upload/51cf39f0-5bf8-43f0-82f8-00197ec624af_77ba0c6399bb4a2f844bce3e621087b0_master.webp'),
(53, 29, '../assets/img/upload/98b2434a-2e42-46a8-8540-be7d5231e7d3_878907df7e0c4f0ab2e2050e725f4cad_master.webp'),
(54, 29, '../assets/img/upload/841f7af2-52ba-4ad9-b5fa-a4b8e81e0085_ed9f985c53d14ecca457ac90b22b2e17_master.webp'),
(55, 29, '../assets/img/upload/f64e78a1-7c61-4f72-89a4-cd3096fa9715_ac47ba9d06024c948e2c420158d4ae25_master.webp'),
(56, 30, 'Array'),
(57, 30, 'Array'),
(58, 30, 'Array'),
(59, 30, 'Array'),
(60, 31, '../assets/img/upload/8515b3a3-ef3f-4954-95fe-c0b0b0f9bf4a_0b9fa20363d24d68b97a9a9ff9e6d1a8_master.webp'),
(61, 31, '../assets/img/upload/14071cdd-f18e-4f39-9521-88259daa7ae7_d1a653ed1cd3451aa0cb77fb7f6beac1_master.webp'),
(62, 31, '../assets/img/upload/c6d8b3f2-1287-4541-ac7a-423580d103e6_1858c99fa7e840e29f348923e390bd70_master.webp'),
(63, 31, '../assets/img/upload/c8e32867-0cc5-46a5-9301-960b76975551_bba93ee417e14bd18e8d7f4e0dfb42c2_master.webp'),
(64, 32, '../assets/img/upload/73a82da7-ad4b-49d8-ac55-d00209114cc6_fb2bb3a60e4241cfa0b683f7fae8fa8c_master.webp'),
(65, 32, '../assets/img/upload/340753c1-2bcd-474a-b6f4-a522f26cbf11_d46feefaa897491bb75fba6e39fc65f8_master.webp'),
(66, 32, '../assets/img/upload/ba13c41b-0fc5-437b-be0f-3f096e6d16ce_2e849315e4a449dfbb3f502c5d15d703_master.jpg'),
(67, 32, '../assets/img/upload/f6985ee7-2d59-4f98-96ca-228b3789baae_263c6575e21845a68fd9cda83f218316_master.webp'),
(68, 33, '../assets/img/upload/1f669824-6074-491d-aae9-0d6a89163d11_9dfdc9029bcc44939ea3945d3fe181e0_master.jpg'),
(69, 33, '../assets/img/upload/65e374f8-3c12-4989-b993-3020c666b0a7_8f9acae743744479a6282b098d458280_master.jpg'),
(70, 33, '../assets/img/upload/516ae325-3615-4bc4-8c8a-74fe9d7e64ca_13d4f8e423c2466b96cc34d9ef85a696_master.webp'),
(71, 33, '../assets/img/upload/afad6db7-c74f-4a12-9102-9e4b26fbab60_febed3c5adbd4bc5a1f2b566532052e4_master.jpg'),
(72, 34, '../assets/img/upload/3efc44f8-2876-4c62-9e06-837fd111a6d0_233519aef04c43659cf7458770e23cc4_master.webp'),
(73, 34, '../assets/img/upload/6c242d7b-b1fe-404e-9c1a-e8099bc9b6f6_c25b8ba080414dc7a398870c110b5d1f_master.webp'),
(74, 34, '../assets/img/upload/a6349494-ac86-4fe7-b6db-8e80b40cb9a0_e84c341cb14f4146bdc9bc076b51daab_master.webp'),
(75, 34, '../assets/img/upload/cdd4d564-60e9-4993-b1ca-a587e1e09865_0caa83351ab445d7895a9b4640cc8f3e_master.webp'),
(76, 35, '../assets/img/upload/3faf40a0-caf0-436b-a136-8466f47fe35e_ec56ab7cc8e641fca25c41ae50eacb72_master.jpg'),
(77, 35, '../assets/img/upload/26ec5192-b3c3-4876-8ae1-0f6a19c6f499_8faa7faf63a24acdabb9eceaab48c0a5_master.jpg'),
(78, 35, '../assets/img/upload/983ce1a4-67d0-40a3-9acf-eae02f0905cc_142bea49ae4f44bc9075bc986c4fc4b8_master.jpg'),
(79, 35, '../assets/img/upload/175312b5-a21d-4d1b-bb4b-d859c258bf53_0896714a5b2e44f18ff6c6f03e7ce8b5_master.webp'),
(80, 35, '../assets/img/upload/c3f3c38d-4585-4a15-a568-b4dd46e2e7f9_947f4dad19a1476d9231adfd557bd736_master.webp'),
(81, 36, '../assets/img/upload/4b730efc-14c7-43b0-8497-e3a964f85276_2745979087bf42cfabd99dc22d76c592_master.jpg'),
(82, 36, '../assets/img/upload/ec483e8d-a188-46fe-820f-024fc85a06e3_35d3e32e8c5247218b4981536ee02760_master.webp'),
(83, 37, '../assets/img/upload/3ae65eaab55dc36385379791fe47a9d3.webp'),
(84, 37, '../assets/img/upload/aac52be0de33dd11022e83cea5edbbc0.jpg'),
(85, 37, '../assets/img/upload/bee56f7beb4f25ef4383aa3cf33cac11.webp'),
(86, 37, '../assets/img/upload/cae797706f7a27c7ba4cd99c8be06054.jpg'),
(87, 37, '../assets/img/upload/ee4ec2b1c9278a77ef70dfbc460e2882.webp'),
(88, 38, '../assets/img/upload/4318d7d5-160a-4e29-8938-df00287d75be_445e1e7f53224b01a25f45f71b01c790_master.webp'),
(89, 38, '../assets/img/upload/a2a2be07-ee68-42b7-94dc-306f21e08453_3575b78fb80d44c7b0d305694e29e541_master.webp'),
(90, 38, '../assets/img/upload/f114143b-cd9c-4f02-8fd9-ed72fe140dc6_039e4e55a49d4cfc9f0b396b5007a7fc_master.webp'),
(91, 39, '../assets/img/upload/4d4876b5-930b-4562-bfa0-ef1fda8df2d7_26183c8e6348493f9651a7453f7ff423_master.webp'),
(92, 39, '../assets/img/upload/ba7d858b-9d94-483b-aedf-a2f804151e5a_4946c32881ca400abde6e1fe09db6033_master.webp'),
(93, 39, '../assets/img/upload/c08cf448-b0f9-4d2f-b1e0-54aeb18df157_ffd4aa2763b54c8d8a1de115c971870d_master.webp'),
(94, 39, '../assets/img/upload/ddcfc7a9-ef6b-4f55-a0b8-57af6df5eb33_86acf56348c1468cb51726599204488a_master.webp'),
(95, 40, '../assets/img/upload/2dad2a6d-8247-4ebe-add0-9182085acff8_e41359205c834517a98aed93f4306e28_master.webp'),
(96, 40, '../assets/img/upload/9e0f2b4a-66e5-4e49-823c-ec3752e2c187_a54fbe49d7da48b491222579a8bd70c4_master.webp'),
(97, 40, '../assets/img/upload/54a2e86e-3502-4d17-9a6e-64fbc535c68a_51d4208da7f741d7b89743d02e83c4b3_master.webp'),
(98, 40, '../assets/img/upload/82ed582f-4864-4d96-88bb-511ae13b152a_042da3fa26374b30a915e9ffbe0d4b6b_master.webp'),
(99, 40, '../assets/img/upload/323e53a0-6b6b-4a95-857d-bb2fcfef4613_2a593b3b52084acbaa2c8f68c675fe7c_master.webp'),
(100, 41, '../assets/img/upload/4b024ee8-84e5-4610-a1f1-39052303046d_f85f8a0c75f248969e201461450d16f9_master.jpg'),
(101, 41, '../assets/img/upload/17902344-14f2-4f6a-b2cb-677b88326d6b_7b9ac62ef47042e7b91aeeab714fd326_master.webp'),
(102, 42, '../assets/img/upload/c8647c15-05e1-4d99-bb0d-347def50fe70_ccb68038c9af4078b0ec9d93e3e7f03b_master.webp'),
(103, 42, '../assets/img/upload/de984414-7769-4ce2-9223-e8459995155b_f6438a5d7d38434aa6f490a6b73e7a1b_master.webp'),
(104, 42, '../assets/img/upload/e739cf43-4ccd-4e31-a676-b7783b5f8f99_94bb035111c5437987411c0c41de1637_master.webp'),
(105, 43, '../assets/img/upload/3cd8181a-cd77-4aef-8d49-bfd1032a7f5c_740a29cbead544b5a1421ea2212a3556_master.webp'),
(106, 43, '../assets/img/upload/2580909b-a884-4099-9ee1-86e1be27c13a_5d7594719c5340f48c4b965379157722_master.webp'),
(107, 43, '../assets/img/upload/e7b2aa02-b327-4382-a347-1f408f8c57cd_e2eb9d805d1147c1bb80c8a9b8cec65e_master.webp'),
(108, 44, '../assets/img/upload/b4e7d0fc-b360-4304-909e-3f13515b2e3d_adad327e1cb34fc0a3dc496ba2dd2624_master.webp'),
(109, 44, '../assets/img/upload/d3e2719c-ae34-45c6-96f3-44c70deddf53_7d8d0705d62e40d388f0dfc68a633d09_master.webp'),
(110, 44, '../assets/img/upload/a626e52e-747d-4857-8a3a-1aa55b098009_d5a4ebed41b647f49c176eab1bcf3a5b_master.webp'),
(111, 45, '../assets/img/upload/70515b4a-ebcf-40dc-931b-6f5e6200f20f_9fd2d64e759349a3b99febccb7b60e13_master.webp'),
(112, 45, '../assets/img/upload/f76b1208-ce84-4d85-a3fe-a58a76938a4a_8c71cdd82a0e490a9e8a207ad94484bc_master.webp'),
(113, 45, '../assets/img/upload/f6263e85-6427-4842-b908-09fd7a3ce262_29bda2644a1e46699d5f38d405203154_master.webp'),
(114, 46, '../assets/img/upload/2c49affa-e669-43d3-9e8a-e064d67bbf7d_e5a64bcb7d7d4a27b579622352764573_master.webp'),
(115, 46, '../assets/img/upload/5137364e-5a57-48f7-84c2-600a79fed5b3_ac9f6e636e914a49bb8a941b7d95bac6_master.webp'),
(116, 46, '../assets/img/upload/a49792b0-5563-400c-a48b-a33e82f22fdd_44c571d7bbd24463badaa2331edeb07b_master.webp'),
(117, 47, '../assets/img/upload/0ce312047db8f0be02dfde993f2d05db.webp'),
(118, 47, '../assets/img/upload/3e5e1eba1e3a9d74b0e6818c990c8710.jpg'),
(119, 47, '../assets/img/upload/30f34a9bdf296f6b69356aaa139d7341.webp'),
(120, 47, '../assets/img/upload/86f40a8609faab7b9b37161e2c991d10.jpg'),
(121, 47, '../assets/img/upload/0186cbdf2b57851f5c71262041979cb4.webp'),
(122, 48, '../assets/img/upload/9b4d7784-adce-472f-9867-041cac0df9eb_f3a1cfb546ba4850b7b5e3ef77362065_master.webp'),
(123, 48, '../assets/img/upload/64a1ebb9-ad7f-41d4-8266-6e8a475fef8f_d41a2e7893f7483ebc2d81326e17f283_master.jpg'),
(124, 48, '../assets/img/upload/94ad5d82-95e0-411e-b926-1c059c48aac5_985735a2e9f8485e8b2eadf60332b2fe_master.jpg'),
(125, 48, '../assets/img/upload/567d5fc8-ffcf-4cf5-92fe-50ad194a2ac4_19d2e116223f469b930a7a3934c97a66_master.webp'),
(126, 48, '../assets/img/upload/70162f91-b1b0-47af-8bff-e53c5678ff7f_74257bf19f384681afb79c26845265f4_master.jpg'),
(127, 49, '../assets/img/upload/1c40c431-4b8b-4003-b07e-391dd3944392_0b2bcbe57168409999302ee6c43b3420_master.webp'),
(128, 49, '../assets/img/upload/54506455-119e-4cca-b605-0bf61ed76880_fbd363c00f5f417eadbb72a59790fafa_master.webp'),
(129, 49, '../assets/img/upload/b73b998e-ea4f-4735-9537-137b204e1734_b53dd67a2cc6459e97308353c9fd42d6_master.webp'),
(161, 51, '../assets/img/upload/10001_1104e8995bf84835abcb4c5b7de42d87_master.webp'),
(162, 51, '../assets/img/upload/10002_4ea04d654d7b49f495b44d69e5a24c61_master.webp'),
(163, 51, '../assets/img/upload/10007_3effe76bc5b44f57812948ed31838ae4_master.webp'),
(164, 51, '../assets/img/upload/10011_67a06ad2f752493fbbfbcf45fcf89dd6_master.webp'),
(165, 52, '../assets/img/upload/2024-02-23_17h05_17_f09927d0c1ba4efab35ee07ffd9b17f1_master.webp'),
(166, 52, '../assets/img/upload/1637315-4d65d_2a6c77c23ac94f2e8e25226cea873d83_master.webp'),
(167, 53, '../assets/img/upload/2023-07-13_11h56_59_760c17a55a6f4ce288a6006afe1f3cf2_master.webp'),
(168, 53, '../assets/img/upload/2023-08-17_12h55_50_652d6f40fe1f4180833104bded931377_master.webp'),
(169, 53, '../assets/img/upload/2023-08-17_12h55_59_670f326e63454c46adc8e032f3a0fc34_master.webp'),
(170, 53, '../assets/img/upload/10003_e0e777696dca4a41859ea9808954ff98_master.webp'),
(171, 53, '../assets/img/upload/10005_e7afed59154c44d98cf9a796a04498d1_master.webp'),
(176, 54, '../assets/img/upload/e_a_live_yatogami_tohka_kdcolle_date_kadokawa_jhfigure_figure_2_-_copy_64ba6ed09c1b4836ab9c57095a28c0e8_master.webp'),
(177, 54, '../assets/img/upload/tokisaki_kurumi_kdcolle_date_kadokawa_jhfigure_figure_5_a2d23c34d4e54f9d8053e58c6396ea98_master.webp'),
(178, 54, '../assets/img/upload/tokisaki_kurumi_kdcolle_date_kadokawa_jhfigure_figure_6_177615e3f7804c3eb1cf42c64a6954af_master.webp'),
(179, 54, '../assets/img/upload/tokisaki_kurumi_kdcolle_date_kadokawa_jhfigure_figure_9_289bdd045bde443d876590f4b877ff68_master.jpeg'),
(185, 56, '../assets/img/upload/10005_b14cbfd06ca64c0fa3e7023c495809f4_master.webp'),
(186, 56, '../assets/img/upload/10006_7cadc8d05b9b4ba2bbfe402338c9a8bf_master.webp'),
(187, 56, '../assets/img/upload/10007_f893d5bb747b4421b95d016f4c742456_master.webp'),
(188, 56, '../assets/img/upload/10008_dbbb36dcdccb4bdabb0e9472ebcc01bd_master.jpeg'),
(189, 56, '../assets/img/upload/10010_44d2356fe3614c769448ab05f0b45a17_master.webp'),
(190, 57, '../assets/img/upload/figure-147045_01_-_copy_07d611f7e05e40e7993e2417b8ea149a_master.webp'),
(191, 57, '../assets/img/upload/figure-147045_02_9dc169f324a14446968387b6b0d4e40c_master.webp'),
(192, 57, '../assets/img/upload/figure-147045_03_8cdc206baa2d42f0930145601b547138_master.webp'),
(193, 57, '../assets/img/upload/figure-147045_05_95b418c6e55949129a3bee4afb670fd5_master.webp'),
(194, 58, '../assets/img/upload/0_80_e6_99_82_e5_b4_8e_e7_8b_82_e4_b8_89_ef_bd_9e_e7_a7_81_e6_9c_8dver_ee77ee0a5bd3415c9ac4214510d3c498_master.webp'),
(195, 58, '../assets/img/upload/upload_002a089ef7bd4af7ae347201f00945cf_master.webp'),
(196, 58, '../assets/img/upload/upload_e98169e432154dc4a47e9882a195f5e5_master.webp'),
(197, 58, '../assets/img/upload/upload_f9a317b046d54246937aa1667620a404_master.webp'),
(198, 59, '../assets/img/upload/10001_e4f943b995784e01b4c0e59308ac71ff_master.jpg'),
(199, 59, '../assets/img/upload/10002_f38d2db7cd724f6a80d141706760eade_master.webp'),
(200, 59, '../assets/img/upload/10003_6b702dae9d074605a8ba1640b8c76817_master.jpg'),
(201, 59, '../assets/img/upload/10005_650474df25ed410f8c4b860f8a9c5762_master.webp'),
(202, 60, '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set__1__9205d2cf1ac8489d9769d23d81bf84cf_master.webp'),
(203, 60, '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set__2__9a3b61d72d974cec96e1e9272886a62a_master.jpg'),
(204, 60, '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set__4__5833b52248ae4550b470c5d2c0d3d7d2_master.jpg'),
(205, 60, '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set__5__bdb8b499c7bb47578da2fcd447007c5d_master.webp'),
(206, 60, '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set_d249b5e77dd24370b702ff972a7fb839_master.jpg'),
(207, 61, '../assets/img/upload/1724959-7ee42_45a4dd954e5b4122917e5223173ddccc_master.webp'),
(208, 62, '../assets/img/upload/screen_shot_2023-08-07_at_20 (1).webp'),
(209, 62, '../assets/img/upload/screen_shot_2023-08-07_at_20 (2).webp'),
(210, 62, '../assets/img/upload/screen_shot_2023-08-07_at_20 (3).webp'),
(211, 62, '../assets/img/upload/screen_shot_2023-08-07_at_20.webp'),
(212, 63, '../assets/img/upload/10002_08b064ef196a44b3b43f5307f5393bda_master.webp'),
(213, 63, '../assets/img/upload/10003_47f5ef2a9bfe47538ebc36ddb0ea112f_master.webp'),
(214, 63, '../assets/img/upload/10004_aa82915ea5e648598db5cbde1f0bf07c_master.webp'),
(215, 63, '../assets/img/upload/10005_c39f2fdf937645fab2253b4f8f8e42df_master.webp'),
(216, 63, '../assets/img/upload/10006_9650787d8a884c27a24ca9ed8dd2a2f1_master.webp'),
(217, 64, '../assets/img/upload/10001_71ccbb6d51c5408db8425cebc507e4a9_master.webp'),
(218, 64, '../assets/img/upload/10002_a028446d75974930b90d72ac766b43da_master.webp'),
(219, 64, '../assets/img/upload/10004_bdd86d4dab0d44aa88477a259dacd5ea_master.webp'),
(220, 64, '../assets/img/upload/10008_be88ce9eff9b46848171ae2bafc0081e_master.webp'),
(221, 64, '../assets/img/upload/10011_b03b78fe713e4bf7a1b1eab017743049_master.webp'),
(222, 65, '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver._1_7__2__02697d114f4340b5ba5e71923b63be22_master.jpg'),
(223, 65, '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver._1_7__6__11e4c3b317de4750bfce9c7a57a7596f_master.jpg'),
(224, 65, '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver._1_7__10__7a283888f7814689b712f50ff615c0dc_master.jpg'),
(225, 65, '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver._1_7__12__2f0ae671b4c2406480f79c015d8e5e2a_master.jpg'),
(226, 65, '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver.webp'),
(227, 66, '../assets/img/upload/10001_f0b69b4cf54448a19789c98be9b21cc4_master.jpg'),
(228, 66, '../assets/img/upload/10003_cd53a45b375d43598459c585511a8e6b_master.webp'),
(229, 66, '../assets/img/upload/10004_d6de578eccc3473e9f8e4607e66ae8e8_master.jpg'),
(230, 66, '../assets/img/upload/10006_03d333c4887c453ab2dcafb4b244a49b_master.jpg'),
(231, 66, '../assets/img/upload/10007_494a54ad976f414291cfd231225957be_master.jpg'),
(232, 67, '../assets/img/upload/0e2d9182c3e360ce36fe179255e48706_85aa037a37db44189c9d9ca91df06a95_master.jpg'),
(233, 67, '../assets/img/upload/09f37f1a14a072f61170985a30bcfddf_e2edbc2c8c4548ad9f6010ddf32cb573_master.jpg'),
(234, 67, '../assets/img/upload/617onllyi9l.webp'),
(235, 67, '../assets/img/upload/974cee50098426f3987f27810387dde8_41e9c956b90b4f80aef83ce02e43b3a7_master.jpg'),
(236, 68, '../assets/img/upload/00eff1d4c08d23bc4d79886db4bc8884_95f4778314834e4187207b4c84524a13_master.jpg'),
(237, 68, '../assets/img/upload/86e358dae6a5a355818c7f9cbc9d41c1_7b2ac9a293264bb7ae46a1cd3d7bcd19_master.jpg'),
(238, 68, '../assets/img/upload/2022-12-17_09h35_13_7ffd83ed8aad4d6da29b14db92e36af7_master.webp'),
(239, 68, '../assets/img/upload/e0a9c1d80112aeb2262d811c3258c2fe_e8ba526927544885a5c8f950661988e7_master.jpg'),
(240, 69, '../assets/img/upload/3236830_d45ac68214e3456e99571de909024028_master.jpeg'),
(241, 69, '../assets/img/upload/3236832_18b94dafac174eb287f646a32adab615_master.jpeg'),
(242, 69, '../assets/img/upload/3236836_8dd0e42187fa44da82009570ebeb5069_master.jpeg'),
(243, 69, '../assets/img/upload/3236837_-_copy_ea9620dbb7c54031abf2fa669b3927eb_master.jpeg'),
(244, 69, '../assets/img/upload/3236837_59613c7ddd2e47ae859d2540d54ec8ee_master.jpeg'),
(245, 69, '../assets/img/upload/3239264_43bf81ca802843b9b738f929ee30e66b_master.jpeg'),
(246, 70, '../assets/img/upload/10001_d8dbcffb899340c68c6d870fbb8023a6_master.jpg'),
(247, 70, '../assets/img/upload/10002_38077f13ca0542cdae65fb186a824552_master.jpg'),
(248, 70, '../assets/img/upload/10003_8cb690956db445ef8def9d42b898059d_master.jpg'),
(249, 70, '../assets/img/upload/10004_f5b3e4637bad4fb597ebec6441dca297_master.webp'),
(250, 70, '../assets/img/upload/10005_7cb935f4e9fc41aaa5040bcb56afe428_master.webp'),
(257, 55, '../assets/img/upload/10001_f4467875f4134164afa2b65dc6e5d569_master.jpg'),
(258, 55, '../assets/img/upload/10002_e90a3865679e489da6a633d0aa3b19b9_master.jpg'),
(259, 55, '../assets/img/upload/10003_589a706596a840088bdce03b2eb90e1a_master.jpg'),
(260, 55, '../assets/img/upload/10004_19844ca255294eb3906bfbdbce05a723_master.jpg'),
(261, 55, '../assets/img/upload/10006_37a6ed04d4c4482e9bdb77becf4b561e_master.webp'),
(262, 55, '../assets/img/upload/'),
(263, 55, '../assets/img/upload/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(32) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catalog_id` int(32) NOT NULL,
  `studio` varchar(255) NOT NULL,
  `productPrice` decimal(15,1) NOT NULL,
  `scale` varchar(32) NOT NULL,
  `img` varchar(2550) NOT NULL,
  `quantity` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `productName`, `catalog_id`, `studio`, `productPrice`, `scale`, `img`, `quantity`) VALUES
(3, 'Luffy Cosplay Neymar', 1, '712N Studio', 2900000.0, '1/6', 'https://product.hstatic.net/200000515997/product/afa24de9-9863-485b-a28e-0a8bf390cf29_260cd73579174153b0b48dca7e14e0fd_master.jpg', 20),
(8, 'YingNing', 1, 'Gamma Studio', 15000000.0, '1/4', 'https://product.hstatic.net/200000515997/product/f9e23f0a-5807-4fca-bed2-1245971986dc_091c8c0f92094d5c899c63da608cea1f_master.jpg', 19),
(9, 'Itachi Anbu - Naruto', 1, 'SNBR Studio', 2700000.0, 'H33xW28xD13', '../assets/img/upload/ed55230f-c4b9-4029-b0f2-dc6d180490be_434ac394a77e4e2eba3cc3db173c8902_master.webp', 20),
(14, 'Cattle Luffy - One Piece', 1, 'Straw Hat Studio', 1850000.0, 'H15.5 x W8.6 x L10cm', 'https://product.hstatic.net/200000515997/product/8078dbd6-83f5-422b-b9fd-3f0881289628_62be516540ff42579afab6d0d26072fd_master.jpg', 20),
(15, 'Sparkle - Honkai Star Rail', 1, 'Ocelot Studio', 5400000.0, 'H30 x D22 x W27cm', '../assets/img/upload/5e69bbb5-0d96-46cd-bc2b-1f7f25facfa4_8854f37250594b27990d159ec00643e2_master.webp', 18),
(16, 'Nami - One Piece', 1, 'TZT Studio', 4500000.0, '1/6 (H36 x D26 x W26cm)', '../assets/img/upload/1c26666e-b654-4d5f-a8ee-0ec179a1ae2e_5df82b9ef06e47419c4aff0bd2a4f5fd_master.webp', 20),
(17, 'Frieren & Fern - Sousou No Frieren', 1, 'Madhouse x Design Coco', 5000000.0, '1/7 cao 30cm', '../assets/img/upload/e17ef05f-c5d2-4264-97b5-b90abd1863c7_f873f31d8df84d21a87c6114b4539daa_master.webp', 20),
(18, 'Boa Hancock - One Piece', 1, 'Puffers Studio', 6000000.0, '1/4', '../assets/img/upload/db13109a-a6b7-4b0b-a28d-4cf90bc0ec96_b385ccfef595490982900c78c8441496_master.webp', 20),
(19, 'Yae Miko - Genshin Impact', 1, 'CR Studio', 2300000.0, 'H14 x W13 x D13cm', '../assets/img/upload/596ff5ba-f1d9-46c9-ad64-3cb76318ede8_971b77b2e2794be585c416df18fabcb1_master.webp', 19),
(20, 'Garou - One Punch Man', 1, 'Tsume Arts', 10000000.0, '1/6 41x36x18cm', '../assets/img/upload/24d804ae-b466-4110-a2be-0d3add652913_b2509ae856e14cb88b3b5f543b7fa662_master.webp', 18),
(21, 'Mikasa - Attack On Titan', 1, 'Typical Scene', 5000000.0, 'H34.7 x W28.5 x D18.8cm', '../assets/img/upload/2a63ce1d-7008-4202-9284-630ec9e446cc_00bb077106654223b7444b2ff2be1102_master.jpg', 20),
(22, 'Haibara Ai & Miyano Shiho', 1, 'Wonderland Studio', 4500000.0, '1/7', '../assets/img/upload/050735ea-7593-428d-be23-fdbb05251e59_bee1293d0377467aa482d90a6cc2ecc6_master.webp', 19),
(23, 'Namikaze Minato - Naruto', 1, 'KP Studio', 6600000.0, 'H42.5 x W25.5 x D30cm', '../assets/img/upload/9bf757a7-bf84-4d59-882e-bac59ed9500a_ae7d2499450649d6af3878b0d5360667_master.jpg', 20),
(24, 'Black Swan - Honkai Star Rail', 1, 'Gentleman 18 Studio & Mornoe Studio', 3650000.0, '1/6 (H34 x W25 x D22cm)', '../assets/img/upload/37d62153-ee7f-42cb-a89e-c601ecf3ea41_934be11462524549af9b76e028bdf385_master.webp', 20),
(25, 'Light Yagami - Death Note', 1, 'Typical Scene Studio & Rising Waves Studio', 4500000.0, 'H38 x D15 x W25cm', '../assets/img/upload/7b9fd619-e1bc-4452-a149-e51fc837618a_1012f499d963475b80e2be087f52e0bb_master.webp', 20),
(26, 'Ahri Spirit Blossom Ver - League of Legends', 5, 'Myethos', 4400000.0, '1/7 (cao 27cm)', '../assets/img/upload/a52b5b69-1769-45af-8d65-ac9a09d42c6f_4f696d5bab8044a1b6ab45854f12e92a_master.webp', 20),
(27, 'Aeolian - Ghost Blade', 5, 'PIJI Studio & SPARKKEY Studio', 4400000.0, 'cao 38cm', '../assets/img/upload/a4c5c167-861e-483d-b584-adf41c81d89f_8cbe2f8cb0cf44cf923db427e46fe241_master.webp', 20),
(28, 'Charmander - Pokemon', 1, 'EGG Studio', 7000000.0, '1/1 Size (H46 x D32.5 x W34.5cm)', '../assets/img/upload/749df1fe-e642-449f-a6d4-e83568a21219_8a21cb34281049c8a3fb605c83a71020_master.webp', 20),
(29, 'Dracule Mihawk - One Piece', 1, 'Super Guai Studio', 2500000.0, 'cao 28cm', '../assets/img/upload/51cf39f0-5bf8-43f0-82f8-00197ec624af_77ba0c6399bb4a2f844bce3e621087b0_master.webp', 19),
(30, 'Look Up Ai Hoshino - Oshi no Ko', 1, 'MegaHouse', 1000000.0, '1/7', '../assets/img/upload/714144d4-dc6e-4c0f-bb8f-00556aeecad8_dc7a9db82b0c4122bab0386099de237b_master.webp', 20),
(31, 'A2', 1, 'Good Smile Company', 1500000.0, '10cm', '../assets/img/upload/8515b3a3-ef3f-4954-95fe-c0b0b0f9bf4a_0b9fa20363d24d68b97a9a9ff9e6d1a8_master.webp', 20),
(32, 'Aqua', 1, 'Good Smile Company', 1400000.0, '10cm', '../assets/img/upload/ba13c41b-0fc5-437b-be0f-3f096e6d16ce_2e849315e4a449dfbb3f502c5d15d703_master.jpg', 10),
(33, 'Megumin', 1, 'Good Smile Company', 1500000.0, '10cm', '../assets/img/upload/65e374f8-3c12-4989-b993-3020c666b0a7_8f9acae743744479a6282b098d458280_master.jpg', 10),
(34, 'Haikyuu Random Card', 4, 'Ensky', 1050000.0, '20x40', '../assets/img/upload/cdd4d564-60e9-4993-b1ca-a587e1e09865_0caa83351ab445d7895a9b4640cc8f3e_master.webp', 40),
(35, 'One Piece Card Romance Dawn', 4, 'Toei Animation', 1500000.0, '20x30', '../assets/img/upload/26ec5192-b3c3-4876-8ae1-0f6a19c6f499_8faa7faf63a24acdabb9eceaab48c0a5_master.jpg', 30),
(36, 'Spy x Family Random Card 20Packs', 4, 'Ensky', 850000.0, '20x40', '../assets/img/upload/ec483e8d-a188-46fe-820f-024fc85a06e3_35d3e32e8c5247218b4981536ee02760_master.webp', 30),
(37, 'Nendoroid Reg', 2, 'Good Smile Company', 1340000.0, '10cm', '../assets/img/upload/bee56f7beb4f25ef4383aa3cf33cac11.webp', 20),
(38, 'Nendoroid Fuyutsuki-san', 2, 'Good Smile Arts Shanghai', 1450000.0, '10cm', '../assets/img/upload/a2a2be07-ee68-42b7-94dc-306f21e08453_3575b78fb80d44c7b0d305694e29e541_master.webp', 20),
(39, 'Pop Up Parade Reina Aharen', 5, 'Good Smile Arts Shanghai', 1020000.0, '20cm', '../assets/img/upload/c08cf448-b0f9-4d2f-b1e0-54aeb18df157_ffd4aa2763b54c8d8a1de115c971870d_master.webp', 20),
(40, 'Hutao - Genshin Impact - miHoYo', 5, 'miHoYo', 470000.0, '6x10', '../assets/img/upload/9e0f2b4a-66e5-4e49-823c-ec3752e2c187_a54fbe49d7da48b491222579a8bd70c4_master.webp', 30),
(41, 'Pop Up Parade Eren Yeager Titan Ver - Attack On Titan - Good Smile Company', 5, 'Good Smile Company', 1100000.0, '15cm', '../assets/img/upload/17902344-14f2-4f6a-b2cb-677b88326d6b_7b9ac62ef47042e7b91aeeab714fd326_master.webp', 20),
(42, 'Nendoroid Shion - NO.6', 2, 'Good Smile Arts Shanghai', 1400000.0, '10cm', '../assets/img/upload/e739cf43-4ccd-4e31-a676-b7783b5f8f99_94bb035111c5437987411c0c41de1637_master.webp', 20),
(43, 'Nendoroid Nagatoro-san', 2, 'Good Smile Company', 1400000.0, '10cm', '../assets/img/upload/3cd8181a-cd77-4aef-8d49-bfd1032a7f5c_740a29cbead544b5a1421ea2212a3556_master.webp', 20),
(44, 'Nendoroid Sonic', 2, 'Good Smile Company', 1230000.0, '10cm', '../assets/img/upload/d3e2719c-ae34-45c6-96f3-44c70deddf53_7d8d0705d62e40d388f0dfc68a633d09_master.webp', 20),
(45, 'Nendoroid Himuro-kun', 2, 'Good Smile Arts Shanghai', 1450000.0, '10cm', '../assets/img/upload/f76b1208-ce84-4d85-a3fe-a58a76938a4a_8c71cdd82a0e490a9e8a207ad94484bc_master.webp', 20),
(46, 'Nendoroid Sylphiette', 2, 'Good Smile Company', 1360000.0, '10cm', '../assets/img/upload/2c49affa-e669-43d3-9e8a-e064d67bbf7d_e5a64bcb7d7d4a27b579622352764573_master.webp', 20),
(47, 'Nendoroid Fran', 2, 'Good Smile Company', 1590000.0, '10cm', '../assets/img/upload/0186cbdf2b57851f5c71262041979cb4.webp', 20),
(48, 'Tanjiro Life Scale Bust - Kimetsu No Yaiba', 3, 'Korekushon', 30000000.0, '1/1 93x91x85', '../assets/img/upload/9b4d7784-adce-472f-9867-041cac0df9eb_f3a1cfb546ba4850b7b5e3ef77362065_master.webp', 10),
(49, 'Chopper Scale 1/1 ver Valentine Day - One Piece', 3, 'Mr. Dear Studio', 10000000.0, '1/1 53cm', '../assets/img/upload/b73b998e-ea4f-4735-9537-137b204e1734_b53dd67a2cc6459e97308353c9fd42d6_master.webp', 5),
(51, 'Date A Live - Tokisaki Kurumi', 5, 'Union Creative', 3500000.0, '1/7', '../assets/img/upload/10011_67a06ad2f752493fbbfbcf45fcf89dd6_master.webp', 20),
(52, 'Date A Live IV - Tokisaki Kurumi - Artist MasterPiece+ - Zafkiel', 5, 'Taito', 650000.0, '23cm', '../assets/img/upload/1637315-4d65d_2a6c77c23ac94f2e8e25226cea873d83_master.webp', 20),
(53, 'Date A Live IV - Tokisaki Kurumi - Coreful Figure - Japanese Goth Ver', 5, 'Taito', 490000.0, '18cm', '../assets/img/upload/2023-08-17_12h55_50_652d6f40fe1f4180833104bded931377_master.webp', 20),
(54, 'Tokisaki Kurumi: Date ver. - 1/7th Scale - Date A Live (KADOKAWA Corporation) Figure', 1, 'Kadokawa', 4200000.0, '1/7', '../assets/img/upload/tokisaki_kurumi_kdcolle_date_kadokawa_jhfigure_figure_6_177615e3f7804c3eb1cf42c64a6954af_master.webp', 20),
(55, 'Nendoroid 466  Tokisaki Kurumi - Date A Live II ', 1, 'Good Smile Company', 2500000.0, '10cm', '../assets/img/upload/10003_589a706596a840088bdce03b2eb90e1a_master.jpg', 20),
(56, 'Tokisaki Kurumi - Mo Se Sheng Xiang Ver. 1/7 - Date A Live: Seirei Sairin', 5, 'APEX', 3600000.0, '1/7', '../assets/img/upload/10006_7cadc8d05b9b4ba2bbfe402338c9a8bf_master.webp', 20),
(57, 'Date A Live IV - Tokisaki Kurumi - 1/7 Scale - Lingerie Mizugi ver', 5, 'Spiritale', 6900000.0, '1/7', '../assets/img/upload/figure-147045_01_-_copy_07d611f7e05e40e7993e2417b8ea149a_master.webp', 20),
(58, 'Tokisaki Kurumi  - Date A Live IV TAITO Coreful ~ Casual Wear Ver.', 5, 'Taito', 480000.0, '20cm', '../assets/img/upload/upload_f9a317b046d54246937aa1667620a404_master.webp', 20),
(59, 'Elaina ~Early Summer Sky~ 1/7th Scale - Wandering Witch: The Journey of Elaina', 5, 'Good Smile Company', 4800000.0, '1/7', '../assets/img/upload/10001_e4f943b995784e01b4c0e59308ac71ff_master.jpg', 20),
(60, 'Elaina ~My Adventure Diary~ KADOKAWA Special Set - Wandering Witch: The Journey of Elaina', 5, 'Good Smile Company', 4800000.0, '1/7', '../assets/img/upload/elaina_my_adventure_diary_kadokawa_special_set__4__5833b52248ae4550b470c5d2c0d3d7d2_master.jpg', 20),
(61, 'Elaina, Majo no Tabitabi, Budomimi no Otome Ver', 5, 'Taito', 390000.0, '20cm', '../assets/img/upload/1724959-7ee42_45a4dd954e5b4122917e5223173ddccc_master.webp', 20),
(62, 'Elaina, Majo no Tabitabi, Renewal ver. - Coreful Figure', 5, 'Taito', 450000.0, '20cm', '../assets/img/upload/screen_shot_2023-08-07_at_20.webp', 20),
(63, 'Majo no Tabitabi - Elaina', 5, 'PROOF', 5800000.0, '1/7', '../assets/img/upload/10002_08b064ef196a44b3b43f5307f5393bda_master.webp', 20),
(64, 'Majo no Tabitabi - Elaina - F:Nex - 1/7 - Summer Dress Ver', 5, 'FuRyu', 5000000.0, '1/7', '../assets/img/upload/10001_71ccbb6d51c5408db8425cebc507e4a9_master.webp', 20),
(65, 'Hatsune Miku - Shimian Maifu Ver. 1/7 - Vocaloid', 5, 'Good Smile Company', 6700000.0, '1/7', '../assets/img/upload/character_vocal_series_01_hatsune_miku_shimian_maifu_ver._1_7__2__02697d114f4340b5ba5e71923b63be22_master.jpg', 10),
(66, 'GOOD SMILE Racing - Hatsune Miku - 1/7 - Racing Miku 2021 Private Ver', 5, 'Max Factory', 6200000.0, '1/7', '../assets/img/upload/10001_f0b69b4cf54448a19789c98be9b21cc4_master.jpg', 10),
(67, 'Hatsune Miku - 1/8 Scale - Snow Miku: Snow Princess Ver Snow Miku 2019 10th Aniversary', 5, 'Good Smile Company', 3700000.0, '1/7', '../assets/img/upload/0e2d9182c3e360ce36fe179255e48706_85aa037a37db44189c9d9ca91df06a95_master.jpg', 10),
(68, 'Hatsune Miku - 1/8 Scale - Miku Expo 5th Anniversary Ver., Lucky☆Orb: Uta X Kasoku Ver', 5, 'Good Smile Company', 3500000.0, '1/8', '../assets/img/upload/86e358dae6a5a355818c7f9cbc9d41c1_7b2ac9a293264bb7ae46a1cd3d7bcd19_master.jpg', 15),
(69, 'Hatsune Miku - 15th Anniversary Ver', 5, 'Good Smile Company', 8500000.0, '1/7', '../assets/img/upload/3236837_59613c7ddd2e47ae859d2540d54ec8ee_master.jpeg', 10),
(70, 'Hatsune Miku - SNOW MIKU B-STYLE 1/4 - Character Vocal Series 01: Hatsune Miku ', 5, 'FREEing', 6900000.0, '1/4', '../assets/img/upload/10001_d8dbcffb899340c68c6d870fbb8023a6_master.jpg', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Khách hàng'),
(2, 'Nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `address`, `phone`, `role_id`) VALUES
(1, 'admin@gmail.figure.com', '$2y$10$tjavq5VfohhlCf9IHKTHFezg84ZbHP02G0nGgxP9gO6PIaprHhxXW', 'admin', 'figure shop', '0999999999', 2),
(2, 'huyb1702724@student.ctu.edu.vn', '$2y$10$tSzhotVLlq7ASGNA.35BVe5vY0/zkS8mOhSM7dxJSe8GDOwjcqOJu', 'Huy Trần', 'Tầm Vu', '0369859916', 1),
(3, 'chicharayto@gmail.com', '$2y$10$oUBkJXH9o9J.P9h5Eg8QQ.M1QxmfCnSkZcqek4QP9OzEJGJ3cqlDe', 'TRAN HONG HOANG HUY', '80 Tầm Vu, Hưng Lợi, Ninh Kiều, TP Cần Thơ', '0369859916', 1),
(4, 'chicharayto99@gmail.com', '111111', 'Trần Hữu Lễ', '86/2 Vĩnh Long', '0999999888', 1),
(12, 'jokey61487@wanbeiz.com', '$2y$10$leYZtCwG/6jltGnUsLiclerejJ3.BqCdT2h9ZeVxod4e4DrS1fH6O', 'Minh Nhật', '185 Hoàng Văn Thụ, Biên Hòa, Đồng Nai', '0345555642', 1),
(14, 'dgo06111999@gmail.com', '$2y$10$PjUbvT2jVkPdy.JFz.E3XukeefdYt5pB0YT1iXGKFrQ7U.LoWC0FW', 'Kay Lambert', '229/36B Thich Quang Duc, Ward 4', '3676855116', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`catalog_id`);

--
-- Chỉ mục cho bảng `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Chỉ mục cho bảng `imglist`
--
ALTER TABLE `imglist`
  ADD PRIMARY KEY (`imglist_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `catalog_id` (`catalog_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `catalog_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `imglist`
--
ALTER TABLE `imglist`
  MODIFY `imglist_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `bill_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `bill_details_ibfk_3` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `imglist`
--
ALTER TABLE `imglist`
  ADD CONSTRAINT `imglist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catalog_id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
