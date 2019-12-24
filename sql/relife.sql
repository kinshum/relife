/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : localhost:3306
 Source Schema         : relife

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 24/12/2019 16:10:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件md5',
  `contentType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物理路径',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(1) NOT NULL,
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for httpjob_details
-- ----------------------------
DROP TABLE IF EXISTS `httpjob_details`;
CREATE TABLE `httpjob_details`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUEST_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HTTP_URL` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HTTP_PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `UNIQUEIDX_HTTPJOB_JN_JG`(`JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of httpjob_details
-- ----------------------------
INSERT INTO `httpjob_details` VALUES (1, '111', '1', '111', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:33:45', '2019-12-24 15:33:45');
INSERT INTO `httpjob_details` VALUES (2, '121', '12121', 'ggg', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:42:49', '2019-12-24 15:42:49');

-- ----------------------------
-- Table structure for httpjob_logs
-- ----------------------------
DROP TABLE IF EXISTS `httpjob_logs`;
CREATE TABLE `httpjob_logs`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUEST_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HTTP_URL` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HTTP_PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIRE_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `RESULT` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_HTTPJOBHISTORY_JN_JG`(`JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of httpjob_logs
-- ----------------------------
INSERT INTO `httpjob_logs` VALUES (1, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:18', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (2, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (3, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:27', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (4, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (5, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (6, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (7, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (8, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (9, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:34:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (10, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (11, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (12, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (13, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (14, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (15, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (16, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (17, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (18, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (19, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (20, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (21, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:35:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (22, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (23, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (24, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (25, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (26, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (27, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (28, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (29, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (30, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (31, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (32, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (33, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:36:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (34, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (35, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (36, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (37, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (38, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (39, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (40, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (41, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (42, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (43, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (44, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (45, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:37:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (46, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (47, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (48, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (49, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (50, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (51, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (52, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (53, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (54, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (55, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (56, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (57, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:38:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (58, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (59, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (60, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (61, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (62, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (63, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (64, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (65, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (66, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (67, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (68, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (69, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:39:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (70, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (71, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (72, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (73, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (74, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (75, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (76, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (77, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (78, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (79, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (80, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (81, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:40:56', '');
INSERT INTO `httpjob_logs` VALUES (82, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:01', '');
INSERT INTO `httpjob_logs` VALUES (83, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (84, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (85, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (86, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (87, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (88, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (89, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (90, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (91, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (92, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (93, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:41:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (94, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (95, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (96, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (97, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (98, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (99, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (100, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (101, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (102, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (103, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (104, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (105, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:42:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (106, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:42:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (107, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (108, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (109, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:07', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (110, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:12', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (111, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:13', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (112, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:16', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (113, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (114, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (115, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (116, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (117, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (118, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (119, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (120, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (121, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (122, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (123, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:43:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (124, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:43:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (125, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (126, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (127, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (128, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (129, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (130, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (131, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (132, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (133, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (134, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (135, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (136, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (137, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (138, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (139, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (140, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (141, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:44:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (142, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:44:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (143, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (144, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (145, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (146, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (147, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (148, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (149, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (150, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (151, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (152, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (153, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (154, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (155, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (156, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (157, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (158, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (159, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:45:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (160, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:45:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (161, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (162, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (163, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (164, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (165, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (166, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (167, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (168, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (169, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (170, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (171, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (172, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (173, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (174, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (175, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (176, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (177, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:46:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (178, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:46:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (179, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (180, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (181, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (182, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (183, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (184, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (185, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (186, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (187, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (188, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (189, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (190, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (191, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (192, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (193, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (194, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (195, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:47:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (196, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:47:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (197, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (198, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (199, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (200, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (201, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (202, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (203, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (204, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (205, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (206, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (207, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (208, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (209, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (210, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (211, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (212, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (213, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:48:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (214, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:48:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (215, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (216, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (217, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (218, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (219, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (220, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (221, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (222, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (223, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (224, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (225, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (226, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:36', '');
INSERT INTO `httpjob_logs` VALUES (227, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:41', '');
INSERT INTO `httpjob_logs` VALUES (228, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:41', '');
INSERT INTO `httpjob_logs` VALUES (229, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (230, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (231, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:49:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (232, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:49:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (233, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (234, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (235, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (236, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (237, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (238, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (239, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:21', '');
INSERT INTO `httpjob_logs` VALUES (240, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:21', '');
INSERT INTO `httpjob_logs` VALUES (241, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:26', '');
INSERT INTO `httpjob_logs` VALUES (242, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (243, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (244, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (245, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (246, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (247, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (248, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (249, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:50:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (250, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:50:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (251, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (252, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (253, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (254, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (255, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (256, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (257, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (258, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (259, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (260, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (261, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (262, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (263, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (264, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (265, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (266, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (267, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:51:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (268, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:51:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (269, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (270, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (271, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (272, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (273, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (274, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (275, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (276, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (277, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (278, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (279, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (280, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (281, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (282, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (283, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (284, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (285, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:52:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (286, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:52:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (287, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (288, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (289, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (290, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (291, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (292, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (293, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (294, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (295, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (296, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (297, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (298, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (299, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (300, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (301, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (302, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (303, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:53:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (304, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:53:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (305, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (306, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (307, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (308, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (309, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (310, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (311, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (312, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (313, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (314, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (315, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (316, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (317, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (318, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (319, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (320, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (321, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:54:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (322, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:54:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (323, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (324, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (325, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (326, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (327, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (328, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (329, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (330, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (331, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (332, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (333, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (334, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (335, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (336, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (337, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (338, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (339, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:55:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (340, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:55:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (341, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (342, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (343, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (344, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (345, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (346, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (347, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (348, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (349, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (350, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (351, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (352, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (353, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (354, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (355, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (356, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (357, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:56:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (358, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:56:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (359, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (360, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (361, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (362, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (363, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (364, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (365, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (366, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (367, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (368, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (369, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (370, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (371, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (372, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (373, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (374, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (375, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:57:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (376, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:57:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (377, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (378, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (379, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (380, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (381, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (382, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (383, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (384, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (385, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (386, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (387, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (388, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (389, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:41', '');
INSERT INTO `httpjob_logs` VALUES (390, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:41', '');
INSERT INTO `httpjob_logs` VALUES (391, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:46', '');
INSERT INTO `httpjob_logs` VALUES (392, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:58:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (393, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (394, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:58:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (395, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (396, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (397, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (398, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (399, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (400, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (401, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (402, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (403, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (404, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (405, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (406, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (407, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (408, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (409, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (410, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (411, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 15:59:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (412, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 15:59:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (413, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (414, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (415, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (416, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (417, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (418, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (419, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (420, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (421, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (422, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (423, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (424, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (425, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (426, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (427, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (428, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (429, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:00:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (430, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:00:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (431, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (432, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (433, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (434, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (435, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (436, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (437, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (438, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (439, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:26', '');
INSERT INTO `httpjob_logs` VALUES (440, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:31', '');
INSERT INTO `httpjob_logs` VALUES (441, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:31', '');
INSERT INTO `httpjob_logs` VALUES (442, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (443, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (444, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (445, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (446, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (447, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:01:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (448, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:01:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (449, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (450, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (451, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (452, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (453, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (454, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (455, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (456, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (457, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:25', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (458, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (459, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (460, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (461, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (462, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (463, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:45', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (464, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (465, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:02:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (466, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:02:55', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (467, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (468, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:03:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (469, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:05', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (470, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (471, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:03:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (472, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:15', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (473, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (474, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:28', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (475, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:31', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (476, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:35', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (477, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:41', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (478, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:03:46', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (479, '111', '1', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', NULL, '2019-12-24 16:04:03', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (480, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:13', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (481, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:17', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (482, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (483, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:31', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (484, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (485, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:05:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (486, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (487, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (488, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:21', '');
INSERT INTO `httpjob_logs` VALUES (489, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (490, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (491, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:06:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (492, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (493, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (494, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (495, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:30', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (496, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:40', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (497, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:07:50', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (498, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:08:00', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (499, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:08:10', '{\"status\":0,\"message\":\"Success\",\"data\":null}');
INSERT INTO `httpjob_logs` VALUES (500, '121', '12121', 'GET', 'http://127.0.0.1:8087/quartz/test/logList', '{limit=11}', '2019-12-24 16:08:20', '{\"status\":0,\"message\":\"Success\",\"data\":null}');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MyQuartzScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MyQuartzScheduler', 'DESKTOP-DHJFLEC1576833396200', 1577083098446, 20000);
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactoryBean', 'DESKTOP-DHJFLEC1577170601239', 1577175002864, 7500);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '成功失败',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `createTime`(`createTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES (1, 1, '登陆', 1, NULL, '2019-12-13 16:35:49');
INSERT INTO `sys_logs` VALUES (2, 1, '退出', 1, NULL, '2019-12-13 16:36:00');
INSERT INTO `sys_logs` VALUES (3, 1, '登陆', 1, NULL, '2019-12-13 16:36:36');
INSERT INTO `sys_logs` VALUES (4, 1, '登陆', 1, NULL, '2019-12-17 16:22:34');
INSERT INTO `sys_logs` VALUES (5, 1, '登陆', 1, NULL, '2019-12-17 18:28:07');
INSERT INTO `sys_logs` VALUES (6, 1, '登陆', 1, NULL, '2019-12-18 13:59:02');
INSERT INTO `sys_logs` VALUES (7, 1, '登陆', 1, NULL, '2019-12-18 15:27:47');
INSERT INTO `sys_logs` VALUES (8, 1, '登陆', 1, NULL, '2019-12-18 16:09:52');
INSERT INTO `sys_logs` VALUES (9, 1, '登陆', 1, NULL, '2019-12-18 16:16:08');
INSERT INTO `sys_logs` VALUES (10, 1, '登陆', 1, NULL, '2019-12-18 16:18:41');
INSERT INTO `sys_logs` VALUES (11, 1, '登陆', 1, NULL, '2019-12-18 16:20:55');
INSERT INTO `sys_logs` VALUES (12, 1, '登陆', 1, NULL, '2019-12-18 16:20:56');
INSERT INTO `sys_logs` VALUES (13, 1, '登陆', 1, NULL, '2019-12-18 16:20:57');
INSERT INTO `sys_logs` VALUES (14, 1, '登陆', 1, NULL, '2019-12-18 16:20:57');
INSERT INTO `sys_logs` VALUES (15, 1, '登陆', 1, NULL, '2019-12-18 16:20:57');
INSERT INTO `sys_logs` VALUES (16, 1, '登陆', 1, NULL, '2019-12-18 16:20:57');
INSERT INTO `sys_logs` VALUES (17, 1, '登陆', 1, NULL, '2019-12-18 16:20:58');
INSERT INTO `sys_logs` VALUES (18, 1, '登陆', 1, NULL, '2019-12-18 16:20:58');
INSERT INTO `sys_logs` VALUES (19, 1, '登陆', 1, NULL, '2019-12-20 15:13:55');
INSERT INTO `sys_logs` VALUES (20, 1, '登陆', 1, NULL, '2019-12-20 16:12:19');
INSERT INTO `sys_logs` VALUES (21, 1, '登陆', 1, NULL, '2019-12-23 15:40:28');
INSERT INTO `sys_logs` VALUES (22, 1, '登陆', 1, NULL, '2019-12-23 16:00:52');
INSERT INTO `sys_logs` VALUES (23, 1, '登陆', 1, NULL, '2019-12-23 16:01:44');
INSERT INTO `sys_logs` VALUES (24, 1, '登陆', 1, NULL, '2019-12-24 14:12:04');
INSERT INTO `sys_logs` VALUES (25, 1, '登陆', 1, NULL, '2019-12-24 14:35:35');
INSERT INTO `sys_logs` VALUES (26, 1, '登陆', 1, NULL, '2019-12-24 14:48:43');
INSERT INTO `sys_logs` VALUES (27, 1, '登陆', 1, NULL, '2019-12-24 14:49:20');
INSERT INTO `sys_logs` VALUES (28, 1, '登陆', 1, NULL, '2019-12-24 14:54:25');
INSERT INTO `sys_logs` VALUES (29, 1, '登陆', 1, NULL, '2019-12-24 14:54:38');
INSERT INTO `sys_logs` VALUES (30, 1, '登陆', 1, NULL, '2019-12-24 15:22:45');
INSERT INTO `sys_logs` VALUES (31, 1, '登陆', 1, NULL, '2019-12-24 15:42:40');
INSERT INTO `sys_logs` VALUES (32, 1, '登陆', 1, NULL, '2019-12-24 15:51:04');
INSERT INTO `sys_logs` VALUES (33, 1, '登陆', 1, NULL, '2019-12-24 16:02:00');
INSERT INTO `sys_logs` VALUES (34, 1, '登陆', 1, NULL, '2019-12-24 16:07:08');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `css` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `href` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, '用户管理', 'fa-users', 'pages/user/userList.html', 1, '', 1);
INSERT INTO `sys_permission` VALUES (2, 1, '用户查询', 'fa-user', 'pages/user/userList.html', 1, '', 2);
INSERT INTO `sys_permission` VALUES (3, 2, '查询', '', '', 2, 'sys:user:query', 100);
INSERT INTO `sys_permission` VALUES (4, 2, '新增', '', '', 2, 'sys:user:add', 100);
INSERT INTO `sys_permission` VALUES (6, 0, '修改密码', 'fa-pencil-square-o', 'pages/user/changePassword.html', 1, 'sys:user:password', 4);
INSERT INTO `sys_permission` VALUES (7, 0, '系统设置', 'fa-gears', '', 1, '', 5);
INSERT INTO `sys_permission` VALUES (8, 7, '菜单', 'fa-cog', 'pages/menu/menuList.html', 1, '', 6);
INSERT INTO `sys_permission` VALUES (9, 8, '查询', '', '', 2, 'sys:menu:query', 100);
INSERT INTO `sys_permission` VALUES (10, 8, '新增', '', '', 2, 'sys:menu:add', 100);
INSERT INTO `sys_permission` VALUES (11, 8, '删除', '', '', 2, 'sys:menu:del', 100);
INSERT INTO `sys_permission` VALUES (12, 7, '角色', 'fa-user-secret', 'pages/role/roleList.html', 1, '', 7);
INSERT INTO `sys_permission` VALUES (13, 12, '查询', '', '', 2, 'sys:role:query', 100);
INSERT INTO `sys_permission` VALUES (14, 12, '新增', '', '', 2, 'sys:role:add', 100);
INSERT INTO `sys_permission` VALUES (15, 12, '删除', '', '', 2, 'sys:role:del', 100);
INSERT INTO `sys_permission` VALUES (16, 0, '文件管理', 'fa-folder-open', 'pages/file/fileList.html', 1, '', 8);
INSERT INTO `sys_permission` VALUES (17, 16, '查询', '', '', 2, 'sys:file:query', 100);
INSERT INTO `sys_permission` VALUES (18, 16, '删除', '', '', 2, 'sys:file:del', 100);
INSERT INTO `sys_permission` VALUES (19, 0, '数据源监控', 'fa-eye', 'druid/index.html', 1, '', 9);
INSERT INTO `sys_permission` VALUES (20, 0, '接口swagger', 'fa-file-pdf-o', 'swagger-ui.html', 1, '', 10);
INSERT INTO `sys_permission` VALUES (21, 0, '代码生成', 'fa-wrench', 'pages/generate/edit.html', 1, 'generate:edit', 11);
INSERT INTO `sys_permission` VALUES (22, 0, '公告管理', 'fa-book', 'pages/notice/noticeList.html', 1, '', 12);
INSERT INTO `sys_permission` VALUES (23, 22, '查询', '', '', 2, 'notice:query', 100);
INSERT INTO `sys_permission` VALUES (24, 22, '添加', '', '', 2, 'notice:add', 100);
INSERT INTO `sys_permission` VALUES (25, 22, '删除', '', '', 2, 'notice:del', 100);
INSERT INTO `sys_permission` VALUES (26, 0, '日志查询', 'fa-reorder', 'pages/log/logList.html', 1, 'sys:log:query', 13);
INSERT INTO `sys_permission` VALUES (27, 0, '邮件管理', 'fa-envelope', 'pages/mail/mailList.html', 1, '', 14);
INSERT INTO `sys_permission` VALUES (28, 27, '发送邮件', '', '', 2, 'mail:send', 100);
INSERT INTO `sys_permission` VALUES (29, 27, '查询', '', '', 2, 'mail:all:query', 100);
INSERT INTO `sys_permission` VALUES (30, 0, '定时任务管理', 'fa-tasks', 'pages/job/jobList.html', 1, '', 15);
INSERT INTO `sys_permission` VALUES (31, 30, '查询', '', '', 2, 'job:query', 100);
INSERT INTO `sys_permission` VALUES (32, 30, '新增', '', '', 2, 'job:add', 100);
INSERT INTO `sys_permission` VALUES (33, 30, '删除', '', '', 2, 'job:del', 100);
INSERT INTO `sys_permission` VALUES (34, 0, 'excel导出', 'fa-arrow-circle-down', 'pages/excel/sql.html', 1, '', 16);
INSERT INTO `sys_permission` VALUES (35, 34, '导出', '', '', 2, 'excel:down', 100);
INSERT INTO `sys_permission` VALUES (36, 34, '页面显示数据', '', '', 2, 'excel:show:datas', 100);
INSERT INTO `sys_permission` VALUES (37, 0, '字典管理', 'fa-reddit', 'pages/dict/dictList.html', 1, '', 17);
INSERT INTO `sys_permission` VALUES (38, 37, '查询', '', '', 2, 'dict:query', 100);
INSERT INTO `sys_permission` VALUES (39, 37, '新增', '', '', 2, 'dict:add', 100);
INSERT INTO `sys_permission` VALUES (40, 37, '删除', '', '', 2, 'dict:del', 100);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ADMIN', '管理员', '2017-05-01 13:25:39', '2017-10-05 21:59:18');
INSERT INTO `sys_role` VALUES (2, 'USER', '', '2017-08-01 21:47:31', '2017-10-05 21:59:26');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `permissionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (1, 19);
INSERT INTO `sys_role_permission` VALUES (1, 20);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 24);
INSERT INTO `sys_role_permission` VALUES (1, 25);
INSERT INTO `sys_role_permission` VALUES (1, 26);
INSERT INTO `sys_role_permission` VALUES (1, 27);
INSERT INTO `sys_role_permission` VALUES (1, 28);
INSERT INTO `sys_role_permission` VALUES (1, 29);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (1, 33);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (1, 37);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);
INSERT INTO `sys_role_permission` VALUES (2, 6);
INSERT INTO `sys_role_permission` VALUES (2, 7);
INSERT INTO `sys_role_permission` VALUES (2, 8);
INSERT INTO `sys_role_permission` VALUES (2, 9);
INSERT INTO `sys_role_permission` VALUES (2, 10);
INSERT INTO `sys_role_permission` VALUES (2, 11);
INSERT INTO `sys_role_permission` VALUES (2, 12);
INSERT INTO `sys_role_permission` VALUES (2, 13);
INSERT INTO `sys_role_permission` VALUES (2, 14);
INSERT INTO `sys_role_permission` VALUES (2, 15);
INSERT INTO `sys_role_permission` VALUES (2, 16);
INSERT INTO `sys_role_permission` VALUES (2, 17);
INSERT INTO `sys_role_permission` VALUES (2, 18);
INSERT INTO `sys_role_permission` VALUES (2, 19);
INSERT INTO `sys_role_permission` VALUES (2, 20);
INSERT INTO `sys_role_permission` VALUES (2, 21);
INSERT INTO `sys_role_permission` VALUES (2, 22);
INSERT INTO `sys_role_permission` VALUES (2, 23);
INSERT INTO `sys_role_permission` VALUES (2, 24);
INSERT INTO `sys_role_permission` VALUES (2, 25);
INSERT INTO `sys_role_permission` VALUES (2, 30);
INSERT INTO `sys_role_permission` VALUES (2, 31);
INSERT INTO `sys_role_permission` VALUES (2, 34);
INSERT INTO `sys_role_permission` VALUES (2, 36);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `headImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$iYM/H7TrSaLs7XyIWQdGwe1xf4cdmt3nwMja6RT0wxG5YY1RjN0EK', '管理员', NULL, '', '', '', '1998-07-01', 0, 1, '2017-04-10 15:21:38', '2017-07-06 09:20:19');
INSERT INTO `sys_user` VALUES (2, 'user', '$2a$10$ooGb4wjT7Hg3zgU2RhZp6eVu3jvG29i/U4L6VRwiZZ4.DZ0OOEAHu', '用户', NULL, '', '', '', NULL, 1, 1, '2017-08-01 21:47:18', '2017-08-01 21:47:18');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `k` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `val` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `k`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, 'sex', '0', '女', '2017-11-17 09:58:24', '2017-11-18 14:21:05');
INSERT INTO `t_dict` VALUES (2, 'sex', '1', '男', '2017-11-17 10:03:46', '2017-11-17 10:03:46');
INSERT INTO `t_dict` VALUES (3, 'userStatus', '0', '无效', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (4, 'userStatus', '1', '正常', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (5, 'userStatus', '2', '锁定', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (6, 'noticeStatus', '0', '草稿', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (7, 'noticeStatus', '1', '发布', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (8, 'isRead', '0', '未读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (9, 'isRead', '1', '已读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '发送人',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '正文',
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_mail_to
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailId` int(11) NOT NULL,
  `toUser` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1成功，0失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `updateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_read`;
CREATE TABLE `t_notice_read`  (
  `noticeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`noticeId`, `userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
