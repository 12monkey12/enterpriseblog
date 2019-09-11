/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : companyblog

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2019-09-07 14:31:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(20) NOT NULL AUTO_INCREMENT,
  `acount` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'admin1', '123', '技术部');
INSERT INTO admin VALUES ('2', 'admin2', '123', '人力资源部');
INSERT INTO admin VALUES ('3', 'admin3', '123', '总经理办公室');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `cid` int(20) NOT NULL,
  `comment` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uid` (`uid`),
  KEY `fk_cid` (`cid`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`cid`) REFERENCES `contents` (`cid`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO comments VALUES ('4', '2', '14', '讲道理，散甲醛最好的方法还是打开窗户用风扇吹走，然后再除雾霾，毕竟甲醛的吸附不如雾霾的吸附有效率。', '2019-9-1');
INSERT INTO comments VALUES ('5', '1', '14', 'dsafreagfsd', '2019-09-03');
INSERT INTO comments VALUES ('6', '1', '14', '的挖坟挖', '2019-09-03');
INSERT INTO comments VALUES ('7', '1', '14', '二手房灌水灌水', '2019-09-03');
INSERT INTO comments VALUES ('8', '1', '14', 'jjjjjjjjjjj', '2019-09-03');
INSERT INTO comments VALUES ('12', '1', '14', '&ltscript>location.href=\'www.baidu.com\'&lt/script>', '2019-09-03');
INSERT INTO comments VALUES ('13', '1', '14', '&ltscript>location.href=\"www.baidu.com\"&lt/script>', '2019-09-03');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `addtime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO contact VALUES ('1', '1', 'hdshf', 'dasilhe阿凤姐奥利弗的萨拉', '2019-9-3 下午9:41');
INSERT INTO contact VALUES ('2', '1', 'dsafe的撒', '打飞机啊松肉粉', '2019-9-3 下午9:41');
INSERT INTO contact VALUES ('3', '2', '放大发', '阿尔法狗它是如何与人个人', '2019-9-3 下午9:41');
INSERT INTO contact VALUES ('4', '1', '打法和法律瓦房', '而法国人金马奖反日建瓯个人分', '19-9-3 下午9:41');
INSERT INTO contact VALUES ('5', '1', '就范德萨合肥half的进来撒', '的方式客户如果加上路费阿飞', '19-9-3 下午9:44');

-- ----------------------------
-- Table structure for `contents`
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `aid` int(20) NOT NULL,
  `addtime` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `pics` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `star` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `fk_aid` (`aid`),
  CONSTRAINT `fk_aid` FOREIGN KEY (`aid`) REFERENCES `admin` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO contents VALUES ('14', '1', '2019-08-30', '锤子阅读 v1.4.0 史上最大改版上线，我们欢迎一切反馈', '各位好，这里是锤子阅读的官方社区账号。初次见面，我们带来全新扩容改版的 v1.4.0 锤子阅读，Android 和 iOS 均已上线，欢迎下载使用。也期待能在这里得到大家的使用体验反馈，我们有问必答有查必复。\r\n\r\n分享一下新版本中的几大变化和它们的背后思路。\r\n\r\n·更精简的首页，解放浏览空间\r\n新版本中最直观的变化，是取消了底部的 4 个 tab。“订阅”页集成到精选频道左侧，轻轻一划即可抵达。“我的”、“收藏”、“阅读历史”等，则被统统收纳到左上角的导航栏中。不用升级手机，你的自由浏览区域就得到了大幅增加。作为一款深度阅读产品，我们相信简洁清新、摒弃一切干扰的界面，能更好地帮助用户把注意力集中在阅读内容上。\r\n\r\n·更精致的精选，有且只有最好\r\n新版锤子阅读对精选频道进行了全面优化，引入全新的时间线模式，完全摒弃算法，依靠阅读品位，每天筛选出 10 篇左右全网最值得一读的文章。换句话说，这将是一个完全由编辑手工奉上价值资讯的频道。精深报道，优质写作，都在全新的精选频道里了。\r\n\r\n·更精深的站点，打造个人盛宴\r\n和新版锤子阅读同步登场的，还有近百个全新上线的高质量内容站点，涵盖新闻、科技、商业、文艺等多个领域，希望能为大家在 DIY 自己的“媒体食谱”时提供更多的优质选择。\r\n\r\n算法蔚然成风的年代，锤子阅读坚守方向，完成了有史以来最大的版本更新。一切改变的初衷，皆为保证每日阅读的价值与营养。新的界面之上，永不改变的是锤子阅读对入驻站点和推荐文章的高标准要求。\r\n\r\n期待与你的更多相遇。', '1_1567150558569.jpg', '1');
INSERT INTO contents VALUES ('15', '2', '2019-08-30', '装修季【再谈室内装修污染——这个杀手有点冷】', '又到了一年装修季的尾声，锤子商城再次上架畅呼吸系列产品，欢迎大家前往选购。\r\n以下是微博博主@急诊科女超人于莺 的一篇关于空气进化器甲醛方面的评测文章，分享给各位用户。\r\n眼红、眼痒、咽喉不适或疼痛、胸闷、气喘、皮炎？甚至是头痛、头晕、乏力、感觉障碍、爱打瞌睡？或许你以为的感冒或疲劳症状、皮肤问题，也许是长期接触甲醛的反应。\r\n        更严重的是，WHO 下属的国际癌症研究机构 IRAC 的论文库资料，确认甲醛为1类致癌物，有充足并强有力的证据证明它会诱发白血病。当然，这个诱发白血病或致癌的先决条件是甲醛暴露的持续时间和致癌剂量。目前大家都关注环保、关注健康，普通家庭新装修环境下不可能出现这么严重的甲醛污染，但知道一些生活常识，防患于未然对自己和家人都是一种保护。\r\n 零甲醛不存在！记住甲醛的“安全线”。甲醛在自然界中的存在相当广泛，森林、水果、动物，包括我们人体内都会含有一定剂量的甲醛。家中的板材类家具、窗帘布艺沙发等是甲醛最大的藏身处，即使是纯实木的家具，也不可能达到零甲醛的存在。刚装修完、完全合格的房子，也会随着家具、窗帘的加入，造成“积少成多”的超标。比如说，我家 2016 年装修时采用的是德国艾格板材，一年后，开放空间的甲醛含量都达标，但是密闭抽屉里的甲醛含量还是超标。这里给大家一个tips，如果做固定衣柜或衣帽间的话，尽量少做抽屉，宜家一些抽屉柜可以替代。那么问题来了？甲醛的“安全线”在哪里？\r\n        中华人民共和国国家标准《居室空气中甲醛的卫生标准》规定：居室空气中甲醛的最高容许浓度为 0.08 毫克/立方米，但绝大部分刚装修完的房子，甲醛多不低于 0.2 毫克/立方米，数倍于 0.08 这个值。\r\n        进入家装季，甲醛是绕不开的话题。新装修的房子放“味”多久才安全，如何有效去除甲醛？新装修的房子，显然最好的方式是通风，门窗大开，柜门、抽屉都打开，电扇也打开，增加空气流动。但是，大家会面临一个问题，新装修的房子，谁去开关窗？雾霾天、沙尘暴、雨雪天气将何去何从？甲醛的释放期比较长，一般为 3-15 年，除了打开门窗通风外，能否配合其他净化方式，是否有其他的选择？\r\n        市面上可见的去除甲醛的方法到底管用与否？', '2_1567150987286.jpg', '2');
INSERT INTO contents VALUES ('22', '1', '2019-09-03', 'javascript', '的知识Greg深入骨髓', '1_1567509522807.jpg', '0');

-- ----------------------------
-- Table structure for `great`
-- ----------------------------
DROP TABLE IF EXISTS `great`;
CREATE TABLE `great` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `cid` int(20) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of great
-- ----------------------------
INSERT INTO great VALUES ('1', '1', '14', '1');
INSERT INTO great VALUES ('2', '2', '14', '1');
INSERT INTO great VALUES ('3', '3', '15', '1');
INSERT INTO great VALUES ('4', '4', '15', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'login_user.jpg',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'ls', '1_1567509664581.jpg', '123@1', '123', '11000000000');
INSERT INTO user VALUES ('2', 'admin', '2_1567235750144.jpg', '123@3', '123', '11111111111');
INSERT INTO user VALUES ('3', 'aaa', 'login_user.jpg', '123@2', '123', '11222222222');
INSERT INTO user VALUES ('4', 'admin1', 'login_user.jpg', '123@123', '123', '11111111111');
INSERT INTO user VALUES ('5', 'admin11', 'login_user.jpg', '123@1234', '123', '11111111111');
INSERT INTO user VALUES ('6', '刘德华', 'login_user.jpg', '111@111', '123', '11111111111');
INSERT INTO user VALUES ('7', 'asd', 'login_user.jpg', 'asd@a', '123', '11111111111');
