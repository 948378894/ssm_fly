/*
Navicat MySQL Data Transfer

Source Server         : nuedu
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : java9_fly

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-01-10 15:57:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articleinfo
-- ----------------------------
DROP TABLE IF EXISTS `articleinfo`;
CREATE TABLE `articleinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `authorid` int(9) NOT NULL DEFAULT '0' COMMENT '作者id,对应userinfoid',
  `releasetime` datetime DEFAULT NULL COMMENT '发布时间',
  `typeid` int(9) NOT NULL DEFAULT '0' COMMENT '类型id 对应article中id',
  `visitnum` int(9) NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `commentnum` int(9) NOT NULL DEFAULT '0' COMMENT '文章评论量',
  `cream` int(3) NOT NULL DEFAULT '0' COMMENT '是否是精华帖 0代表不是 1代表是',
  `stick` int(3) NOT NULL DEFAULT '0' COMMENT '是否是置顶帖 0代表不是 1代表是',
  `isdone` int(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '是否结帖 0代表未结帖 1代表结帖',
  `paykiss` int(9) NOT NULL DEFAULT '0' COMMENT '悬赏的飞吻数',
  `markdown_content` varchar(1000) NOT NULL,
  `html_content` varchar(1000) NOT NULL,
  `exsits` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articleinfo
-- ----------------------------
INSERT INTO `articleinfo` VALUES ('1', 'asdasd', '22', '2018-12-29 10:40:36', '1', '0', '0', '0', '0', '000', '5', 'werwefg', '<p>werwefg</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('2', 'DFSD', '22', '2018-12-29 10:45:51', '1', '0', '0', '0', '0', '000', '5', 'DASFD', '<p>DASFD</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('3', 'HeLLO', '22', '2018-12-29 10:48:04', '3', '4', '1', '0', '0', '000', '5', 'ASHJKFHAKJS\r\nDSF世茂股份啥都没干', '<p>ASHJKFHAKJS<br>DSF世茂股份啥都没干\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('4', '最后一个贴', '22', '2018-12-29 10:49:00', '2', '10', '4', '1', '1', '000', '5', '没钱了,以后发不了啊\r\n...', '<p>没钱了,以后发不了啊<br>…\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('5', '我是管理员', '21', '2018-12-29 10:51:38', '4', '0', '0', '1', '0', '000', '100', '渣渣们,你们好', '<p>渣渣们,你们好</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('6', '管理员充钱了', '21', '2018-12-29 10:54:27', '4', '80', '17', '0', '0', '000', '100', '充值成功', '<p>充值成功</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('7', '开业大酬宾', '21', '2018-12-29 10:55:56', '5', '12', '3', '1', '1', '000', '100', '充1返10\r\n大家快充值啊\r\n走过,路过,不要错过!', '<p>充1返10<br>大家快充值啊<br>走过,路过,不要错过!\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('8', '我帖子去哪了', '21', '2018-12-29 11:23:59', '1', '14', '0', '0', '0', '000', '100', '为啥不显示帖子呢,\r\n没有初始化', '<p>为啥不显示帖子呢,<br>没有初始化\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('9', '测试帖子,置顶', '21', '2018-12-29 11:27:26', '4', '17', '0', '0', '0', '000', '100', '精帖和置顶测试', '<p>精帖和置顶测试</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('10', '123', '23', '2019-01-02 15:57:55', '1', '8', '0', '0', '0', '000', '5', 'sadsadksjdgklj货到付款江安河', '<p>sadsadksjdgklj货到付款江安河</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('11', '12312', '21', '2019-01-02 16:32:25', '1', '62', '11', '0', '0', '000', '5', 'asd', '<p>asd</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('12', '发财了', '32', '2019-01-08 10:16:36', '3', '72', '3', '0', '0', '001', '20', '按时发生按时发放', '<p>按时发生按时发放</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('13', '666', '32', '2019-01-09 11:22:17', '1', '1', '0', '0', '0', '000', '5', 'ndfhdfh', '<p>ndfhdfh</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('14', '7777', '32', '2019-01-09 11:47:05', '1', '0', '0', '0', '0', '000', '5', '77', '<p>77</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('15', 'sadasd', '32', '2019-01-09 12:22:49', '1', '0', '0', '0', '0', '000', '5', 'asdasd', '<p>asdasd</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('16', 'asdsa', '32', '2019-01-09 12:22:55', '1', '8', '0', '0', '0', '000', '5', 'asdasd', '<p>asdasd</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('17', 'asdasd', '32', '2019-01-09 12:23:01', '1', '30', '0', '0', '0', '000', '5', 'dasdsad', '<p>dasdsad</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('18', 'asdasd', '32', '2019-01-09 16:18:07', '1', '1', '0', '0', '0', '000', '5', 'dasdsad大声道', '<p>dasdsad大声道</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('19', '请问', '32', '2019-01-09 16:19:42', '1', '3', '0', '0', '0', '000', '5', 'add', '<p>add</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('20', '请问1', '32', '2019-01-09 16:19:52', '1', '2', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('21', '请问2', '32', '2019-01-09 16:21:46', '1', '3', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('22', '请问3', '32', '2019-01-09 16:23:59', '1', '4', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('23', '请问4', '32', '2019-01-09 16:26:16', '1', '4', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('24', '请问5', '32', '2019-01-09 16:27:36', '1', '3', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('25', '请问7', '32', '2019-01-09 16:28:54', '1', '2', '0', '0', '0', '000', '5', 'add奥术大师多', '<p>add奥术大师多</p>\r\n', '\0');
INSERT INTO `articleinfo` VALUES ('26', 'sdfsd', '32', '2019-01-10 10:22:43', '1', '0', '0', '0', '0', '001', '5', 'fdsfsdf', '<p>fdsfsdf</p>\r\n', '\0');

-- ----------------------------
-- Table structure for articletype
-- ----------------------------
DROP TABLE IF EXISTS `articletype`;
CREATE TABLE `articletype` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子类型',
  `power` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articletype
-- ----------------------------
INSERT INTO `articletype` VALUES ('1', '提问', '0');
INSERT INTO `articletype` VALUES ('2', '分享', '0');
INSERT INTO `articletype` VALUES ('3', '动态', '0');
INSERT INTO `articletype` VALUES ('4', '公告', '1');
INSERT INTO `articletype` VALUES ('5', '活动', '1');

-- ----------------------------
-- Table structure for collectioninfo
-- ----------------------------
DROP TABLE IF EXISTS `collectioninfo`;
CREATE TABLE `collectioninfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(9) NOT NULL DEFAULT '0' COMMENT '收藏者id',
  `articleid` int(9) NOT NULL DEFAULT '0' COMMENT '收藏者帖子',
  `colltime` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collectioninfo
-- ----------------------------
INSERT INTO `collectioninfo` VALUES ('6', '32', '9', '2019-01-09 11:45:25');

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `authorid` int(9) NOT NULL DEFAULT '0' COMMENT '评论者id,对应articleinfo id',
  `commtime` datetime DEFAULT NULL COMMENT '评论时间',
  `commcontent` longtext COMMENT '评论内容',
  `artidorcommid` int(9) NOT NULL DEFAULT '0' COMMENT '评论文章id,或者评论的id',
  `commtype` int(3) NOT NULL DEFAULT '0' COMMENT '评论类型,0评论类型,1回复评论',
  `praisepoints` int(9) NOT NULL DEFAULT '0' COMMENT '收到的赞',
  `isaccept` int(3) NOT NULL DEFAULT '0' COMMENT '是否被采纳,0未被采纳,1被采纳',
  `exist` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------
INSERT INTO `commentinfo` VALUES ('11', '21', '2019-01-03 12:44:21', '大师傅', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('12', '21', '2019-01-03 12:44:33', '第三个', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('13', '21', '2019-01-03 12:46:17', '啦啦啦', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('14', '21', '2019-01-03 12:48:49', '沙发', '6', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('15', '21', '2019-01-03 12:49:32', '啊', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('16', '21', '2019-01-03 12:56:05', '楼呢', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('17', '21', '2019-01-03 15:44:08', '@2222:666', '6', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('18', '21', '2019-01-03 15:45:00', '没救了', '4', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('19', '21', '2019-01-03 15:46:31', '111', '4', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('20', '21', '2019-01-03 15:48:04', '333', '3', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('21', '32', '2019-01-08 09:56:13', 'dsadas', '8', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('22', '32', '2019-01-08 09:56:47', 'fasf', '10', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('23', '23', '2019-01-08 10:17:17', '666', '12', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('24', '23', '2019-01-08 10:17:23', '渣渣', '12', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('25', '23', '2019-01-08 10:17:29', '等死吧', '12', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('26', '23', '2019-01-08 10:17:39', '我是最优解', '12', '0', '0', '1', '\0');
INSERT INTO `commentinfo` VALUES ('27', '32', '2019-01-08 17:34:55', '666', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('28', '32', '2019-01-08 17:39:32', '345', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('29', '32', '2019-01-08 17:40:02', 'adas', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('30', '32', '2019-01-08 17:42:55', 'sgsdg', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('31', '32', '2019-01-08 17:43:55', 'sdfsdf', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('32', '32', '2019-01-08 17:44:16', '', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('33', '32', '2019-01-08 17:45:41', 'sdgsdg', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('34', '32', '2019-01-08 17:46:24', 'afasfas', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('35', '32', '2019-01-08 17:48:45', 'gsdg', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('36', '32', '2019-01-08 17:49:10', '@aaa:dfdsf', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('37', '32', '2019-01-08 17:49:20', 'fsdfsd', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('38', '32', '2019-01-08 17:49:39', '@aaa:sdsad', '11', '0', '0', '0', '');
INSERT INTO `commentinfo` VALUES ('39', '32', '2019-01-08 17:49:50', 'asfasfasf', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('40', '32', '2019-01-08 17:52:18', 'dasf', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('41', '32', '2019-01-10 14:58:41', '按个', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('42', '32', '2019-01-10 15:09:42', '安抚', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('43', '32', '2019-01-10 15:11:55', '奥术大师', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('44', '32', '2019-01-10 15:13:10', '签到', '11', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('45', '32', '2019-01-10 15:22:29', '666', '4', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('46', '32', '2019-01-10 15:23:42', '333', '4', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('47', '32', '2019-01-10 15:25:41', '33', '7', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('48', '32', '2019-01-10 15:26:43', '22', '7', '0', '0', '0', '\0');
INSERT INTO `commentinfo` VALUES ('49', '32', '2019-01-10 15:28:46', '7777777', '7', '0', '0', '0', '\0');

-- ----------------------------
-- Table structure for messageinfo
-- ----------------------------
DROP TABLE IF EXISTS `messageinfo`;
CREATE TABLE `messageinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `commid` int(9) NOT NULL COMMENT '回复人id',
  `articleid` int(9) NOT NULL COMMENT '文章id',
  `writerid` int(11) NOT NULL COMMENT '作者id',
  `empty` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否清空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messageinfo
-- ----------------------------
INSERT INTO `messageinfo` VALUES ('1', '32', '7', '21', '\0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `nickname` varchar(200) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(500) NOT NULL DEFAULT '' COMMENT '用户密码',
  `head` varchar(100) NOT NULL DEFAULT 'default.png' COMMENT '用户头像地址',
  `city` varchar(50) NOT NULL DEFAULT '外太空' COMMENT '居住城市',
  `sex` varchar(2) NOT NULL DEFAULT '男' COMMENT '性别',
  `sign` varchar(1000) NOT NULL DEFAULT '您的签名为空' COMMENT '签名',
  `kissnum` int(9) NOT NULL DEFAULT '100' COMMENT '飞吻数',
  `regtime` date DEFAULT NULL COMMENT '注册时间',
  `authority` int(2) NOT NULL DEFAULT '0' COMMENT '用户权限, 0 代表普通用户,1代表管理员',
  `experience` int(9) NOT NULL DEFAULT '0' COMMENT '经验值, 发帖回帖涨经验值',
  `activecode` varchar(200) NOT NULL DEFAULT '',
  `active` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('11', '888888@qq.com', '生命十一号', 'f379eaf3c831b04de153469d1bec345e', 'default.png', '外太空', '男', '您的签名为空', '100', '2018-12-26', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('12', '999999@qq.com', '生命十二号', 'f379eaf3c831b04de153469d1bec345e', 'default.png', '外太空', '男', '您的签名为空', '120', '2018-12-26', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('13', '343434@qq.com', 'asdas', 'f379eaf3c831b04de153469d1bec345e', 'zou.gif', '外太空', '男', '您的签名为空', '100', '2018-12-26', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('14', '123456@qq.com', '生命一号', 'f379eaf3c831b04de153469d1bec345e', 'default.png', '外太空', '男', '您的签名为空', '100', '2018-12-27', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('21', '666666@qq.com', '2222', 'f379eaf3c831b04de153469d1bec345e', 'zou.gif', '外太空', '女', '', '999999614', '2018-12-27', '1', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('22', '12345678@qq.com', '生命1号', 'f379eaf3c831b04de153469d1bec345e', 'default.png', '外太空', '女', '', '0', '2018-12-27', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('23', '123@qq.com', '小小', 'e10adc3949ba59abbe56e057f20f883e', 'default.png', '外太空', '男', '您的签名为空', '140', '2019-01-02', '0', '0', '', '\0');
INSERT INTO `userinfo` VALUES ('32', '15973800855@163.com', 'aaa', '4297f44b13955235245b2497399d7a93', '6708e42c-03d1-4e88-9e32-14ca94060fca1.jpg', '外太空', '男', '您的签名为空', '50', '2019-01-07', '1', '0', '983f3715-2587-49fc-85f1-06487bd33e54', '');
