/*
 Navicat Premium Data Transfer

 Source Server         : anxinsu
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : anxinsu

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 29/03/2019 17:33:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `title` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `icon_cls` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '数据分析', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('1-1', '分析', NULL, NULL, '1');
INSERT INTO `sys_menu` VALUES ('1-2', '数据导出', NULL, NULL, '1');
INSERT INTO `sys_menu` VALUES ('10', '新闻管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('11', '数据维护', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('11-1', '权限管理', NULL, 'permission.jsp', '11');
INSERT INTO `sys_menu` VALUES ('11-2', '权限维护', NULL, 'permissions.jsp', '11');
INSERT INTO `sys_menu` VALUES ('12', '系统管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('13', '系统日志', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('14', '电子印章', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('14-1', '电子印章管理', NULL, NULL, '14');
INSERT INTO `sys_menu` VALUES ('14-1-1', '查看', NULL, NULL, '14-1');
INSERT INTO `sys_menu` VALUES ('14-1-2', '冻结', NULL, NULL, '14-1');
INSERT INTO `sys_menu` VALUES ('14-1-3', '解冻', NULL, NULL, '14-1');
INSERT INTO `sys_menu` VALUES ('14-2', '电子印章变动管理', NULL, NULL, '14');
INSERT INTO `sys_menu` VALUES ('14-3', '电子印章订单管理', NULL, NULL, '14');
INSERT INTO `sys_menu` VALUES ('14-4', '电子印迹管理', NULL, NULL, '14');
INSERT INTO `sys_menu` VALUES ('14-5', 'PDF眼前管理', NULL, NULL, '14');
INSERT INTO `sys_menu` VALUES ('2', '网点管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('2-1', '网点', NULL, NULL, '2');
INSERT INTO `sys_menu` VALUES ('3', '车辆管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('3-1', '信息核验', NULL, NULL, '3');
INSERT INTO `sys_menu` VALUES ('3-2', '检验安装', NULL, NULL, '3');
INSERT INTO `sys_menu` VALUES ('3-3', '领证', NULL, NULL, '3');
INSERT INTO `sys_menu` VALUES ('3-4', '备案信息审核', NULL, NULL, '3');
INSERT INTO `sys_menu` VALUES ('4', '专卖店管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('5', '车牌管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('6', '车辆过户管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('7', '挂失管理', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('8', '充电桩分局', NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES ('9', '报警管理', NULL, NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `menu_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
BEGIN;
INSERT INTO `sys_permissions` VALUES (1, '查看', '14-1');
INSERT INTO `sys_permissions` VALUES (2, '冻结', '14-1');
INSERT INTO `sys_permissions` VALUES (3, '解冻', '14-1');
INSERT INTO `sys_permissions` VALUES (4, '撤销', '14-1');
INSERT INTO `sys_permissions` VALUES (5, '变更管理员', '14-1');
INSERT INTO `sys_permissions` VALUES (6, '添加电子印章', '14-1');
INSERT INTO `sys_permissions` VALUES (7, 'ofd后台签章', '14-1');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(4) NOT NULL,
  `role_name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '分局');
INSERT INTO `sys_role` VALUES (3, '网点');
INSERT INTO `sys_role` VALUES (4, '专卖店');
INSERT INTO `sys_role` VALUES (5, '非机处');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `menu_id` varchar(500) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1,1-1,1-2,10,11,11-1,12,13,14,14-1,14-1-1,14-1-2,14-1-3,14-2,14-3,14-4,14-5,2,2-1,3,3-1,3-2,3-3,3-4,4,5,6,7,8,9');
INSERT INTO `sys_role_menu` VALUES ('2', '1,1-1,1-2,10,11,11-1');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '1,1-1,1-2,10,12,13,14,14-1,14-1-1,14-1-2,14-1-3,14-2,14-3,14-4,14-5');
INSERT INTO `sys_role_menu` VALUES ('5', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `rold_id` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '123456', NULL, '5');
INSERT INTO `sys_user` VALUES ('2', 'ypjfj', '123456', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for t_bike
-- ----------------------------
DROP TABLE IF EXISTS `t_bike`;
CREATE TABLE `t_bike` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `brand` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `user_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `chip_id` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '芯片id',
  `plate_id` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for t_chip
-- ----------------------------
DROP TABLE IF EXISTS `t_chip`;
CREATE TABLE `t_chip` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `code` varchar(30) COLLATE utf8_bin NOT NULL,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `update_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for t_plate
-- ----------------------------
DROP TABLE IF EXISTS `t_plate`;
CREATE TABLE `t_plate` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `code` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Procedure structure for func_get_split_string_total
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_get_split_string_total`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_get_split_string_total`(in f_string varchar(1000), in f_delimiter varchar(5), out totol int)
    DETERMINISTIC
BEGIN
  #Routine body goes here...
	set @total = 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
-- 	return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
	SELECT total;
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for func_split_string
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_split_string`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_split_string`(IN f_string VARCHAR(1000), IN f_dlimiter VARCHAR(5))
BEGIN
  #Routine body goes here...
	DECLARE cnt INT DEFAULT 0;
	
END;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
