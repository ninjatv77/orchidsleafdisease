-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2022 at 05:14 PM
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
(1, 'pbkdf2_sha256$320000$gCU00AoQ9TkeU3uklbOQE1$TROs4OWYHVC89IBboXwinrTJoMOPDtWAvEowV9yarws=', '2022-07-24 15:12:12.860636', 0, 'test1', '', '', '', 0, 1, '2022-07-18 06:36:22.161279'),
(2, 'pbkdf2_sha256$320000$rakkIDZdpqcjz9f7DzMlQv$YUF4a+RUkoV/UKlZL9avioThxgya+h2UzLLAZ4+NT0Q=', '2022-07-24 12:43:11.999990', 1, 'test', '', '', 'jajaturong@kkumail.com', 1, 1, '2022-07-24 12:42:51.659265'),
(3, 'pbkdf2_sha256$320000$OK1hjUvAkpcSfa77P2EvJH$WWtmCKmGnMXQ/mgn4n6c5rQ+kc81GLk3TxtYqSd0O6c=', '2022-07-24 15:00:17.697855', 0, 'test2', '', '', '', 0, 1, '2022-07-24 14:56:31.182087');

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
  `disease_name` varchar(45) NOT NULL,
  `disease_look` longtext NOT NULL,
  `disease_epidemic` longtext NOT NULL,
  `disease_prevent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_leaf_images`
--

CREATE TABLE `blogs_leaf_images` (
  `img_id` int(11) NOT NULL,
  `img_date` date NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(7, '2022-07-24 12:51:52.782420', '4', 'leaf_images object (4)', 1, '[{\"added\": {}}]', 10, 2);

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
(31, 'blogs', '0013_remove_leaf_images_img_leaf_leaf_images_image', '2022-07-25 14:23:24.274347');

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
('9k95b91nfl8btb934xt19xjim0dcqrgg', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oFdHA:HLPrsmJcmrypHQJF-TJVLv38qiSPGLYijMweMO3N0rA', '2022-08-07 15:12:12.868584'),
('b2jpps8101jye3zci6v4amtwzy6w8d0i', '.eJxVjEEOwiAQRe_C2pBCBwWX7j0DGYYZqRpISrsy3l2bdKHb_977LxVxXUpcO89xyuqsjDr8bgnpwXUD-Y711jS1usxT0puid9r1tWV-Xnb376BgL9_aWz6By-wNCQ8wipA4sMcwgBMZIaBzSWwKGIDAGvGByQqPKWVHFtX7A---OKE:1oENAD:j5NHnGvKabSogOIkniAEovEjNNgtcKdFNgm96ZHva9w', '2022-08-04 03:47:49.934967'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `blogs_leaf_images`
--
ALTER TABLE `blogs_leaf_images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
