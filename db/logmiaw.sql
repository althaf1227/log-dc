-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2024 at 09:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logmiaw`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
(1, 1, 'admin', '2023-11-10 09:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `auth_identities`
--

CREATE TABLE `auth_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `secret2` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `force_reset` tinyint(1) NOT NULL DEFAULT 0,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_identities`
--

INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'email_password', 'Penjaga Server', 'jagaserver@gmail.com', '$2y$12$1Uk83xr1tZXEfDbJTG179.2JHqCjyvbYpIJu7LaAjz6Q5LbBKn9Eq', NULL, NULL, 0, '2024-08-28 09:14:27', '2023-11-10 09:14:24', '2024-08-28 09:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-02 02:18:29', 1),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-04 00:37:33', 1),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-04 01:13:09', 1),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-05 00:56:27', 1),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-06 14:55:47', 1),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-08 10:09:58', 1),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-08 12:04:59', 1),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-08 12:13:25', 1),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-08 15:53:27', 1),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-09 08:40:00', 1),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-13 13:10:15', 1),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-15 10:07:23', 1),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-15 12:08:55', 1),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-15 16:49:26', 1),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-16 11:47:01', 1),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-16 14:41:54', 1),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-16 15:35:12', 1),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-18 08:19:35', 1),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-23 13:30:06', 1),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-29 08:51:41', 1),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-01 14:27:01', 1),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-02 07:58:44', 1),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-02 21:35:08', 1),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-03 14:27:43', 1),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-03 22:20:53', 1),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-05 10:25:42', 1),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-06 07:58:07', 1),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-06 10:25:06', 1),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-08-06 15:56:49', 0),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-08-06 15:57:00', 0),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-06 15:58:15', 1),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-06 15:59:40', 1),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-07 07:33:49', 1),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-07 08:03:18', 1),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-07 09:24:51', 1),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-07 09:51:43', 1),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-07 14:14:42', 1),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-08 07:57:31', 1),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-12 08:00:51', 1),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-12 12:41:51', 1),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-12 12:43:19', 1),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-13 08:31:21', 1),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-13 20:03:33', 1),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-14 07:34:52', 1),
(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-14 14:41:37', 1),
(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-15 07:45:56', 1),
(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-26 08:09:46', 1),
(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-26 08:16:24', 1),
(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-26 08:33:17', 1),
(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-26 08:49:28', 1),
(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-26 13:01:21', 1),
(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-27 08:51:55', 1),
(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-28 08:11:51', 1),
(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-28 08:17:45', 1),
(55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 08:33:18', 1),
(56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 08:35:35', 1),
(57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 08:56:03', 1),
(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 09:14:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions_users`
--

CREATE TABLE `auth_permissions_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_permissions_users`
--

INSERT INTO `auth_permissions_users` (`id`, `user_id`, `permission`, `created_at`) VALUES
(1, 1, 'adminpanel/user-management/group.create', '2023-11-10 09:57:15'),
(2, 1, 'adminpanel/user-management/group.read', '2023-11-10 09:57:15'),
(3, 1, 'adminpanel/user-management/group.update', '2023-11-10 09:57:15'),
(4, 1, 'adminpanel/user-management/group.delete', '2023-11-10 09:57:15'),
(5, 1, 'adminpanel/user-management/permission.create', '2023-11-10 09:57:15'),
(6, 1, 'adminpanel/user-management/permission.read', '2023-11-10 09:57:15'),
(7, 1, 'adminpanel/user-management/permission.update', '2023-11-10 09:57:15'),
(8, 1, 'adminpanel/user-management/permission.delete', '2023-11-10 09:57:15'),
(9, 1, 'adminpanel/user-management/users.create', '2023-11-10 09:57:15'),
(10, 1, 'adminpanel/user-management/users.read', '2023-11-10 09:57:15'),
(11, 1, 'adminpanel/user-management/users.update', '2023-11-10 09:57:15'),
(12, 1, 'adminpanel/user-management/users.delete', '2023-11-10 09:57:15'),
(13, 1, 'adminpanel/user-management/menu.create', '2023-11-10 09:57:15'),
(14, 1, 'adminpanel/user-management/menu.read', '2023-11-10 09:57:15'),
(15, 1, 'adminpanel/user-management/menu.update', '2023-11-10 09:57:15'),
(16, 1, 'adminpanel/user-management/menu.delete', '2023-11-10 09:57:15'),
(17, 1, 'adminpanel/user-management/users-menu.create', '2023-11-10 09:57:15'),
(18, 1, 'adminpanel/user-management/users-menu.read', '2023-11-10 09:57:15'),
(19, 1, 'adminpanel/user-management/users-menu.update', '2023-11-10 09:57:15'),
(20, 1, 'adminpanel/user-management/users-menu.delete', '2023-11-10 09:57:15'),
(25, 1, 'adminpanel/setting/kontak.create', '2024-06-04 00:47:16'),
(26, 1, 'adminpanel/setting/kontak.read', '2024-06-04 00:47:16'),
(27, 1, 'adminpanel/setting/kontak.update', '2024-06-04 00:47:16'),
(28, 1, 'adminpanel/setting/kontak.delete', '2024-06-04 00:47:16'),
(29, 1, 'adminpanel/setting/berita.create', '2024-07-08 10:42:25'),
(31, 1, 'adminpanel/setting/berita.update', '2024-07-08 10:42:25'),
(32, 1, 'adminpanel/setting/berita.delete', '2024-07-08 10:42:26'),
(41, 1, 'adminpanel/master/tes.create', '2024-07-16 15:59:05'),
(42, 1, 'adminpanel/master/tes.read', '2024-07-16 15:59:05'),
(43, 1, 'adminpanel/master/tes.update', '2024-07-16 15:59:05'),
(44, 1, 'adminpanel/master/tes.delete', '2024-07-16 15:59:05'),
(49, 1, 'adminpanel/setting/download.create', '2024-08-01 08:48:44'),
(50, 1, 'adminpanel/setting/download.read', '2024-08-01 08:48:44'),
(51, 1, 'adminpanel/setting/download.update', '2024-08-01 08:48:44'),
(52, 1, 'adminpanel/setting/download.delete', '2024-08-01 08:48:44'),
(53, 1, 'adminpanel/setting/pengumuman.create', '2024-08-01 08:48:44'),
(54, 1, 'adminpanel/setting/pengumuman.read', '2024-08-01 08:48:44'),
(55, 1, 'adminpanel/setting/pengumuman.update', '2024-08-01 08:48:44'),
(56, 1, 'adminpanel/setting/pengumuman.delete', '2024-08-01 08:48:44'),
(57, 1, 'adminpanel/master/kategori-download.create', '2024-08-01 08:48:44'),
(58, 1, 'adminpanel/master/kategori-download.read', '2024-08-01 08:48:44'),
(59, 1, 'adminpanel/master/kategori-download.update', '2024-08-01 08:48:44'),
(60, 1, 'adminpanel/master/kategori-download.delete', '2024-08-01 08:48:44'),
(61, 1, 'adminpanel/master/kategori-berita.create', '2024-08-01 08:48:44'),
(62, 1, 'adminpanel/master/kategori-berita.read', '2024-08-01 08:48:44'),
(63, 1, 'adminpanel/master/kategori-berita.update', '2024-08-01 08:48:44'),
(64, 1, 'adminpanel/master/kategori-berita.delete', '2024-08-01 08:48:44'),
(65, 1, 'adminpanel/master/kategori-informasi.create', '2024-08-01 08:48:44'),
(66, 1, 'adminpanel/master/kategori-informasi.read', '2024-08-01 08:48:44'),
(67, 1, 'adminpanel/master/kategori-informasi.update', '2024-08-01 08:48:44'),
(68, 1, 'adminpanel/master/kategori-informasi.delete', '2024-08-01 08:48:44'),
(69, 1, 'adminpanel/setting/informasi.create', '2024-08-01 11:17:59'),
(70, 1, 'adminpanel/setting/informasi.read', '2024-08-01 11:17:59'),
(71, 1, 'adminpanel/setting/informasi.update', '2024-08-01 11:17:59'),
(72, 1, 'adminpanel/setting/informasi.delete', '2024-08-01 11:17:59'),
(81, 1, 'adminpanel/setting/berita.read', '2024-08-02 09:02:21'),
(82, 1, 'adminpanel/setting/on-the-spot.create', '2024-08-02 09:02:21'),
(83, 1, 'adminpanel/setting/on-the-spot.read', '2024-08-02 09:02:21'),
(84, 1, 'adminpanel/setting/on-the-spot.update', '2024-08-02 09:02:21'),
(85, 1, 'adminpanel/setting/on-the-spot.delete', '2024-08-02 09:02:21'),
(86, 1, 'adminpanel/setting/layanan.create', '2024-08-02 10:04:50'),
(87, 1, 'adminpanel/setting/layanan.read', '2024-08-02 10:04:50'),
(88, 1, 'adminpanel/setting/layanan.update', '2024-08-02 10:04:50'),
(89, 1, 'adminpanel/setting/layanan.delete', '2024-08-02 10:04:50'),
(90, 1, 'adminpanel/setting/front-menu.create', '2024-08-02 22:09:14'),
(91, 1, 'adminpanel/setting/front-menu.read', '2024-08-02 22:09:14'),
(92, 1, 'adminpanel/setting/front-menu.update', '2024-08-02 22:09:14'),
(93, 1, 'adminpanel/setting/front-menu.delete', '2024-08-02 22:09:14'),
(94, 1, 'adminpanel/master/kategori-sub-menu-front.create', '2024-08-03 00:08:26'),
(95, 1, 'adminpanel/master/kategori-sub-menu-front.read', '2024-08-03 00:08:26'),
(96, 1, 'adminpanel/master/kategori-sub-menu-front.update', '2024-08-03 00:08:26'),
(97, 1, 'adminpanel/master/kategori-sub-menu-front.delete', '2024-08-03 00:08:26'),
(98, 1, 'adminpanel/setting/front-sub-menu.create', '2024-08-03 14:46:36'),
(99, 1, 'adminpanel/setting/front-sub-menu.read', '2024-08-03 14:46:36'),
(100, 1, 'adminpanel/setting/front-sub-menu.update', '2024-08-03 14:46:36'),
(101, 1, 'adminpanel/setting/front-sub-menu.delete', '2024-08-03 14:46:36'),
(102, 1, 'adminpanel/setting/sejarah-pati.create', '2024-08-05 15:04:18'),
(103, 1, 'adminpanel/setting/sejarah-pati.read', '2024-08-05 15:04:18'),
(104, 1, 'adminpanel/setting/sejarah-pati.update', '2024-08-05 15:04:18'),
(105, 1, 'adminpanel/setting/sejarah-pati.delete', '2024-08-05 15:04:18'),
(106, 1, 'adminpanel/setting/arti-lambang.create', '2024-08-05 15:08:32'),
(107, 1, 'adminpanel/setting/arti-lambang.read', '2024-08-05 15:08:32'),
(108, 1, 'adminpanel/setting/arti-lambang.update', '2024-08-05 15:08:33'),
(109, 1, 'adminpanel/setting/arti-lambang.delete', '2024-08-05 15:08:33'),
(110, 1, 'adminpanel/setting/layanan-opd.create', '2024-08-12 09:14:55'),
(111, 1, 'adminpanel/setting/layanan-opd.read', '2024-08-12 09:14:55'),
(112, 1, 'adminpanel/setting/layanan-opd.update', '2024-08-12 09:14:55'),
(113, 1, 'adminpanel/setting/layanan-opd.delete', '2024-08-12 09:14:55'),
(114, 1, 'adminpanel/setting/unit-kerja.create', '2024-08-12 09:17:53'),
(115, 1, 'adminpanel/setting/unit-kerja.read', '2024-08-12 09:17:53'),
(116, 1, 'adminpanel/setting/unit-kerja.update', '2024-08-12 09:17:53'),
(117, 1, 'adminpanel/setting/unit-kerja.delete', '2024-08-12 09:17:53'),
(118, 1, 'adminpanel/setting/background.create', '2024-08-13 10:35:25'),
(119, 1, 'adminpanel/setting/background.read', '2024-08-13 10:35:25'),
(120, 1, 'adminpanel/setting/background.update', '2024-08-13 10:35:25'),
(121, 1, 'adminpanel/setting/background.delete', '2024-08-13 10:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `auth_remember_tokens`
--

CREATE TABLE `auth_remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `auth_token_logins`
--

CREATE TABLE `auth_token_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `berita_komen`
--

CREATE TABLE `berita_komen` (
  `BeritaKomenId` int(11) NOT NULL,
  `BeritaKomenBeritaId` int(11) DEFAULT NULL,
  `BeritaKomenTgl` datetime DEFAULT NULL,
  `BeritaKomenNamaPengirim` varchar(255) DEFAULT NULL,
  `BeritaKomenNoHp` varchar(255) DEFAULT NULL,
  `BeritaKomenWebsite` varchar(255) DEFAULT NULL,
  `BeritaKomenEmail` varchar(255) DEFAULT NULL,
  `BeritaKomenText` varchar(255) DEFAULT NULL,
  `BeritaKomenIp` varchar(255) DEFAULT NULL,
  `BeritaKomenInsert` datetime DEFAULT NULL,
  `BeritaKomenUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `berita_komen`
--

INSERT INTO `berita_komen` (`BeritaKomenId`, `BeritaKomenBeritaId`, `BeritaKomenTgl`, `BeritaKomenNamaPengirim`, `BeritaKomenNoHp`, `BeritaKomenWebsite`, `BeritaKomenEmail`, `BeritaKomenText`, `BeritaKomenIp`, `BeritaKomenInsert`, `BeritaKomenUpdate`) VALUES
(1, 7733, '2024-05-20 00:00:00', 'Ardian', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', NULL, NULL, NULL),
(2, 7733, '2024-05-21 00:00:00', 'Bagas', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', NULL, NULL, NULL),
(3, 7732, '2024-08-01 16:34:51', 'Pradita', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_menu`
--

CREATE TABLE `front_menu` (
  `FrontMenuId` int(11) NOT NULL,
  `FrontMenuNama` varchar(255) DEFAULT NULL,
  `FrontMenuUrl` varchar(255) DEFAULT NULL COMMENT 'menyesuikan dengan type',
  `FrontMenuType` enum('page','subpage','link') DEFAULT NULL COMMENT '(page) url link controllers, (subpage) ulr link : # ,(link) wajjib isi url dengan link ',
  `FrontMenuNoUrut` int(11) DEFAULT NULL COMMENT 'no urut dari menu',
  `FrontMenuAktif` int(11) DEFAULT 0,
  `FrontMenuInsert` datetime DEFAULT NULL,
  `FrontMenuUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `front_menu`
--

INSERT INTO `front_menu` (`FrontMenuId`, `FrontMenuNama`, `FrontMenuUrl`, `FrontMenuType`, `FrontMenuNoUrut`, `FrontMenuAktif`, `FrontMenuInsert`, `FrontMenuUpdate`) VALUES
(1, 'Home', '/', 'page', 1, 1, NULL, NULL),
(2, 'Profil', '#', 'subpage', 2, 1, NULL, NULL),
(3, 'Berita', '/frontpanel/berita', 'page', 3, 1, NULL, NULL),
(4, 'Informasi', '#', 'subpage', 7, 1, NULL, NULL),
(5, 'Download', '/frontpanel/download', 'page', 9, 1, NULL, NULL),
(6, 'Link', '/frontpanel/link', 'page', 10, 1, NULL, NULL),
(7, 'Kontak', '/frontpanel/kontak', 'page', 12, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_sub_menu`
--

CREATE TABLE `front_sub_menu` (
  `FrontSubMenuId` int(11) NOT NULL,
  `FrontSubMenuFrontMenuId` int(11) DEFAULT NULL,
  `FrontSubMenuFrontSubMenuKategoriId` int(11) DEFAULT NULL,
  `FrontSubMenuNama` varchar(255) DEFAULT NULL,
  `FrontSubMenuUrl` varchar(255) DEFAULT NULL,
  `FrontSubMenuType` enum('page','page_kategori','sub_page','sub_page_kategori') DEFAULT NULL,
  `FrontSubMenuNoUrut` int(11) DEFAULT NULL,
  `FrontSubMenuAktif` int(11) DEFAULT NULL,
  `FrontSubMenuInsert` datetime DEFAULT NULL,
  `FrontSubMenuUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `front_sub_menu`
--

INSERT INTO `front_sub_menu` (`FrontSubMenuId`, `FrontSubMenuFrontMenuId`, `FrontSubMenuFrontSubMenuKategoriId`, `FrontSubMenuNama`, `FrontSubMenuUrl`, `FrontSubMenuType`, `FrontSubMenuNoUrut`, `FrontSubMenuAktif`, `FrontSubMenuInsert`, `FrontSubMenuUpdate`) VALUES
(1, 2, 1, 'Sejarah Pati', '/frontpanel/profil/profil-daerah/sejarah-pati', 'page_kategori', 1, 1, NULL, NULL),
(2, 2, 1, 'Arti Lambang', '/frontpanel/profil/profil-daerah/arti-lambang', 'page_kategori', 2, 1, NULL, NULL),
(3, 2, 1, 'Kondisi Geografis', '/frontpanel/profil/profil-daerah/kondisi-geografis', 'page_kategori', 3, 1, NULL, NULL),
(4, 2, 1, 'Kependudukan', '/frontpanel/profil/profil-daerah/kependudukan', 'page_kategori', 4, 1, NULL, NULL),
(5, 2, 1, 'Kondisi Pemerintahan', '/frontpanel/profil/profil-daerah/kondisi-pemerintah', 'page_kategori', 5, 1, NULL, NULL),
(11, 2, 2, 'OPD', '/frontpanel/profil/profil-pemerintahan/opd', 'page_kategori', 4, 1, NULL, NULL),
(12, 2, 2, 'Visi Misi', '/frontpanel/profil/profil-pemerintahan/visi-misi', 'page_kategori', 1, 1, NULL, NULL),
(13, 2, 2, 'Kepala Daerah', '/frontpanel/profil/profil-pemerintahan/kepala-daerah', 'page_kategori', 2, 1, NULL, NULL),
(14, 2, 2, 'Struktur Organisasi', '/frontpanel/profil/profil-pemerintahan/struktur-organisasi', 'page_kategori', 3, 1, NULL, NULL),
(15, 4, NULL, 'P3DN', '/frontpanel/informasi/p3dn', 'page', 4, 1, NULL, NULL),
(16, 4, NULL, 'Stunting', '/frontpanel/informasi/stunting', 'page', 3, 1, NULL, NULL),
(17, 4, NULL, 'Narasi Tunggal', '/frontpanel/informasi/narasi-tunggal', 'page', 1, 1, NULL, NULL),
(18, 4, NULL, 'Transparansi Keuangan', '/frontpanel/informasi/transparansi-keuangan', 'page', 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_sub_menu_kategori`
--

CREATE TABLE `front_sub_menu_kategori` (
  `FrontSubMenuKategoriId` int(11) NOT NULL,
  `FrontSubMenuKategoriFrontMenuId` int(11) DEFAULT NULL,
  `FrontSubMenuKategoriNama` varchar(255) DEFAULT NULL,
  `FrontSubMenuKategoriNoUrut` int(11) DEFAULT NULL,
  `FrontSubMenuKategoriAktif` int(11) DEFAULT NULL,
  `FrontSubMenuKategoriInsert` datetime DEFAULT NULL,
  `FrontSubMenuKategoriUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `front_sub_menu_kategori`
--

INSERT INTO `front_sub_menu_kategori` (`FrontSubMenuKategoriId`, `FrontSubMenuKategoriFrontMenuId`, `FrontSubMenuKategoriNama`, `FrontSubMenuKategoriNoUrut`, `FrontSubMenuKategoriAktif`, `FrontSubMenuKategoriInsert`, `FrontSubMenuKategoriUpdate`) VALUES
(1, 2, 'Profil Daerah', 1, 1, NULL, NULL),
(2, 2, 'Profil Pemerintahan', 2, 1, NULL, NULL),
(3, 2, 'Sa Layang Pandang Pati', 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_download`
--

CREATE TABLE `kategori_download` (
  `KategoriDownloadId` int(11) NOT NULL,
  `KategoriDownloadNama` varchar(255) DEFAULT NULL,
  `KategoriDownloadInsert` datetime DEFAULT NULL,
  `KategoriDownloadUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_download`
--

INSERT INTO `kategori_download` (`KategoriDownloadId`, `KategoriDownloadNama`, `KategoriDownloadInsert`, `KategoriDownloadUpdate`) VALUES
(1, 'SE Bupati', NULL, NULL),
(2, 'INBUP', NULL, NULL),
(3, 'Surat Edaran', NULL, NULL),
(4, 'Lowongan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_informasi`
--

CREATE TABLE `kategori_informasi` (
  `KategoriInformasiId` int(11) NOT NULL,
  `KategoriInformasiNama` varchar(255) DEFAULT NULL,
  `KategoriInformasiInsert` datetime DEFAULT NULL,
  `KategoriInformasiUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_informasi`
--

INSERT INTO `kategori_informasi` (`KategoriInformasiId`, `KategoriInformasiNama`, `KategoriInformasiInsert`, `KategoriInformasiUpdate`) VALUES
(1, 'P3DN', NULL, NULL),
(2, 'Stunting', NULL, NULL),
(3, 'Narasi Tunggal', NULL, NULL),
(4, 'Transparansi Keuangan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `layanan_opd`
--

CREATE TABLE `layanan_opd` (
  `LayananOpdId` int(11) NOT NULL,
  `LayananOpdUnitKerjaId` int(11) NOT NULL,
  `LayananOpdLayananId` int(11) DEFAULT NULL,
  `LayananOpdAktif` tinyint(1) DEFAULT 1,
  `LayananOpdIsPublik` tinyint(1) DEFAULT 0,
  `LayananOpdInsert` datetime DEFAULT NULL,
  `LayananOpdUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `layanan_opd`
--

INSERT INTO `layanan_opd` (`LayananOpdId`, `LayananOpdUnitKerjaId`, `LayananOpdLayananId`, `LayananOpdAktif`, `LayananOpdIsPublik`, `LayananOpdInsert`, `LayananOpdUpdate`) VALUES
(1, 2, 2, 1, 0, NULL, NULL),
(2, 2, 4, 1, 0, NULL, NULL),
(3, 2, 3, 1, 0, NULL, NULL),
(4, 17, NULL, 1, 0, NULL, NULL),
(5, 17, NULL, 1, 0, NULL, NULL),
(6, 17, NULL, 1, 0, NULL, NULL),
(7, 17, NULL, 1, 0, NULL, NULL),
(8, 17, NULL, 1, 0, NULL, NULL),
(9, 17, NULL, 1, 0, NULL, NULL),
(10, 20, NULL, 1, 0, NULL, NULL),
(11, 20, NULL, 1, 0, NULL, NULL),
(12, 20, NULL, 1, 0, NULL, NULL),
(13, 20, NULL, 1, 0, NULL, NULL),
(14, 20, NULL, 1, 0, NULL, NULL),
(15, 20, NULL, 1, 0, NULL, NULL),
(16, 23, NULL, 1, 0, NULL, NULL),
(17, 23, NULL, 1, 0, NULL, NULL),
(18, 23, NULL, 1, 0, NULL, NULL),
(19, 23, NULL, 1, 0, NULL, NULL),
(20, 23, NULL, 1, 0, NULL, NULL),
(21, 23, NULL, 1, 0, NULL, NULL),
(22, 22, NULL, 1, 0, NULL, NULL),
(23, 22, NULL, 1, 0, NULL, NULL),
(24, 22, NULL, 1, 0, NULL, NULL),
(25, 22, NULL, 1, 0, NULL, NULL),
(26, 22, NULL, 1, 0, NULL, NULL),
(27, 22, NULL, 1, 0, NULL, NULL),
(28, 15, NULL, 1, 0, NULL, NULL),
(29, 15, NULL, 1, 0, NULL, NULL),
(30, 15, NULL, 1, 0, NULL, NULL),
(31, 15, NULL, 1, 0, NULL, NULL),
(32, 15, NULL, 1, 0, NULL, NULL),
(33, 15, NULL, 1, 0, NULL, NULL),
(34, 14, NULL, 1, 0, NULL, NULL),
(35, 14, NULL, 1, 0, NULL, NULL),
(36, 14, NULL, 1, 0, NULL, NULL),
(37, 14, NULL, 1, 0, NULL, NULL),
(38, 14, NULL, 1, 0, NULL, NULL),
(39, 14, NULL, 1, 0, NULL, NULL),
(40, 13, NULL, 1, 0, NULL, NULL),
(41, 13, NULL, 1, 0, NULL, NULL),
(42, 13, NULL, 1, 0, NULL, NULL),
(43, 13, NULL, 1, 0, NULL, NULL),
(44, 13, NULL, 1, 0, NULL, NULL),
(45, 13, NULL, 1, 0, NULL, NULL),
(46, 16, NULL, 1, 0, NULL, NULL),
(47, 16, NULL, 1, 0, NULL, NULL),
(48, 16, NULL, 1, 0, NULL, NULL),
(49, 16, NULL, 1, 0, NULL, NULL),
(50, 16, NULL, 1, 0, NULL, NULL),
(51, 16, NULL, 1, 0, NULL, NULL),
(52, 29, NULL, 1, 0, NULL, NULL),
(53, 29, NULL, 1, 0, NULL, NULL),
(54, 29, NULL, 1, 0, NULL, NULL),
(55, 29, NULL, 1, 0, NULL, NULL),
(56, 29, NULL, 1, 0, NULL, NULL),
(57, 29, NULL, 1, 0, NULL, NULL),
(58, 26, NULL, 1, 0, NULL, NULL),
(59, 26, NULL, 1, 0, NULL, NULL),
(60, 26, NULL, 1, 0, NULL, NULL),
(61, 26, NULL, 1, 0, NULL, NULL),
(62, 26, NULL, 1, 0, NULL, NULL),
(63, 26, NULL, 1, 0, NULL, NULL),
(64, 31, NULL, 1, 0, NULL, NULL),
(65, 31, NULL, 1, 0, NULL, NULL),
(66, 31, NULL, 1, 0, NULL, NULL),
(67, 31, NULL, 1, 0, NULL, NULL),
(68, 31, NULL, 1, 0, NULL, NULL),
(69, 31, NULL, 1, 0, NULL, NULL),
(70, 27, NULL, 1, 0, NULL, NULL),
(71, 27, NULL, 1, 0, NULL, NULL),
(72, 27, NULL, 1, 0, NULL, NULL),
(73, 27, NULL, 1, 0, NULL, NULL),
(74, 27, NULL, 1, 0, NULL, NULL),
(75, 27, NULL, 1, 0, NULL, NULL),
(76, 8, NULL, 1, 0, NULL, NULL),
(77, 8, NULL, 1, 0, NULL, NULL),
(78, 8, NULL, 1, 0, NULL, NULL),
(79, 8, NULL, 1, 0, NULL, NULL),
(80, 8, NULL, 1, 0, NULL, NULL),
(81, 8, NULL, 1, 0, NULL, NULL),
(82, 24, NULL, 1, 0, NULL, NULL),
(83, 24, NULL, 1, 0, NULL, NULL),
(84, 24, NULL, 1, 0, NULL, NULL),
(85, 24, NULL, 1, 0, NULL, NULL),
(86, 24, NULL, 1, 0, NULL, NULL),
(87, 24, NULL, 1, 0, NULL, NULL),
(88, 19, NULL, 1, 0, NULL, NULL),
(89, 19, NULL, 1, 0, NULL, NULL),
(90, 19, NULL, 1, 0, NULL, NULL),
(91, 19, NULL, 1, 0, NULL, NULL),
(92, 19, NULL, 1, 0, NULL, NULL),
(93, 19, NULL, 1, 0, NULL, NULL),
(94, 5, NULL, 1, 0, NULL, NULL),
(95, 5, NULL, 1, 0, NULL, NULL),
(96, 5, NULL, 1, 0, NULL, NULL),
(97, 5, NULL, 1, 0, NULL, NULL),
(98, 5, NULL, 1, 0, NULL, NULL),
(99, 5, NULL, 1, 0, NULL, NULL),
(100, 6, NULL, 1, 0, NULL, NULL),
(101, 6, NULL, 1, 0, NULL, NULL),
(102, 6, NULL, 1, 0, NULL, NULL),
(103, 6, NULL, 1, 0, NULL, NULL),
(104, 6, NULL, 1, 0, NULL, NULL),
(105, 6, NULL, 1, 0, NULL, NULL),
(106, 9, NULL, 1, 0, NULL, NULL),
(107, 9, NULL, 1, 0, NULL, NULL),
(108, 9, NULL, 1, 0, NULL, NULL),
(109, 9, NULL, 1, 0, NULL, NULL),
(110, 9, NULL, 1, 0, NULL, NULL),
(111, 9, NULL, 1, 0, NULL, NULL),
(112, 10, NULL, 1, 0, NULL, NULL),
(113, 10, NULL, 1, 0, NULL, NULL),
(114, 10, NULL, 1, 0, NULL, NULL),
(115, 10, NULL, 1, 0, NULL, NULL),
(116, 10, NULL, 1, 0, NULL, NULL),
(117, 10, NULL, 1, 0, NULL, NULL),
(118, 7, NULL, 1, 0, NULL, NULL),
(119, 7, NULL, 1, 0, NULL, NULL),
(120, 7, NULL, 1, 0, NULL, NULL),
(121, 7, NULL, 1, 0, NULL, NULL),
(122, 7, NULL, 1, 0, NULL, NULL),
(123, 7, NULL, 1, 0, NULL, NULL),
(124, 30, NULL, 1, 0, NULL, NULL),
(125, 30, NULL, 1, 0, NULL, NULL),
(126, 30, NULL, 1, 0, NULL, NULL),
(127, 30, NULL, 1, 0, NULL, NULL),
(128, 30, NULL, 1, 0, NULL, NULL),
(129, 30, NULL, 1, 0, NULL, NULL),
(130, 33, NULL, 1, 0, NULL, NULL),
(131, 33, NULL, 1, 0, NULL, NULL),
(132, 33, NULL, 1, 0, NULL, NULL),
(133, 33, NULL, 1, 0, NULL, NULL),
(134, 33, NULL, 1, 0, NULL, NULL),
(135, 33, NULL, 1, 0, NULL, NULL),
(136, 18, NULL, 1, 0, NULL, NULL),
(137, 18, NULL, 1, 0, NULL, NULL),
(138, 18, NULL, 1, 0, NULL, NULL),
(139, 18, NULL, 1, 0, NULL, NULL),
(140, 18, NULL, 1, 0, NULL, NULL),
(141, 18, NULL, 1, 0, NULL, NULL),
(142, 12, NULL, 1, 0, NULL, NULL),
(143, 12, NULL, 1, 0, NULL, NULL),
(144, 12, NULL, 1, 0, NULL, NULL),
(145, 12, NULL, 1, 0, NULL, NULL),
(146, 12, NULL, 1, 0, NULL, NULL),
(147, 12, NULL, 1, 0, NULL, NULL),
(148, 11, NULL, 1, 0, NULL, NULL),
(149, 11, NULL, 1, 0, NULL, NULL),
(150, 11, NULL, 1, 0, NULL, NULL),
(151, 11, NULL, 1, 0, NULL, NULL),
(152, 11, NULL, 1, 0, NULL, NULL),
(153, 11, NULL, 1, 0, NULL, NULL),
(154, 25, NULL, 1, 0, NULL, NULL),
(155, 25, NULL, 1, 0, NULL, NULL),
(156, 25, NULL, 1, 0, NULL, NULL),
(157, 25, NULL, 1, 0, NULL, NULL),
(158, 25, NULL, 1, 0, NULL, NULL),
(159, 25, NULL, 1, 0, NULL, NULL),
(160, 102, NULL, 1, 0, NULL, NULL),
(161, 102, NULL, 1, 0, NULL, NULL),
(162, 102, NULL, 1, 0, NULL, NULL),
(163, 102, NULL, 1, 0, NULL, NULL),
(164, 102, NULL, 1, 0, NULL, NULL),
(165, 102, NULL, 1, 0, NULL, NULL),
(166, 102, NULL, 1, 0, NULL, NULL),
(167, 49, NULL, 1, 0, NULL, NULL),
(168, 49, NULL, 1, 0, NULL, NULL),
(169, 97, NULL, 1, 0, NULL, NULL),
(170, 97, NULL, 1, 0, NULL, NULL),
(171, 97, NULL, 1, 0, NULL, NULL),
(172, 97, NULL, 1, 0, NULL, NULL),
(173, 97, NULL, 1, 0, NULL, NULL),
(174, 97, NULL, 1, 0, NULL, NULL),
(175, 97, NULL, 1, 0, NULL, NULL),
(176, 97, NULL, 1, 0, NULL, NULL),
(177, 100, NULL, 1, 0, NULL, NULL),
(179, 100, NULL, 1, 0, NULL, NULL),
(180, 100, NULL, 1, 0, NULL, NULL),
(181, 100, NULL, 1, 0, NULL, NULL),
(182, 100, NULL, 1, 0, NULL, NULL),
(183, 100, NULL, 1, 0, NULL, NULL),
(184, 100, NULL, 1, 0, NULL, NULL),
(185, 100, NULL, 1, 0, NULL, NULL),
(186, 100, NULL, 1, 0, NULL, NULL),
(187, 100, NULL, 1, 0, NULL, NULL),
(188, 100, NULL, 1, 0, NULL, NULL),
(189, 39, NULL, 1, 0, NULL, NULL),
(190, 39, NULL, 1, 0, NULL, NULL),
(191, 40, NULL, 1, 0, NULL, NULL),
(192, 40, NULL, 1, 0, NULL, NULL),
(193, 40, NULL, 1, 0, NULL, NULL),
(194, 54, NULL, 1, 0, NULL, NULL),
(195, 54, NULL, 1, 0, NULL, NULL),
(196, 54, NULL, 1, 0, NULL, NULL),
(197, 103, NULL, 1, 0, NULL, NULL),
(198, 103, NULL, 1, 0, NULL, NULL),
(199, 103, NULL, 1, 0, NULL, NULL),
(200, 36, NULL, 1, 0, NULL, NULL),
(201, 36, NULL, 1, 0, NULL, NULL),
(202, 36, NULL, 1, 0, NULL, NULL),
(203, 36, NULL, 1, 0, NULL, NULL),
(204, 36, NULL, 1, 0, NULL, NULL),
(205, 36, NULL, 1, 0, NULL, NULL),
(206, 36, NULL, 1, 0, NULL, NULL),
(207, 36, NULL, 1, 0, NULL, NULL),
(208, 36, NULL, 1, 0, NULL, NULL),
(209, 36, NULL, 1, 0, NULL, NULL),
(210, 36, NULL, 1, 0, NULL, NULL),
(211, 36, NULL, 1, 0, NULL, NULL),
(212, 36, NULL, 1, 0, NULL, NULL),
(213, 36, NULL, 1, 0, NULL, NULL),
(214, 36, NULL, 1, 0, NULL, NULL),
(215, 36, NULL, 1, 0, NULL, NULL),
(216, 36, NULL, 1, 0, NULL, NULL),
(217, 36, NULL, 1, 0, NULL, NULL),
(218, 36, NULL, 1, 0, NULL, NULL),
(219, 36, NULL, 1, 0, NULL, NULL),
(220, 36, NULL, 1, 0, NULL, NULL),
(224, 85, NULL, 1, 0, NULL, NULL),
(229, 85, NULL, 1, 0, NULL, NULL),
(232, 73, NULL, 1, 0, NULL, NULL),
(233, 73, NULL, 1, 0, NULL, NULL),
(234, 73, NULL, 1, 0, NULL, NULL),
(235, 58, NULL, 1, 0, NULL, NULL),
(236, 40, NULL, 1, 0, NULL, NULL),
(237, 40, NULL, 1, 0, NULL, NULL),
(238, 40, NULL, 1, 0, NULL, NULL),
(239, 40, NULL, 1, 0, NULL, NULL),
(240, 40, NULL, 1, 0, NULL, NULL),
(241, 40, NULL, 1, 0, NULL, NULL),
(242, 40, NULL, 1, 0, NULL, NULL),
(243, 40, NULL, 1, 0, NULL, NULL),
(244, 40, NULL, 1, 0, NULL, NULL),
(246, 73, NULL, 1, 0, NULL, NULL),
(247, 73, NULL, 1, 0, NULL, NULL),
(248, 73, NULL, 1, 0, NULL, NULL),
(249, 73, NULL, 1, 0, NULL, NULL),
(250, 73, NULL, 1, 0, NULL, NULL),
(251, 73, NULL, 1, 0, NULL, NULL),
(252, 73, NULL, 1, 0, NULL, NULL),
(253, 73, NULL, 1, 0, NULL, NULL),
(254, 73, NULL, 1, 0, NULL, NULL),
(255, 73, NULL, 1, 0, NULL, NULL),
(256, 73, NULL, 1, 0, NULL, NULL),
(257, 89, NULL, 1, 0, NULL, NULL),
(258, 89, NULL, 1, 0, NULL, NULL),
(259, 37, NULL, 1, 0, NULL, NULL),
(260, 37, NULL, 1, 0, NULL, NULL),
(261, 37, NULL, 1, 0, NULL, NULL),
(262, 37, NULL, 1, 0, NULL, NULL),
(263, 37, NULL, 1, 0, NULL, NULL),
(264, 37, NULL, 1, 0, NULL, NULL),
(265, 89, NULL, 1, 0, NULL, NULL),
(266, 89, NULL, 1, 0, NULL, NULL),
(267, 89, NULL, 1, 0, NULL, NULL),
(268, 89, NULL, 1, 0, NULL, NULL),
(269, 89, NULL, 1, 0, NULL, NULL),
(270, 89, NULL, 1, 0, NULL, NULL),
(271, 89, NULL, 1, 0, NULL, NULL),
(272, 89, NULL, 1, 0, NULL, NULL),
(273, 89, NULL, 1, 0, NULL, NULL),
(274, 89, NULL, 1, 0, NULL, NULL),
(275, 89, NULL, 1, 0, NULL, NULL),
(276, 89, NULL, 1, 0, NULL, NULL),
(277, 89, NULL, 1, 0, NULL, NULL),
(278, 89, NULL, 1, 0, NULL, NULL),
(279, 89, NULL, 1, 0, NULL, NULL),
(280, 89, NULL, 1, 0, NULL, NULL),
(281, 89, NULL, 1, 0, NULL, NULL),
(282, 71, NULL, 1, 0, NULL, NULL),
(283, 71, NULL, 1, 0, NULL, NULL),
(284, 71, NULL, 1, 0, NULL, NULL),
(285, 71, NULL, 1, 0, NULL, NULL),
(286, 71, NULL, 1, 0, NULL, NULL),
(287, 71, NULL, 1, 0, NULL, NULL),
(288, 71, NULL, 1, 0, NULL, NULL),
(289, 71, NULL, 1, 0, NULL, NULL),
(290, 71, NULL, 1, 0, NULL, NULL),
(291, 71, NULL, 1, 0, NULL, NULL),
(292, 71, NULL, 1, 0, NULL, NULL),
(293, 71, NULL, 1, 0, NULL, NULL),
(294, 71, NULL, 1, 0, NULL, NULL),
(295, 71, NULL, 1, 0, NULL, NULL),
(296, 71, NULL, 1, 0, NULL, NULL),
(297, 56, NULL, 1, 0, NULL, NULL),
(298, 56, NULL, 1, 0, NULL, NULL),
(299, 56, NULL, 1, 0, NULL, NULL),
(300, 56, NULL, 1, 0, NULL, NULL),
(301, 56, NULL, 1, 0, NULL, NULL),
(302, 56, NULL, 1, 0, NULL, NULL),
(303, 56, NULL, 1, 0, NULL, NULL),
(304, 56, NULL, 1, 0, NULL, NULL),
(305, 85, NULL, 1, 0, NULL, NULL),
(307, 63, NULL, 1, 0, NULL, NULL),
(308, 63, NULL, 1, 0, NULL, NULL),
(309, 63, NULL, 1, 0, NULL, NULL),
(310, 63, NULL, 1, 0, NULL, NULL),
(311, 63, NULL, 1, 0, NULL, NULL),
(312, 63, NULL, 1, 0, NULL, NULL),
(313, 63, NULL, 1, 0, NULL, NULL),
(314, 63, NULL, 1, 0, NULL, NULL),
(315, 63, NULL, 1, 0, NULL, NULL),
(316, 63, NULL, 1, 0, NULL, NULL),
(317, 63, NULL, 1, 0, NULL, NULL),
(318, 63, NULL, 1, 0, NULL, NULL),
(319, 63, NULL, 1, 0, NULL, NULL),
(320, 63, NULL, 1, 0, NULL, NULL),
(321, 63, NULL, 1, 0, NULL, NULL),
(322, 63, NULL, 1, 0, NULL, NULL),
(323, 56, NULL, 1, 0, NULL, NULL),
(324, 56, NULL, 1, 0, NULL, NULL),
(325, 56, NULL, 1, 0, NULL, NULL),
(326, 56, NULL, 1, 0, NULL, NULL),
(327, 56, NULL, 1, 0, NULL, NULL),
(328, 56, NULL, 1, 0, NULL, NULL),
(329, 56, NULL, 1, 0, NULL, NULL),
(330, 56, NULL, 1, 0, NULL, NULL),
(331, 56, NULL, 1, 0, NULL, NULL),
(332, 102, NULL, 1, 0, NULL, NULL),
(333, 102, NULL, 0, 0, NULL, NULL),
(334, 64, NULL, 1, 0, NULL, NULL),
(335, 64, NULL, 1, 0, NULL, NULL),
(336, 64, NULL, 1, 0, NULL, NULL),
(337, 64, NULL, 1, 0, NULL, NULL),
(338, 64, NULL, 1, 0, NULL, NULL),
(339, 64, NULL, 1, 0, NULL, NULL),
(340, 64, NULL, 1, 0, NULL, NULL),
(341, 88, NULL, 1, 0, NULL, NULL),
(342, 74, NULL, 1, 0, NULL, NULL),
(343, 89, NULL, 1, 0, NULL, NULL),
(344, 88, NULL, 1, 0, NULL, NULL),
(345, 37, NULL, 1, 0, NULL, NULL),
(348, 41, NULL, 1, 0, NULL, NULL),
(349, 41, NULL, 1, 0, NULL, NULL),
(350, 41, NULL, 1, 0, NULL, NULL),
(351, 41, NULL, 1, 0, NULL, NULL),
(352, 41, NULL, 1, 0, NULL, NULL),
(353, 41, NULL, 1, 0, NULL, NULL),
(354, 41, NULL, 1, 0, NULL, NULL),
(355, 41, NULL, 1, 0, NULL, NULL),
(356, 41, NULL, 1, 0, NULL, NULL),
(357, 41, NULL, 1, 0, NULL, NULL),
(358, 41, NULL, 1, 0, NULL, NULL),
(359, 41, NULL, 1, 0, NULL, NULL),
(360, 41, NULL, 1, 0, NULL, NULL),
(361, 41, NULL, 1, 0, NULL, NULL),
(362, 41, NULL, 1, 0, NULL, NULL),
(363, 41, NULL, 1, 0, NULL, NULL),
(364, 41, NULL, 1, 0, NULL, NULL),
(365, 41, NULL, 1, 0, NULL, NULL),
(366, 41, NULL, 1, 0, NULL, NULL),
(367, 41, NULL, 1, 0, NULL, NULL),
(368, 41, NULL, 1, 0, NULL, NULL),
(369, 41, NULL, 1, 0, NULL, NULL),
(370, 41, NULL, 1, 0, NULL, NULL),
(371, 41, NULL, 1, 0, NULL, NULL),
(372, 85, NULL, 1, 0, NULL, NULL),
(373, 54, NULL, 1, 0, NULL, NULL),
(374, 54, NULL, 1, 0, NULL, NULL),
(375, 54, NULL, 1, 0, NULL, NULL),
(376, 54, NULL, 1, 0, NULL, NULL),
(377, 54, NULL, 1, 0, NULL, NULL),
(378, 54, NULL, 1, 0, NULL, NULL),
(379, 54, NULL, 1, 0, NULL, NULL),
(380, 54, NULL, 1, 0, NULL, NULL),
(381, 54, NULL, 1, 0, NULL, NULL),
(382, 54, NULL, 1, 0, NULL, NULL),
(383, 54, NULL, 1, 0, NULL, NULL),
(384, 60, NULL, 1, 0, NULL, NULL),
(385, 60, NULL, 1, 0, NULL, NULL),
(386, 60, NULL, 1, 0, NULL, NULL),
(387, 60, NULL, 1, 0, NULL, NULL),
(388, 60, NULL, 1, 0, NULL, NULL),
(389, 60, NULL, 1, 0, NULL, NULL),
(390, 60, NULL, 1, 0, NULL, NULL),
(391, 70, NULL, 1, 0, NULL, NULL),
(392, 70, NULL, 1, 0, NULL, NULL),
(393, 70, NULL, 1, 0, NULL, NULL),
(394, 60, NULL, 1, 0, NULL, NULL),
(395, 60, NULL, 1, 0, NULL, NULL),
(396, 70, NULL, 1, 0, NULL, NULL),
(397, 60, NULL, 1, 0, NULL, NULL),
(398, 60, NULL, 1, 0, NULL, NULL),
(399, 70, NULL, 1, 0, NULL, NULL),
(400, 60, NULL, 1, 0, NULL, NULL),
(401, 60, NULL, 1, 0, NULL, NULL),
(402, 60, NULL, 1, 0, NULL, NULL),
(403, 70, NULL, 1, 0, NULL, NULL),
(404, 70, NULL, 1, 0, NULL, NULL),
(405, 70, NULL, 1, 0, NULL, NULL),
(406, 70, NULL, 1, 0, NULL, NULL),
(407, 70, NULL, 1, 0, NULL, NULL),
(408, 70, NULL, 1, 0, NULL, NULL),
(409, 70, NULL, 1, 0, NULL, NULL),
(410, 70, NULL, 1, 0, NULL, NULL),
(411, 70, NULL, 1, 0, NULL, NULL),
(412, 70, NULL, 1, 0, NULL, NULL),
(413, 44, NULL, 1, 0, NULL, NULL),
(414, 44, NULL, 1, 0, NULL, NULL),
(415, 44, NULL, 1, 0, NULL, NULL),
(416, 89, NULL, 1, 0, NULL, NULL),
(417, 44, NULL, 1, 0, NULL, NULL),
(418, 44, NULL, 1, 0, NULL, NULL),
(419, 44, NULL, 1, 0, NULL, NULL),
(420, 44, NULL, 1, 0, NULL, NULL),
(421, 65, NULL, 1, 0, NULL, NULL),
(422, 65, NULL, 1, 0, NULL, NULL),
(423, 69, NULL, 1, 0, NULL, NULL),
(424, 65, NULL, 1, 0, NULL, NULL),
(426, 69, NULL, 1, 0, NULL, NULL),
(427, 65, NULL, 1, 0, NULL, NULL),
(428, 65, NULL, 1, 0, NULL, NULL),
(429, 69, NULL, 1, 0, NULL, NULL),
(430, 65, NULL, 1, 0, NULL, NULL),
(431, 69, NULL, 1, 0, NULL, NULL),
(432, 65, NULL, 1, 0, NULL, NULL),
(433, 65, NULL, 1, 0, NULL, NULL),
(434, 69, NULL, 1, 0, NULL, NULL),
(435, 65, NULL, 1, 0, NULL, NULL),
(436, 65, NULL, 1, 0, NULL, NULL),
(437, 69, NULL, 1, 0, NULL, NULL),
(438, 69, NULL, 1, 0, NULL, NULL),
(439, 65, NULL, 1, 0, NULL, NULL),
(440, 69, NULL, 1, 0, NULL, NULL),
(441, 69, NULL, 1, 0, NULL, NULL),
(442, 69, NULL, 1, 0, NULL, NULL),
(443, 69, NULL, 1, 0, NULL, NULL),
(444, 65, NULL, 1, 0, NULL, NULL),
(445, 69, NULL, 1, 0, NULL, NULL),
(446, 65, NULL, 1, 0, NULL, NULL),
(447, 65, NULL, 1, 0, NULL, NULL),
(448, 69, NULL, 1, 0, NULL, NULL),
(449, 65, NULL, 1, 0, NULL, NULL),
(450, 68, NULL, 1, 0, NULL, NULL),
(451, 68, NULL, 1, 0, NULL, NULL),
(452, 68, NULL, 1, 0, NULL, NULL),
(453, 68, NULL, 1, 0, NULL, NULL),
(454, 61, NULL, 1, 0, NULL, NULL),
(455, 61, NULL, 1, 0, NULL, NULL),
(456, 61, NULL, 1, 0, NULL, NULL),
(457, 61, NULL, 1, 0, NULL, NULL),
(458, 61, NULL, 1, 0, NULL, NULL),
(459, 61, NULL, 1, 0, NULL, NULL),
(460, 61, NULL, 1, 0, NULL, NULL),
(461, 61, NULL, 1, 0, NULL, NULL),
(462, 61, NULL, 1, 0, NULL, NULL),
(463, 61, NULL, 1, 0, NULL, NULL),
(464, 44, NULL, 1, 0, NULL, NULL),
(465, 44, NULL, 1, 0, NULL, NULL),
(466, 44, NULL, 1, 0, NULL, NULL),
(467, 84, NULL, 1, 0, NULL, NULL),
(468, 84, NULL, 1, 0, NULL, NULL),
(469, 84, NULL, 1, 0, NULL, NULL),
(470, 84, NULL, 1, 0, NULL, NULL),
(471, 84, NULL, 1, 0, NULL, NULL),
(472, 61, NULL, 1, 0, NULL, NULL),
(473, 59, NULL, 1, 0, NULL, NULL),
(474, 59, NULL, 1, 0, NULL, NULL),
(475, 59, NULL, 1, 0, NULL, NULL),
(477, 59, NULL, 1, 0, NULL, NULL),
(478, 59, NULL, 1, 0, NULL, NULL),
(479, 59, NULL, 1, 0, NULL, NULL),
(480, 59, NULL, 1, 0, NULL, NULL),
(481, 59, NULL, 1, 0, NULL, NULL),
(482, 59, NULL, 1, 0, NULL, NULL),
(483, 59, NULL, 1, 0, NULL, NULL),
(484, 83, NULL, 1, 0, NULL, NULL),
(485, 86, NULL, 1, 0, NULL, NULL),
(486, 86, NULL, 1, 0, NULL, NULL),
(487, 86, NULL, 1, 0, NULL, NULL),
(488, 86, NULL, 1, 0, NULL, NULL),
(489, 86, NULL, 1, 0, NULL, NULL),
(490, 86, NULL, 1, 0, NULL, NULL),
(491, 86, NULL, 1, 0, NULL, NULL),
(492, 86, NULL, 1, 0, NULL, NULL),
(493, 86, NULL, 1, 0, NULL, NULL),
(494, 86, NULL, 1, 0, NULL, NULL),
(495, 86, NULL, 1, 0, NULL, NULL),
(496, 75, NULL, 1, 0, NULL, NULL),
(497, 53, NULL, 1, 0, NULL, NULL),
(498, 86, NULL, 1, 0, NULL, NULL),
(499, 86, NULL, 1, 0, NULL, NULL),
(500, 86, NULL, 1, 0, NULL, NULL),
(501, 86, NULL, 1, 0, NULL, NULL),
(502, 86, NULL, 1, 0, NULL, NULL),
(503, 86, NULL, 1, 0, NULL, NULL),
(504, 86, NULL, 1, 0, NULL, NULL),
(505, 86, NULL, 1, 0, NULL, NULL),
(506, 86, NULL, 1, 0, NULL, NULL),
(507, 86, NULL, 1, 0, NULL, NULL),
(508, 86, NULL, 1, 0, NULL, NULL),
(509, 86, NULL, 1, 0, NULL, NULL),
(510, 86, NULL, 1, 0, NULL, NULL),
(511, 86, NULL, 1, 0, NULL, NULL),
(512, 86, NULL, 1, 0, NULL, NULL),
(513, 86, NULL, 1, 0, NULL, NULL),
(514, 86, NULL, 1, 0, NULL, NULL),
(515, 86, NULL, 1, 0, NULL, NULL),
(516, 61, NULL, 1, 0, NULL, NULL),
(517, 61, NULL, 1, 0, NULL, NULL),
(518, 61, NULL, 1, 0, NULL, NULL),
(519, 61, NULL, 1, 0, NULL, NULL),
(520, 61, NULL, 1, 0, NULL, NULL),
(521, 61, NULL, 1, 0, NULL, NULL),
(522, 61, NULL, 1, 0, NULL, NULL),
(523, 43, NULL, 1, 0, NULL, NULL),
(524, 75, NULL, 1, 0, NULL, NULL),
(525, 43, NULL, 1, 0, NULL, NULL),
(526, 43, NULL, 1, 0, NULL, NULL),
(527, 43, NULL, 1, 0, NULL, NULL),
(528, 43, NULL, 1, 0, NULL, NULL),
(529, 43, NULL, 1, 0, NULL, NULL),
(530, 43, NULL, 1, 0, NULL, NULL),
(532, 43, NULL, 1, 0, NULL, NULL),
(533, 43, NULL, 1, 0, NULL, NULL),
(534, 43, NULL, 1, 0, NULL, NULL),
(535, 43, NULL, 1, 0, NULL, NULL),
(536, 43, NULL, 1, 0, NULL, NULL),
(537, 43, NULL, 1, 0, NULL, NULL),
(538, 75, NULL, 1, 0, NULL, NULL),
(539, 75, NULL, 1, 0, NULL, NULL),
(540, 75, NULL, 1, 0, NULL, NULL),
(541, 75, NULL, 1, 0, NULL, NULL),
(543, 75, NULL, 1, 0, NULL, NULL),
(544, 75, NULL, 1, 0, NULL, NULL),
(545, 75, NULL, 1, 0, NULL, NULL),
(546, 75, NULL, 1, 0, NULL, NULL),
(547, 75, NULL, 1, 0, NULL, NULL),
(548, 75, NULL, 1, 0, NULL, NULL),
(549, 75, NULL, 1, 0, NULL, NULL),
(550, 75, NULL, 1, 0, NULL, NULL),
(551, 75, NULL, 1, 0, NULL, NULL),
(552, 75, NULL, 1, 0, NULL, NULL),
(553, 75, NULL, 1, 0, NULL, NULL),
(554, 75, NULL, 1, 0, NULL, NULL),
(555, 75, NULL, 1, 0, NULL, NULL),
(556, 86, NULL, 1, 0, NULL, NULL),
(557, 96, NULL, 1, 0, NULL, NULL),
(558, 43, NULL, 1, 0, NULL, NULL),
(559, 74, NULL, 1, 0, NULL, NULL),
(560, 74, NULL, 1, 0, NULL, NULL),
(561, 91, NULL, 1, 0, NULL, NULL),
(562, 91, NULL, 1, 0, NULL, NULL),
(564, 91, NULL, 1, 0, NULL, NULL),
(565, 91, NULL, 1, 0, NULL, NULL),
(566, 91, NULL, 1, 0, NULL, NULL),
(567, 51, NULL, 1, 0, NULL, NULL),
(568, 51, NULL, 1, 0, NULL, NULL),
(569, 74, NULL, 1, 0, NULL, NULL),
(570, 86, NULL, 1, 0, NULL, NULL),
(571, 86, NULL, 1, 0, NULL, NULL),
(572, 86, NULL, 1, 0, NULL, NULL),
(573, 86, NULL, 1, 0, NULL, NULL),
(574, 86, NULL, 1, 0, NULL, NULL),
(575, 74, NULL, 1, 0, NULL, NULL),
(576, 74, NULL, 1, 0, NULL, NULL),
(577, 86, NULL, 1, 0, NULL, NULL),
(578, 74, NULL, 1, 0, NULL, NULL),
(579, 74, NULL, 1, 0, NULL, NULL),
(580, 53, NULL, 1, 0, NULL, NULL),
(581, 51, NULL, 1, 0, NULL, NULL),
(582, 28, NULL, 1, 0, NULL, NULL),
(583, 28, NULL, 1, 0, NULL, NULL),
(584, 28, NULL, 1, 0, NULL, NULL),
(585, 28, NULL, 1, 0, NULL, NULL),
(586, 28, NULL, 1, 0, NULL, NULL),
(587, 28, NULL, 1, 0, NULL, NULL),
(588, 92, NULL, 1, 0, NULL, NULL),
(589, 92, NULL, 1, 0, NULL, NULL),
(590, 98, NULL, 1, 0, NULL, NULL),
(591, 92, NULL, 1, 0, NULL, NULL),
(592, 92, NULL, 1, 0, NULL, NULL),
(593, 92, NULL, 1, 0, NULL, NULL),
(594, 92, NULL, 1, 0, NULL, NULL),
(595, 70, NULL, 1, 0, NULL, NULL),
(596, 55, NULL, 1, 0, NULL, NULL),
(597, 55, NULL, 1, 0, NULL, NULL),
(598, 55, NULL, 1, 0, NULL, NULL),
(599, 55, NULL, 1, 0, NULL, NULL),
(600, 55, NULL, 1, 0, NULL, NULL),
(602, 55, NULL, 1, 0, NULL, NULL),
(603, 55, NULL, 1, 0, NULL, NULL),
(604, 55, NULL, 1, 0, NULL, NULL),
(605, 51, NULL, 1, 0, NULL, NULL),
(606, 74, NULL, 1, 0, NULL, NULL),
(607, 1, NULL, 1, 0, NULL, NULL),
(609, 101, NULL, 1, 0, NULL, NULL),
(610, 86, NULL, 1, 0, NULL, NULL),
(611, 86, NULL, 1, 0, NULL, NULL),
(612, 1, NULL, 1, 0, NULL, NULL),
(613, 1, NULL, 1, 0, NULL, NULL),
(614, 1, NULL, 1, 0, NULL, NULL),
(615, 101, NULL, 1, 0, NULL, NULL),
(616, 101, NULL, 1, 0, NULL, NULL),
(617, 101, NULL, 1, 0, NULL, NULL),
(618, 53, NULL, 1, 0, NULL, NULL),
(619, 53, NULL, 1, 0, NULL, NULL),
(620, 53, NULL, 1, 0, NULL, NULL),
(621, 90, NULL, 1, 0, NULL, NULL),
(622, 38, NULL, 1, 0, NULL, NULL),
(624, 76, NULL, 1, 0, NULL, NULL),
(625, 76, NULL, 1, 0, NULL, NULL),
(626, 76, NULL, 1, 0, NULL, NULL),
(627, 76, NULL, 1, 0, NULL, NULL),
(628, 76, NULL, 1, 0, NULL, NULL),
(629, 76, NULL, 1, 0, NULL, NULL),
(630, 76, NULL, 1, 0, NULL, NULL),
(631, 76, NULL, 1, 0, NULL, NULL),
(632, 76, NULL, 1, 0, NULL, NULL),
(633, 76, NULL, 1, 0, NULL, NULL),
(634, 76, NULL, 1, 0, NULL, NULL),
(635, 76, NULL, 1, 0, NULL, NULL),
(636, 76, NULL, 1, 0, NULL, NULL),
(637, 76, NULL, 1, 0, NULL, NULL),
(638, 76, NULL, 1, 0, NULL, NULL),
(639, 76, NULL, 1, 0, NULL, NULL),
(640, 76, NULL, 1, 0, NULL, NULL),
(641, 76, NULL, 1, 0, NULL, NULL),
(642, 76, NULL, 1, 0, NULL, NULL),
(643, 76, NULL, 1, 0, NULL, NULL),
(644, 76, NULL, 1, 0, NULL, NULL),
(645, 38, NULL, 1, 0, NULL, NULL),
(646, 38, NULL, 1, 0, NULL, NULL),
(647, 38, NULL, 1, 0, NULL, NULL),
(648, 38, NULL, 1, 0, NULL, NULL),
(649, 36, NULL, 1, 0, NULL, NULL),
(650, 36, NULL, 1, 0, NULL, NULL),
(651, 36, NULL, 1, 0, NULL, NULL),
(652, 36, NULL, 1, 0, NULL, NULL),
(653, 36, NULL, 1, 0, NULL, NULL),
(654, 36, NULL, 1, 0, NULL, NULL),
(655, 36, NULL, 1, 0, NULL, NULL),
(656, 36, NULL, 1, 0, NULL, NULL),
(657, 36, NULL, 1, 0, NULL, NULL),
(658, 36, NULL, 1, 0, NULL, NULL),
(659, 90, NULL, 1, 0, NULL, NULL),
(660, 90, NULL, 1, 0, NULL, NULL),
(661, 90, NULL, 1, 0, NULL, NULL),
(662, 90, NULL, 1, 0, NULL, NULL),
(663, 90, NULL, 1, 0, NULL, NULL),
(664, 90, NULL, 1, 0, NULL, NULL),
(665, 90, NULL, 1, 0, NULL, NULL),
(666, 90, NULL, 1, 0, NULL, NULL),
(667, 90, NULL, 1, 0, NULL, NULL),
(668, 90, NULL, 1, 0, NULL, NULL),
(669, 90, NULL, 1, 0, NULL, NULL),
(670, 90, NULL, 1, 0, NULL, NULL),
(671, 90, NULL, 1, 0, NULL, NULL),
(672, 90, NULL, 1, 0, NULL, NULL),
(673, 90, NULL, 1, 0, NULL, NULL),
(674, 90, NULL, 1, 0, NULL, NULL),
(675, 90, NULL, 1, 0, NULL, NULL),
(676, 90, NULL, 1, 0, NULL, NULL),
(677, 90, NULL, 1, 0, NULL, NULL),
(678, 90, NULL, 1, 0, NULL, NULL),
(679, 90, NULL, 1, 0, NULL, NULL),
(680, 90, NULL, 1, 0, NULL, NULL),
(681, 90, NULL, 1, 0, NULL, NULL),
(682, 90, NULL, 1, 0, NULL, NULL),
(683, 90, NULL, 1, 0, NULL, NULL),
(684, 90, NULL, 1, 0, NULL, NULL),
(685, 90, NULL, 1, 0, NULL, NULL),
(686, 93, NULL, 1, 0, NULL, NULL),
(687, 90, NULL, 1, 0, NULL, NULL),
(688, 101, NULL, 1, 0, NULL, NULL),
(689, 89, NULL, 1, 0, NULL, NULL),
(690, 89, NULL, 1, 0, NULL, NULL),
(691, 89, NULL, 1, 0, NULL, NULL),
(692, 38, NULL, 1, 0, NULL, NULL),
(693, 38, NULL, 1, 0, NULL, NULL),
(694, 74, NULL, 1, 0, NULL, NULL),
(695, 74, NULL, 1, 0, NULL, NULL),
(696, 87, NULL, 1, 0, NULL, NULL),
(697, 87, NULL, 1, 0, NULL, NULL),
(698, 87, NULL, 1, 0, NULL, NULL),
(699, 87, NULL, 1, 0, NULL, NULL),
(700, 87, NULL, 1, 0, NULL, NULL),
(701, 87, NULL, 1, 0, NULL, NULL),
(702, 87, NULL, 1, 0, NULL, NULL),
(703, 87, NULL, 1, 0, NULL, NULL),
(704, 93, NULL, 1, 0, NULL, NULL),
(705, 93, NULL, 1, 0, NULL, NULL),
(706, 90, NULL, 1, 0, NULL, NULL),
(707, 90, NULL, 1, 0, NULL, NULL),
(708, 67, NULL, 1, 0, NULL, NULL),
(709, 67, NULL, 1, 0, NULL, NULL),
(710, 67, NULL, 1, 0, NULL, NULL),
(711, 67, NULL, 1, 0, NULL, NULL),
(712, 67, NULL, 1, 0, NULL, NULL),
(713, 67, NULL, 1, 0, NULL, NULL),
(719, 62, NULL, 1, 0, NULL, NULL),
(720, 62, NULL, 1, 0, NULL, NULL),
(721, 62, NULL, 1, 0, NULL, NULL),
(722, 62, NULL, 1, 0, NULL, NULL),
(723, 62, NULL, 1, 0, NULL, NULL),
(725, 62, NULL, 1, 0, NULL, NULL),
(727, 62, NULL, 1, 0, NULL, NULL),
(729, 62, NULL, 1, 0, NULL, NULL),
(731, 62, NULL, 1, 0, NULL, NULL),
(732, 62, NULL, 1, 0, NULL, NULL),
(733, 62, NULL, 1, 0, NULL, NULL),
(734, 29, NULL, 1, 0, NULL, NULL),
(735, 62, NULL, 1, 0, NULL, NULL),
(736, 62, NULL, 1, 0, NULL, NULL),
(739, 67, NULL, 1, 0, NULL, NULL),
(740, 67, NULL, 1, 0, NULL, NULL),
(741, 67, NULL, 1, 0, NULL, NULL),
(742, 67, NULL, 1, 0, NULL, NULL),
(743, 67, NULL, 1, 0, NULL, NULL),
(745, 67, NULL, 1, 0, NULL, NULL),
(746, 67, NULL, 1, 0, NULL, NULL),
(747, 67, NULL, 1, 0, NULL, NULL),
(748, 67, NULL, 1, 0, NULL, NULL),
(749, 67, NULL, 1, 0, NULL, NULL),
(750, 67, NULL, 1, 0, NULL, NULL),
(751, 67, NULL, 1, 0, NULL, NULL),
(752, 67, NULL, 1, 0, NULL, NULL),
(753, 67, NULL, 1, 0, NULL, NULL),
(754, 67, NULL, 1, 0, NULL, NULL),
(755, 67, NULL, 1, 0, NULL, NULL),
(756, 67, NULL, 1, 0, NULL, NULL),
(757, 72, NULL, 1, 0, NULL, NULL),
(758, 72, NULL, 1, 0, NULL, NULL),
(759, 72, NULL, 1, 0, NULL, NULL),
(760, 72, NULL, 1, 0, NULL, NULL),
(761, 72, NULL, 1, 0, NULL, NULL),
(762, 72, NULL, 1, 0, NULL, NULL),
(763, 72, NULL, 1, 0, NULL, NULL),
(764, 72, NULL, 1, 0, NULL, NULL),
(765, 72, NULL, 1, 0, NULL, NULL),
(766, 72, NULL, 1, 0, NULL, NULL),
(767, 72, NULL, 1, 0, NULL, NULL),
(768, 72, NULL, 1, 0, NULL, NULL),
(769, 72, NULL, 1, 0, NULL, NULL),
(770, 67, NULL, 1, 0, NULL, NULL),
(771, 67, NULL, 1, 0, NULL, NULL),
(772, 67, NULL, 1, 0, NULL, NULL),
(773, 54, NULL, 1, 0, NULL, NULL),
(774, 72, NULL, 1, 0, NULL, NULL),
(775, 72, NULL, 1, 0, NULL, NULL),
(776, 46, NULL, 1, 0, NULL, NULL),
(777, 46, NULL, 1, 0, NULL, NULL),
(778, 46, NULL, 1, 0, NULL, NULL),
(779, 72, NULL, 1, 0, NULL, NULL),
(780, 72, NULL, 1, 0, NULL, NULL),
(781, 72, NULL, 1, 0, NULL, NULL),
(782, 70, NULL, 1, 0, NULL, NULL),
(783, 46, NULL, 1, 0, NULL, NULL),
(785, 46, NULL, 1, 0, NULL, NULL),
(786, 89, NULL, 1, 0, NULL, NULL),
(787, 87, NULL, 1, 0, NULL, NULL),
(788, 87, NULL, 1, 0, NULL, NULL),
(789, 72, NULL, 1, 0, NULL, NULL),
(790, 54, NULL, 1, 0, NULL, NULL),
(791, 54, NULL, 1, 0, NULL, NULL),
(792, 18, NULL, 1, 0, NULL, NULL),
(793, 18, NULL, 1, 0, NULL, NULL),
(794, 18, NULL, 1, 0, NULL, NULL),
(795, 18, NULL, 1, 0, NULL, NULL),
(796, 18, NULL, 1, 0, NULL, NULL),
(798, 44, NULL, 1, 0, NULL, NULL),
(799, 82, NULL, 1, 0, NULL, NULL),
(800, 82, NULL, 1, 0, NULL, NULL),
(801, 82, NULL, 1, 0, NULL, NULL),
(802, 82, NULL, 1, 0, NULL, NULL),
(803, 82, NULL, 1, 0, NULL, NULL),
(804, 44, NULL, 1, 0, NULL, NULL),
(805, 49, NULL, 1, 0, NULL, NULL),
(806, 98, NULL, 1, 0, NULL, NULL),
(807, 98, NULL, 1, 0, NULL, NULL),
(808, 98, NULL, 1, 0, NULL, NULL),
(809, 98, NULL, 1, 0, NULL, NULL),
(810, 104, NULL, 1, 0, NULL, NULL),
(811, 104, NULL, 1, 0, NULL, NULL),
(812, 104, NULL, 1, 0, NULL, NULL),
(813, 104, NULL, 1, 0, NULL, NULL),
(814, 104, NULL, 1, 0, NULL, NULL),
(816, 104, NULL, 1, 0, NULL, NULL),
(817, 104, NULL, 1, 0, NULL, NULL),
(818, 86, NULL, 1, 0, NULL, NULL),
(819, 86, NULL, 1, 0, NULL, NULL),
(820, 40, NULL, 1, 0, NULL, NULL),
(821, 98, NULL, 1, 0, NULL, NULL),
(822, 98, NULL, 1, 0, NULL, NULL),
(825, 40, NULL, 1, 0, NULL, NULL),
(826, 66, NULL, 1, 0, NULL, NULL),
(827, 66, NULL, 1, 0, NULL, NULL),
(828, 66, NULL, 1, 0, NULL, NULL),
(829, 66, NULL, 1, 0, NULL, NULL),
(830, 66, NULL, 1, 0, NULL, NULL),
(831, 66, NULL, 1, 0, NULL, NULL),
(832, 66, NULL, 1, 0, NULL, NULL),
(833, 66, NULL, 1, 0, NULL, NULL),
(834, 66, NULL, 1, 0, NULL, NULL),
(835, 66, NULL, 1, 0, NULL, NULL),
(836, 66, NULL, 1, 0, NULL, NULL),
(837, 66, NULL, 1, 0, NULL, NULL),
(838, 66, NULL, 1, 0, NULL, NULL),
(839, 38, NULL, 1, 0, NULL, NULL),
(840, 58, NULL, 1, 0, NULL, NULL),
(841, 102, NULL, 1, 0, NULL, NULL),
(842, 83, NULL, 1, 0, NULL, NULL),
(843, 83, NULL, 1, 0, NULL, NULL),
(844, 83, NULL, 1, 0, NULL, NULL),
(845, 83, NULL, 1, 0, NULL, NULL),
(846, 84, NULL, 1, 0, NULL, NULL),
(847, 84, NULL, 1, 0, NULL, NULL),
(848, 84, NULL, 1, 0, NULL, NULL),
(849, 94, NULL, 1, 0, NULL, NULL),
(850, 91, NULL, 1, 0, NULL, NULL),
(851, 42, NULL, 1, 0, NULL, NULL),
(852, 42, NULL, 1, 0, NULL, NULL),
(853, 42, NULL, 1, 0, NULL, NULL),
(855, 42, NULL, 1, 0, NULL, NULL),
(856, 42, NULL, 1, 0, NULL, NULL),
(857, 42, NULL, 1, 0, NULL, NULL),
(858, 42, NULL, 1, 0, NULL, NULL),
(861, 42, NULL, 1, 0, NULL, NULL),
(862, 73, NULL, 1, 0, NULL, NULL),
(863, 43, NULL, 1, 0, NULL, NULL),
(873, 38, NULL, 1, 0, NULL, NULL),
(874, 43, NULL, 1, 0, NULL, NULL),
(875, 84, NULL, 1, 0, NULL, NULL),
(876, 42, NULL, 1, 0, NULL, NULL),
(877, 102, NULL, 1, 0, NULL, NULL),
(878, 1, NULL, 1, 0, NULL, NULL),
(879, 1, NULL, 1, 0, NULL, NULL),
(880, 66, NULL, 1, 0, NULL, NULL),
(881, 73, NULL, 1, 0, NULL, NULL),
(882, 44, NULL, 1, 0, NULL, NULL),
(883, 44, NULL, 1, 0, NULL, NULL),
(884, 47, NULL, 1, 0, NULL, NULL),
(885, 47, NULL, 1, 0, NULL, NULL),
(886, 47, NULL, 1, 0, NULL, NULL),
(887, 47, NULL, 1, 0, NULL, NULL),
(888, 31, NULL, 1, 0, NULL, NULL),
(889, 31, NULL, 1, 0, NULL, NULL),
(890, 31, NULL, 1, 0, NULL, NULL),
(891, 47, NULL, 1, 0, NULL, NULL),
(892, 47, NULL, 1, 0, NULL, NULL),
(893, 47, NULL, 1, 0, NULL, NULL),
(894, 47, NULL, 1, 0, NULL, NULL),
(895, 47, NULL, 1, 0, NULL, NULL),
(897, 11, NULL, 1, 0, NULL, NULL),
(898, 73, NULL, 1, 0, NULL, NULL),
(899, 88, NULL, 0, 0, NULL, NULL),
(902, 88, NULL, 1, 0, NULL, NULL),
(903, 85, NULL, 1, 0, NULL, NULL),
(904, 85, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_masuk`
--

CREATE TABLE `log_masuk` (
  `LogId` int(11) NOT NULL,
  `LogTanggal` date DEFAULT NULL,
  `LogNama` varchar(255) DEFAULT NULL,
  `LogInstansi` varchar(255) DEFAULT NULL,
  `LogNomorHp` varchar(15) DEFAULT NULL,
  `LogEmail` varchar(255) DEFAULT NULL,
  `LogKeperluan` varchar(1024) DEFAULT NULL,
  `LogJamMasuk` time DEFAULT NULL,
  `LogJamKeluar` time DEFAULT NULL,
  `LogPersetujuan` tinyint(1) DEFAULT NULL,
  `LogCatatan` varchar(1024) DEFAULT NULL,
  `LogStatus` enum('request','in process','completed') DEFAULT NULL,
  `LogInsert` datetime DEFAULT NULL,
  `LogUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_masuk`
--

INSERT INTO `log_masuk` (`LogId`, `LogTanggal`, `LogNama`, `LogInstansi`, `LogNomorHp`, `LogEmail`, `LogKeperluan`, `LogJamMasuk`, `LogJamKeluar`, `LogPersetujuan`, `LogCatatan`, `LogStatus`, `LogInsert`, `LogUpdate`) VALUES
(1, '2024-08-28', 'althaf', 'kominfo', '0976789009876', 'zeta@gmail.com', 'coba', '09:45:59', '10:45:56', 1, 'coba', 'request', NULL, NULL),
(2, '2024-08-28', 'althaf', 'kominfo', '098789876789', 'zeta@gmail.com', 'coba', '08:45:59', '13:45:59', 3, 'coab', 'in process', NULL, NULL),
(3, '2024-08-28', 'althaf', 'kominfo', '09876789056', 'zeta@gmail.com', 'coba', '12:50:13', '17:50:13', 4, 'coba', 'completed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_statistik`
--

CREATE TABLE `log_statistik` (
  `LogId` int(11) NOT NULL,
  `LogTgl` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `LogIp` varchar(255) DEFAULT NULL,
  `LogLayananId` int(11) DEFAULT NULL COMMENT 'Jika Diperlukan',
  `LogLayananNama` varchar(255) DEFAULT NULL COMMENT 'Jika Diperlukan',
  `LogInsertUserId` int(11) DEFAULT NULL COMMENT 'Jika User Login',
  `LogUserGroupId` int(11) DEFAULT NULL COMMENT 'Jika User Login',
  `LogInsert` datetime DEFAULT NULL,
  `LogUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `log_statistik`
--

INSERT INTO `log_statistik` (`LogId`, `LogTgl`, `LogIp`, `LogLayananId`, `LogLayananNama`, `LogInsertUserId`, `LogUserGroupId`, `LogInsert`, `LogUpdate`) VALUES
(1, '2024-07-29 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-07-29 11:44:39', '2024-07-29 11:44:39'),
(2, '2024-07-30 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-07-30 09:12:52', '2024-07-30 09:12:52'),
(3, '2024-07-31 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-07-31 08:26:26', '2024-07-31 08:26:26'),
(4, '2024-08-01 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-01 07:53:19', '2024-08-01 07:53:19'),
(5, '2024-08-02 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-02 00:03:14', '2024-08-02 00:03:14'),
(6, '2024-08-03 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-03 14:25:34', '2024-08-03 14:25:34'),
(7, '2024-08-05 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-05 10:18:23', '2024-08-05 10:18:23'),
(8, '2024-08-06 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-06 07:21:12', '2024-08-06 07:21:12'),
(9, '2024-08-07 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-07 07:33:29', '2024-08-07 07:33:29'),
(10, '2024-08-08 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-08 07:57:00', '2024-08-08 07:57:00'),
(11, '2024-08-09 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-09 14:03:13', '2024-08-09 14:03:13'),
(12, '2024-08-12 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-12 07:54:26', '2024-08-12 07:54:26'),
(13, '2024-08-13 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-13 07:56:53', '2024-08-13 07:56:53'),
(14, '2024-08-14 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-14 07:34:17', '2024-08-14 07:34:17'),
(15, '2024-08-15 00:00:00', '::1', NULL, NULL, NULL, NULL, '2024-08-15 07:37:59', '2024-08-15 07:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1701069642, 1),
(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1701069643, 1),
(3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1701069643, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_kategori_berita`
--

CREATE TABLE `mst_kategori_berita` (
  `KategoriBeritaId` int(11) NOT NULL,
  `KategoriBeritaNama` varchar(255) DEFAULT NULL,
  `KategoriBeritaDeskripsi` varchar(255) DEFAULT NULL,
  `KategoriBeritaInsert` datetime DEFAULT NULL,
  `KategoriBeritaUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mst_kategori_berita`
--

INSERT INTO `mst_kategori_berita` (`KategoriBeritaId`, `KategoriBeritaNama`, `KategoriBeritaDeskripsi`, `KategoriBeritaInsert`, `KategoriBeritaUpdate`) VALUES
(1, 'News,2024', '&lt;p&gt;&lt;strong&gt;Berita Utama&lt;/strong&gt;&lt;/p&gt;', '2024-08-01 08:59:54', '2024-08-01 09:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `my_admin_menu`
--

CREATE TABLE `my_admin_menu` (
  `MenuId` int(10) UNSIGNED NOT NULL,
  `MenuParentId` int(11) DEFAULT NULL,
  `MenuName` varchar(250) DEFAULT NULL,
  `MenuUrl` varchar(250) DEFAULT NULL,
  `MenuHasSubmenu` tinyint(4) NOT NULL DEFAULT 0,
  `MenuIcon` varchar(250) DEFAULT NULL,
  `MenuOrder` int(11) DEFAULT NULL,
  `MenuIsShow` enum('1','0') DEFAULT NULL,
  `MenuCreatedAt` datetime DEFAULT NULL,
  `MenuCreatedBy` varchar(250) DEFAULT NULL,
  `MenuUpdatedAt` datetime DEFAULT NULL,
  `MenuUpdatedBy` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `my_admin_menu`
--

INSERT INTO `my_admin_menu` (`MenuId`, `MenuParentId`, `MenuName`, `MenuUrl`, `MenuHasSubmenu`, `MenuIcon`, `MenuOrder`, `MenuIsShow`, `MenuCreatedAt`, `MenuCreatedBy`, `MenuUpdatedAt`, `MenuUpdatedBy`) VALUES
(1, NULL, 'Master', '#', 1, 'database-2', 2, '1', '2023-12-05 10:44:12', 'Admin PatiKab', '2023-12-05 10:49:04', NULL),
(2, 1, 'Tes', 'adminpanel/master/tes', 0, NULL, 10, '1', '2023-12-05 10:49:04', 'Admin PatiKab', '2024-08-01 08:26:07', 'Admin PatiKab'),
(3, NULL, 'Setting', '#', 1, 'settings-2', 4, '1', '2024-06-04 00:44:32', 'Admin PatiKab', '2024-07-08 15:54:15', NULL),
(4, 3, 'Background', 'adminpanel/setting/background', 0, NULL, 1, '1', '2024-06-04 00:45:20', 'Admin PatiKab', '2024-06-04 00:47:41', 'Admin PatiKab'),
(5, 3, 'Kontak', 'adminpanel/setting/kontak', 0, NULL, 2, '1', '2024-06-04 00:45:58', 'Admin PatiKab', '2024-08-01 10:57:02', 'Admin PatiKab'),
(6, 3, 'Berita', 'adminpanel/setting/berita', 0, NULL, 4, '1', '2024-07-08 10:40:47', 'Admin PatiKab', '2024-08-01 10:57:52', 'Admin PatiKab'),
(11, 1, 'Kategori Download', 'adminpanel/master/kategori-download', 0, NULL, 1, '1', '2024-08-01 08:27:03', 'Admin PatiKab', '2024-08-01 08:27:03', NULL),
(12, 3, 'Download', 'adminpanel/setting/download', 0, NULL, 3, '1', '2024-08-01 08:27:55', 'Admin PatiKab', '2024-08-01 10:57:25', 'Admin PatiKab'),
(14, 1, 'Kategori Berita', 'adminpanel/master/kategori-berita', 0, NULL, 2, '1', '2024-08-01 08:50:43', 'Admin PatiKab', '2024-08-01 08:50:43', NULL),
(15, 1, 'Kategori Informasi', 'adminpanel/master/kategori-informasi', 0, NULL, 3, '1', '2024-08-01 09:07:26', 'Admin PatiKab', '2024-08-01 09:07:26', NULL),
(16, 3, 'Pengumuman', 'adminpanel/setting/pengumuman', 0, NULL, 8, '1', '2024-08-01 10:55:22', 'Admin PatiKab', '2024-08-02 08:16:17', 'Admin PatiKab'),
(17, 3, 'Informasi', 'adminpanel/setting/informasi', 0, NULL, 9, '1', '2024-08-01 11:17:03', 'Admin PatiKab', '2024-08-02 10:02:28', 'Admin PatiKab'),
(21, 3, 'On The Spot', 'adminpanel/setting/on-the-spot', 0, NULL, 7, '1', '2024-08-02 09:05:48', 'Admin PatiKab', '2024-08-02 09:05:48', NULL),
(22, 3, 'Layanan', 'adminpanel/setting/layanan', 0, NULL, 6, '1', '2024-08-02 10:03:53', 'Admin PatiKab', '2024-08-02 10:03:53', NULL),
(23, 3, 'Front Menu', 'adminpanel/setting/front-menu', 0, NULL, 5, '1', '2024-08-02 22:04:24', 'Admin PatiKab', '2024-08-02 22:10:23', 'Admin PatiKab'),
(24, 1, 'Kategori Sub Menu Front', 'adminpanel/master/kategori-sub-menu-front', 0, NULL, 4, '1', '2024-08-03 00:07:28', 'Admin PatiKab', '2024-08-03 00:07:28', NULL),
(25, 3, 'Front Sub Menu', 'adminpanel/setting/front-sub-menu', 0, NULL, 10, '1', '2024-08-03 14:44:23', 'Admin PatiKab', '2024-08-03 14:44:23', NULL),
(27, 3, 'Sejarah Pati', 'adminpanel/setting/sejarah-pati', 0, NULL, 12, '1', '2024-08-05 15:03:34', 'Admin PatiKab', '2024-08-05 15:03:34', NULL),
(28, 3, 'Arti Lambang', 'adminpanel/setting/arti-lambang', 0, NULL, 13, '1', '2024-08-05 15:07:10', 'Admin PatiKab', '2024-08-05 15:07:10', NULL),
(29, 3, 'Layanan Opd', 'adminpanel/setting/layanan-opd', 0, NULL, 11, '1', '2024-08-12 09:13:25', 'Admin PatiKab', '2024-08-12 09:13:25', NULL),
(30, 3, 'Unit Kerja', 'adminpanel/setting/unit-kerja', 0, NULL, 14, '1', '2024-08-12 09:16:59', 'Admin PatiKab', '2024-08-12 09:16:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `my_admin_users_menu`
--

CREATE TABLE `my_admin_users_menu` (
  `UsersMenuId` int(10) UNSIGNED NOT NULL,
  `UsersMenuUsersId` int(10) UNSIGNED DEFAULT NULL,
  `UsersMenuMenuId` int(10) UNSIGNED DEFAULT NULL,
  `UsersMenuCreatedAt` datetime DEFAULT NULL,
  `UsersMenuCreatedBy` varchar(250) DEFAULT NULL,
  `UsersMenuUpdatedAt` datetime DEFAULT NULL,
  `UsersMenuUpdatedBy` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `my_admin_users_menu`
--

INSERT INTO `my_admin_users_menu` (`UsersMenuId`, `UsersMenuUsersId`, `UsersMenuMenuId`, `UsersMenuCreatedAt`, `UsersMenuCreatedBy`, `UsersMenuUpdatedAt`, `UsersMenuUpdatedBy`) VALUES
(1, 1, 3, '2024-06-04 00:47:55', 'Admin PatiKab', '2024-06-04 00:47:55', NULL),
(2, 1, 4, '2024-06-04 00:47:55', 'Admin PatiKab', '2024-06-04 00:47:55', NULL),
(3, 1, 5, '2024-06-04 00:47:55', 'Admin PatiKab', '2024-06-04 00:47:55', NULL),
(4, 1, 6, '2024-07-08 10:41:03', 'Admin PatiKab', '2024-07-08 10:41:03', NULL),
(9, 1, 11, '2024-08-01 08:51:25', 'Admin PatiKab', '2024-08-01 08:51:25', NULL),
(10, 1, 1, '2024-08-01 08:51:25', 'Admin PatiKab', '2024-08-01 08:51:25', NULL),
(11, 1, 14, '2024-08-01 08:51:25', 'Admin PatiKab', '2024-08-01 08:51:25', NULL),
(12, 1, 12, '2024-08-01 08:51:25', 'Admin PatiKab', '2024-08-01 08:51:25', NULL),
(13, 1, 15, '2024-08-01 09:08:41', 'Admin PatiKab', '2024-08-01 09:08:41', NULL),
(14, 1, 16, '2024-08-01 10:55:57', 'Admin PatiKab', '2024-08-01 10:55:57', NULL),
(15, 1, 17, '2024-08-01 11:18:29', 'Admin PatiKab', '2024-08-01 11:18:29', NULL),
(19, 1, 21, '2024-08-02 09:06:26', 'Admin PatiKab', '2024-08-02 09:06:26', NULL),
(20, 1, 22, '2024-08-02 10:05:03', 'Admin PatiKab', '2024-08-02 10:05:03', NULL),
(21, 1, 23, '2024-08-02 22:09:33', 'Admin PatiKab', '2024-08-02 22:09:33', NULL),
(22, 1, 24, '2024-08-03 00:08:41', 'Admin PatiKab', '2024-08-03 00:08:41', NULL),
(23, 1, 25, '2024-08-03 14:48:55', 'Admin PatiKab', '2024-08-03 14:48:55', NULL),
(25, 1, 27, '2024-08-05 15:04:32', 'Admin PatiKab', '2024-08-05 15:04:32', NULL),
(26, 1, 28, '2024-08-05 15:09:21', 'Admin PatiKab', '2024-08-05 15:09:21', NULL),
(27, 1, 29, '2024-08-12 09:15:16', 'Admin PatiKab', '2024-08-12 09:15:16', NULL),
(28, 1, 30, '2024-08-12 09:18:11', 'Admin PatiKab', '2024-08-12 09:18:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `on_the_spot_file`
--

CREATE TABLE `on_the_spot_file` (
  `OnTheSpotFileId` int(11) NOT NULL,
  `OnTheSpotFileOnTheSpotId` int(11) DEFAULT NULL,
  `OnTheSpotFileNama` varchar(255) DEFAULT NULL,
  `OnTheSpotFileKeterangan` varchar(255) DEFAULT NULL,
  `OnTheSpotFileInsert` datetime DEFAULT NULL,
  `OnTheSpotFileUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `on_the_spot_file`
--

INSERT INTO `on_the_spot_file` (`OnTheSpotFileId`, `OnTheSpotFileOnTheSpotId`, `OnTheSpotFileNama`, `OnTheSpotFileKeterangan`, `OnTheSpotFileInsert`, `OnTheSpotFileUpdate`) VALUES
(1, 1, '64.jpg', 'Pati Viral', NULL, NULL),
(2, 1, '64.jpg', 'Pati Viral', NULL, NULL),
(3, 1, '64.jpg', 'Pati Viral', NULL, NULL),
(4, 2, '64.jpg', 'Pati Viral', NULL, NULL),
(5, 3, '64.jpg', 'Pati Viral', NULL, NULL),
(6, 3, '64.jpg', 'Pati Viral', NULL, NULL),
(7, 4, '64.jpg', 'Pati Viral', NULL, NULL),
(31, 27, '1722841327_2df7ee94c1fc0d1676dd.jpg', 'ref', '2024-08-05 14:02:07', '2024-08-05 14:02:07'),
(32, 27, '1722841327_f26d5f7ce1dfd8cfa12b.jpg', 'ref', '2024-08-05 14:02:07', '2024-08-05 14:02:07'),
(43, 49, '1722993995_e5d33f31d13d86048d88.jpg', 'gnm', '2024-08-07 08:26:35', '2024-08-07 08:26:35'),
(44, 51, '1723524684_97956c0d567373778b95.png', 'vnbnm', '2024-08-13 11:51:24', '2024-08-13 11:51:24'),
(45, 52, '1723608166_bdc6081ae2167634af76.png', 'nyoba', '2024-08-14 11:02:46', '2024-08-14 11:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `PengumumanId` int(11) NOT NULL,
  `PengumumanJudul` varchar(255) DEFAULT NULL,
  `PengumumanText` varchar(255) DEFAULT NULL,
  `PengumumanView` varchar(255) DEFAULT NULL,
  `PengumumanInsert` datetime DEFAULT NULL,
  `PengumumanUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`PengumumanId`, `PengumumanJudul`, `PengumumanText`, `PengumumanView`, `PengumumanInsert`, `PengumumanUpdate`) VALUES
(1, 'LARANGAN PENGOPERASIAN KENDARAAN ANGKUTAN BARANG', 'Berdasarkan Surat Edaran Menteri Perhubungan No. 48  Tahun 2015, Pada Tanggal 30 Desember 2015 s.d. 3 Januari 2015', '20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publik_komen`
--

CREATE TABLE `publik_komen` (
  `PublikKomenId` int(11) NOT NULL,
  `PublikKomenTgl` datetime DEFAULT NULL,
  `PublikKomenNamaPengirim` varchar(255) DEFAULT NULL,
  `PublikKomenNoHp` varchar(255) DEFAULT NULL,
  `PublikKomenSubject` varchar(255) DEFAULT NULL,
  `PublikKomenEmail` varchar(255) DEFAULT NULL,
  `PublikKomenGambar` varchar(255) DEFAULT NULL,
  `PublikKomenText` varchar(255) DEFAULT NULL,
  `PublikKomenBalasanText` varchar(255) DEFAULT NULL,
  `PublikKomenIp` varchar(255) DEFAULT NULL,
  `PublikKomenInsert` datetime DEFAULT NULL,
  `PublikKomenUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `publik_komen`
--

INSERT INTO `publik_komen` (`PublikKomenId`, `PublikKomenTgl`, `PublikKomenNamaPengirim`, `PublikKomenNoHp`, `PublikKomenSubject`, `PublikKomenEmail`, `PublikKomenGambar`, `PublikKomenText`, `PublikKomenBalasanText`, `PublikKomenIp`, `PublikKomenInsert`, `PublikKomenUpdate`) VALUES
(1, '2024-05-20 00:00:00', 'Ardian', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'logo.png', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', 'Terima Kasih Sudah Memberikan Komentar Anda', NULL, NULL, '2024-05-21 00:00:00'),
(2, '2024-05-21 00:00:00', 'Bagas', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'logo.png', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', NULL, NULL, NULL, NULL),
(3, '2024-08-01 16:34:51', 'Pradita', '0897659997222', 'Bagus Lanjutkan', 'ardiansusetyo@gmail.com', 'logo.png', 'Untuk lebih Lengkapnya untuk penambahan inovasi yang lebih baik lagi', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `class`, `key`, `value`, `type`, `context`, `created_at`, `updated_at`) VALUES
(1, 'Config\\App', 'siteName', 'Pemerintah Kabupaten Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(2, 'Config\\App', 'siteNameAlias', 'Pemerintah Kabupaten Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(3, 'Config\\App', 'siteNameFull', 'Pemerintah Kabupaten Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(4, 'Config\\App', 'siteDescription', 'Pemerintah Kabupaten Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(5, 'Config\\App', 'siteVersion', '3.0', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(6, 'Config\\App', 'siteYear', '2024', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(7, 'Config\\App', 'siteLogo', '', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(8, 'Config\\App', 'siteCopyRight', 'Dinas Komunikasi Dan Informatika', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', NULL, NULL, 1, '2024-08-28 09:14:37', '2023-11-10 09:14:24', '2023-11-10 09:14:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `type_secret` (`type`,`secret`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_type_identifier` (`id_type`,`identifier`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `auth_permissions_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `selector` (`selector`) USING BTREE,
  ADD KEY `auth_remember_tokens_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_type_identifier` (`id_type`,`identifier`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `berita_komen`
--
ALTER TABLE `berita_komen`
  ADD PRIMARY KEY (`BeritaKomenId`) USING BTREE;

--
-- Indexes for table `front_menu`
--
ALTER TABLE `front_menu`
  ADD PRIMARY KEY (`FrontMenuId`) USING BTREE;

--
-- Indexes for table `front_sub_menu`
--
ALTER TABLE `front_sub_menu`
  ADD PRIMARY KEY (`FrontSubMenuId`) USING BTREE;

--
-- Indexes for table `front_sub_menu_kategori`
--
ALTER TABLE `front_sub_menu_kategori`
  ADD PRIMARY KEY (`FrontSubMenuKategoriId`) USING BTREE;

--
-- Indexes for table `kategori_download`
--
ALTER TABLE `kategori_download`
  ADD PRIMARY KEY (`KategoriDownloadId`) USING BTREE;

--
-- Indexes for table `kategori_informasi`
--
ALTER TABLE `kategori_informasi`
  ADD PRIMARY KEY (`KategoriInformasiId`) USING BTREE;

--
-- Indexes for table `layanan_opd`
--
ALTER TABLE `layanan_opd`
  ADD PRIMARY KEY (`LayananOpdId`),
  ADD KEY `JenisPelayananUnitKerjaId` (`LayananOpdUnitKerjaId`);

--
-- Indexes for table `log_masuk`
--
ALTER TABLE `log_masuk`
  ADD PRIMARY KEY (`LogId`);

--
-- Indexes for table `log_statistik`
--
ALTER TABLE `log_statistik`
  ADD PRIMARY KEY (`LogId`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mst_kategori_berita`
--
ALTER TABLE `mst_kategori_berita`
  ADD PRIMARY KEY (`KategoriBeritaId`) USING BTREE;

--
-- Indexes for table `my_admin_menu`
--
ALTER TABLE `my_admin_menu`
  ADD PRIMARY KEY (`MenuId`) USING BTREE;

--
-- Indexes for table `my_admin_users_menu`
--
ALTER TABLE `my_admin_users_menu`
  ADD PRIMARY KEY (`UsersMenuId`) USING BTREE,
  ADD UNIQUE KEY `UsersMenuUsersId` (`UsersMenuUsersId`,`UsersMenuMenuId`) USING BTREE,
  ADD KEY `UsersMenuMenuId` (`UsersMenuMenuId`) USING BTREE;

--
-- Indexes for table `on_the_spot_file`
--
ALTER TABLE `on_the_spot_file`
  ADD PRIMARY KEY (`OnTheSpotFileId`) USING BTREE;

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`PengumumanId`) USING BTREE;

--
-- Indexes for table `publik_komen`
--
ALTER TABLE `publik_komen`
  ADD PRIMARY KEY (`PublikKomenId`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_identities`
--
ALTER TABLE `auth_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berita_komen`
--
ALTER TABLE `berita_komen`
  MODIFY `BeritaKomenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `front_menu`
--
ALTER TABLE `front_menu`
  MODIFY `FrontMenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `front_sub_menu`
--
ALTER TABLE `front_sub_menu`
  MODIFY `FrontSubMenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `front_sub_menu_kategori`
--
ALTER TABLE `front_sub_menu_kategori`
  MODIFY `FrontSubMenuKategoriId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_download`
--
ALTER TABLE `kategori_download`
  MODIFY `KategoriDownloadId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_informasi`
--
ALTER TABLE `kategori_informasi`
  MODIFY `KategoriInformasiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `layanan_opd`
--
ALTER TABLE `layanan_opd`
  MODIFY `LayananOpdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=916;

--
-- AUTO_INCREMENT for table `log_statistik`
--
ALTER TABLE `log_statistik`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_kategori_berita`
--
ALTER TABLE `mst_kategori_berita`
  MODIFY `KategoriBeritaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `my_admin_menu`
--
ALTER TABLE `my_admin_menu`
  MODIFY `MenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `my_admin_users_menu`
--
ALTER TABLE `my_admin_users_menu`
  MODIFY `UsersMenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `on_the_spot_file`
--
ALTER TABLE `on_the_spot_file`
  MODIFY `OnTheSpotFileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `PengumumanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publik_komen`
--
ALTER TABLE `publik_komen`
  MODIFY `PublikKomenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `my_admin_users_menu`
--
ALTER TABLE `my_admin_users_menu`
  ADD CONSTRAINT `my_admin_users_menu_ibfk_1` FOREIGN KEY (`UsersMenuUsersId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `my_admin_users_menu_ibfk_2` FOREIGN KEY (`UsersMenuMenuId`) REFERENCES `my_admin_menu` (`MenuId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
