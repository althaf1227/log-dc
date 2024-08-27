/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : admin-ci4

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 21/08/2024 10:40:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_groups_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_groups_users_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_users
-- ----------------------------
INSERT INTO `auth_groups_users` VALUES (1, 1, 'admin', '2023-11-10 09:14:24');
INSERT INTO `auth_groups_users` VALUES (2, 2, 'opd', '2024-08-19 14:21:11');
INSERT INTO `auth_groups_users` VALUES (3, 3, 'opd', '2024-08-19 14:23:02');
INSERT INTO `auth_groups_users` VALUES (6, 18, 'opd', '2024-08-20 11:54:16');
INSERT INTO `auth_groups_users` VALUES (7, 19, 'opd', '2024-08-20 12:27:26');
INSERT INTO `auth_groups_users` VALUES (8, 20, 'opd', '2024-08-20 16:59:16');

-- ----------------------------
-- Table structure for auth_identities
-- ----------------------------
DROP TABLE IF EXISTS `auth_identities`;
CREATE TABLE `auth_identities`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expires` datetime NULL DEFAULT NULL,
  `extra` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `force_reset` tinyint(1) NOT NULL DEFAULT 0,
  `last_used_at` datetime NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_secret`(`type` ASC, `secret` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_identities
-- ----------------------------
INSERT INTO `auth_identities` VALUES (1, 1, 'email_password', 'Admin PatiKab', 'patikab@gmail.com', '$2y$12$5LlLNKiIwdvhl.8oVSzypeM/J7Itmaiq5LP26OUly2mvQQB0jEGcK', NULL, NULL, 0, '2024-08-20 16:51:28', '2023-11-10 09:14:24', '2024-08-20 16:51:28');
INSERT INTO `auth_identities` VALUES (2, 2, 'email_password', 'Kominfo', 'kominfo@gmail.com', '$2y$12$951j2nstOHqZeXNfLcLYZe/hMBHdYcPu.RMV.P1qlgwoiOxtcPDEi', NULL, NULL, 0, NULL, '2024-08-19 14:21:10', '2024-08-20 08:59:35');
INSERT INTO `auth_identities` VALUES (3, 3, 'email_password', 'Dpmptsp', 'ptsp@gmail.com', '$2y$12$jYPXspN/D9bFJlibjGyWJOVKU3u96Gbl0QLQCxZIRwYMYQxl/jpe6', NULL, NULL, 0, NULL, '2024-08-19 14:23:01', '2024-08-19 14:23:02');
INSERT INTO `auth_identities` VALUES (11, 18, 'email_password', 'DPUTR', 'dputr@gmail.com', '$2y$12$D9ExxuPCBlKduTA7ZVBm0.hTewDsjm1OUzhrOrBgEuwf2OznciVni', NULL, NULL, 0, '2024-08-20 17:27:28', '2024-08-20 11:54:15', '2024-08-20 17:27:28');
INSERT INTO `auth_identities` VALUES (12, 19, 'email_password', 'Kepala OPD', 'frontoffice@gmail.com', '$2y$12$cgJyV9QN9uZQ7Q0uPwp4.eqXUD9xihyYsN0KmOY4DtLfZ9S9Ms4rS', NULL, NULL, 0, NULL, '2024-08-20 12:27:25', '2024-08-20 12:30:50');
INSERT INTO `auth_identities` VALUES (13, 20, 'email_password', 'Operator', 'operator@gmail.com', '$2y$12$SkKYEZMRUI.DmwCcYWKIwOk.ygsiXjns76igOvKpTzxHhILQA2eGS', NULL, NULL, 0, NULL, '2024-08-20 16:59:15', '2024-08-20 16:59:16');

-- ----------------------------
-- Table structure for auth_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE `auth_logins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_type_identifier`(`id_type` ASC, `identifier` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_logins
-- ----------------------------
INSERT INTO `auth_logins` VALUES (1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-19 15:12:34', 1);
INSERT INTO `auth_logins` VALUES (2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-19 17:20:14', 1);
INSERT INTO `auth_logins` VALUES (3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-20 08:06:48', 1);
INSERT INTO `auth_logins` VALUES (4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'dputr@gmail.com', 18, '2024-08-20 16:50:52', 1);
INSERT INTO `auth_logins` VALUES (5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'patikab@gmail.com', 1, '2024-08-20 16:51:28', 1);
INSERT INTO `auth_logins` VALUES (6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'dputr@gmail.com', 18, '2024-08-20 17:04:06', 1);
INSERT INTO `auth_logins` VALUES (7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'dputr@gmail.com', NULL, '2024-08-20 17:25:20', 0);
INSERT INTO `auth_logins` VALUES (8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'dputr@gmail.com', 18, '2024-08-20 17:25:56', 1);
INSERT INTO `auth_logins` VALUES (9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'email_password', 'dputr@gmail.com', 18, '2024-08-20 17:27:28', 1);

-- ----------------------------
-- Table structure for auth_permissions_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_permissions_users`;
CREATE TABLE `auth_permissions_users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_permissions_users_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 346 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permissions_users
-- ----------------------------
INSERT INTO `auth_permissions_users` VALUES (1, 1, 'adminpanel/user-management/group.create', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (2, 1, 'adminpanel/user-management/group.read', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (3, 1, 'adminpanel/user-management/group.update', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (4, 1, 'adminpanel/user-management/group.delete', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (5, 1, 'adminpanel/user-management/permission.create', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (6, 1, 'adminpanel/user-management/permission.read', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (7, 1, 'adminpanel/user-management/permission.update', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (8, 1, 'adminpanel/user-management/permission.delete', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (9, 1, 'adminpanel/user-management/users.create', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (10, 1, 'adminpanel/user-management/users.read', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (11, 1, 'adminpanel/user-management/users.update', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (12, 1, 'adminpanel/user-management/users.delete', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (13, 1, 'adminpanel/user-management/menu.create', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (14, 1, 'adminpanel/user-management/menu.read', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (15, 1, 'adminpanel/user-management/menu.update', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (16, 1, 'adminpanel/user-management/menu.delete', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (17, 1, 'adminpanel/user-management/users-menu.create', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (18, 1, 'adminpanel/user-management/users-menu.read', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (19, 1, 'adminpanel/user-management/users-menu.update', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (20, 1, 'adminpanel/user-management/users-menu.delete', '2023-11-10 09:57:15', NULL);
INSERT INTO `auth_permissions_users` VALUES (90, 2, 'adminpanel/master/tes.create', '2024-08-20 12:19:20', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (91, 2, 'adminpanel/master/tes.read', '2024-08-20 12:19:20', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (92, 2, 'adminpanel/master/tes.update', '2024-08-20 12:19:20', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (93, 2, 'adminpanel/master/tes.delete', '2024-08-20 12:19:20', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (330, 3, 'adminpanel/master/tes.create', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (331, 3, 'adminpanel/master/tes.read', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (332, 3, 'adminpanel/master/tes.update', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (333, 3, 'adminpanel/master/tes.delete', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (334, 18, 'adminpanel/master/tes.create', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (335, 18, 'adminpanel/master/tes.read', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (336, 18, 'adminpanel/master/tes.update', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (337, 18, 'adminpanel/master/tes.delete', '2024-08-20 12:27:24', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (338, 19, 'adminpanel/master/tes.create', '2024-08-20 12:27:26', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (339, 19, 'adminpanel/master/tes.read', '2024-08-20 12:27:26', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (340, 19, 'adminpanel/master/tes.update', '2024-08-20 12:27:26', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (341, 19, 'adminpanel/master/tes.delete', '2024-08-20 12:27:26', '2024-08-20 16:59:14');
INSERT INTO `auth_permissions_users` VALUES (342, 20, 'adminpanel/master/tes.create', '2024-08-20 16:59:16', NULL);
INSERT INTO `auth_permissions_users` VALUES (343, 20, 'adminpanel/master/tes.read', '2024-08-20 16:59:16', NULL);
INSERT INTO `auth_permissions_users` VALUES (344, 20, 'adminpanel/master/tes.update', '2024-08-20 16:59:16', NULL);
INSERT INTO `auth_permissions_users` VALUES (345, 20, 'adminpanel/master/tes.delete', '2024-08-20 16:59:16', NULL);

-- ----------------------------
-- Table structure for auth_remember_tokens
-- ----------------------------
DROP TABLE IF EXISTS `auth_remember_tokens`;
CREATE TABLE `auth_remember_tokens`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashedValidator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `selector`(`selector` ASC) USING BTREE,
  INDEX `auth_remember_tokens_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_remember_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for auth_token_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_token_logins`;
CREATE TABLE `auth_token_logins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_type_identifier`(`id_type` ASC, `identifier` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_token_logins
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1701069642, 1);
INSERT INTO `migrations` VALUES (2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1701069643, 1);
INSERT INTO `migrations` VALUES (3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1701069643, 1);

-- ----------------------------
-- Table structure for my_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_menu`;
CREATE TABLE `my_admin_menu`  (
  `MenuId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `MenuParentId` int NULL DEFAULT NULL,
  `MenuName` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuUrl` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuHasSubmenu` tinyint NOT NULL DEFAULT 0,
  `MenuIcon` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuOrder` int NULL DEFAULT NULL,
  `MenuIsShow` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuCreatedAt` datetime NULL DEFAULT NULL,
  `MenuCreatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuUpdatedAt` datetime NULL DEFAULT NULL,
  `MenuUpdatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MenuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_admin_menu
-- ----------------------------
INSERT INTO `my_admin_menu` VALUES (1, NULL, 'Master', '#', 1, NULL, 2, '1', '2023-12-05 10:44:12', 'Admin PatiKab', '2023-12-05 10:49:04', NULL);
INSERT INTO `my_admin_menu` VALUES (2, 1, 'Tes', 'adminpanel/master/tes', 0, NULL, 1, '1', '2023-12-05 10:49:04', 'Admin PatiKab', '2023-12-05 10:49:04', NULL);

-- ----------------------------
-- Table structure for my_admin_users_menu
-- ----------------------------
DROP TABLE IF EXISTS `my_admin_users_menu`;
CREATE TABLE `my_admin_users_menu`  (
  `UsersMenuId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `UsersMenuUsersId` int UNSIGNED NULL DEFAULT NULL,
  `UsersMenuMenuId` int UNSIGNED NULL DEFAULT NULL,
  `UsersMenuCreatedAt` datetime NULL DEFAULT NULL,
  `UsersMenuCreatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UsersMenuUpdatedAt` datetime NULL DEFAULT NULL,
  `UsersMenuUpdatedBy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UsersMenuId`) USING BTREE,
  UNIQUE INDEX `UsersMenuUsersId`(`UsersMenuUsersId` ASC, `UsersMenuMenuId` ASC) USING BTREE,
  INDEX `UsersMenuMenuId`(`UsersMenuMenuId` ASC) USING BTREE,
  CONSTRAINT `my_admin_users_menu_ibfk_1` FOREIGN KEY (`UsersMenuUsersId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `my_admin_users_menu_ibfk_2` FOREIGN KEY (`UsersMenuMenuId`) REFERENCES `my_admin_menu` (`MenuId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_admin_users_menu
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'string',
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'Config\\App', 'siteName', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (2, 'Config\\App', 'siteNameAlias', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (3, 'Config\\App', 'siteNameFull', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (4, 'Config\\App', 'siteDescription', 'MyAdmin', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (5, 'Config\\App', 'siteVersion', '1.2', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (6, 'Config\\App', 'siteYear', '2023', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (7, 'Config\\App', 'siteLogo', '', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');
INSERT INTO `settings` VALUES (8, 'Config\\App', 'siteCopyRight', 'Diskominfo Pati', 'string', NULL, '2023-11-28 05:23:58', '2023-11-28 05:23:58');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_active` datetime NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', NULL, NULL, 1, '2024-08-20 17:03:25', '2023-11-10 09:14:24', '2023-11-10 09:14:25', NULL);
INSERT INTO `users` VALUES (2, 'kominfo', NULL, NULL, 1, NULL, '2024-08-19 14:21:10', '2024-08-19 14:21:12', NULL);
INSERT INTO `users` VALUES (3, 'dpmptsp', NULL, NULL, 1, NULL, '2024-08-19 14:23:00', '2024-08-19 14:23:02', NULL);
INSERT INTO `users` VALUES (18, 'dputr@gmail.com', NULL, NULL, 1, '2024-08-20 17:27:29', '2024-08-20 11:54:15', '2024-08-20 11:54:16', NULL);
INSERT INTO `users` VALUES (19, 'frontoffice@gmail.com', NULL, NULL, 1, NULL, '2024-08-20 12:27:24', '2024-08-20 12:27:26', NULL);
INSERT INTO `users` VALUES (20, 'operator@gmail.com', NULL, NULL, 1, NULL, '2024-08-20 16:59:14', '2024-08-20 16:59:16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
