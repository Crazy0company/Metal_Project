/*
Navicat MySQL Data Transfer

Source Server         : ebuy
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : metal_project

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-27 00:14:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for armor_data
-- ----------------------------
DROP TABLE IF EXISTS `armor_data`;
CREATE TABLE `armor_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '装甲名',
  `type_ch` varchar(20) NOT NULL DEFAULT '装甲' COMMENT '类型中文名',
  `type_en` varchar(20) NOT NULL DEFAULT 'Armor' COMMENT '类型英文名',
  `rarity` int(11) NOT NULL DEFAULT '0' COMMENT '稀有度',
  `a_he_def` int(11) NOT NULL DEFAULT '0' COMMENT '对高爆防御',
  `a_ap_def` int(11) NOT NULL DEFAULT '0' COMMENT '对穿甲防御',
  `a_max_hp` int(11) NOT NULL,
  `a_hp` int(11) NOT NULL DEFAULT '0' COMMENT '耐久值',
  `a_re_hp` float NOT NULL DEFAULT '0' COMMENT '每回合回复的耐久值',
  `a_re_cost` int(11) NOT NULL DEFAULT '0' COMMENT '基础修理费用（每损失1%修理费用增加10%）',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购入价格',
  `sell` int(11) NOT NULL DEFAULT '0' COMMENT '卖出价格',
  `message` varchar(100) DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`id`),
  KEY `rarity_armor_d` (`rarity`),
  KEY `name` (`name`),
  CONSTRAINT `rarity_armor_d` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of armor_data
-- ----------------------------
INSERT INTO `armor_data` VALUES ('1', 'open', '装甲', 'Armor', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `armor_data` VALUES ('2', '铁质装甲', '装甲', 'Armor', '0', '30', '30', '100', '100', '0', '10', '50', '200', '100', null);
INSERT INTO `armor_data` VALUES ('3', '钢质装甲', '装甲', 'Armor', '0', '50', '50', '200', '200', '0', '20', '100', '500', '250', null);
INSERT INTO `armor_data` VALUES ('4', '反物质合金装甲', '装甲', 'Armor', '0', '1200', '1200', '5000', '5000', '2', '1000', '1500', '50000', '25000', null);
INSERT INTO `armor_data` VALUES ('5', '高强度钢装甲', '装甲', 'Armor', '1', '100', '100', '500', '500', '0', '50', '200', '1000', '500', null);

-- ----------------------------
-- Table structure for armor_pack
-- ----------------------------
DROP TABLE IF EXISTS `armor_pack`;
CREATE TABLE `armor_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(20) NOT NULL,
  `a_max_hp` int(11) DEFAULT '0',
  `a_hp` int(255) NOT NULL DEFAULT '0',
  `a_he_def` int(11) NOT NULL DEFAULT '0' COMMENT '对高爆防御',
  `a_ap_def` int(11) NOT NULL DEFAULT '0' COMMENT '对穿甲防御',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量',
  `sp` int(11) NOT NULL DEFAULT '0' COMMENT '装甲装甲片',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '这件装备属于哪个玩家',
  `equipped_with` int(11) NOT NULL DEFAULT '0' COMMENT '是否正在装备着（0：未装备，1：已被装备）',
  PRIMARY KEY (`id`),
  KEY `armor_name_pack` (`armor_name`),
  CONSTRAINT `armor_name_pack` FOREIGN KEY (`armor_name`) REFERENCES `armor_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of armor_pack
-- ----------------------------
INSERT INTO `armor_pack` VALUES ('2', 'open', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `armor_pack` VALUES ('33', '铁质装甲', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `armor_pack` VALUES ('34', '钢质装甲', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `armor_pack` VALUES ('35', '高强度钢装甲', '500', '500', '100', '100', '200', '0', '1', '0');
INSERT INTO `armor_pack` VALUES ('36', '高强度钢装甲', '500', '500', '100', '100', '200', '0', '1', '1');

-- ----------------------------
-- Table structure for chassis_skill_data
-- ----------------------------
DROP TABLE IF EXISTS `chassis_skill_data`;
CREATE TABLE `chassis_skill_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name_ch` varchar(20) NOT NULL COMMENT '底盘特性的中文名',
  `type_1` varchar(20) NOT NULL DEFAULT 'null' COMMENT '技能类别（攻击或防御）',
  `skill_1` varchar(20) NOT NULL DEFAULT 'null' COMMENT '特性1名称',
  `skill_1_m` varchar(255) NOT NULL DEFAULT 'null' COMMENT '特性一介绍',
  `type_2` varchar(20) NOT NULL DEFAULT 'null' COMMENT '技能类别（攻击或防御）',
  `skill_2` varchar(20) NOT NULL DEFAULT 'null' COMMENT '特性二名称',
  `skill_2_m` varchar(255) NOT NULL DEFAULT 'null' COMMENT '特性二介绍',
  `type_3` varchar(20) NOT NULL DEFAULT 'null' COMMENT '技能类别（攻击或防御）',
  `skill_3` varchar(20) NOT NULL DEFAULT 'null' COMMENT '特性三名称',
  `skill_3_m` varchar(255) NOT NULL DEFAULT 'null' COMMENT '特性三介绍',
  PRIMARY KEY (`id`),
  KEY `chassis_equip_type` (`type_1`),
  KEY `skill_name_ch` (`skill_name_ch`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chassis_skill_data
-- ----------------------------
INSERT INTO `chassis_skill_data` VALUES ('1', 'null', 'M_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('2', '虎王', 'ATK', '重点打击', '主炮射击时有10%几率造成2倍伤害', 'DEF', '重点防御', '受到攻击时有10%几率减免10%的伤害', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('3', '引擎载重量强化', 'Engine', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('4', '精准射击[主炮]', 'M_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('5', '精准射击[副炮]', 'A_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('6', '精准射击[特殊武器]', 'S_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('7', '会心一击[主炮]', 'M_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('8', '会心一击[副炮]', 'A_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('9', '会心一击[特殊武器]', 'S_Gun', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('10', '暴躁射击', 'M_Gun', '20', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('11', '帝皇', 'S_Gun', '75', '10', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('12', '鼠式', 'Armor', '0', '0', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('13', '鼬式', 'Armor', '0', '10', 'null', 'null', 'null', 'null', 'null', 'null');
INSERT INTO `chassis_skill_data` VALUES ('14', '主炮攻击强化', 'M_Gun', '10', '0', 'null', 'null', 'null', 'null', 'null', 'null');

-- ----------------------------
-- Table structure for core_data
-- ----------------------------
DROP TABLE IF EXISTS `core_data`;
CREATE TABLE `core_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type_en` varchar(10) NOT NULL DEFAULT 'core',
  `type_ch` varchar(10) NOT NULL DEFAULT 'c核心',
  `rarity` int(11) NOT NULL DEFAULT '1',
  `c_reload_time` float NOT NULL DEFAULT '0' COMMENT '装填时间',
  `c_hit` float NOT NULL DEFAULT '0' COMMENT '命中率',
  `c_miss` float NOT NULL DEFAULT '0' COMMENT '闪避',
  `c_crt` float NOT NULL DEFAULT '0' COMMENT '普通暴击率',
  `c_x_crt` float NOT NULL DEFAULT '0' COMMENT '超暴击率',
  `c_load` float NOT NULL DEFAULT '0' COMMENT 'C核心加成的引擎载重量',
  `c_intercept` varchar(11) NOT NULL DEFAULT 'NULL' COMMENT '该C核心是否有迎击功能',
  `weight` float NOT NULL DEFAULT '0' COMMENT '重量',
  `buy` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL DEFAULT '0',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `message` varchar(100) DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`id`),
  KEY `core_rarity` (`rarity`) USING BTREE,
  KEY `name` (`name`),
  CONSTRAINT `rarity` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_data
-- ----------------------------
INSERT INTO `core_data` VALUES ('1', 'close', 'core', 'c核心', '1', '0', '0', '0', '0', '0', '0', 'NULL', '0', '0', '0', null, null);
INSERT INTO `core_data` VALUES ('2', 'open', 'core', 'c核心', '1', '0', '0', '0', '0', '0', '0', 'NULL', '0', '0', '0', null, null);
INSERT INTO `core_data` VALUES ('3', '锈迹斑斑的战车核心', 'core', 'c核心', '0', '0', '5', '0', '0', '0', '10', 'NULL', '50', '100', '50', null, null);
INSERT INTO `core_data` VALUES ('4', 'H800', 'core', 'c核心', '1', '1', '5', '0', '1', '0', '10', 'NULL', '100', '300', '150', null, null);
INSERT INTO `core_data` VALUES ('5', '所罗门SMC-1', 'core', 'c核心', '5', '50', '50', '30', '30', '10', '50', 'A', '700', '150000', '75000', null, null);
INSERT INTO `core_data` VALUES ('6', '人工智障I型', 'core', 'c核心', '1', '0', '5', '10', '1', '0', '0', 'NULL', '200', '1000', '500', null, null);

-- ----------------------------
-- Table structure for core_pack
-- ----------------------------
DROP TABLE IF EXISTS `core_pack`;
CREATE TABLE `core_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `core_name` varchar(20) NOT NULL,
  `c_reload_time` float NOT NULL DEFAULT '0' COMMENT '装填时间',
  `c_hit` float NOT NULL DEFAULT '0' COMMENT '命中率',
  `c_miss` float NOT NULL DEFAULT '0' COMMENT '闪避',
  `c_crt` float NOT NULL DEFAULT '0' COMMENT '普通暴击率',
  `c_x_crt` float NOT NULL DEFAULT '0' COMMENT '超暴击率',
  `c_load` float NOT NULL DEFAULT '0' COMMENT 'C核心加成的引擎载重量',
  `weight` float NOT NULL DEFAULT '0' COMMENT '重量',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '这件装备属于哪个玩家',
  `equipped_with` int(11) NOT NULL DEFAULT '0' COMMENT '是否正在装备着（0：未装备，1：已被装备）',
  PRIMARY KEY (`id`),
  KEY `c_p_id` (`p_id`),
  KEY `name` (`core_name`),
  CONSTRAINT `core_name_pack` FOREIGN KEY (`core_name`) REFERENCES `core_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_pack
-- ----------------------------
INSERT INTO `core_pack` VALUES ('1', 'close', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `core_pack` VALUES ('2', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `core_pack` VALUES ('39', 'H800', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `core_pack` VALUES ('40', '所罗门SMC-1', '0', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `core_pack` VALUES ('41', '人工智障I型', '0', '5', '10', '1', '0', '0', '200', '1', '0');
INSERT INTO `core_pack` VALUES ('42', '人工智障I型', '0', '5', '10', '1', '0', '0', '200', '1', '1');

-- ----------------------------
-- Table structure for engine_data
-- ----------------------------
DROP TABLE IF EXISTS `engine_data`;
CREATE TABLE `engine_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '引擎名称',
  `type_ch` varchar(20) NOT NULL DEFAULT '引擎' COMMENT '引擎类型中文名',
  `type_en` varchar(20) NOT NULL DEFAULT 'engine' COMMENT '引擎类型英文名',
  `rarity` int(11) NOT NULL DEFAULT '1',
  `e_load` int(11) NOT NULL DEFAULT '0' COMMENT '引擎载重量',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '引擎重量',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购入价格',
  `sell` int(11) NOT NULL DEFAULT '0' COMMENT '卖出价格',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `message` varchar(100) DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`id`),
  KEY `e_rarity` (`rarity`),
  KEY `e_name` (`name`),
  CONSTRAINT `e_rarity` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of engine_data
-- ----------------------------
INSERT INTO `engine_data` VALUES ('1', 'close', '引擎', 'engine', '1', '0', '0', '0', '0', null, null);
INSERT INTO `engine_data` VALUES ('2', 'open', '引擎', 'engine', '1', '0', '0', '0', '0', null, null);
INSERT INTO `engine_data` VALUES ('3', '猛力强哥', '引擎', 'engine', '1', '700', '65', '150', '75', null, null);
INSERT INTO `engine_data` VALUES ('4', '生锈的引擎', '引擎', 'engine', '0', '500', '50', '80', '40', null, null);
INSERT INTO `engine_data` VALUES ('5', '终极龙卷', '引擎', 'engine', '4', '6000', '500', '180000', '90000', null, '这个引擎产生的动力足以形成一场龙卷');
INSERT INTO `engine_data` VALUES ('6', 'BULL', '引擎', 'engine', '1', '1000', '100', '700', '350', null, null);

-- ----------------------------
-- Table structure for engine_pack
-- ----------------------------
DROP TABLE IF EXISTS `engine_pack`;
CREATE TABLE `engine_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine_name` varchar(20) NOT NULL COMMENT '引擎名称',
  `e_load` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '这件装备属于哪个玩家',
  `equipped_with` int(11) NOT NULL DEFAULT '0' COMMENT '是否正在装备着（0：未装备，1：已被装备）',
  PRIMARY KEY (`id`),
  KEY `e_name` (`engine_name`),
  CONSTRAINT `engine_name` FOREIGN KEY (`engine_name`) REFERENCES `engine_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of engine_pack
-- ----------------------------
INSERT INTO `engine_pack` VALUES ('1', 'close', '0', '0', '0', '0');
INSERT INTO `engine_pack` VALUES ('2', 'open', '0', '0', '0', '0');
INSERT INTO `engine_pack` VALUES ('37', '猛力强哥', '0', '0', '1', '0');
INSERT INTO `engine_pack` VALUES ('38', '终极龙卷', '0', '0', '1', '0');
INSERT INTO `engine_pack` VALUES ('39', 'BULL', '1000', '100', '1', '0');
INSERT INTO `engine_pack` VALUES ('40', 'BULL', '1000', '100', '1', '1');

-- ----------------------------
-- Table structure for material_data
-- ----------------------------
DROP TABLE IF EXISTS `material_data`;
CREATE TABLE `material_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rarity` int(11) NOT NULL DEFAULT '0',
  `type_ch` varchar(20) NOT NULL DEFAULT '材料',
  `type_en` varchar(20) NOT NULL DEFAULT 'material',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购买金额',
  `sell` int(11) NOT NULL DEFAULT '0' COMMENT '卖出金额',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `message` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_rarity` (`rarity`),
  KEY `m_name` (`name`),
  CONSTRAINT `m_rarity` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_data
-- ----------------------------
INSERT INTO `material_data` VALUES ('1', '废铁', '0', '材料', 'material', '100', '50', null, '一堆废铁，似乎有许多地方需要用到');

-- ----------------------------
-- Table structure for material_pack
-- ----------------------------
DROP TABLE IF EXISTS `material_pack`;
CREATE TABLE `material_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(20) NOT NULL,
  `p_id` int(11) NOT NULL COMMENT '这个材料属于哪个玩家',
  `num` int(11) NOT NULL COMMENT '持有多少数量',
  PRIMARY KEY (`id`),
  KEY `m_name` (`material_name`),
  CONSTRAINT `material_name_pack` FOREIGN KEY (`material_name`) REFERENCES `material_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_pack
-- ----------------------------
INSERT INTO `material_pack` VALUES ('1', '废铁', '0', '1');
INSERT INTO `material_pack` VALUES ('2', '废铁', '0', '10');

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) DEFAULT NULL COMMENT '角色名字',
  `p_username` varchar(20) NOT NULL,
  `p_password` varchar(20) NOT NULL,
  `p_email` varchar(20) NOT NULL,
  `p_head` varchar(100) NOT NULL DEFAULT 'null' COMMENT '头像',
  `p_gold` int(20) NOT NULL DEFAULT '0' COMMENT '持有金钱',
  `p_exp` int(11) NOT NULL DEFAULT '0' COMMENT '玩家目前经验（声望）',
  `p_max_exp` int(11) NOT NULL DEFAULT '0' COMMENT '玩家总经验(声望)',
  `p_max_garage` int(11) NOT NULL DEFAULT '5',
  `p_use_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_use_id` (`p_use_id`),
  CONSTRAINT `p_use_id` FOREIGN KEY (`p_use_id`) REFERENCES `tank_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('1', null, '大萝卜', '123456', '123456@qq.com', '', '0', '0', '0', '3', null);
INSERT INTO `play` VALUES ('5', null, 'qqq', 'qqq', '2313929465@qq.com', '', '0', '0', '0', '3', null);
INSERT INTO `play` VALUES ('6', 'null', 'aaa', 'aaa123', 'aaa123@qq.com', 'null', '0', '0', '0', '3', null);

-- ----------------------------
-- Table structure for rarity
-- ----------------------------
DROP TABLE IF EXISTS `rarity`;
CREATE TABLE `rarity` (
  `id` int(11) NOT NULL,
  `rarity_color` varchar(20) NOT NULL,
  `rarity_ch` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rarity_ch` (`rarity_ch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rarity
-- ----------------------------
INSERT INTO `rarity` VALUES ('0', '#696969;', '下级科技');
INSERT INTO `rarity` VALUES ('1', '#000000;', '中级科技');
INSERT INTO `rarity` VALUES ('2', '#87CEFA;', '高级科技');
INSERT INTO `rarity` VALUES ('3', '#0000FF;', '金属科技');
INSERT INTO `rarity` VALUES ('4', '#00FF00;', '次元科技');
INSERT INTO `rarity` VALUES ('5', '#FF0000;', '行星科技');
INSERT INTO `rarity` VALUES ('6', '#', '银河科技');

-- ----------------------------
-- Table structure for shell_data
-- ----------------------------
DROP TABLE IF EXISTS `shell_data`;
CREATE TABLE `shell_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_type` varchar(20) NOT NULL COMMENT '炮弹对应的武器类型',
  `name_ch` varchar(20) NOT NULL COMMENT '炮弹的英文名',
  `name_en` varchar(20) NOT NULL COMMENT '炮弹的中文名',
  `rarity` int(11) NOT NULL DEFAULT '1',
  `shell_he` float NOT NULL DEFAULT '100' COMMENT '炮弹杀伤',
  `shell_ap` float NOT NULL DEFAULT '100' COMMENT '炮弹穿透',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '每发炮弹的重量',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '炮弹购入的价格',
  `sell` int(11) NOT NULL DEFAULT '0' COMMENT '炮弹卖出的价格',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `s_rarity` (`rarity`),
  KEY `name_ch` (`name_ch`),
  CONSTRAINT `s_rarity` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shell_data
-- ----------------------------
INSERT INTO `shell_data` VALUES ('1', 'null', '未装填', 'null', '1', '0', '0', '0', '0', '0', null);
INSERT INTO `shell_data` VALUES ('2', 'M_Gun', '高爆弹', 'HE', '1', '120', '80', '5', '5', '3', null);
INSERT INTO `shell_data` VALUES ('3', 'M_Gun', '穿甲弹', 'AP', '1', '80', '120', '5', '5', '3', null);
INSERT INTO `shell_data` VALUES ('4', 'S_Gun', '特殊导弹', 'SM', '1', '100', '100', '10', '30', '15', null);
INSERT INTO `shell_data` VALUES ('5', 'A_Gun', '标准火药子弹', 'SB', '1', '100', '100', '0', '0', '0', null);
INSERT INTO `shell_data` VALUES ('6', 'M_Gun', '钻头', 'AP', '1', '80', '130', '15', '10', '5', null);

-- ----------------------------
-- Table structure for shell_pack
-- ----------------------------
DROP TABLE IF EXISTS `shell_pack`;
CREATE TABLE `shell_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shell_name` varchar(20) NOT NULL DEFAULT '0' COMMENT '炮弹卖出的价格',
  `p_id` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shell_name_pack` (`shell_name`),
  CONSTRAINT `shell_name_pack` FOREIGN KEY (`shell_name`) REFERENCES `shell_data` (`name_ch`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shell_pack
-- ----------------------------
INSERT INTO `shell_pack` VALUES ('1', '高爆弹', '0', '5');
INSERT INTO `shell_pack` VALUES ('2', '高爆弹', '0', '5');

-- ----------------------------
-- Table structure for tank_data
-- ----------------------------
DROP TABLE IF EXISTS `tank_data`;
CREATE TABLE `tank_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tank_rarity` int(20) NOT NULL DEFAULT '0' COMMENT '战车稀有度',
  `name` varchar(20) NOT NULL COMMENT '战车名称（可自定义）',
  `chassis_skill` varchar(20) NOT NULL COMMENT '战车底盘特性',
  `chassis_weight` int(20) NOT NULL DEFAULT '0' COMMENT '战车底盘重量',
  `load` float NOT NULL DEFAULT '0' COMMENT '战车目前载重量',
  `max_load` float NOT NULL DEFAULT '0' COMMENT '战车最大载重量',
  `armor` varchar(20) NOT NULL DEFAULT 'open' COMMENT '战车装甲',
  `core_1` varchar(20) NOT NULL DEFAULT 'open' COMMENT '一号核心',
  `core_2` varchar(20) NOT NULL DEFAULT 'close' COMMENT '二号核心',
  `engine_1` varchar(20) NOT NULL DEFAULT 'open' COMMENT '一号引擎',
  `engine_2` varchar(20) NOT NULL DEFAULT 'close' COMMENT '二号引擎',
  `hole_1` varchar(20) NOT NULL DEFAULT 'close' COMMENT '一号穴位',
  `hole_2` varchar(20) NOT NULL DEFAULT 'close' COMMENT '二号穴位',
  `hole_3` varchar(20) NOT NULL DEFAULT 'close' COMMENT '三号穴位',
  `hole_4` varchar(20) NOT NULL DEFAULT 'close' COMMENT '四号穴位',
  `hole_5` varchar(20) NOT NULL DEFAULT 'close' COMMENT '五号穴位',
  `hole_6` varchar(20) NOT NULL DEFAULT 'close' COMMENT '六号穴位',
  `buy` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL DEFAULT '0',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `message` varchar(100) DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`id`),
  KEY `tank_rarity` (`tank_rarity`),
  KEY `chassis_skill` (`chassis_skill`),
  KEY `tank_armor` (`armor`),
  KEY `tank_core_1` (`core_1`),
  KEY `tank_core_2` (`core_2`),
  KEY `tank_engine_1` (`engine_1`),
  KEY `tank_engine_2` (`engine_2`),
  KEY `tank_hole_1` (`hole_1`),
  KEY `tank_hole_2` (`hole_2`),
  KEY `tank_hole_3` (`hole_3`),
  KEY `tank_hole_4` (`hole_4`),
  KEY `tank_hole_5` (`hole_5`),
  KEY `tank_hole_6` (`hole_6`),
  CONSTRAINT `tank_armor_data` FOREIGN KEY (`armor`) REFERENCES `armor_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_1` FOREIGN KEY (`core_1`) REFERENCES `core_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_10` FOREIGN KEY (`engine_2`) REFERENCES `engine_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_11` FOREIGN KEY (`hole_1`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_12` FOREIGN KEY (`hole_2`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_13` FOREIGN KEY (`hole_3`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_2` FOREIGN KEY (`core_2`) REFERENCES `core_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_3` FOREIGN KEY (`chassis_skill`) REFERENCES `chassis_skill_data` (`skill_name_ch`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_4` FOREIGN KEY (`hole_4`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_5` FOREIGN KEY (`hole_5`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_6` FOREIGN KEY (`hole_6`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_7` FOREIGN KEY (`tank_rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_data_ibfk_9` FOREIGN KEY (`engine_1`) REFERENCES `engine_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tank_data
-- ----------------------------
INSERT INTO `tank_data` VALUES ('1', '0', '破旧的战车', 'null', '70', '0', '0', '铁质装甲', '锈迹斑斑的战车核心', 'close', '生锈的引擎', 'close', '45mm主炮', 'close', 'close', 'close', 'close', 'close', '2000', '50', null, '锈迹斑斑的战车');
INSERT INTO `tank_data` VALUES ('2', '1', '暴躁者', 'null', '150', '0', '0', '钢质装甲', 'H800', 'close', '猛力强哥', 'close', '36mm连射炮', '36mm连射炮', 'close', 'close', 'close', 'close', '3000', '1500', null, '看起来很暴躁');
INSERT INTO `tank_data` VALUES ('3', '2', '惩罚者', 'null', '300', '0', '0', '钢质装甲', 'H800', '锈迹斑斑的战车核心', '生锈的引擎', '猛力强哥', '45mm主炮', '45mm主炮', '7.62mm机枪', 'ATM导弹', 'close', 'close', '8000', '4000', null, null);
INSERT INTO `tank_data` VALUES ('4', '4', '帝皇战车', 'null', '3000', '0', '0', '反物质合金装甲', '所罗门SMC-1', '所罗门SMC-1', '终极龙卷', '终极龙卷', '第一大和炮', '第一大和炮', '第二大和炮', '第二大和炮', '第一武藏炮[四联装型]', '彗星之光', '1000000', '500000', null, '帝皇战车');
INSERT INTO `tank_data` VALUES ('5', '1', '\"鼬\"式', 'null', '130', '0', '0', '钢质装甲', 'H800', 'close', '猛力强哥', 'close', '36mm连射炮', '主炮穴', '副炮穴', '特殊武器穴', 'close', 'close', '0', '0', null, null);
INSERT INTO `tank_data` VALUES ('6', '2', '\"鼠\"式', 'null', '800', '0', '0', '钢质装甲', 'H800', 'close', '猛力强哥', 'close', '45mm主炮', 'close', 'close', 'close', 'close', 'close', '0', '0', null, null);
INSERT INTO `tank_data` VALUES ('7', '1', '兽王', '虎王', '300', '0', '0', '高强度钢装甲', '人工智障I型', 'close', 'BULL', 'close', '88mm加农炮', '88mm加农炮', '格林炮', 'close', 'close', 'close', '6000', '3000', '<%=basePath%>game/images/tank/Tiger.jpg', null);

-- ----------------------------
-- Table structure for tank_pack
-- ----------------------------
DROP TABLE IF EXISTS `tank_pack`;
CREATE TABLE `tank_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tank_rarity` int(20) NOT NULL DEFAULT '0' COMMENT '战车稀有度',
  `name` varchar(20) NOT NULL DEFAULT '破旧的战车' COMMENT '战车名称（可自定义）',
  `chassis_skill` varchar(20) NOT NULL DEFAULT 'null' COMMENT '战车底盘特性',
  `chassis_weight` int(20) NOT NULL DEFAULT '0' COMMENT '战车底盘重量',
  `tank_load` float(20,0) NOT NULL DEFAULT '0' COMMENT '战车目前载重量',
  `tank_max_load` float(20,0) NOT NULL DEFAULT '0' COMMENT '战车最大载重量',
  `armor` int(20) NOT NULL DEFAULT '1' COMMENT '战车装甲',
  `core_1` int(20) NOT NULL DEFAULT '1' COMMENT '一号核心',
  `core_2` int(20) NOT NULL DEFAULT '0' COMMENT '二号核心',
  `engine_1` int(20) NOT NULL DEFAULT '1' COMMENT '一号引擎',
  `engine_2` int(20) NOT NULL DEFAULT '0' COMMENT '二号引擎',
  `hole_1` int(20) NOT NULL DEFAULT '0' COMMENT '一号穴位',
  `hole_2` int(20) NOT NULL DEFAULT '0' COMMENT '二号穴位',
  `hole_3` int(20) NOT NULL DEFAULT '0' COMMENT '三号穴位',
  `hole_4` int(20) NOT NULL DEFAULT '0' COMMENT '四号穴位',
  `hole_5` int(20) NOT NULL DEFAULT '0' COMMENT '五号穴位',
  `hole_6` int(20) NOT NULL DEFAULT '0' COMMENT '六号穴位',
  `buy` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT '' COMMENT '战车图片',
  `message` varchar(100) DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '这辆战车属于哪个玩家',
  PRIMARY KEY (`id`),
  KEY `tank_chassis_skill_p` (`chassis_skill`),
  KEY `tank_rarity_p` (`tank_rarity`),
  KEY `armor_id_p` (`armor`),
  KEY `core_1_id_p` (`core_1`),
  KEY `core_2_id_p` (`core_2`),
  KEY `engine_1_id_p` (`engine_1`),
  KEY `engine_2_id_p` (`engine_2`),
  KEY `hole_1_id_p` (`hole_1`),
  KEY `hole_2_id_p` (`hole_2`),
  KEY `hole_3_id_p` (`hole_3`),
  KEY `hole_4_id_p` (`hole_4`),
  KEY `hole_5_id_p` (`hole_5`),
  KEY `hole_6_id_p` (`hole_6`),
  CONSTRAINT `armor_id_p` FOREIGN KEY (`armor`) REFERENCES `armor_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `core_1_id_p` FOREIGN KEY (`core_1`) REFERENCES `core_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `core_2_id_p` FOREIGN KEY (`core_2`) REFERENCES `core_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `engine_1_id_p` FOREIGN KEY (`engine_1`) REFERENCES `engine_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `engine_2_id_p` FOREIGN KEY (`engine_2`) REFERENCES `engine_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_1_id_p` FOREIGN KEY (`hole_1`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_2_id_p` FOREIGN KEY (`hole_2`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_3_id_p` FOREIGN KEY (`hole_3`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_4_id_p` FOREIGN KEY (`hole_4`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_5_id_p` FOREIGN KEY (`hole_5`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hole_6_id_p` FOREIGN KEY (`hole_6`) REFERENCES `weapon_pack` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_chassis_skill_p` FOREIGN KEY (`chassis_skill`) REFERENCES `chassis_skill_data` (`skill_name_ch`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tank_rarity_p` FOREIGN KEY (`tank_rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tank_pack
-- ----------------------------
INSERT INTO `tank_pack` VALUES ('31', '1', '兽王', '虎王', '300', '0', '0', '2', '2', '2', '2', '1', '2', '2', '3', '1', '1', '1', '6000', '3000', 'game/images/tank/Tiger.jpg', null, '1');
INSERT INTO `tank_pack` VALUES ('32', '1', '兽王', '虎王', '300', '0', '0', '36', '42', '1', '40', '1', '76', '77', '78', '1', '1', '1', '6000', '3000', 'game/images/tank/Tiger.jpg', null, '1');

-- ----------------------------
-- Table structure for type_data
-- ----------------------------
DROP TABLE IF EXISTS `type_data`;
CREATE TABLE `type_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `type_ch` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_ch` (`type_ch`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_data
-- ----------------------------
INSERT INTO `type_data` VALUES ('1', 'engine', '引擎');
INSERT INTO `type_data` VALUES ('2', 'Core', 'C-核心');
INSERT INTO `type_data` VALUES ('3', 'M-Gun', '主炮');
INSERT INTO `type_data` VALUES ('4', 'A-Gun', '副炮');
INSERT INTO `type_data` VALUES ('5', 'S-Gun', '特殊武器');
INSERT INTO `type_data` VALUES ('6', 'armor', '装甲');

-- ----------------------------
-- Table structure for weapon_data
-- ----------------------------
DROP TABLE IF EXISTS `weapon_data`;
CREATE TABLE `weapon_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type_ch` varchar(20) NOT NULL DEFAULT '主炮' COMMENT '装备类型的中文名',
  `type_en` varchar(255) NOT NULL DEFAULT 'M_Gun' COMMENT '装备类型的英文名',
  `rarity` int(11) NOT NULL DEFAULT '1' COMMENT '装备稀有度',
  `shell_name` varchar(20) NOT NULL DEFAULT '高爆弹',
  `w_range` int(20) NOT NULL DEFAULT '1' COMMENT '射程（1：短，2：中，3：长，4：超长）',
  `w_atk` int(11) NOT NULL DEFAULT '0' COMMENT '装备攻击力',
  `w_atk_num` int(11) NOT NULL COMMENT '这件装备的攻击次数',
  `w_intercept` int(11) NOT NULL DEFAULT '0' COMMENT '这装备是否可以用作拦截武器',
  `w_hit` float NOT NULL DEFAULT '100' COMMENT '装备命中率',
  `w_crt` float NOT NULL DEFAULT '0' COMMENT '装备普通暴击率',
  `w_x_crt` float NOT NULL DEFAULT '0' COMMENT '装备超暴击率',
  `w_reload_time` float NOT NULL DEFAULT '0' COMMENT '装备装填速度',
  `shell_num` int(255) NOT NULL DEFAULT '0' COMMENT '目前携带的弹药数量',
  `max_shell_num` int(11) NOT NULL DEFAULT '0' COMMENT '武器最大携弹量',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '装备重量',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购入价格',
  `sell` int(11) NOT NULL DEFAULT '0' COMMENT '卖出价格',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `message` varchar(100) DEFAULT NULL COMMENT '装备介绍',
  PRIMARY KEY (`id`),
  KEY `w_rarity` (`rarity`),
  KEY `w_name` (`name`),
  KEY `shell_name` (`shell_name`),
  CONSTRAINT `shell_name` FOREIGN KEY (`shell_name`) REFERENCES `shell_data` (`name_ch`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `w_rarity` FOREIGN KEY (`rarity`) REFERENCES `rarity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weapon_data
-- ----------------------------
INSERT INTO `weapon_data` VALUES ('1', 'close', '主炮', 'M_Gun', '1', '高爆弹', '1', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `weapon_data` VALUES ('2', '主炮穴', '主炮', 'M_Gun', '1', '高爆弹', '1', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `weapon_data` VALUES ('3', '副炮穴', '副炮', 'A_Gun', '1', '标准火药子弹', '1', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `weapon_data` VALUES ('4', '特殊武器穴', '特殊武器', 'S_Gun', '1', '特殊导弹', '1', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `weapon_data` VALUES ('5', 'ATM导弹', '特殊武器', 'S_Gun', '1', '特殊导弹', '1', '125', '1', '0', '100', '5', '5', '10', '0', '8', '100', '150', '75', null, null);
INSERT INTO `weapon_data` VALUES ('6', '36mm连射炮', '主炮', 'M_Gun', '1', '高爆弹', '3', '55', '2', '1', '70', '5', '2', '10', '0', '28', '90', '200', '100', null, null);
INSERT INTO `weapon_data` VALUES ('7', '45mm主炮', '主炮', 'M_Gun', '0', '高爆弹', '2', '75', '1', '0', '70', '5', '1', '8', '20', '20', '70', '120', '60', null, null);
INSERT INTO `weapon_data` VALUES ('8', '7.62mm机枪', '副炮', 'A_Gun', '0', '标准火药子弹', '1', '20', '1', '0', '85', '5', '0', '3', '0', '0', '35', '60', '30', null, null);
INSERT INTO `weapon_data` VALUES ('9', '88mm加农炮', '主炮', 'M_Gun', '1', '高爆弹', '2', '250', '1', '0', '90', '5', '5', '15', '36', '36', '250', '4000', '2000', null, null);
INSERT INTO `weapon_data` VALUES ('10', '格林炮', '副炮', 'A_Gun', '1', '标准火药子弹', '1', '60', '2', '0', '100', '5', '1', '7', '0', '0', '45', '500', '250', null, null);
INSERT INTO `weapon_data` VALUES ('11', '钻头发射器', '主炮', 'M_Gun', '1', '钻头', '1', '200', '1', '0', '90', '5', '5', '18', '30', '30', '300', '1000', '500', null, '穿透敌人的钻头');
INSERT INTO `weapon_data` VALUES ('99', '第一大和炮', '主炮', 'M_Gun', '4', '高爆弹', '2', '1000', '3', '0', '150', '40', '20', '60', '60', '60', '1800', '180000', '90000', null, '终极大炮之一的强大兵器');
INSERT INTO `weapon_data` VALUES ('100', '第二大和炮', '主炮', 'M_Gun', '5', '高爆弹', '2', '1500', '2', '0', '170', '45', '30', '50', '60', '60', '1500', '180000', '90000', null, '终极大炮之一的大和炮的衍生型');
INSERT INTO `weapon_data` VALUES ('101', '第一武藏炮[四联装型]', '主炮', 'M_Gun', '5', '高爆弹', '3', '800', '4', '0', '130', '30', '30', '80', '64', '64', '2500', '200000', '100000', null, '武藏传奇');
INSERT INTO `weapon_data` VALUES ('102', '彗星之光', '特殊武器', 'S_Gun', '4', '特殊导弹', '4', '3000', '2', '0', '200', '30', '30', '150', '24', '24', '3000', '300000', '150000', null, '如同彗星般闪亮的光芒');

-- ----------------------------
-- Table structure for weapon_pack
-- ----------------------------
DROP TABLE IF EXISTS `weapon_pack`;
CREATE TABLE `weapon_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapon_name` varchar(20) NOT NULL,
  `w_atk` int(11) NOT NULL DEFAULT '0' COMMENT '装备攻击力',
  `w_hit` float NOT NULL DEFAULT '100' COMMENT '装备命中率',
  `w_crt` float NOT NULL DEFAULT '0' COMMENT '装备普通暴击率',
  `w_x_crt` float NOT NULL DEFAULT '0' COMMENT '装备超暴击率',
  `w_reload_time` float NOT NULL DEFAULT '0' COMMENT '装备装填速度',
  `shell_name` varchar(20) DEFAULT NULL COMMENT '该武器携带的炮弹类型',
  `shell_num` int(11) NOT NULL DEFAULT '0' COMMENT '该武器目前携带的炮弹数量',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '装备重量',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '这个武器属于哪个角色',
  `equipped_with` int(11) DEFAULT '0' COMMENT '是否正在装备着（0：未装备，1：已被装备）',
  PRIMARY KEY (`id`),
  KEY `w_name` (`weapon_name`),
  KEY `w_pack_p_id` (`p_id`),
  KEY `weapon_shell_name_p` (`shell_name`),
  CONSTRAINT `weapon_name_pack` FOREIGN KEY (`weapon_name`) REFERENCES `weapon_data` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `weapon_shell_name_p` FOREIGN KEY (`shell_name`) REFERENCES `shell_data` (`name_ch`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weapon_pack
-- ----------------------------
INSERT INTO `weapon_pack` VALUES ('1', 'close', '0', '100', '0', '0', '0', '未装填', '0', '0', '0', '0');
INSERT INTO `weapon_pack` VALUES ('2', '主炮穴', '0', '100', '0', '0', '0', '未装填', '0', '0', '0', '0');
INSERT INTO `weapon_pack` VALUES ('3', '副炮穴', '0', '100', '0', '0', '0', '未装填', '0', '0', '0', '0');
INSERT INTO `weapon_pack` VALUES ('4', '特殊武器穴', '0', '100', '0', '0', '0', '未装填', '0', '0', '0', '0');
INSERT INTO `weapon_pack` VALUES ('66', '45mm主炮', '75', '70', '5', '1', '8', '高爆弹', '0', '70', '1', '0');
INSERT INTO `weapon_pack` VALUES ('67', '36mm连射炮', '55', '70', '5', '2', '10', '高爆弹', '0', '90', '1', '0');
INSERT INTO `weapon_pack` VALUES ('68', '第一武藏炮[四联装型]', '800', '130', '30', '30', '80', '高爆弹', '0', '2500', '1', '0');
INSERT INTO `weapon_pack` VALUES ('69', '彗星之光', '0', '100', '0', '0', '0', null, '0', '0', '1', '0');
INSERT INTO `weapon_pack` VALUES ('70', 'ATM导弹', '0', '100', '0', '0', '0', null, '0', '0', '1', '0');
INSERT INTO `weapon_pack` VALUES ('71', '7.62mm机枪', '0', '100', '0', '0', '0', null, '0', '0', '1', '0');
INSERT INTO `weapon_pack` VALUES ('72', '格林炮', '0', '100', '0', '0', '0', null, '0', '0', '1', '0');
INSERT INTO `weapon_pack` VALUES ('73', '88mm加农炮', '250', '90', '5', '5', '15', '高爆弹', '36', '250', '1', '0');
INSERT INTO `weapon_pack` VALUES ('74', '88mm加农炮', '250', '90', '5', '5', '15', '高爆弹', '36', '250', '1', '0');
INSERT INTO `weapon_pack` VALUES ('75', '格林炮', '60', '100', '5', '1', '7', '标准火药子弹', '0', '45', '1', '0');
INSERT INTO `weapon_pack` VALUES ('76', '88mm加农炮', '250', '90', '5', '5', '15', '高爆弹', '36', '250', '1', '1');
INSERT INTO `weapon_pack` VALUES ('77', '88mm加农炮', '250', '90', '5', '5', '15', '高爆弹', '36', '250', '1', '1');
INSERT INTO `weapon_pack` VALUES ('78', '格林炮', '60', '100', '5', '1', '7', '标准火药子弹', '0', '45', '1', '1');
