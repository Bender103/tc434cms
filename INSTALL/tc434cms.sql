/*
Navicat MySQL Data Transfer

Source Server         : localhost_xampp
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : tc434_web

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2012-12-08 19:52:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `newsid` int(10) NOT NULL,
  `comment` text NOT NULL,
  `accountId` int(10) NOT NULL DEFAULT '1337',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('57', '1', 'Nice ', '1', '2012-12-07 22:21:52');
INSERT INTO `comments` VALUES ('62', '1', 'Fixed Comment System, no more double post', '1', '2012-12-07 22:21:49');
INSERT INTO `comments` VALUES ('63', '1', 'cool', '1', '2012-12-06 20:54:23');

-- ----------------------------
-- Table structure for `community_slides`
-- ----------------------------
DROP TABLE IF EXISTS `community_slides`;
CREATE TABLE `community_slides` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `date` date NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of community_slides
-- ----------------------------
INSERT INTO `community_slides` VALUES ('1', 'Testing TrinityCMS at maximum capacity.', 'Testing TrinityCMS', '#', '2011-04-20', '4ZONJ2G8H02S1291403588642.jpg');
INSERT INTO `community_slides` VALUES ('2', 'Find us on TrinityCore.org.', 'Where to find us?', '#', '2011-04-20', '3A016YGNDN971281040709386.jpg');
INSERT INTO `community_slides` VALUES ('3', 'Check The Forum for the latest updates.', 'TrinityCMS Forum', '#', '2011-04-20', 'HXW8I6KL6MRK1290045863003.jpg');
INSERT INTO `community_slides` VALUES ('4', 'test', 'test', '#', '2011-04-20', 'TE943VAV1IVZ1290560963083.jpg');

-- ----------------------------
-- Table structure for `forum_blizzposts`
-- ----------------------------
DROP TABLE IF EXISTS `forum_blizzposts`;
CREATE TABLE `forum_blizzposts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `postid` int(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_blizzposts
-- ----------------------------
INSERT INTO `forum_blizzposts` VALUES ('1', 'thread', 'Bender', '1', '2012-12-07 22:22:30');
INSERT INTO `forum_blizzposts` VALUES ('2', 'reply', 'Bender', '1', '2012-12-07 22:22:32');
INSERT INTO `forum_blizzposts` VALUES ('3', 'reply', 'Bender', '2', '2012-12-07 22:22:35');

-- ----------------------------
-- Table structure for `forum_categ`
-- ----------------------------
DROP TABLE IF EXISTS `forum_categ`;
CREATE TABLE `forum_categ` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_categ
-- ----------------------------
INSERT INTO `forum_categ` VALUES ('1', '1', 'TrinityCMS');

-- ----------------------------
-- Table structure for `forum_forums`
-- ----------------------------
DROP TABLE IF EXISTS `forum_forums`;
CREATE TABLE `forum_forums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL,
  `categ` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `locked` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_forums
-- ----------------------------
INSERT INTO `forum_forums` VALUES ('1', '1', '1', 'Announcement', 'blizzard', 'All important messages/announcements/informations regarding TrinityCMS will be posted here.', '1');
INSERT INTO `forum_forums` VALUES ('2', '2', '1', 'General Talk', 'general', 'You can talk anything you want here :)', '0');
INSERT INTO `forum_forums` VALUES ('3', '3', '1', 'Bugs', 'bugs', 'Post here all bugs you find.', '0');
INSERT INTO `forum_forums` VALUES ('4', '4', '1', 'Suggestions', 'suggestions', 'Post here your ideas regarding TrinityCMS.', '0');

-- ----------------------------
-- Table structure for `forum_replies`
-- ----------------------------
DROP TABLE IF EXISTS `forum_replies`;
CREATE TABLE `forum_replies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `threadid` int(10) NOT NULL,
  `content` text NOT NULL,
  `author` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `forumid` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_replies
-- ----------------------------
INSERT INTO `forum_replies` VALUES ('1', '1', 'Testing...', '1', '2012-12-07 22:23:23', '1', 'TrinityCMS Opened');
INSERT INTO `forum_replies` VALUES ('2', '1', 'Testing...', '1', '2012-12-07 22:23:20', '1', 'TrinityCMS Opened');
INSERT INTO `forum_replies` VALUES ('3', '3', '[u][code]cool[/code][/u]', '1', '2012-12-07 14:22:36', '1', 'TrinityCMS Updates');
INSERT INTO `forum_replies` VALUES ('4', '3', '[quote][u][i][b][ul]sdfsdfsd[/ul][/b][/i][/u][/quote]', '1', '2012-12-07 14:22:59', '1', 'TrinityCMS Updates');

-- ----------------------------
-- Table structure for `forum_threads`
-- ----------------------------
DROP TABLE IF EXISTS `forum_threads`;
CREATE TABLE `forum_threads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `forumid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` int(10) NOT NULL,
  `replies` int(10) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `content` text NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `has_blizz` tinyint(1) DEFAULT '0',
  `prefix` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_threads
-- ----------------------------
INSERT INTO `forum_threads` VALUES ('1', '1', 'TrinityCMS Opened', '1', '2', '58', '2011-04-19', 'Bla', '1', '1', 'none');
INSERT INTO `forum_threads` VALUES ('2', '2', 'demo', '1', '0', '5', '2011-04-20', ' [code]mm11[/code]<br />\r\n [quote]quote[/quote] [item=\\\"1234\\\" /]', '0', '0', 'none');
INSERT INTO `forum_threads` VALUES ('3', '1', 'TrinityCMS Updates', '1', '2', '8', '2011-04-20', 'Here I will post some updates : ', '0', '0', 'none');
INSERT INTO `forum_threads` VALUES ('4', '4', 'hehe, hi i cant wait this website', '1', '0', '5', '2011-04-21', 'Hi, i have the idea:<br />\r\n- Vote sistem<br />\r\n- Donation Sistem<br />\r\n- The admin panel and account panel.<br />\r\nYou can visit:<br />\r\nhttp://www.wowlcv.com<br />\r\nis a website in spanish but looks why this website (they use your projecy , idon\\\'t know). But it was idea. If you want, you can.', '0', '0', 'none');
INSERT INTO `forum_threads` VALUES ('5', '2', 'teszt', '1', '0', '1', '2012-12-07', 'árvízt&#369;r&#337; fúrógépül&#337;ke', '0', '0', 'none');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT 'TheAdriann',
  `class` varchar(255) NOT NULL DEFAULT 'Administrator',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('1', 'Media Page', 'The Media page has been temporary disabled.<br />\r\nCheck out the updates on the main page.', 'Bender', 'Administrator');
INSERT INTO `messages` VALUES ('2', 'Forums', 'The Forums are still in development.<br />\r\nCheck out the updates on the main page.', 'Bender', 'Administrator');
INSERT INTO `messages` VALUES ('3', 'Services Page', 'The Services page has been temporary disabled.<br />\r\nCheck out the updates on the main page.', 'Bender', 'Administrator');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL DEFAULT 'Unkown',
  `date` date NOT NULL,
  `content` text,
  `authorlnk` text,
  `contentlnk` text,
  `title` text,
  `comments` int(10) DEFAULT '0',
  `image` varchar(255) DEFAULT 'staff',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', 'Bender', '2011-04-22', '<p>Hey everyone, I\'m back. After a long time of sleeping I finally decided to continue this project.</p>\r\n<p>I don\'t know how much I will keep updating this project, but it depens on how much support you give me, thanks.</p>\r\nStay Tuned for Updates.', null, null, 'Back on DEV', '3', 'fix');

-- ----------------------------
-- Table structure for `slideshows`
-- ----------------------------
DROP TABLE IF EXISTS `slideshows`;
CREATE TABLE `slideshows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of slideshows
-- ----------------------------
INSERT INTO `slideshows` VALUES ('2', 'Back on DEV', 'I\'m back on developing this project...', 'traveling_rocket.jpg', '#');
INSERT INTO `slideshows` VALUES ('1', 'Updates soon', 'I\'m gonna post some updates soon...', 'draenei.jpg', '#');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) NOT NULL DEFAULT '0-0.jpg',
  `blizz` tinyint(1) DEFAULT '0',
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('7', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('1', 'blizzard.png', '0', 'blizz');
INSERT INTO `users` VALUES ('9', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('10', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('11', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('12', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('13', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('14', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('15', '0-0.jpg', '0', '');
INSERT INTO `users` VALUES ('8', '0-0.jpg', '0', '');
