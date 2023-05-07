/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719 (5.7.19)
 Source Host           : localhost:3306
 Source Schema         : ticketsystem

 Target Server Type    : MySQL
 Target Server Version : 50719 (5.7.19)
 File Encoding         : 65001

 Date: 07/05/2023 19:18:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `f_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班号',
  `start_date` date NULL DEFAULT NULL COMMENT '起飞日期',
  `start_time` time NULL DEFAULT NULL COMMENT '起飞时间',
  `start_add` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '始发地',
  `target_add` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `total_seats` int(11) NULL DEFAULT NULL COMMENT '总座位数',
  `available_seats` int(11) NULL DEFAULT NULL COMMENT '可用座位数',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, 'c45667', '2023-04-30', '08:45:00', '成都', '福建', 169, 169, 601.00);
INSERT INTO `flight` VALUES (2, 'd54675', '2023-04-30', '08:20:00', '上海', '广州', 133, 133, 352.00);
INSERT INTO `flight` VALUES (3, 'f12345', '2023-04-29', '15:00:00', '成都', '重庆', 200, 200, 108.00);
INSERT INTO `flight` VALUES (4, 'f34542', '2023-04-30', '10:50:00', '北京', '兰州', 102, 102, 399.00);
INSERT INTO `flight` VALUES (5, 'f43523', '2023-04-29', '23:00:00', '成都', '武汉', 74, 74, 330.00);
INSERT INTO `flight` VALUES (6, 'f54654', '2023-04-30', '10:23:00', '重庆', '天津', 147, 147, 835.00);
INSERT INTO `flight` VALUES (7, 'g4354', '2023-04-29', '20:00:00', '北京', '杭州', 122, 122, 472.00);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `flight_id` int(11) NULL DEFAULT NULL COMMENT '飞机号',
  `is_paid` int(11) NULL DEFAULT NULL COMMENT '是(1)否(0)支付？',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'fhr', '123', '男', '12345678');
INSERT INTO `user` VALUES (3, 'yfy', '456', '男', '12344354676');
INSERT INTO `user` VALUES (4, 'qym', 'qwer', NULL, NULL);
INSERT INTO `user` VALUES (5, 'yls', 'asdf', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
