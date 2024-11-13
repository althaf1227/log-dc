-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 05:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `log_dc`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '2023-11-10 09:14:24', NULL);

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
(1, 1, 'email_password', 'Penjaga Server', 'jagaserver@gmail.com', '$2y$12$1Uk83xr1tZXEfDbJTG179.2JHqCjyvbYpIJu7LaAjz6Q5LbBKn9Eq', NULL, NULL, 0, '2024-11-13 11:27:34', '2023-11-10 09:14:24', '2024-11-13 11:27:34');

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
(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 09:14:27', 1),
(59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-08-28 14:49:58', 0),
(60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-28 14:50:03', 1),
(61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-08-29 08:46:39', 0),
(62, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-29 08:46:47', 1),
(63, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-29 13:24:03', 1),
(64, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-30 07:55:53', 1),
(65, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-08-30 10:31:19', 1),
(66, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-02 08:14:04', 1),
(67, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-02 11:45:32', 1),
(68, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-03 08:47:28', 1),
(69, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-03 14:18:42', 1),
(70, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-04 07:38:17', 1),
(71, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-04 11:36:49', 1),
(72, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-04 13:52:58', 1),
(73, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-05 07:59:06', 1),
(74, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-05 13:28:49', 1),
(75, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-06 08:01:03', 1),
(76, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-06 13:52:53', 1),
(77, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-09 07:56:26', 1),
(78, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-09 14:48:49', 1),
(79, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-10 08:05:15', 1),
(80, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-10 12:57:50', 1),
(81, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-10 13:32:51', 1),
(82, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-10 13:37:57', 1),
(83, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-11 09:14:14', 1),
(84, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-12 08:06:55', 1),
(85, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-13 09:37:21', 1),
(86, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-13 13:37:09', 1),
(87, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-17 07:48:52', 1),
(88, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-09-30 09:38:03', 1),
(89, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-10-01 08:29:02', 1),
(90, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-10-01 20:14:53', 1),
(91, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-10-02 09:17:05', 1),
(92, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-11-12 09:09:54', 1),
(93, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'jagaserver@gmail.com', 1, '2024-11-13 11:27:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions_users`
--

CREATE TABLE `auth_permissions_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auth_permissions_users`
--

INSERT INTO `auth_permissions_users` (`id`, `user_id`, `permission`, `created_at`, `updated_at`) VALUES
(1, 1, 'adminpanel/user-management/group.create', '2023-11-10 09:57:15', NULL),
(2, 1, 'adminpanel/user-management/group.read', '2023-11-10 09:57:15', NULL),
(3, 1, 'adminpanel/user-management/group.update', '2023-11-10 09:57:15', NULL),
(4, 1, 'adminpanel/user-management/group.delete', '2023-11-10 09:57:15', NULL),
(5, 1, 'adminpanel/user-management/permission.create', '2023-11-10 09:57:15', NULL),
(6, 1, 'adminpanel/user-management/permission.read', '2023-11-10 09:57:15', NULL),
(7, 1, 'adminpanel/user-management/permission.update', '2023-11-10 09:57:15', NULL),
(8, 1, 'adminpanel/user-management/permission.delete', '2023-11-10 09:57:15', NULL),
(9, 1, 'adminpanel/user-management/users.create', '2023-11-10 09:57:15', NULL),
(10, 1, 'adminpanel/user-management/users.read', '2023-11-10 09:57:15', NULL),
(11, 1, 'adminpanel/user-management/users.update', '2023-11-10 09:57:15', NULL),
(12, 1, 'adminpanel/user-management/users.delete', '2023-11-10 09:57:15', NULL),
(13, 1, 'adminpanel/user-management/menu.create', '2023-11-10 09:57:15', NULL),
(14, 1, 'adminpanel/user-management/menu.read', '2023-11-10 09:57:15', NULL),
(15, 1, 'adminpanel/user-management/menu.update', '2023-11-10 09:57:15', NULL),
(16, 1, 'adminpanel/user-management/menu.delete', '2023-11-10 09:57:15', NULL),
(17, 1, 'adminpanel/user-management/users-menu.create', '2023-11-10 09:57:15', NULL),
(18, 1, 'adminpanel/user-management/users-menu.read', '2023-11-10 09:57:15', NULL),
(19, 1, 'adminpanel/user-management/users-menu.update', '2023-11-10 09:57:15', NULL),
(20, 1, 'adminpanel/user-management/users-menu.delete', '2023-11-10 09:57:15', NULL);

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
  `LogGambar` varchar(255) NOT NULL,
  `LogInsert` datetime DEFAULT NULL,
  `LogUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_masuk`
--

INSERT INTO `log_masuk` (`LogId`, `LogTanggal`, `LogNama`, `LogInstansi`, `LogNomorHp`, `LogEmail`, `LogKeperluan`, `LogJamMasuk`, `LogJamKeluar`, `LogPersetujuan`, `LogCatatan`, `LogStatus`, `LogGambar`, `LogInsert`, `LogUpdate`) VALUES
(1, '2024-09-11', 'zeta', 'hololive', '082136413548', 'zetabazo@gmail.com', '<p>maintenence</p>', '09:45:59', NULL, 0, '<p>sedang istirahat mim</p>', 'request', '', NULL, '2024-11-06 14:22:41'),
(2, '2024-08-28', 'althaf', 'kominfo', '098789876789', 'zeta@gmail.com', 'maintenace', '08:45:59', NULL, 1, '<p>mengambil barang</p>', 'in process', '0', NULL, '2024-09-13 09:38:03'),
(3, '2024-08-28', 'althaf3', 'kominfo', '09876789056', 'zeta@gmail.com', 'maintenace', '12:50:13', '17:50:13', 1, 'lain kali jangan lupa yah', 'completed', 'uploads/foto/672b1941bf63d.png', NULL, '2024-09-10 09:30:28');

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
-- Table structure for table `my_admin_group`
--

CREATE TABLE `my_admin_group` (
  `GroupId` int(10) UNSIGNED NOT NULL,
  `GroupNama` varchar(30) DEFAULT NULL,
  `GroupStatus` varchar(255) DEFAULT NULL,
  `GroupAktif` tinyint(1) NOT NULL DEFAULT 0,
  `GroupCreatedAt` datetime DEFAULT NULL,
  `GroupCreatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GroupUpdatedAt` datetime DEFAULT NULL,
  `GroupUpdatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `my_admin_group`
--

INSERT INTO `my_admin_group` (`GroupId`, `GroupNama`, `GroupStatus`, `GroupAktif`, `GroupCreatedAt`, `GroupCreatedBy`, `GroupUpdatedAt`, `GroupUpdatedBy`) VALUES
(1, 'admin', 'aktif', 1, '2024-08-18 05:16:48', NULL, '2024-08-18 05:16:48', NULL),
(2, 'kabupaten', 'aktif', 1, '2024-08-18 05:16:48', NULL, '2024-08-18 05:16:48', NULL),
(3, 'opd', 'aktif', 1, '2024-08-18 05:16:48', NULL, '2024-08-18 05:16:48', NULL),
(4, 'user', 'aktif', 1, '2024-08-18 05:16:48', NULL, '2024-08-18 05:16:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `my_admin_group_permission`
--

CREATE TABLE `my_admin_group_permission` (
  `GroupPermissionId` int(10) UNSIGNED NOT NULL,
  `GroupPermissionGroupId` int(10) UNSIGNED NOT NULL,
  `GroupPermissionUrl` varchar(255) NOT NULL,
  `GroupPermissionCreatedAt` datetime DEFAULT NULL,
  `GroupPermissionCreatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GroupPermissionUpdatedAt` datetime DEFAULT NULL,
  `GroupPermissionUpdatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `my_admin_group_permission`
--

INSERT INTO `my_admin_group_permission` (`GroupPermissionId`, `GroupPermissionGroupId`, `GroupPermissionUrl`, `GroupPermissionCreatedAt`, `GroupPermissionCreatedBy`, `GroupPermissionUpdatedAt`, `GroupPermissionUpdatedBy`) VALUES
(1, 1, 'adminpanel/user-management/group.create', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(2, 1, 'adminpanel/user-management/group.read', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(3, 1, 'adminpanel/user-management/group.update', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(4, 1, 'adminpanel/user-management/group.delete', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(5, 1, 'adminpanel/user-management/permission.create', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(6, 1, 'adminpanel/user-management/permission.read', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(7, 1, 'adminpanel/user-management/permission.update', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(8, 1, 'adminpanel/user-management/permission.delete', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(9, 1, 'adminpanel/user-management/users.create', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(10, 1, 'adminpanel/user-management/users.read', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(11, 1, 'adminpanel/user-management/users.update', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(12, 1, 'adminpanel/user-management/users.delete', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(13, 1, 'adminpanel/user-management/menu.create', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(14, 1, 'adminpanel/user-management/menu.read', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(15, 1, 'adminpanel/user-management/menu.update', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(16, 1, 'adminpanel/user-management/menu.delete', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(17, 1, 'adminpanel/user-management/users-menu.create', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(18, 1, 'adminpanel/user-management/users-menu.read', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(19, 1, 'adminpanel/user-management/users-menu.update', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(20, 1, 'adminpanel/user-management/users-menu.delete', NULL, NULL, '2024-08-19 01:10:04', 'Admin PatiKab'),
(25, 2, 'adminpanel/user-management/group.create', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(26, 2, 'adminpanel/user-management/group.read', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(27, 2, 'adminpanel/user-management/group.update', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(28, 2, 'adminpanel/user-management/group.delete', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(29, 2, 'adminpanel/user-management/permission.create', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(30, 2, 'adminpanel/user-management/permission.read', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(31, 2, 'adminpanel/user-management/permission.update', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(32, 2, 'adminpanel/user-management/permission.delete', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(33, 2, 'adminpanel/user-management/users.create', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(34, 2, 'adminpanel/user-management/users.read', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(35, 2, 'adminpanel/user-management/users.update', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(36, 2, 'adminpanel/user-management/users.delete', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(37, 2, 'adminpanel/user-management/menu.create', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(38, 2, 'adminpanel/user-management/menu.read', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(39, 2, 'adminpanel/user-management/menu.update', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(40, 2, 'adminpanel/user-management/menu.delete', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(41, 2, 'adminpanel/user-management/users-menu.create', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(42, 2, 'adminpanel/user-management/users-menu.read', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(43, 2, 'adminpanel/user-management/users-menu.update', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(44, 2, 'adminpanel/user-management/users-menu.delete', '2024-08-19 01:05:25', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(53, 2, 'adminpanel/master/tes.create', '2024-08-19 01:09:30', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(54, 2, 'adminpanel/master/tes.read', '2024-08-19 01:09:30', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(59, 2, 'adminpanel/setting/kontak.update', '2024-08-19 01:09:30', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(60, 2, 'adminpanel/setting/kontak.delete', '2024-08-19 01:09:30', 'Admin PatiKab', '2024-08-19 01:09:45', 'Admin PatiKab'),
(61, 1, 'adminpanel/master/tes.create', '2024-08-19 01:10:04', 'Admin PatiKab', '2024-08-19 01:10:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `my_admin_group_users`
--

CREATE TABLE `my_admin_group_users` (
  `GroupUsersId` int(10) UNSIGNED NOT NULL,
  `GroupUsersGroupId` int(10) UNSIGNED NOT NULL,
  `GroupUsersUsersId` int(10) UNSIGNED NOT NULL,
  `GroupUsersCreatedAt` datetime DEFAULT NULL,
  `GroupUsersCreatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GroupUsersUpdatedAt` datetime DEFAULT NULL,
  `GroupUsersUpdatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `my_admin_group_users`
--

INSERT INTO `my_admin_group_users` (`GroupUsersId`, `GroupUsersGroupId`, `GroupUsersUsersId`, `GroupUsersCreatedAt`, `GroupUsersCreatedBy`, `GroupUsersUpdatedAt`, `GroupUsersUpdatedBy`) VALUES
(1, 1, 1, '2024-08-19 02:14:37', 'Admin PatiKab', '2024-08-19 02:14:37', NULL),
(2, 2, 1, '2024-08-19 02:24:02', 'Admin PatiKab', '2024-08-19 02:24:02', NULL);

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
(1, NULL, 'Master', '#', 1, 'settings-2', 1, '1', '2023-12-05 10:44:12', 'Admin PatiKab', '2024-10-02 11:39:03', 'Admin PatiKab'),
(2, 1, 'Tes', 'adminpanel/master/tes', 0, NULL, 1, '1', '2023-12-05 10:49:04', 'Admin PatiKab', '2023-12-05 10:49:04', NULL),
(3, NULL, 'Setting', '#', 1, 'settings-3', 2, '1', '2024-06-04 01:09:33', 'Admin PatiKab', '2024-10-02 11:39:03', 'Admin PatiKab'),
(6, 3, 'Kontak', 'adminpanel/setting/kontak', 0, '', 1, '1', '2024-10-02 12:02:40', 'Admin PatiKab', '2024-10-02 12:02:40', NULL),
(7, NULL, 'Server Activity', '#', 1, 'settings-3', 3, '1', '2024-11-06 14:20:50', 'Admin PatiKab', '2024-11-06 14:21:17', NULL),
(8, 7, 'active', 'adminpanel/activity-server/active', 0, '', 1, '1', '2024-11-06 14:21:17', 'Admin PatiKab', '2024-11-06 14:21:33', 'Admin PatiKab'),
(9, 7, 'completed', 'adminpanel/activity-server/inactive', 0, '', 2, '1', '2024-11-06 14:25:01', 'Admin PatiKab', '2024-11-06 14:25:01', NULL);

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
(13, 1, 7, '2024-11-06 14:21:47', 'Admin PatiKab', '2024-11-06 14:21:47', NULL),
(14, 1, 8, '2024-11-06 14:21:47', 'Admin PatiKab', '2024-11-06 14:21:47', NULL),
(15, 1, 9, '2024-11-06 14:25:24', 'Admin PatiKab', '2024-11-06 14:25:24', NULL);

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
(1, 'admin', NULL, NULL, 1, '2024-11-13 11:28:07', '2023-11-10 09:14:24', '2023-11-10 09:14:25', NULL);

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
-- Indexes for table `log_masuk`
--
ALTER TABLE `log_masuk`
  ADD PRIMARY KEY (`LogId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `my_admin_group`
--
ALTER TABLE `my_admin_group`
  ADD PRIMARY KEY (`GroupId`) USING BTREE;

--
-- Indexes for table `my_admin_group_permission`
--
ALTER TABLE `my_admin_group_permission`
  ADD PRIMARY KEY (`GroupPermissionId`) USING BTREE,
  ADD KEY `auth_permissions_users_user_id_foreign` (`GroupPermissionGroupId`) USING BTREE;

--
-- Indexes for table `my_admin_group_users`
--
ALTER TABLE `my_admin_group_users`
  ADD PRIMARY KEY (`GroupUsersId`) USING BTREE,
  ADD KEY `auth_group_user_id_foreign` (`GroupUsersGroupId`) USING BTREE,
  ADD KEY `foreignkey_users_id` (`GroupUsersUsersId`) USING BTREE;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_identities`
--
ALTER TABLE `auth_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `my_admin_group`
--
ALTER TABLE `my_admin_group`
  MODIFY `GroupId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `my_admin_group_permission`
--
ALTER TABLE `my_admin_group_permission`
  MODIFY `GroupPermissionId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `my_admin_group_users`
--
ALTER TABLE `my_admin_group_users`
  MODIFY `GroupUsersId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `my_admin_menu`
--
ALTER TABLE `my_admin_menu`
  MODIFY `MenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `my_admin_users_menu`
--
ALTER TABLE `my_admin_users_menu`
  MODIFY `UsersMenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
