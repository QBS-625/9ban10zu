/*
 Navicat Premium Data Transfer

 Source Server         : nqq
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : qbs

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 03/04/2025 11:19:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `college` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '软件工程', '计算机学院');
INSERT INTO `class` VALUES (2, '土木工程', '建筑与设计学院');
INSERT INTO `class` VALUES (3, '商务英语', '外国语学院');
INSERT INTO `class` VALUES (4, '大数据技术', '计算机学院');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '张三', '男', '21', 1);
INSERT INTO `student` VALUES (2, '李四', '女', '21', 2);
INSERT INTO `student` VALUES (3, '王五', '男', '22', 3);
INSERT INTO `student` VALUES (4, '麻六', '女', '22', 4);
INSERT INTO `student` VALUES (5, '小明', '男', '21', 1);
INSERT INTO `student` VALUES (6, '小红', '女', '21', 3);

-- ----------------------------
-- Function structure for get_sclass
-- ----------------------------
DROP FUNCTION IF EXISTS `get_sclass`;
delimiter ;;
CREATE FUNCTION `get_sclass`(sname VARCHAR(20))
 RETURNS varchar(10) CHARSET utf8mb4
  DETERMINISTIC
BEGIN
    DECLARE sclass VARCHAR(10);

    SELECT osclass INTO sclass FROM stu WHERE osname = sname;

    RETURN sclass;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pro_stu
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_stu`;
delimiter ;;
CREATE PROCEDURE `pro_stu`()
BEGIN
    -- 创建stu表
    CREATE TABLE IF NOT EXISTS stu (
        osno VARCHAR(10) NOT NULL PRIMARY KEY,
        osname VARCHAR(20) NOT NULL UNIQUE,
        ossex ENUM('男', '女') NOT NULL,
        osclass VARCHAR(10) NOT NULL
    );

    -- 向stu表中插入2条记录
    INSERT INTO stu (osno, osname, ossex, osclass) VALUES
        ('0000000001', '张三', '男', '一班'),
        ('0000000002', '李四', '女', '二班');

    -- 根据传入的sname参数检索并输出学生信息
    SET @sname = '张三'; -- 这里先设置一个示例值，实际使用时可通过传入参数改变
    SELECT * FROM stu WHERE osname = @sname;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
