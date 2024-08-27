/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 11.3.2-MariaDB : Database - shield
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_groups_users` */

DROP TABLE IF EXISTS `auth_groups_users`;

CREATE TABLE `auth_groups_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_groups_users` */

insert  into `auth_groups_users`(`id`,`user_id`,`group`,`created_at`) values (1,1,'admin','2023-11-10 09:14:24');

/*Table structure for table `auth_identities` */

DROP TABLE IF EXISTS `auth_identities`;

CREATE TABLE `auth_identities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `secret2` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `force_reset` tinyint(1) NOT NULL DEFAULT 0,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_secret` (`type`,`secret`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_identities` */

insert  into `auth_identities`(`id`,`user_id`,`type`,`name`,`secret`,`secret2`,`expires`,`extra`,`force_reset`,`last_used_at`,`created_at`,`updated_at`) values (1,1,'email_password','Admin PatiKab','patikab@gmail.com','$2y$12$5LlLNKiIwdvhl.8oVSzypeM/J7Itmaiq5LP26OUly2mvQQB0jEGcK',NULL,NULL,0,'2023-11-28 05:56:42','2023-11-10 09:14:24','2023-11-28 05:56:42');

/*Table structure for table `auth_logins` */

DROP TABLE IF EXISTS `auth_logins`;

CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_logins` */

/*Table structure for table `auth_permissions_users` */

DROP TABLE IF EXISTS `auth_permissions_users`;

CREATE TABLE `auth_permissions_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_permissions_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permissions_users` */

insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (1,1,'adminpanel/user-management/group.create','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (2,1,'adminpanel/user-management/group.read','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (3,1,'adminpanel/user-management/group.update','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (4,1,'adminpanel/user-management/group.delete','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (5,1,'adminpanel/user-management/permission.create','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (6,1,'adminpanel/user-management/permission.read','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (7,1,'adminpanel/user-management/permission.update','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (8,1,'adminpanel/user-management/permission.delete','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (9,1,'adminpanel/user-management/users.create','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (10,1,'adminpanel/user-management/users.read','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (11,1,'adminpanel/user-management/users.update','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (12,1,'adminpanel/user-management/users.delete','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (13,1,'adminpanel/user-management/menu.create','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (14,1,'adminpanel/user-management/menu.read','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (15,1,'adminpanel/user-management/menu.update','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (16,1,'adminpanel/user-management/menu.delete','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (17,1,'adminpanel/user-management/users-menu.create','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (18,1,'adminpanel/user-management/users-menu.read','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (19,1,'adminpanel/user-management/users-menu.update','2023-11-10 09:57:15');
insert  into `auth_permissions_users`(`id`,`user_id`,`permission`,`created_at`) values (20,1,'adminpanel/user-management/users-menu.delete','2023-11-10 09:57:15');

/*Table structure for table `auth_remember_tokens` */

DROP TABLE IF EXISTS `auth_remember_tokens`;

CREATE TABLE `auth_remember_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `auth_remember_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_remember_tokens` */

/*Table structure for table `auth_token_logins` */

DROP TABLE IF EXISTS `auth_token_logins`;

CREATE TABLE `auth_token_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_token_logins` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values (1,'2020-12-28-223112','CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables','default','CodeIgniter\\Shield',1717990540,1);
insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values (2,'2021-07-04-041948','CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable','default','CodeIgniter\\Settings',1717990540,1);
insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values (3,'2021-11-14-143905','CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn','default','CodeIgniter\\Settings',1717990540,1);

/*Table structure for table `my_admin_menu` */

DROP TABLE IF EXISTS `my_admin_menu`;

CREATE TABLE `my_admin_menu` (
  `MenuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `MenuUpdatedBy` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`MenuId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `my_admin_menu` */

insert  into `my_admin_menu`(`MenuId`,`MenuParentId`,`MenuName`,`MenuUrl`,`MenuHasSubmenu`,`MenuIcon`,`MenuOrder`,`MenuIsShow`,`MenuCreatedAt`,`MenuCreatedBy`,`MenuUpdatedAt`,`MenuUpdatedBy`) values (1,NULL,'Master','#',1,NULL,2,'1','2023-12-05 10:44:12','Admin PatiKab','2023-12-05 10:49:04',NULL);
insert  into `my_admin_menu`(`MenuId`,`MenuParentId`,`MenuName`,`MenuUrl`,`MenuHasSubmenu`,`MenuIcon`,`MenuOrder`,`MenuIsShow`,`MenuCreatedAt`,`MenuCreatedBy`,`MenuUpdatedAt`,`MenuUpdatedBy`) values (2,1,'Tes','adminpanel/master/tes',0,NULL,1,'1','2023-12-05 10:49:04','Admin PatiKab','2023-12-05 10:49:04',NULL);

/*Table structure for table `my_admin_users_menu` */

DROP TABLE IF EXISTS `my_admin_users_menu`;

CREATE TABLE `my_admin_users_menu` (
  `UsersMenuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UsersMenuUsersId` int(10) unsigned DEFAULT NULL,
  `UsersMenuMenuId` int(10) unsigned DEFAULT NULL,
  `UsersMenuCreatedAt` datetime DEFAULT NULL,
  `UsersMenuCreatedBy` varchar(250) DEFAULT NULL,
  `UsersMenuUpdatedAt` datetime DEFAULT NULL,
  `UsersMenuUpdatedBy` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`UsersMenuId`),
  UNIQUE KEY `UsersMenuUsersId` (`UsersMenuUsersId`,`UsersMenuMenuId`),
  KEY `UsersMenuMenuId` (`UsersMenuMenuId`),
  CONSTRAINT `my_admin_users_menu_ibfk_1` FOREIGN KEY (`UsersMenuUsersId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `my_admin_users_menu_ibfk_2` FOREIGN KEY (`UsersMenuMenuId`) REFERENCES `my_admin_menu` (`MenuId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (1,'Config\\App','siteName','MyAdmin','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (2,'Config\\App','siteNameAlias','MyAdmin','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (3,'Config\\App','siteNameFull','MyAdmin','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (4,'Config\\App','siteDescription','MyAdmin','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (5,'Config\\App','siteVersion','1.2','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (6,'Config\\App','siteYear','2023','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (7,'Config\\App','siteLogo','','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');
insert  into `settings`(`id`,`class`,`key`,`value`,`type`,`context`,`created_at`,`updated_at`) values (8,'Config\\App','siteCopyRight','Diskominfo Pati','string',NULL,'2023-11-28 05:23:58','2023-11-28 05:23:58');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`status`,`status_message`,`active`,`last_active`,`created_at`,`updated_at`,`deleted_at`) values (1,'admin',NULL,NULL,1,'2023-11-24 09:56:38','2023-11-10 09:14:24','2023-11-10 09:14:25',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
