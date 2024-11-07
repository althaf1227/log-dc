-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 02:14 AM
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
(1, 1, 'email_password', 'Admin PatiKab', 'patikab@gmail.com', '$2y$12$xKCmucnHA4J/hopckOfUUuJHOFR8dYrm4wLyC2YfXLDH147i4IRuS', NULL, NULL, 0, '2024-10-02 11:20:38', '2023-11-10 09:14:24', '2024-10-02 11:20:38');

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
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-06-04 01:01:07', 1),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-07-15 00:48:58', 1),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-17 09:19:49', 1),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-18 01:06:44', 1),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-18 11:00:23', 1),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-18 13:32:42', 1),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-19 00:16:44', 1),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-07 02:05:25', 0),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-07 02:06:00', 1),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-07 02:08:03', 1),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-08 02:28:01', 0),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-08 02:28:12', 0),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-08 02:28:33', 1),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:42:50', 0),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:43:22', 0),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:43:57', 0),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:46:31', 0),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:48:02', 0),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:48:46', 0),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:49:47', 0),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:50:06', 0),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:50:26', 0),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:51:51', 0),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:53:47', 0),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:53:54', 0),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:54:26', 0),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:55:24', 0),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:57:07', 0),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 00:57:19', 1),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 00:58:04', 0),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 00:58:17', 1),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 01:43:16', 0),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 01:43:36', 0),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 01:52:30', 1),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 01:53:05', 0),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 01:54:54', 1),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 02:07:06', 1),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 02:34:01', 1),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', NULL, '2024-09-11 11:55:32', 0),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-11 11:56:04', 1),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-09-13 11:00:52', 1),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-10-02 11:20:38', 1);

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
(1, 'Config\\App', 'siteName', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(2, 'Config\\App', 'siteNameAlias', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(3, 'Config\\App', 'siteNameFull', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(4, 'Config\\App', 'siteDescription', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(5, 'Config\\App', 'siteVersion', '1.2', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(6, 'Config\\App', 'siteYear', '2023', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(7, 'Config\\App', 'siteLogo', '', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58'),
(8, 'Config\\App', 'siteCopyRight', 'Diskominfo Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');

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
(1, 'admin', NULL, NULL, 1, '2024-11-06 14:56:51', '2023-11-10 09:14:24', '2023-11-10 09:14:25', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
-- AUTO_INCREMENT for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
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
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `my_admin_group_permission`
--
ALTER TABLE `my_admin_group_permission`
  ADD CONSTRAINT `foreignkey_permission_group_id` FOREIGN KEY (`GroupPermissionGroupId`) REFERENCES `my_admin_group` (`GroupId`);

--
-- Constraints for table `my_admin_group_users`
--
ALTER TABLE `my_admin_group_users`
  ADD CONSTRAINT `foreignkey_group_id` FOREIGN KEY (`GroupUsersGroupId`) REFERENCES `my_admin_group` (`GroupId`),
  ADD CONSTRAINT `foreignkey_users_id` FOREIGN KEY (`GroupUsersUsersId`) REFERENCES `users` (`id`);

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
