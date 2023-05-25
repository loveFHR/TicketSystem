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

 Date: 25/05/2023 15:22:24
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, 'c45667', '2023-04-30', '08:45:00', '成都', '福建', 169, 168, 601.00);
INSERT INTO `flight` VALUES (2, 'd54675', '2023-04-30', '08:20:00', '上海', '广州', 133, 132, 352.00);
INSERT INTO `flight` VALUES (3, 'f12345', '2023-04-29', '15:00:00', '成都', '重庆', 200, 199, 108.00);
INSERT INTO `flight` VALUES (4, 'f34542', '2023-04-30', '10:50:00', '北京', '兰州', 102, 100, 399.00);
INSERT INTO `flight` VALUES (5, 'f43523', '2023-04-29', '23:00:00', '成都', '武汉', 74, 72, 330.00);
INSERT INTO `flight` VALUES (6, 'f54654', '2023-04-30', '10:23:00', '重庆', '天津', 147, 146, 835.00);
INSERT INTO `flight` VALUES (7, 'g4354', '2023-04-29', '20:00:00', '北京', '杭州', 122, 121, 472.00);
INSERT INTO `flight` VALUES (9, 'g4365', '2023-05-23', '12:00:00', '成都', '北京', 89, 89, 1299.00);
INSERT INTO `flight` VALUES (10, 'f5465', '2023-05-23', '12:00:00', '天津', '淄博', 166, 164, 419.00);
INSERT INTO `flight` VALUES (11, 'f6786', '2023-05-18', '18:00:00', '成都', '拉萨', 100, 0, 399.00);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `flight_id` int(11) NULL DEFAULT NULL COMMENT '飞机号',
  `cabin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '舱位',
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, 4, '商务舱', '体验生活', '已出票', '2023-05-24 17:58:06', '2023-05-24 19:36:00');
INSERT INTO `order` VALUES (2, 1, 4, '商务舱', 'jbgjfb', '已出票', '2023-05-24 18:49:53', '2023-05-24 19:36:06');
INSERT INTO `order` VALUES (3, 1, 10, '经济舱', '体验生活', '已退票', '2023-05-24 19:39:30', '2023-05-24 19:48:28');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'fhr', '123', '男', '12345678');
INSERT INTO `user` VALUES (3, 'yfy', '456', '女', '12344354676');
INSERT INTO `user` VALUES (4, 'qym', 'qwer', '男', '7689577657');
INSERT INTO `user` VALUES (5, 'yls', 'asdf', '男', '6547884656');

SET FOREIGN_KEY_CHECKS = 1;
