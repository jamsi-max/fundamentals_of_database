-- Повторил и доработал учебную базу "социальная сеть"
-- Заполнил все таблицы с помощью сервиса ниже скрип прилагаю 
-- С командами CRUD потренеровался

-- Проект подобрал начал делать, но аналогов такого не нашёл
-- Идея в том что бы создать сервис наподобе госуслуг который бы мог оказывать помощь
-- при заключении простых договоров между физ и юр лицамиполностью идею
-- распишу помре готовности так проще наверное будде


DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_inx` (`phone`),
  KEY `firstname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users VALUES ('1','Eleanora','Yundt','sauer.jackson@example.net','26a6cf94d5a5a415d9def327105441989e553ed5','651-409-5040',0),
('2','Precious','Blick','graham.cleora@example.net','50d332a225695c61bc2250b30909f0b441d00c47','163-198-5529',1),
('3','Karson','Luettgen','pbartell@example.org','c8fcfa9eabf6e754b4542017332dda146aa37f78','1-757-038-75',1),
('4','Ottilie','Schmeler','jairo.langworth@example.com','ab7135ce5fcb2b5990636322ed08072ebc2f1c3f','659.003.7630',0),
('5','Michel','Reynolds','rosie.mckenzie@example.net','87421a06b4d109a07ff3401796f21e0dca5f991b','322.431.7299',1),
('6','Chesley','Bednar','frohan@example.org','c28e1832d57ccd0ec2cf553941e88cab05791769','(835)811-521',0),
('7','Mallory','Rosenbaum','koss.isai@example.com','baff47f9b0d313bab7fc65216265a2dc0cd73b9c','1-015-529-03',1),
('8','Mark','Jacobson','wemmerich@example.com','b4e8ea78eb02d1f0d8b2250f52b569fea2d9b4bc','520-595-0637',1),
('9','Stacy','Collins','ryan.brionna@example.org','b4a715f4f507a6b86947d63fbeeebc848a590714','06798766157',0),
('10','Georgette','Lockman','tyrese.kshlerin@example.org','88988fe8c0e5300b8b99d31bc8ca30aa577c0687','05864349275',0); 

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
 
  CONSTRAINT `users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1',NULL,'1972-02-05','1',NULL,'1990-08-30 07:59:40'),
('2',NULL,'2002-01-22','2',NULL,'1977-10-05 23:16:10'),
('3',NULL,'1984-01-21','3',NULL,'1997-07-15 09:15:49'),
('4',NULL,'1996-08-08','4',NULL,'1982-06-01 05:40:16'),
('5',NULL,'2018-06-04','5',NULL,'1974-05-25 02:59:37'),
('6',NULL,'2019-06-28','6',NULL,'1984-08-20 12:38:45'),
('7',NULL,'2019-07-12','7',NULL,'2015-10-08 07:14:34'),
('8',NULL,'1984-05-29','8',NULL,'1973-09-15 23:45:23'),
('9',NULL,'1973-11-18','9',NULL,'1983-01-23 00:18:12'),
('10',NULL,'2005-12-17','10',NULL,'1980-09-28 05:33:52'); 

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` VALUES ('1','1','1','Ipsa possimus eaque dolore. Amet consequatur nemo consequatur harum atque cupiditate. Voluptate libero quas voluptas voluptatibus corrupti reiciendis. Aliquid sed hic tempore non dolorum.','1995-05-31 18:44:17'),
('2','2','2','Exercitationem accusamus ex suscipit rerum neque non sit laboriosam. Officiis asperiores sapiente occaecati. Id cumque earum sunt doloremque. Et corporis ad exercitationem est corporis illum. Nihil dolorem eum rem aut culpa est fugit.','1971-04-23 20:14:42'),
('3','3','3','Aut consequatur error qui qui non ex ipsam voluptas. Aut dolore distinctio incidunt consequatur. Id quas eum similique. Iure sint aspernatur repellendus dolorem eligendi in fugit ut.','2009-07-16 04:57:38'),
('4','4','4','Distinctio magni qui blanditiis nemo enim eligendi aperiam autem. Sapiente deserunt ut et accusamus et. Veritatis autem dolor voluptate non eum labore. Quibusdam impedit tempore error atque deserunt.','2017-06-08 15:02:43'),
('5','5','5','Atque omnis quo porro in molestias ipsum. Et quae quidem accusamus unde illo. Totam autem ullam laborum laborum minima.','2015-09-20 18:59:40'),
('6','6','6','Blanditiis voluptate nisi velit alias sunt reprehenderit. Tempora ea omnis reiciendis autem nobis laudantium. Amet doloremque praesentium quo neque corrupti id nihil laborum. Molestiae ipsa quia et quia natus repellendus quo.','1983-02-03 03:07:54'),
('7','7','7','Fugit qui voluptatibus fugit commodi tempore accusamus. Asperiores unde repellendus omnis pariatur omnis maiores inventore. Culpa fugiat sit deserunt enim ipsa.','2001-02-20 03:10:55'),
('8','8','8','Nemo excepturi saepe quisquam enim dolor et quis. Suscipit tempora quis voluptatem qui excepturi deserunt doloribus. Incidunt saepe sit expedita voluptas a qui. Modi consequatur ea velit ad voluptas.','1983-08-31 04:54:05'),
('9','9','9','Quam reiciendis consequatur id temporibus dolorem repudiandae. Ut vero architecto tempora non quam ipsa ullam. Quis numquam esse qui minima.','1975-05-01 11:27:08'),
('10','10','10','Id atque omnis sequi enim nam. Nihil iure in voluptates et dolores. Rerum ratione voluptatem iste nesciunt rerum a.','2002-12-10 00:06:37'); 

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requsted','approved','declined','unfriended') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','1','declined','1983-01-09 08:52:57','1975-07-01 05:07:38'),
('2','2','approved','1992-02-20 23:26:22','1973-02-05 00:30:05'),
('3','3','unfriended','1998-02-23 12:25:09','1994-09-30 23:39:27'),
('4','4','approved','2010-02-14 01:52:02','1995-11-13 15:15:49'),
('5','5','approved','1985-10-11 03:25:03','2007-09-06 06:18:43'),
('6','6','declined','2012-12-26 07:29:10','1995-05-02 03:23:26'),
('7','7','declined','1972-07-25 02:10:01','1977-06-23 01:10:37'),
('8','8','requsted','2002-08-04 07:49:40','1972-02-02 07:40:56'),
('9','9','unfriended','1981-01-26 16:27:51','2014-12-25 15:53:13'),
('10','10','declined','1989-05-10 09:24:42','1993-10-19 06:06:12'); 


DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('1','ut','1'),
('2','voluptatum','2'),
('3','molestias','3'),
('4','iste','4'),
('5','eligendi','5'),
('6','et','6'),
('7','harum','7'),
('8','eos','8'),
('9','eos','9'),
('10','omnis','10'); 

DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'); 

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','vel','2008-07-13 17:00:00'),
('2','ut','2005-11-21 19:13:31'),
('3','et','1983-08-09 09:21:40'),
('4','libero','2010-06-27 00:33:57'),
('5','ut','1974-01-10 02:55:08'),
('6','qui','1997-03-29 11:54:33'),
('7','labore','2016-06-16 04:40:39'),
('8','hic','1993-02-11 12:56:28'),
('9','unde','2002-01-06 04:49:15'),
('10','tempore','1980-08-24 23:11:08'); 

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Et quas voluptas consequatur consequuntur porro est ut. Quaerat ipsam quae nisi accusantium quia. Aspernatur quasi rem excepturi ipsa. Quas est ab qui labore ad ut labore.','fuga','5044965',NULL,'1977-08-08 23:31:59'),
('2','2','2','Omnis eaque odit aut dolorem quas fugit quasi. Dolor quisquam id repudiandae suscipit est. Totam consectetur eligendi excepturi doloribus praesentium qui.','porro','42224739',NULL,'2001-02-26 20:10:47'),
('3','3','3','Et id dolores porro ut. Harum illum beatae nihil illum inventore hic modi. Laborum sunt iure qui similique fugiat doloribus. Aliquid est molestiae eos.','asperiores','9075809',NULL,'2014-04-09 05:13:46'),
('4','4','4','Tenetur et aspernatur doloribus enim magni. In veniam aut nisi ab repellendus assumenda debitis. Doloremque rerum ab recusandae recusandae delectus. Iure expedita veritatis unde rerum architecto placeat ut quia.','harum','5288',NULL,'1988-06-18 00:36:41'),
('5','5','5','Ab omnis vel aliquam cupiditate. Corporis error accusamus enim expedita quas odio et. Atque voluptas aut quos fugit.','aut','7475283',NULL,'2013-03-01 09:12:00'),
('6','6','6','Ex cum eaque deserunt hic aut soluta. Aut aliquid ducimus mollitia. Voluptas consequatur minima quibusdam vero quia voluptatem.','delectus','0',NULL,'2016-03-20 15:00:41'),
('7','7','7','Minus est voluptas deleniti. Sunt quae qui soluta ad omnis numquam possimus. A corrupti et iusto minima molestias dolorem. Deserunt ut ad et doloribus quia qui consequatur.','nisi','8',NULL,'1974-02-13 16:26:18'),
('8','8','8','Eligendi at qui eaque inventore sit reiciendis. Sed quae sequi quisquam quae corporis natus qui. Ea qui provident mollitia quasi. Et itaque mollitia et.','qui','59933',NULL,'1989-01-24 19:28:49'),
('9','9','9','Omnis repellendus quod sit non. Itaque neque asperiores et quis et magnam excepturi. Sed quos laboriosam odit nulla consequuntur praesentium at dignissimos.','assumenda','7',NULL,'2012-10-04 18:13:05'),
('10','10','10','Atque qui beatae aliquam optio cum nulla qui nobis. Aut repellendus quas eligendi provident. Aut totam fugiat praesentium consequuntur.','aspernatur','8872',NULL,'1993-10-27 23:37:04'); 


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','2004-01-21 02:57:09'),
('2','2','2','1986-08-21 15:23:53'),
('3','3','3','1973-01-07 04:07:14'),
('4','4','4','1973-06-12 08:10:47'),
('5','5','5','1976-11-04 13:39:44'),
('6','6','6','1978-10-28 14:23:58'),
('7','7','7','1976-11-24 13:51:41'),
('8','8','8','1974-02-11 04:51:34'),
('9','9','9','1981-11-22 20:42:43'),
('10','10','10','1993-02-12 23:38:56'); 








DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `photo_albums` VALUES ('1','nisi','1'),
('2','et','2'),
('3','maxime','3'),
('4','quis','4'),
('5','dolorum','5'),
('6','est','6'),
('7','dolores','7'),
('8','illo','8'),
('9','molestiae','9'),
('10','aut','10'); 
ALTER TABLE profiles ADD CONSTRAINT profiles_id_fk FOREIGN KEY (photo_id) REFERENCES photo_albums(id);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'); 


