-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2022 at 02:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djangodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add post', 7, 'add_post'),
(26, 'Can change post', 7, 'change_post'),
(27, 'Can delete post', 7, 'delete_post'),
(28, 'Can view post', 7, 'view_post'),
(29, 'Can add history', 8, 'add_history'),
(30, 'Can change history', 8, 'change_history'),
(31, 'Can delete history', 8, 'delete_history'),
(32, 'Can view history', 8, 'view_history'),
(33, 'Can add leaf_dis', 9, 'add_leaf_dis'),
(34, 'Can change leaf_dis', 9, 'change_leaf_dis'),
(35, 'Can delete leaf_dis', 9, 'delete_leaf_dis'),
(36, 'Can view leaf_dis', 9, 'view_leaf_dis'),
(37, 'Can add leaf_images', 10, 'add_leaf_images'),
(38, 'Can change leaf_images', 10, 'change_leaf_images'),
(39, 'Can delete leaf_images', 10, 'delete_leaf_images'),
(40, 'Can view leaf_images', 10, 'view_leaf_images');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$gCU00AoQ9TkeU3uklbOQE1$TROs4OWYHVC89IBboXwinrTJoMOPDtWAvEowV9yarws=', '2022-08-22 17:25:36.745923', 0, 'test1', 'test1', 'test1', '', 0, 1, '2022-07-18 06:36:22.161279'),
(2, 'pbkdf2_sha256$320000$rakkIDZdpqcjz9f7DzMlQv$YUF4a+RUkoV/UKlZL9avioThxgya+h2UzLLAZ4+NT0Q=', '2022-08-22 17:26:51.500305', 1, 'test', 'admin', 'admin', 'jajaturong@kkumail.com', 1, 1, '2022-07-24 12:42:51.659265'),
(3, 'pbkdf2_sha256$320000$OK1hjUvAkpcSfa77P2EvJH$WWtmCKmGnMXQ/mgn4n6c5rQ+kc81GLk3TxtYqSd0O6c=', '2022-07-24 15:00:17.697855', 0, 'test2', 'test2', 't', '', 0, 1, '2022-07-24 14:56:31.182087'),
(4, 'pbkdf2_sha256$320000$0UJHJmd82dWOMaRKgPvrcK$IJpJDRuACZb06XiSLRIuaM6RowaIAJanuDna/UMwGM0=', '2022-08-21 19:09:28.368918', 0, 'test3', 'test3333', 'test3333', '', 0, 1, '2022-08-18 16:44:23.692500');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_history`
--

CREATE TABLE `blogs_history` (
  `hist_id` int(11) NOT NULL,
  `hist_date` date NOT NULL,
  `hist_img_path` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_leaf_dis`
--

CREATE TABLE `blogs_leaf_dis` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(200) NOT NULL,
  `disease_look` longtext NOT NULL,
  `disease_epidemic` longtext NOT NULL,
  `disease_prevent` longtext NOT NULL,
  `disease_image` varchar(100) DEFAULT NULL,
  `dateCreated` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs_leaf_dis`
--

INSERT INTO `blogs_leaf_dis` (`disease_id`, `disease_name`, `disease_look`, `disease_epidemic`, `disease_prevent`, `disease_image`, `dateCreated`) VALUES
(1, 'โรคเน่าดำ โรคยอดเน่า หรือ โรคเน่าเข้าไส้(Blackrot)', '                                                                                                            เกิดได้ทุกส่วนของกล้วยไม้ เกือบทุกสกุล สามารถสังเกตsอาการของโรคได้ดังนี้\r\n              ราก : เป็นแผลสีดำ เน่า แห้ง ยุบตัวลง หรือ รากเน่าแห้งแฟบ ต่อมาเชื้อจะลุกลามเข้าไปในต้น\r\n              ต้น : เชื้อราเข้าทำลายได้ทั้งทางยอด และโคนต้น ทำให้ยอดเน่าดำ ถ้าทำลายโคนต้นใบจะเหลือง และหลุดร่วงจนหมดเรียกว่า โรคแก้ผ้า\r\n              ใบ : เป็นจุดใส ชุ่มน้ำ สีเหลือง ต่อมาสีเปลี่ยนเป็นสีน้ำตาล แล้วเป็นสีดำในที่สุด ในสภาพที่มีความชื้นสูงแผลจะขยายใหญ่ลุกลามอย่างรวดเร็ว เชื้อราจะสร้างเส้นใยสีขาวละเอียด บนแผลเน่าดำนั้นก้านช่อดอก : เป็นแผลเน่าดำ ลุกลามจนก้านช่อดอกหักพับ\r\n              ดอก : เป็นจุดแผลสีดำ มีสีเหลืองล้อมรอบแผลนั้น กรณีที่เป็นกับดอกตูมขนาดเล็กดอกจะเน่าแล้วหลุดจากก้านช่อ\r\n                                \r\n                                \r\n                                ', '                                                                                                            โรคนี้แพร่ได้ง่ายเนื่องจากสปอร์ของเชื้อราจะกระเด็นไปกับน้ำในระหว่างการรดน้ำมักระบาดในฤดูฝน โดยกระเด็นไปกับน้ำฝน\r\n                                \r\n                                \r\n                                ', '                                                                                                            อย่าปลูกกล้วยไม้แน่นจนเกินไปถ้าพบโรคนี้ในระยะลูกกล้วยไม้ให้แยกออกถ้าเป็นกับต้นกล้วยไม้ที่โต ให้เผาทำลายไม่ควรให้น้ำกล้วยไม้ตอนเย็นใกล้ค่ำ โดยเฉพาะช่วงฤดูหนาวเพราะจะทำให้เกิดสภาพอากาศเย็น ความชื้นสูง ซึ่งเหมาะต่อการเจริญเติบโตของเชื้อนี้โรคจะแพร่ระบาดรุนแรงได้ง่ายขึ้นในกรณีที่ปลูกกล้วยไม้บนพื้นดินเหนียว ควรรองพื้นด้วยขี้เถ้าแกลบก่อนปูด้วยกาบมะพร้าว เพื่อช่วยระบายน้ำ และช่วยป้องกันไม่ให้โรคนี้ทำลายกล้วยไม้ในระยะแรก\r\n                                \r\n                                \r\n                                ', 'โรคเนาดำ.jpg', '2022-08-17 14:37:52.187247'),
(2, 'โรคเน่า(Rot)', 'เป็นโรคที่พบมากในกล้วยไม้สกุลหวาย โดยจะเกิดเป็นจุดขนาดเล็กสีเหลืองอมน้ำตาลบนกลีบดอกเมื่อจุดขยายโตขึ้นจะมีสีเข้มคล้ายสีของสนิม', 'โรคจะระบาดอย่างรวดเร็ว ถ้ามีฝนตกติดต่อกันเป็นเวลานานๆ หรือมีน้ำค้างลงจัด', 'เก็บดอกกล้วยไม้ ทั้งที่ร่วงและเป็นโรคเผาทำลายน้ำที่ใช้รดกล้วยไม้ที่ไม่ใช่น้ำประปาควรผ่านการฆ่าเชื้อด้วยผงคลอรีน อัตรา 5 กรัม ต่อน้ำ 400 ลิตร แล้วปล่องทิ้งค้างคืนจนหมดกลิ่น จึงนำไปใช้การใช้ปุ๋ยในระยะออกดอก ควรใช้ปุ๋ยที่มีโพแทสเซียมสูง เพื่อเพิ่มความต้านทานต่อโรคหรือลดความรุนแรงของโรค', 'โรคเนา.jpg', '2022-08-17 14:37:52.187247'),
(3, 'โรคใบปื้นเหลือง(Yellow leaf spot)', 'เกิดจุดกลมสีเหลืองที่ใบบริเวณโคนต้น ถ้าอาการรุนแรงจุดเหล่านี้จะขยายติดต่อกันเป็นปื้นสีเหลืองตามแนวยาวของใบ เมื่อพบดูด้านหลังใบจะพบกลุ่มผงสีดำในที่สุดใบจะเปลี่ยนเป็นสีน้ำตาลและหลุดร่วงจากต้น', 'โรคนี้แพร่ระบาดมากช่วงปลายฤดูฝน จนถึงฤดูหนาว โดยสปร์จะปลิวไปตามลม หรือกระเด็นไปกับละอองน้ำที่ใช้รดต้นกล้วยไม้', 'เก็บรวบรวมใบที่เป็นโรค เผาทำลาย', 'โรคใบปนเหลอง.jpg', '2022-08-17 14:37:52.187247'),
(4, 'โรคดอกสนิม หรือ จุดสนิม(Flower rusty spot)', 'กล้วยไม้สกุลแวนด้า มีลักษณะแผลเป็นรูปยาวรีคล้ายกระสวย ถ้าเป็นมาก แผลจะรวมกันเป็นแผ่น บริเวณตรงกลางแผลจะมีตุ่มนูนสีน้ำตาลดำ ลูบจะรู้สึกสากมือ ชาวสวนจึงเรียกโรคนี้ว่าโรคขี้กลาก กล้วยไม้สกุลหวาย มีลักษณะแผลเป็นจุดกลมสีน้ำตาลเข้ม หรือดำ ขอบแผลมีสีน้ำตาลอ่อนแผลมีขนาดเท่าปลายเข็มหมุด จนถึงขนาดใหญ่ประมาณ 1 เซนติเมตร บางครั้งแผลจะบุ๋มลึกลงไปหรืออาจนูนขึ้นมาเล็กน้อย หรือเป็นสะเก็ดสีดำเกิดขึ้นได้ทั้งด้านบน และ ใต้ใบบางครั้งอาจมีอาการเป็นจุดกลมสีเหลือง เห็นได้ชัดเจนก่อน แล้วจึงค่อยๆเปลี่ยนเป็นจุดสีดำทั้งวงกล', 'แพร่ระบาดได้ตลอดปี สำหรับกล้วยไม้สกุลแวนด้า ระบาดมากในช่วงปลายฤดูฝนจนถึงฤดูหนาวโดยสปอร์ของเชื้อรา ปลิวไปตามลม หรือกระเด็นไปกับน้ำ', 'รวบรวมใบที่เป็นโรคเผาทำลาย', 'โรคดอกสนม.jpg', '2022-08-17 14:37:52.187247'),
(5, 'โรคใบขุด หรือ โรคใบขี้กลาก(Leaf Spot)', 'เริ่มแรกเป็นจุดฉ่ำน้ำบนใบหรือหน่ออ่อน จากนั้นแผลจะเริ่มขยายขนาดขึ้นและเนื้อเยื่อมีลักษณะเหมือนถูกน้ำร้อนลวก ใบจะพองเป็นสีน้ำตาล ขอบแผลมีสีเหลืองเห็นได้ชัดเจน ภายใน 2-3 วันเนื้อเยื่อใบจะโปร่งแสง มองเห็นเส้นใบ ถ้าอาการรุนแรงจะทำให้กล้วยไม้เน่ายุบตายทั้งต้น', 'ในสภาพอากาศร้อนและความชื้นสูง โรคจะแพร่ระบาดอย่างรุนแรงและรวดเร็ว', 'เก็บรวบรวมส่วนที่เป็นโรคเผาทำลายควรปลูกกล้วยไม้ในโรงเรือนหรือใต้หลังคาพลาสติกถ้ามีโรคเน่าระบาดให้งดการให้น้ำระยะหนึ่ง อาการเน่าจะแห้ง ไม่ลุกลามหรือ', 'โรคใบจด_หรอ_โรคใบขกลาก.jpg', '2022-08-17 14:37:52.187247'),
(6, 'โรคไวรัส(Virus)', 'อาการที่ปรากฏแตกต่างกันไปตามชนิดของเชื้อไวรัส และชนิดของกล้วยไม้บางครั้งกล้วยไม้ที่มีเชื้อไวรัสอยู่อาจจะแสดงอาการหรือไม่แสดงอาการออกมาให้ปรากฏก็ได้\r\n                ลักษณะอาการที่มักพบบ่อยๆมีดังนี้\r\n                1. ลักษณะใบด่าง ตามแนวยาวของใบ มีสีเขียวอ่อนผสมสีเขียวเข้ม\r\n                2. ยอดบิด ช่วงข้อจะถี่สั้นแคระแกร็น\r\n                3. ช่อดอกสั้น กลีบดอกบิด เนื้อเยื่อหน่าแข็งกระด้าง บางครั้งกลีบดอกจะมีสีซีดตรงโคนกลีบ หรือ ดอกด่างซีด\r\n                ขนาดเล็กลง', 'เชื้อไวรัสแพร่ระบาดได้ง่ายโดยติดไปกับเครื่องใช้ต่างๆ เช่น มีด กรรไกร ที่ใช้ตัดหน่อเพื่อขยายพันธุ์ หรือใช้ตัดดอกและตัดแต่งต้น', '1. ถ้าพบต้นกล้วยไม้อาการผิดปกติดังกล่าว ใหเแยกออกแล้วนำไปเผาทำลายอย่านำไปขยายพันธุ์\r\n                2. ทำความสะอาดเครื่องมือเครื่องใช้ทุกครั้งที่มีการตัดแยกหน่อ หรือดอก โดยจุ่มในน้ำสบู่\r\n                น้ำผงซักฟอกทุกครั้งเพื่อฆ่าเชื้อก่อน\r\n                3. ควรดูแลรักษาต้นกล้วยไม้ให้สมบูรณ์อยู่เสมอ 4.\r\n                ควรตรวจสอบพันธุ์กล้วยไม้ก่อนนำไปขยายพันธุ์เพื่อป้องกันการแพร่ระบาดของเชื้อไวรัส', 'โรคไวรส.jpg', '2022-08-17 14:37:52.187247');

-- --------------------------------------------------------

--
-- Table structure for table `blogs_leaf_images`
--

CREATE TABLE `blogs_leaf_images` (
  `img_id` int(11) NOT NULL,
  `img_date` date NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs_leaf_images`
--

INSERT INTO `blogs_leaf_images` (`img_id`, `img_date`, `image`) VALUES
(24, '2022-08-10', 'uploads/20220810214843292453704_586023026267412_4533865656219796211_n.jpg'),
(25, '2022-08-11', 'uploads/20220811103307293771591_439120761561493_5552150102668947473_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-07-24 12:51:03.596281', '1', 'leaf_images object (1)', 1, '[{\"added\": {}}]', 10, 2),
(2, '2022-07-24 12:51:15.501510', '1', 'leaf_images object (1)', 3, '', 10, 2),
(3, '2022-07-24 12:51:26.945226', '2', 'leaf_images object (2)', 1, '[{\"added\": {}}]', 10, 2),
(4, '2022-07-24 12:51:28.860478', '3', 'leaf_images object (3)', 1, '[{\"added\": {}}]', 10, 2),
(5, '2022-07-24 12:51:45.694244', '3', 'leaf_images object (3)', 3, '', 10, 2),
(6, '2022-07-24 12:51:45.697235', '2', 'leaf_images object (2)', 3, '', 10, 2),
(7, '2022-07-24 12:51:52.782420', '4', 'leaf_images object (4)', 1, '[{\"added\": {}}]', 10, 2),
(8, '2022-08-09 10:40:08.199803', '1', 'leaf_dis object (1)', 1, '[{\"added\": {}}]', 9, 2),
(9, '2022-08-09 10:40:46.749794', '2', 'leaf_dis object (2)', 1, '[{\"added\": {}}]', 9, 2),
(10, '2022-08-09 10:41:33.668229', '3', 'leaf_dis object (3)', 1, '[{\"added\": {}}]', 9, 2),
(11, '2022-08-09 10:42:29.216744', '4', 'leaf_dis object (4)', 1, '[{\"added\": {}}]', 9, 2),
(12, '2022-08-09 10:43:11.663743', '5', 'leaf_dis object (5)', 1, '[{\"added\": {}}]', 9, 2),
(13, '2022-08-09 10:44:03.114017', '6', 'leaf_dis object (6)', 1, '[{\"added\": {}}]', 9, 2),
(14, '2022-08-09 11:24:47.280980', '1', 'leaf_dis object (1)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(15, '2022-08-09 11:25:03.185497', '2', 'leaf_dis object (2)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(16, '2022-08-09 11:25:09.117397', '3', 'leaf_dis object (3)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(17, '2022-08-09 11:25:29.385091', '4', 'leaf_dis object (4)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(18, '2022-08-09 11:25:38.022474', '5', 'leaf_dis object (5)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(19, '2022-08-09 11:25:43.080712', '6', 'leaf_dis object (6)', 2, '[{\"changed\": {\"fields\": [\"Disease image\"]}}]', 9, 2),
(20, '2022-08-21 19:32:29.393311', '1', 'staff', 1, '[{\"added\": {}}]', 3, 2),
(21, '2022-08-21 19:32:54.576556', '1', 'staff', 3, '', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'blogs', 'history'),
(9, 'blogs', 'leaf_dis'),
(10, 'blogs', 'leaf_images'),
(7, 'blogs', 'post'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-18 06:35:42.533875'),
(2, 'auth', '0001_initial', '2022-07-18 06:35:42.769368'),
(3, 'admin', '0001_initial', '2022-07-18 06:35:42.825150'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-18 06:35:42.832428'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-18 06:35:42.840409'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-07-18 06:35:42.878306'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-07-18 06:35:42.913217'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-07-18 06:35:42.942884'),
(9, 'auth', '0004_alter_user_username_opts', '2022-07-18 06:35:42.950371'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-07-18 06:35:42.973563'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-07-18 06:35:42.975318'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-07-18 06:35:42.982301'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-07-18 06:35:42.994271'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-07-18 06:35:43.012222'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-07-18 06:35:43.045133'),
(16, 'auth', '0011_update_proxy_permissions', '2022-07-18 06:35:43.054110'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-07-18 06:35:43.068074'),
(18, 'blogs', '0001_initial', '2022-07-18 06:35:43.080053'),
(19, 'sessions', '0001_initial', '2022-07-18 06:35:43.099798'),
(20, 'blogs', '0002_history_leaf_dis_leaf_images_delete_post', '2022-07-18 07:17:17.215915'),
(21, 'blogs', '0003_leaf_images_img_ord', '2022-07-24 11:20:58.461528'),
(22, 'blogs', '0004_alter_leaf_images_img_ord', '2022-07-24 11:33:32.155165'),
(23, 'blogs', '0005_leaf_images_img_date', '2022-07-24 12:49:19.032463'),
(24, 'blogs', '0006_remove_leaf_images_img_path', '2022-07-24 12:50:58.218959'),
(25, 'blogs', '0007_alter_leaf_dis_disease_id', '2022-07-24 12:56:28.535895'),
(26, 'blogs', '0008_alter_leaf_dis_disease_id', '2022-07-24 14:46:05.463145'),
(27, 'blogs', '0009_alter_leaf_dis_disease_id', '2022-07-24 14:52:26.821242'),
(28, 'blogs', '0010_leaf_images_user1', '2022-07-25 09:55:53.330324'),
(29, 'blogs', '0011_rename_img_ord_leaf_images_img_leaf', '2022-07-25 09:55:53.348298'),
(30, 'blogs', '0012_remove_leaf_images_user1_alter_leaf_images_img_leaf', '2022-07-25 14:17:16.744646'),
(31, 'blogs', '0013_remove_leaf_images_img_leaf_leaf_images_image', '2022-07-25 14:23:24.274347'),
(32, 'blogs', '0014_alter_leaf_dis_disease_name', '2022-08-09 10:38:08.284469'),
(33, 'blogs', '0015_leaf_dis_disease_image', '2022-08-09 11:23:47.318257'),
(34, 'blogs', '0016_leaf_dis_datecreated_alter_leaf_dis_disease_id', '2022-08-17 14:37:52.212045'),
(35, 'blogs', '0017_alter_leaf_dis_disease_id', '2022-08-17 14:38:47.869200');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4zcsdixwcfx67o7bg1ur431qf4b6ebsi', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oDmhT:k4Kc5f9zBgk3k0Mw42Lc9jJM0q63AZjaFxj4c0vJnRs', '2022-08-02 12:51:43.634343'),
('61dilwlskknd6jn3is9c76g9i5xslx3z', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oLz6a:lqbD0eDVv0wElIRT6YByInHYnhGbbqFUq5wBLEH_6FA', '2022-08-25 03:43:32.622912'),
('9k95b91nfl8btb934xt19xjim0dcqrgg', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oFdHA:HLPrsmJcmrypHQJF-TJVLv38qiSPGLYijMweMO3N0rA', '2022-08-07 15:12:12.868584'),
('b2jpps8101jye3zci6v4amtwzy6w8d0i', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oENAD:j5NHnGvKabSogOIkniAEovEjNNgtcKdFNgm96ZHva9w', '2022-08-04 03:47:49.934967'),
('bzhzy2tp4lo3u12ku9et1w53ynr5lzxj', '.eJxVjDsOwjAQBe_iGlnxf01Jzxmi9XqNA8iW8qkQd4dIKaB9M_NeYsRtreO28DxOWZyFFqffLSE9uO0g37HduqTe1nlKclfkQRd57Zmfl8P9O6i41G9tIiNFF1Qg64E0eyiGHRoLIZIZlFagPIBmYDcQlmJz0qkkHy17x-L9AdDcN8A:1oQBCN:yOzKXaRwrfT3QsSsawSgut70i01mUbFSRhH60nmgpeY', '2022-09-05 17:26:51.510283'),
('i29grfiv6qy6qtvi7lt8h1rgnsyow9x8', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oPpVc:X5utS5uykV9N8S-nXdMEkI1RSMzgsVIjNHXW1r02pNM', '2022-09-04 18:17:16.781090'),
('igk7b8auvew0d9oiooqycks1fmiqh5rp', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oDKMj:9ENgcxJLRVYYKuBPCSmidtiDa51kT7g3RBozMlUHo30', '2022-08-01 06:36:25.229494'),
('lxfhtooqjep4u81zfm47wqyj40hxpg0c', 'MWQzMTI0ODY1ZWY5YTFmZjBmMGM3MjlmMmEyMDU0MzkxY2MwYWIwOTp7InVzZXJuYW1lIjoia2VuZzU5ODgifQ==', '2020-05-10 10:50:11.288548'),
('o6k1ogfvfxrsbdtpzm1773mj1800mui3', 'MGZjZDQxNDFmNTA2MDI1MjZkYzkwODA0NmU0ZDdhNWFlNGZiMTU2MTp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJcXHUwZTI1XFx1MGUwN1xcdTBlMGFcXHUwZTM3XFx1MGU0OFxcdTBlMmRcXHUwZTQwXFx1MGUwMlxcdTBlNDlcXHUwZTMyXFx1MGU0M1xcdTBlMGFcXHUwZTQ5XFx1MGUwN1xcdTBlMzJcXHUwZTE5XFx1MGU0MFxcdTBlMmFcXHUwZTIzXFx1MGU0N1xcdTBlMDhcIl1dIiwidXNlcm5hbWUiOiJrZW5na2t1MSJ9', '2020-04-07 04:19:16.576956');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blogs_history`
--
ALTER TABLE `blogs_history`
  ADD PRIMARY KEY (`hist_id`);

--
-- Indexes for table `blogs_leaf_dis`
--
ALTER TABLE `blogs_leaf_dis`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `blogs_leaf_images`
--
ALTER TABLE `blogs_leaf_images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_history`
--
ALTER TABLE `blogs_history`
  MODIFY `hist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_leaf_dis`
--
ALTER TABLE `blogs_leaf_dis`
  MODIFY `disease_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `blogs_leaf_images`
--
ALTER TABLE `blogs_leaf_images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
