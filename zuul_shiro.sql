/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50096
 Source Host           : localhost:3306
 Source Schema         : shiro

 Target Server Type    : MySQL
 Target Server Version : 50096
 File Encoding         : 65001

 Date: 08/11/2019 10:22:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NULL DEFAULT NULL,
  `external` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY USING BTREE (`id`),
  INDEX `idx_sys_resource_parent_id` USING BTREE(`parent_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES (1, '用户管理', 'menu', NULL, NULL, 0, 1, 0, 1, 'fa fa-users', '2018-05-16 17:02:54', '2018-05-16 17:02:54');
INSERT INTO `sys_resources` VALUES (2, '用户列表', 'menu', '/users', 'users', 1, 1, 0, 1, NULL, '2017-12-22 13:56:15', '2018-05-16 14:44:20');
INSERT INTO `sys_resources` VALUES (3, '新增用户', 'button', NULL, 'user:add', 2, 2, 0, 1, NULL, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO `sys_resources` VALUES (4, '批量删除用户', 'button', NULL, 'user:batchDelete', 2, 3, 0, 1, NULL, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO `sys_resources` VALUES (5, '编辑用户', 'button', NULL, 'user:edit', 2, 4, 0, 1, NULL, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO `sys_resources` VALUES (6, '删除用户', 'button', NULL, 'user:delete', 2, 5, 0, 1, NULL, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO `sys_resources` VALUES (7, '分配用户角色', 'button', NULL, 'user:allotRole', 2, 6, 0, 1, NULL, '2018-05-16 14:15:28', '2018-05-16 14:16:54');
INSERT INTO `sys_resources` VALUES (8, '系统配置', 'menu', NULL, NULL, 0, 2, 0, 1, 'fa fa-cogs', '2017-12-20 16:40:06', '2017-12-20 16:40:08');
INSERT INTO `sys_resources` VALUES (9, '资源管理', 'menu', '/resources', 'resources', 8, 1, 0, 1, NULL, '2017-12-22 15:31:05', '2017-12-22 15:31:05');
INSERT INTO `sys_resources` VALUES (10, '新增资源', 'button', NULL, 'resource:add', 9, 2, 0, 1, NULL, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO `sys_resources` VALUES (11, '批量删除资源', 'button', NULL, 'resource:batchDelete', 9, 3, 0, 1, NULL, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO `sys_resources` VALUES (12, '编辑资源', 'button', NULL, 'resource:edit', 9, 4, 0, 1, NULL, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO `sys_resources` VALUES (13, '删除资源', 'button', NULL, 'resource:delete', 9, 5, 0, 1, NULL, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO `sys_resources` VALUES (14, '角色管理', 'menu', '/roles', 'roles', 8, 2, 0, 1, '', '2017-12-22 15:31:27', '2018-05-17 12:51:06');
INSERT INTO `sys_resources` VALUES (15, '新增角色', 'button', NULL, 'role:add', 14, 2, 0, 1, NULL, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO `sys_resources` VALUES (16, '批量删除角色', 'button', NULL, 'role:batchDelete', 14, 3, 0, 1, NULL, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO `sys_resources` VALUES (17, '编辑角色', 'button', NULL, 'role:edit', 14, 4, 0, 1, NULL, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO `sys_resources` VALUES (18, '删除角色', 'button', NULL, 'role:delete', 14, 5, 0, 1, NULL, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO `sys_resources` VALUES (19, '分配角色资源', 'button', NULL, 'role:allotResource', 14, 6, 0, 1, NULL, '2018-05-17 10:04:21', '2018-05-17 10:04:21');
INSERT INTO `sys_resources` VALUES (20, '数据监控', 'menu', '', '', NULL, 3, 0, 1, 'fa fa-heartbeat', '2018-05-17 12:38:20', '2018-05-17 12:53:06');
INSERT INTO `sys_resources` VALUES (21, 'Druid监控', 'menu', '/druid/index.html', 'druid', 20, 1, 1, 1, '', '2018-05-17 12:46:37', '2018-05-17 12:52:33');
INSERT INTO `sys_resources` VALUES (22, 'zuul', 'menu', '/api-b/hi', 'users', 1, 8, 1, 0, NULL, '2019-11-08 09:40:10', '2019-11-08 09:40:12');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'role:root', '超级管理员', 1, '2017-12-20 16:40:24', '2017-12-20 16:40:26');
INSERT INTO `sys_role` VALUES (2, 'role:admin', '管理员', 1, '2017-12-22 13:56:39', '2017-12-22 13:56:39');
INSERT INTO `sys_role` VALUES (3, NULL, 'role:test', 1, '2019-11-04 13:37:39', '2019-11-04 13:39:02');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `resources_id` bigint(20) UNSIGNED NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES (112, 1, 1, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (113, 1, 2, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (114, 1, 3, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (115, 1, 4, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (116, 1, 5, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (117, 1, 6, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (118, 1, 7, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (119, 1, 8, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (120, 1, 9, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (121, 1, 10, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (122, 1, 11, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (123, 1, 12, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (124, 1, 13, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (125, 1, 14, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (126, 1, 15, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (127, 1, 16, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (128, 1, 17, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (129, 1, 18, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (130, 1, 19, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (131, 1, 20, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (132, 1, 21, '2019-11-04 13:38:21', '2019-11-04 13:38:21');
INSERT INTO `sys_role_resources` VALUES (140, 2, 1, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (141, 2, 2, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (142, 2, 3, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (143, 2, 4, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (144, 2, 5, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (145, 2, 6, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (146, 2, 7, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (147, 2, 8, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (148, 2, 9, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (149, 2, 10, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (150, 2, 14, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (151, 2, 15, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (152, 2, 20, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (153, 2, 21, '2019-11-04 13:38:28', '2019-11-04 13:38:28');
INSERT INTO `sys_role_resources` VALUES (160, 3, 8, '2019-11-04 15:14:59', '2019-11-04 15:14:59');
INSERT INTO `sys_role_resources` VALUES (161, 3, 9, '2019-11-04 15:14:59', '2019-11-04 15:14:59');
INSERT INTO `sys_role_resources` VALUES (162, 3, 10, '2019-11-04 15:14:59', '2019-11-04 15:14:59');
INSERT INTO `sys_role_resources` VALUES (163, 3, 11, '2019-11-04 15:14:59', '2019-11-04 15:14:59');
INSERT INTO `sys_role_resources` VALUES (164, 3, 12, '2019-11-04 15:14:59', '2019-11-04 15:14:59');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `gender` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `reg_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', 'CGUx1FN++xS+4wNDFeN6DA==', '?????', '15151551516', '843977358@qq.com', '843977358', NULL, NULL, 'https://static.zhyd.me/static/img/favicon.ico', 'ROOT', NULL, '0:0:0:0:0:0:0:1', '2019-11-04 15:00:51', 234, NULL, 1, '2018-01-02 09:32:15', '2019-11-04 15:00:51');
INSERT INTO `sys_user` VALUES (2, 'admin', 'gXp2EbyZ+sB/A6QUMhiUJQ==', '???', '15151551516', '843977358@qq.com', '843977358', NULL, NULL, NULL, 'ADMIN', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2019-11-06 14:07:38', 19, NULL, 1, '2018-01-02 15:56:34', '2019-11-06 14:07:38');
INSERT INTO `sys_user` VALUES (3, 'test', '0OON3/1VUwBkegZJgJPnpw==', '??', '18512341234', '18512341234@12.com', '18512341234', NULL, NULL, NULL, 'ADMIN', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2019-11-04 15:15:09', 2, NULL, 1, '2019-11-04 13:40:00', '2019-11-04 15:15:09');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2018-01-02 10:47:27', '2018-01-02 10:47:27');
INSERT INTO `sys_user_role` VALUES (3, 2, 1, '2019-11-04 13:09:46', '2019-11-04 13:09:46');
INSERT INTO `sys_user_role` VALUES (4, 3, 3, '2019-11-04 13:40:20', '2019-11-04 13:40:20');

-- ----------------------------
-- Procedure structure for init_shiro_demo
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_shiro_demo`;
delimiter ;;
CREATE PROCEDURE `init_shiro_demo`()
BEGIN	
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - 
*********************************************************************
*/
/*表结构插入*/
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role` */
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role_permission` */
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*Table structure for table `u_user` */
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*Table structure for table `u_user_role` */
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - i_wenyiba_com
*********************************************************************
*/
/*所有的表数据插入*/
/*Data for the table `u_permission` */
insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加'),(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配');
/*Data for the table `u_role` */
insert  into `u_role`(`id`,`name`,`type`) values (1,'系统管理员','888888'),(3,'权限角色','100003'),(4,'用户中心','100002');
/*Data for the table `u_role_permission` */
insert  into `u_role_permission`(`rid`,`pid`) values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
/*Data for the table `u_user` */
insert  into `u_user`(`id`,`nickname`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values (1,'管理员','admin','9c3250081c7b1f5c6cbb8096e3e1cd04','2016-06-16 11:15:33','2016-06-16 11:24:10',1),(11,'soso','8446666@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),(12,'8446666','8446666','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1);
/*Data for the table `u_user_role` */
insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1);
   
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
