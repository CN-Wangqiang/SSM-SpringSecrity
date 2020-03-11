/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 11/03/2020 11:10:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
COMMIT;

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` varchar(32) NOT NULL,
  `travellerId` varchar(32) NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
BEGIN;
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(32) NOT NULL,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(255) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  `memberId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '产品管理', '/product');
INSERT INTO `permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '查看日志', '/sysLog/findAll.do');
INSERT INTO `permission` VALUES ('32e064086dba437bab3545439a1d7503', '订单管理', '/orders');
INSERT INTO `permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '用户管理', '/user');
INSERT INTO `permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '角色管理', '/role');
INSERT INTO `permission` VALUES ('9c15518d7f07411289766436b9874e30', '添加用户', '/user/save.do');
INSERT INTO `permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '添加角色', '/role/save.do');
INSERT INTO `permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '添加订单', '/orders/save.do');
INSERT INTO `permission` VALUES ('ed1e3f06673248679130e006a2baa916', '添加产品', '/product/save.do');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NULL DEFAULT NULL,
  `productPrice` decimal(10,0) DEFAULT NULL,
  `productDesc` varchar(255) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2019-07-28 15:22:22', 1800, '魔都我来了', 0);
INSERT INTO `product` VALUES ('26a55b228d1f4367a60c2db5834909c9', '123', '广东一日游', '北京', '2020-03-20 07:35:00', 9999, '无', 1);
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2019-06-28 15:22:22', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2019-08-28 15:22:22', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('b3ac5d7c57604a31a0159b6ed6a24c89', 'asdasd', '武汉一日游', '北京', '2020-03-09 22:20:00', 9999, '', 1);
INSERT INTO `product` VALUES ('c2ae310f5b67491eaa0dc1093f20258d', '123', '北京一日游', '北京', '2020-03-07 01:35:00', 9999, '无', 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', 'ADMIN', '最高管理员');
INSERT INTO `role` VALUES ('2', 'SYSTEM', '系统管理员');
INSERT INTO `role` VALUES ('3', 'BUSINESS', '业务管理员');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '1');
INSERT INTO `role_permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '1');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', '1');
INSERT INTO `role_permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '1');
INSERT INTO `role_permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '1');
INSERT INTO `role_permission` VALUES ('9c15518d7f07411289766436b9874e30', '1');
INSERT INTO `role_permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '1');
INSERT INTO `role_permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '1');
INSERT INTO `role_permission` VALUES ('ed1e3f06673248679130e006a2baa916', '1');
INSERT INTO `role_permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '2');
INSERT INTO `role_permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '2');
INSERT INTO `role_permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '2');
INSERT INTO `role_permission` VALUES ('9c15518d7f07411289766436b9874e30', '2');
INSERT INTO `role_permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '2');
INSERT INTO `role_permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '3');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', '3');
INSERT INTO `role_permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '3');
INSERT INTO `role_permission` VALUES ('ed1e3f06673248679130e006a2baa916', '3');
COMMIT;

-- ----------------------------
-- Table structure for sysLog
-- ----------------------------
DROP TABLE IF EXISTS `sysLog`;
CREATE TABLE `sysLog` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NULL DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysLog
-- ----------------------------
BEGIN;
INSERT INTO `sysLog` VALUES (1, '2019-08-28 15:22:22', 'admin', '0.0.0.0', '/product', 10, 'get');
INSERT INTO `sysLog` VALUES (2, '2019-08-28 15:22:22', 'admin', '0.0.0.0', '/product', 10, 'get');
INSERT INTO `sysLog` VALUES (3, '2019-08-28 15:22:22', 'admin', '0.0.0.0', '/product', 10, 'get');
INSERT INTO `sysLog` VALUES (4, '2020-03-11 02:23:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 99, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (5, '2020-03-11 02:25:41', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 33, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (6, '2020-03-11 02:25:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `sysLog` VALUES (7, '2020-03-11 02:25:55', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (8, '2020-03-11 02:25:57', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 61, '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `sysLog` VALUES (9, '2020-03-11 02:26:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 48, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `sysLog` VALUES (10, '2020-03-11 02:26:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 37, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `sysLog` VALUES (11, '2020-03-11 02:26:16', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 26, '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `sysLog` VALUES (12, '2020-03-11 02:26:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (13, '2020-03-11 02:26:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
COMMIT;

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
BEGIN;
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'admin@123.com', 'admin', '$2a$10$USsAiSx01KKKRnV4ajRmFOEqkXYXdcT06jIiIRvfPJVMLi7wyqlKe', '18888888888', 1);
INSERT INTO `users` VALUES ('9a30379f75cc4de7ac655f9e7be25b88', 'business@123.com', 'business', '$2a$10$kHcVIIDY0UksxgBq2UaE2.awIuc1kFhGq3pbywR7oRpeAwSGrG4.a', '17777777777', 1);
INSERT INTO `users` VALUES ('9dcb93d9ff7d41a382eb6795f2b58be5', 'system@123.com', 'system', '$2a$10$ysdSJx6aKUVubfUmIf1FkO/R7de/VyIHzBFHXFbtqYg/cWwFiaGtG', '155555555555', 1);
COMMIT;

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
BEGIN;
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('9dcb93d9ff7d41a382eb6795f2b58be5', '2');
INSERT INTO `users_role` VALUES ('1', '3');
INSERT INTO `users_role` VALUES ('9a30379f75cc4de7ac655f9e7be25b88', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
