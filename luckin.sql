/*
Navicat MySQL Data Transfer

Source Server         : luckincoffee
Source Server Version : 80033
Source Host           : localhost:3306
Source Database       : luckin

Target Server Type    : MYSQL
Target Server Version : 80033
File Encoding         : 65001

Date: 2023-07-07 15:10:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `src` char(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'http://localhost:3000/images/banner/1.jpg');
INSERT INTO `banner` VALUES ('2', 'http://localhost:3000/images/banner/2.jpg');
INSERT INTO `banner` VALUES ('3', 'http://localhost:3000/images/banner/3.jpg');

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num` int DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `pic` double(100,0) DEFAULT NULL,
  `src` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `classify`
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int NOT NULL,
  `type` char(255) NOT NULL,
  `flag` char(255) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '人气TOP', 'true');
INSERT INTO `classify` VALUES ('2', '大师咖啡', 'false');
INSERT INTO `classify` VALUES ('3', '零度拿铁', 'false');
INSERT INTO `classify` VALUES ('4', '经典饮品', 'false');
INSERT INTO `classify` VALUES ('5', '健康饮食', 'false');

-- ----------------------------
-- Table structure for `detail`
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int NOT NULL,
  `src1` char(255) NOT NULL,
  `src2` char(255) NOT NULL,
  `shape` char(255) NOT NULL DEFAULT '大杯',
  `T` char(255) NOT NULL DEFAULT '冰',
  `sugar` char(255) NOT NULL,
  `xqname` char(255) NOT NULL,
  `pic` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('1', 'http://localhost:3000/images/detail/冰吸.png', 'http://localhost:3000/images/detail/冰吸拿铁.png', '大杯', '冰', '不另外加糖', '冰吸生椰拿铁', '21');
INSERT INTO `detail` VALUES ('2', 'http://localhost:3000/images/detail/青提.png', 'http://localhost:3000/images/detail/青提拿铁.png', '大杯', '冰', '不另外加糖', '夏日青提拿铁', '24');

-- ----------------------------
-- Table structure for `hot`
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` char(255) NOT NULL,
  `src` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'http://localhost:3000/images/shop.png',
  `ename` char(255) NOT NULL,
  `pic` char(255) NOT NULL,
  `type` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of hot
-- ----------------------------
INSERT INTO `hot` VALUES ('1', '冰吸生椰拿铁', 'http://localhost:3000/images/hot/冰吸拿铁.png', '0乳糖 | 超凉感，嘴巴里面开空调', '￥21', '大师咖啡');
INSERT INTO `hot` VALUES ('2', '夏日青提拿铁', 'http://localhost:3000/images/hot/青提拿铁.png', '0卡糖 | 品尝夏日清爽滋味', '￥24', '大师咖啡');
INSERT INTO `hot` VALUES ('3', '柚C美式', 'http://localhost:3000/images/hot/柚C美式.png', '0脂 | 清爽，解腻，夏日推荐', '¥ 20', '大师咖啡');
INSERT INTO `hot` VALUES ('4', '椰青冰萃美式', 'http://localhost:3000/images/hot/椰青冰萃美式.png', '口感独特 | 椰星人的小众口味*0脂', '¥ 21', '零度拿铁');
INSERT INTO `hot` VALUES ('5', '标准美式', 'http://localhost:3000/images/hot/标准美式.png', '浓醇加倍，臻选IIAC精选配方', '¥ 14', '经典饮品');
INSERT INTO `hot` VALUES ('6', '陨石拿铁', 'http://localhost:3000/images/hot/陨石拿铁.png', '人气 | 真的不含陨石成分', '￥19', '零度拿铁');
INSERT INTO `hot` VALUES ('7', '纯牛奶', 'http://localhost:3000/images/hot/纯牛奶.png', '经典 | 简简单单一杯好牛奶', '￥11', '健康饮食');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` char(255) DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  `src` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', '一个真正的man', 'admin', 'http://localhost:3000/images/login/ikun.jpg');
INSERT INTO `login` VALUES ('2', 'admin', 'admin', 'http://localhost:3000/images/login/luckin.png');
INSERT INTO `login` VALUES ('26', '111', '111', null);
