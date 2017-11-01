/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : plg

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-10-24 17:44:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_admin
-- ----------------------------
DROP TABLE IF EXISTS `my_admin`;
CREATE TABLE `my_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '账号',
  `password` char(40) NOT NULL COMMENT '密码(使用sha1()加密)',
  `email` varchar(50) DEFAULT NULL COMMENT '管理员邮箱',
  `roles` varchar(255) DEFAULT NULL COMMENT '权限',
  `auto_key` char(20) DEFAULT NULL COMMENT '自动登录的KEY',
  `access_token` char(40) DEFAULT NULL COMMENT '自动登录TOKEN',
  `status` tinyint(2) NOT NULL COMMENT '管理员状态',
  `create_id` int(11) NOT NULL COMMENT '创建管理员',
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `last_time` int(11) DEFAULT NULL COMMENT '最后登录的时间',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `update_time` int(11) NOT NULL DEFAULT '1' COMMENT '修改时间',
  `update_id` int(11) NOT NULL DEFAULT '1' COMMENT '修改用户',
  `face` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='后台管理员信息表';

-- ----------------------------
-- Records of my_admin
-- ----------------------------
INSERT INTO `my_admin` VALUES ('1', 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'admin@qq.com', '', '', '', '1', '0', '1494677854', '1504495421', '127.0.0.1', '1', '1', null);
INSERT INTO `my_admin` VALUES ('2', 'LaoW', 'd9a7b43d50ac7e36de03e0336b56a223a640aa8b', '52746966711@qq.com', '', '', '', '1', '0', '1494678501', '1495095405', '127.0.0.1', '1', '1', null);
INSERT INTO `my_admin` VALUES ('4', 'bbb', '8c9d225f1ba4547745a09af8355994c44a66901f', 'bbb@126.com', 'user', null, null, '1', '1', '1495010282', '1495101374', '127.0.0.1', '1495010282', '1', null);
INSERT INTO `my_admin` VALUES ('5', 'heyuming', 'c3bccc0d84947bf48c628c5a8edd69e51389bd86', '527877218@qq.com', '', null, null, '-1', '1', '1499942835', '1499942835', '183.63.92.250', '1499942835', '1', null);

-- ----------------------------
-- Table structure for my_article
-- ----------------------------
DROP TABLE IF EXISTS `my_article`;
CREATE TABLE `my_article` (
  `id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `tid` mediumint(8) NOT NULL COMMENT '文章类型',
  `litpic` varchar(100) NOT NULL COMMENT '缩略图',
  `keywords` varchar(30) NOT NULL COMMENT '关键词',
  `desc` varchar(255) NOT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(11) NOT NULL COMMENT '发布时间',
  `edittime` int(11) NOT NULL COMMENT '修改时间',
  `game_id` int(11) DEFAULT NULL COMMENT '游戏id',
  `priority` varchar(15) DEFAULT '100',
  `is_top` tinyint(1) DEFAULT '1' COMMENT '1:置顶   0: 不置顶',
  `is_lamp` tinyint(1) DEFAULT '0' COMMENT '1:置顶   0: 不置顶',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='文章列表';

-- ----------------------------
-- Records of my_article
-- ----------------------------
INSERT INTO `my_article` VALUES ('1', '《秀逗军团》情报站-介绍', 'admin', '1', '1', 'gay老', '芽儿哟', '<p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">小明的头，香蕉球，一脚踢到摩天大楼，情报站是报告世界争霸的数据，分为两面城防信息、复仇信息！</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; z-index: 10; text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156632618926.jpg\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; z-index: 10; text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156632114313.jpg\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">城防信息：</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">会报告每天攻击你城池的玩家，还会受到玩家非常嚣张的挑衅！这个时候你就可以通过城防记录的信息来复仇，整理好你的军团点击该玩家复仇就可以啦！复仇也会获得奖励，并且可以将对方的武将擒住作为你的奴隶去鞭打他，在鞭打的过程当中会的到奖励！</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; z-index: 10; text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156632443872.jpg\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">碰到高级的玩家怎么办，我们不能白白的被吊打，这个事就可以点击通缉，会有好友帮助你击杀他，帮你俘虏他，这样你也可以同样的鞭打他，同时获得奖励。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">报复信息：就是你侵略其他人的城池，其他人来找你报仇的信息。还可以看一下他是怎么找你复仇的，替他复仇的人是谁！</p><p><br/></p>', '1497336001', '1499945530', '1', '2', '0', '0');
INSERT INTO `my_article` VALUES ('2', '《秀逗军团》副本系统-介绍', 'admin', '2', '1', 'gay老', '芽儿哟', '<p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">大家一听说副本都会想起平时升级的一个个的副本，秀逗给大家的是副本活动和正常的关卡副本是有却别的哦！下面就给大家介绍一下！</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">点开副本会有悬赏和征战！</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156602270153.png\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">悬赏：</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">周二、周四、周六开启怒抢金币，不明思议就是通过这个副本可以获得很多的钱。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">周一、周三、周五、周日开启保卫君主，这个副本可以后的大量的经验来提升自己的等级。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">每个玩法都会给玩家提供适应攻击的难度，副本的难度来决定获得经验的多少！</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156602721040.png\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">征战：</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">周一、周四、周日开启百步穿杨通过副本难度可以获得很多的智力型武将提升装备的材料。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">周二、周五、周日开启速战速决通过副本难度可以获得很多统帅型武将提升装备的材料。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">周三、周六、周日开启大兵小将通过副本难度可以获得很多武力型武将提升装备的材料。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156603606662.png\"/></p><p><br/></p>', '1497336001', '1499156605', '1', '5', '0', '0');
INSERT INTO `my_article` VALUES ('25', '《秀逗军团》竞技场攻略', 'admin', '2', '', '老王', '老王', '<p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">由于竞技场开放等级比较早，大多数玩家还没有熟悉武将技能、士兵克制，而对于阵容的搭配更是一头雾水，下面简单说一下竞技场的机制和入门阵容。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; z-index: 10; text-align: center;\"><img src=\"/ueditor/php/upload/image/20170704/1499156557135997.png\"/></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">与其他游戏不同，《<a class=\"keyword-tag\" href=\"http://www.9game.cn/xdjt/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">秀逗军团</a>》竞技场胜利的方式有两个，一是打倒对方的主公（就是骑着马不停召唤士兵的那货），二是时间到时，自己分数高于对方（得分根据击杀武将、士兵数量计算）。简单的按照规则分析的话会形成两种阵容：一是速攻流，用摧枯拉朽的攻势一击击败对方；二是生存流，保证自身不死的情况下尽量多击杀对方，拖到时间结束。下面简单介绍两种流派以及入门阵容。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">速攻流典型英雄就是黄盖，黄盖普通攻击造成的范围伤害能轻松解决掉大波士兵，而且黄盖这种依靠普通攻击的武将完全不惧张角锁<a class=\"keyword-tag\" href=\"http://www.9game.cn/topic/celuelei/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">策略</a>点，在人手一个张角的竞技场里面，用黄盖才是最好的<a class=\"keyword-tag\" href=\"http://www.9game.cn/topic/pojieban/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">破解</a>办法。黄盖可以通过十连抽和战役获取。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">而生存流不仅仅是像其他游戏多带奶妈这么简单了，因为按照规则，时间结束自己得分低于对方的话仍然算输，所以像关羽这种有防御有攻击有回策略点的武将就非常吃香，如果再加上蔡文姬回血加盾更是如虎添翼，最后一个武将坑用统帅将或者曹仁这种超级大肉盾都是可以的。而关羽的获取十分容易，几天的竞技场币就能够换一个三星关羽。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; z-index: 10;\">对于没有过多武将的玩家，入门阵容就用第一次十连抽的S将+A将再加上已有的颜良先混竞技场，再在战役中每天混几张想要的武将的碎片，等S将一多搭配自然容易。在打竞技场之前先稍微研究一下对方的武将搭配再打，不然失败了扣除次数就划不来了~</p><p><br/></p>', '1497437650', '1499156569', '1', '4', '0', '0');
INSERT INTO `my_article` VALUES ('26', '《秀逗军团》首发倒计时，千元福利大放送', 'admin', '3', '1', '傻子', '太和村', '<p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"transition: color 200ms, background-color 200ms, border-color 200ms;\">活动时间:</strong>2016-10-18 15:12:00 至 2016-10-20 11:00:00</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"transition: color 200ms, background-color 200ms, border-color 200ms;\">活动内容:</strong></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">还有2天就全平台震撼首发啦！期间大家的开心、<a class=\"keyword-tag\" href=\"http://www.9game.cn/xyqdb/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">期待</a>、兴奋等诸多情感，都将伴随着10月20日服务器开启而进入一个全新的高度。非常感谢大家一直以来的陪伴和耐心等待。让我们一起来倒计时，留下一张你最喜欢的图片，一起去翻开《<a class=\"keyword-tag\" href=\"http://www.9game.cn/xdjt/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">秀逗军团</a>》崭新的一页吧！</p><p><br/></p>', '1497437650', '1499156527', '1', '6', '0', '0');
INSERT INTO `my_article` VALUES ('29', '《秀逗军团》11月15日11:00新服正式开启', 'admin', '1', '', '情爱', '那你猜猜', '<p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">搞笑剧情，独特造型，不一样的<a class=\"keyword-tag\" href=\"http://www.9game.cn/topic/sanguoticai/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">三国</a>！11月15日11:00点整，以物理引擎为原理的<a class=\"keyword-tag\" href=\"http://www.9game.cn/topic/celuelei/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">策略</a><a class=\"keyword-tag\" href=\"http://www.9game.cn/topic/tafanglei/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">塔防</a>手游《<a class=\"keyword-tag\" href=\"http://www.9game.cn/xdjt/\" style=\"transition: color 200ms, background-color 200ms, border-color 200ms; color: rgb(255, 136, 0); text-decoration-line: none;\">秀逗军团</a>》全新服务器----“官渡之战”正式开启。争霸之路，非你莫属。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"transition: color 200ms, background-color 200ms, border-color 200ms;\">新服“</strong><strong style=\"transition: color 200ms, background-color 200ms, border-color 200ms;\">官渡之战</strong><strong style=\"transition: color 200ms, background-color 200ms, border-color 200ms;\">”即将开启</strong></p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">《秀逗军团》自上架以来，人气持续爆棚，吸引了不少玩家。不管是男生女生，老人小孩，都被这款跨时代的手游所折服。精致的画面、独特的造型、优美的音质，让大家知道，手游也可以如此好玩。为了给关注和喜欢该游戏的玩家带来更为优质的游戏体验，11月14日11:00点整，游戏将开放全新服务器“官渡之战”，邀请玩家共聚三国，加入对抗之战，走上争霸之路。</p><p style=\"transition: color 200ms, background-color 200ms, border-color 200ms; margin-top: 0px; margin-bottom: 20px; padding: 0px; text-indent: 2em; color: rgb(102, 102, 102); z-index: 10; font-family: Arial, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 《秀逗军团》项目组</p><p><br/></p>', '1497604316', '1499156386', '1', '3', '0', '0');
INSERT INTO `my_article` VALUES ('30', 'B站电视剧被下架', '123', '1', '', 'B', 'B', '<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">B站是国内最大的年轻人潮流文化娱乐社区bilibili网站的简称，其最大的特色是悬浮于视频上方的实时评论功能，爱好者称其为“弹幕”。根据百度百科介绍，目前B站活跃用户超过1.5亿，每天视频播放量超过一亿，弹幕总量超过14亿。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/ueditor/php/upload/image/20170713/1499945904691201.jpg\" title=\"1499945904691201.jpg\" alt=\"fd58345143967ef_size196_w600_h375.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">从昨天晚间开始，陆续有A站、B站用户发现，大量海外影视剧、电影遭到下架，原因未知。有网友调侃，这是演了一出“悬疑剧”，收藏夹一夜被掏空。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">对此，有业内人士表示，此次海外影视剧大规模下架，可能是出于版权的考虑。在过去几年间，视频网站下架影视剧、电影的案例并不少见，优酷土豆、搜狐视频等都因版权问题下架过视频。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">此次B站回应称为了维护网站内容的规范性，也印证了该分析，同时我们也不难推断：同样遭遇国外剧“一夜集体阵亡”的A站也是出于此审查原因。</p><p><br/></p>', '1499945701', '1502280161', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for my_articletype
-- ----------------------------
DROP TABLE IF EXISTS `my_articletype`;
CREATE TABLE `my_articletype` (
  `id` smallint(100) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章类型';

-- ----------------------------
-- Records of my_articletype
-- ----------------------------
INSERT INTO `my_articletype` VALUES ('1', '新闻');
INSERT INTO `my_articletype` VALUES ('2', '公告');
INSERT INTO `my_articletype` VALUES ('3', '活动');

-- ----------------------------
-- Table structure for my_auth_child
-- ----------------------------
DROP TABLE IF EXISTS `my_auth_child`;
CREATE TABLE `my_auth_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `jc_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `my_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jc_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `my_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_auth_child
-- ----------------------------
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/admin/index');
INSERT INTO `my_auth_child` VALUES ('user', '/admin/admin/index');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/admin/login');
INSERT INTO `my_auth_child` VALUES ('user', '/admin/admin/login');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/admin/search');
INSERT INTO `my_auth_child` VALUES ('user', '/admin/admin/search');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/admin/update');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/admin/upload');
INSERT INTO `my_auth_child` VALUES ('user', '/admin/admin/upload');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/auth/index');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/auth/search');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/auth/update');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/menu/index');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/menu/search');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/menu/update');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/allocation');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/create');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/index');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/search');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/update');
INSERT INTO `my_auth_child` VALUES ('admin', '/admin/role/view');
INSERT INTO `my_auth_child` VALUES ('admin', 'deleteAuth');
INSERT INTO `my_auth_child` VALUES ('admin', 'deleteRole');
INSERT INTO `my_auth_child` VALUES ('admin', 'deleteUser');
INSERT INTO `my_auth_child` VALUES ('admin', 'updateAuth');

-- ----------------------------
-- Table structure for my_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `my_auth_item`;
CREATE TABLE `my_auth_item` (
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限或者角色名',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型 1 角色 2 权限',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '说明信息',
  `data` varchar(255) DEFAULT NULL COMMENT '其他配置信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和角色信息表';

-- ----------------------------
-- Records of my_auth_item
-- ----------------------------
INSERT INTO `my_auth_item` VALUES ('/admin/admin/index', '2', '管理员信息显示', null, '1495087154', '1495087154');
INSERT INTO `my_auth_item` VALUES ('/admin/admin/login', '2', '管理员欢迎页面显示', null, '1495087164', '1495087164');
INSERT INTO `my_auth_item` VALUES ('/admin/admin/search', '2', '管理员信息搜索', null, '1495087184', '1495087184');
INSERT INTO `my_auth_item` VALUES ('/admin/admin/update', '2', '管理员信息编辑', null, '1495087200', '1495087200');
INSERT INTO `my_auth_item` VALUES ('/admin/admin/upload', '2', '管理员头像上传', null, '1495087312', '1495087312');
INSERT INTO `my_auth_item` VALUES ('/admin/auth/index', '2', '权限管理显示', null, '1495087400', '1495087400');
INSERT INTO `my_auth_item` VALUES ('/admin/auth/search', '2', '权限信息搜索', null, '1495087494', '1495087494');
INSERT INTO `my_auth_item` VALUES ('/admin/auth/update', '2', '权限信息编辑', null, '1495087511', '1495087511');
INSERT INTO `my_auth_item` VALUES ('/admin/menu/index', '2', '导航栏目显示', null, '1495087521', '1495087521');
INSERT INTO `my_auth_item` VALUES ('/admin/menu/search', '2', '导航栏目搜索', null, '1495087609', '1495087609');
INSERT INTO `my_auth_item` VALUES ('/admin/menu/update', '2', '导航栏目编辑', null, '1495087680', '1495087680');
INSERT INTO `my_auth_item` VALUES ('/admin/role/allocation', '2', '角色权限分配', null, '1495087812', '1495087812');
INSERT INTO `my_auth_item` VALUES ('/admin/role/create', '2', '角色分配权限操作', null, '1495087922', '1495087922');
INSERT INTO `my_auth_item` VALUES ('/admin/role/index', '2', '角色管理显示', null, '1495087964', '1495087964');
INSERT INTO `my_auth_item` VALUES ('/admin/role/search', '2', '角色信息搜索', null, '1495088011', '1495088011');
INSERT INTO `my_auth_item` VALUES ('/admin/role/update', '2', '角色管理编辑', null, '1495088100', '1495088100');
INSERT INTO `my_auth_item` VALUES ('/admin/role/view', '2', '角色信息详情', null, '1495088125', '1495088125');
INSERT INTO `my_auth_item` VALUES ('admin', '1', '超级管理员', null, '1495088170', '1495088170');
INSERT INTO `my_auth_item` VALUES ('deleteAuth', '2', '删除权限的权限', null, '1495088230', '1495088230');
INSERT INTO `my_auth_item` VALUES ('deleteRole', '2', '删除角色信息权限', null, '1495088454', '1495088454');
INSERT INTO `my_auth_item` VALUES ('deleteUser', '2', '删除管理员权限', null, '1495088641', '1495088641');
INSERT INTO `my_auth_item` VALUES ('updateAuth', '2', '权限信息操作', null, '1495088888', '1495088888');
INSERT INTO `my_auth_item` VALUES ('user', '1', '普通管理员', null, '1495088954', '1496308000');

-- ----------------------------
-- Table structure for my_menu
-- ----------------------------
DROP TABLE IF EXISTS `my_menu`;
CREATE TABLE `my_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID(只支持两级分类)',
  `menu_name` varchar(50) NOT NULL COMMENT '栏目名称',
  `icons` varchar(50) NOT NULL DEFAULT 'icon-desktop' COMMENT '使用的icons',
  `url` varchar(50) DEFAULT NULL COMMENT '访问地址',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（1启用 0 停用）',
  `sort` int(4) NOT NULL DEFAULT '100' COMMENT '排序字段',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建用户',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='使用SimpliQ的样式的导航栏样式';

-- ----------------------------
-- Records of my_menu
-- ----------------------------
INSERT INTO `my_menu` VALUES ('1', '0', '后台管理', ' icon-cog', '#', '1', '1', '1495087200', '2', '1495087200', '2');
INSERT INTO `my_menu` VALUES ('2', '1', '导航栏目', ' icon-align-justify', '/admin/menu/index', '1', '100', '1495088200', '2', '1495088200', '1');
INSERT INTO `my_menu` VALUES ('3', '1', '管理员信息', ' icon-user', '/admin/admin/index', '1', '2', '1495089200', '2', '1495089200', '2');
INSERT INTO `my_menu` VALUES ('4', '1', '权限管理', 'icon-fire', '/admin/auth/index', '1', '3', '1495091200', '2', '1495091200', '2');
INSERT INTO `my_menu` VALUES ('5', '1', '角色管理', 'icon-flag', '/admin/role/index', '1', '2', '1495091354', '2', '1495091354', '2');
INSERT INTO `my_menu` VALUES ('6', '0', '技术管理', 'icon-cog', '#', '1', '3', '1496220510', '1', '1499051401', '1');
INSERT INTO `my_menu` VALUES ('7', '6', '公告管理', 'icon-align-justify', '#', '1', '2', '1496220677', '1', '1496304279', '1');

-- ----------------------------
-- Table structure for my_unit_choice
-- ----------------------------
DROP TABLE IF EXISTS `my_unit_choice`;
CREATE TABLE `my_unit_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '题目',
  `connect` varchar(255) DEFAULT NULL,
  `a_choice` varchar(255) DEFAULT NULL COMMENT 'A答案',
  `b_choice` varchar(255) DEFAULT NULL COMMENT 'B答案',
  `c_choice` varchar(255) DEFAULT NULL COMMENT 'C答案',
  `d_choice` varchar(255) DEFAULT NULL COMMENT 'D答案',
  `answer` varchar(255) DEFAULT NULL COMMENT '答案',
  `analysis` varchar(255) DEFAULT NULL COMMENT '题目分析',
  `time` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_unit_choice
-- ----------------------------

-- ----------------------------
-- Table structure for my_users
-- ----------------------------
DROP TABLE IF EXISTS `my_users`;
CREATE TABLE `my_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 自增    100000起递增',
  `user_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户类型（1:正式，2:免注册临时，3:facebook)',
  `account` varchar(32) DEFAULT NULL COMMENT '账号（6-16英文数字）',
  `password` varchar(64) DEFAULT NULL COMMENT '密码（6-16英文数字）',
  `account1` varchar(32) DEFAULT NULL,
  `password1` varchar(64) DEFAULT NULL,
  `account2` varchar(32) DEFAULT NULL,
  `password2` varchar(64) DEFAULT NULL,
  `account3` varchar(32) DEFAULT NULL,
  `password3` varchar(64) DEFAULT NULL,
  `account4` varchar(32) DEFAULT NULL,
  `password4` varchar(64) DEFAULT NULL,
  `account5` varchar(32) DEFAULT NULL,
  `password5` varchar(64) DEFAULT NULL,
  `is_fb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定了Facebook账号（0：未绑定， 1：绑定）',
  `key_id` varchar(50) DEFAULT NULL COMMENT '非正式用户存放uid的地方',
  `channel` tinyint(2) NOT NULL DEFAULT '1' COMMENT '渠道（1:IOS，2:Android）',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码(可选)',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱（可选）',
  `name` varchar(50) DEFAULT NULL COMMENT '昵称（可选）',
  `device` varchar(50) DEFAULT NULL COMMENT '设备（可选）',
  `uuid` varchar(50) DEFAULT NULL COMMENT '唯一标识（可选）',
  `site` varchar(1000) DEFAULT NULL COMMENT '开通的游戏',
  `mail_edit_log` varchar(1000) DEFAULT NULL COMMENT '邮箱操作记录',
  `create_ip` varchar(15) DEFAULT NULL COMMENT '注册ip',
  `create_time` varchar(15) DEFAULT NULL COMMENT '注册时间 时间戳',
  `last_ip` varchar(15) DEFAULT NULL COMMENT '最后登陆ip ',
  `last_time` varchar(15) DEFAULT NULL COMMENT '最后登陆时间 时间戳',
  `is_fro` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否封禁(1:账号已封禁  0:账号正常)',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(1:账号已删除  0:账号未删除)',
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `user_type` (`user_type`) USING BTREE,
  KEY `last_time` (`last_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_users
-- ----------------------------
INSERT INTO `my_users` VALUES ('100057', '1', '527469667', '7f3ea874b05d408a11a2846c1ef70f36', null, null, null, null, null, null, null, null, null, null, '0', '', '1', null, 'cong444@126.com', null, null, null, 'eyIxIjoxfQ==', 'W3sibmV3X21haWwiOiJjb25nNDQ0QDEyNi5jb20iLCJvbGRfbWFpbCI6IjUyNzQ2OTY2N0BxcS5jb20iLCJlZGl0X3RpbWUiOjE1MDA5NTI4MTUsImVkaXRlciI6InBsYXllciJ9LHsibmV3X21haWwiOiJjb25nNDQ0NEAxMjYuY29tIiwib2xkX21haWwiOiJjb25nNDQ0QDEyNi5jb20iLCJlZGl0X3RpbWUiOjE1MDA5NTI4NzYsImVkaXRlciI6InBsYXllciJ9LHsibmV3X21haWwiOiJjb25nNDQ0QDEyNi5jb20iLCJvbGRfbWFpbCI6ImNvbmc0NDQ0QDEyNi5jb20iLCJlZGl0X3RpbWUiOjE1MDA5NTI5NjMsImVkaXRlciI6InBsYXllciJ9XQ==', null, null, '183.63.92.250', '1502793350', '0', '0');
INSERT INTO `my_users` VALUES ('100217', '2', 'guest98633716484', '60939d20e46d5ab8409b0da80466fb66', null, null, null, null, null, null, null, null, null, null, '0', '630d8ffc21797fed', '1', null, null, null, 'iPhone 6', '09CE1988BDE44C1ABCDF5442BC8FD58D', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502792800', '117.136.41.72', '1503323221', '0', '0');
INSERT INTO `my_users` VALUES ('100218', '2', 'guest89063743227', 'a65d81ebff0af864385c4d719103e5f8', null, null, null, null, null, null, null, null, null, null, '0', 'd7c27106b7a65d33', '1', null, null, null, 'iPad5,1', '70C006106A324375A8FF8D1647581D55', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502792952', '103.192.224.136', '1503388843', '0', '0');
INSERT INTO `my_users` VALUES ('100219', '2', 'guest10796762759', '4892871c9c16e5997f9272ef96bd6d83', null, null, null, null, null, null, null, null, null, null, '0', '853cf32ec98d1d80', '2', null, null, null, '862073024554861', 'cc3ceeda-6ca8-3462-b7ed-7c5f3a808b34', 'eyI3IjoxfQ==', null, '183.63.92.250', '1502794061', '183.63.92.250', '1502794068', '0', '0');
INSERT INTO `my_users` VALUES ('100220', '2', 'guest32083247394', '48849cd23ca22e00f79092a48df8da94', null, null, null, null, null, null, null, null, null, null, '0', 'a9a0f97a2e164b3c', '1', null, null, null, 'Simulator', 'B5A72D6A3CF64DA892B0B524A9BAC9EE', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502796906', '103.192.224.136', '1503039548', '0', '0');
INSERT INTO `my_users` VALUES ('100221', '2', 'guest74202575746', '052f1098683dbc55d2e59efc6c4d8e61', null, null, null, null, null, null, null, null, null, null, '0', '96a6eb32b149656f', '1', null, null, null, 'iPhone 6s', '159254071AD64A16ADDE649179BF9AD8', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502797490', '112.96.164.62', '1503313666', '0', '0');
INSERT INTO `my_users` VALUES ('100222', '2', 'guest37485669485', '1c937093c164e37fd15a5dfeddc1f2fa', null, null, null, null, null, null, null, null, null, null, '0', 'af410b0fae48a05a', '1', null, null, null, 'iPhone 6', '4E1FA67C4BFD4133A049107BA5B2FDBE', 'eyI4IjoxfQ==', null, '60.29.18.51', '1502798512', '60.29.18.51', '1503379082', '0', '0');
INSERT INTO `my_users` VALUES ('100223', '2', 'guest91059925550', '4e415202b9554e7208320588085012f7', null, null, null, null, null, null, null, null, null, null, '0', '45c20599e4d24fd5', '1', null, null, null, 'Simulator', '5FD446E62A434F7C958E75FD8ADC279D', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502798682', '103.192.224.136', '1503388987', '0', '0');
INSERT INTO `my_users` VALUES ('100224', '1', 'tangshu', '2461a48d1c81fa64e8338ba9e450ee9d', null, null, null, null, null, null, null, null, null, null, '0', null, '2', null, null, null, '864668010156924', 'cf2ff04a-6ee6-3af7-9ef3-133a7c50b2b0', 'eyI3IjoxLCIxIjoxfQ==', null, '60.29.18.51', '1502855545', '118.184.53.61', '1503388354', '0', '0');
INSERT INTO `my_users` VALUES ('100225', '2', 'guest96229054335', '29cc2369dc454675c1406d6a97200fd6', null, null, null, null, null, null, null, null, null, null, '0', 'e616e06b4447022a', '2', null, null, null, '867068022185713', '2ef79279-fe85-3bf1-8da7-6000664365a5', 'eyI3IjoxfQ==', null, '163.172.70.49', '1502865088', null, '1502865088', '0', '0');
INSERT INTO `my_users` VALUES ('100226', '2', 'guest08119543616', 'a5cc321afb2db012785cf0cc77893fc0', null, null, null, null, null, null, null, null, null, null, '0', '0771257171c125ed', '2', null, null, null, '868842026939328', '63588df4-a3ef-3de8-a150-fb45b3986e3d', 'eyI3IjoxfQ==', null, '118.184.53.61', '1502869660', null, '1502869660', '0', '0');
INSERT INTO `my_users` VALUES ('100227', '1', 'cookey91', 'fbb5a321f28622bf5f5e1cb127c26823', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, 'cookey91@qq.com', null, 'iPad5,1', '70C006106A324375A8FF8D1647581D55', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502870059', '103.192.224.136', '1502870980', '0', '0');
INSERT INTO `my_users` VALUES ('100228', '2', 'guest01031482106', '73c3257c7a7afc2545a84ae7490afcd1', null, null, null, null, null, null, null, null, null, null, '0', '68e8df9acec1bf25', '2', null, null, null, '862845010156920', 'ec532c99-2111-3844-9f42-1eb022ad88a1', 'eyI3IjoxfQ==', null, '118.184.53.61', '1502870444', null, '1502870444', '0', '0');
INSERT INTO `my_users` VALUES ('100229', '2', 'guest15508826636', '76b8170b3128939b6fa4046a9d2a6ed9', null, null, null, null, null, null, null, null, null, null, '0', '885cb016989e7100', '2', null, null, null, '865528010156929', '8ea41f69-7da7-37e1-a212-69172e42acf6', 'eyI3IjoxfQ==', null, '165.227.95.179', '1502871484', '118.184.53.61', '1503122986', '0', '0');
INSERT INTO `my_users` VALUES ('100230', '2', 'guest60029511613', '01131062ebaa23449b4b4a09d2269465', null, null, null, null, null, null, null, null, null, null, '0', '581d5bf4c1247435', '2', null, null, null, '867148010487717', 'aec8941c-9db0-3ea3-ac5a-b37e826bc15c', 'eyI3IjoxfQ==', null, '45.77.46.210', '1502871783', '103.192.224.136', '1502888026', '0', '0');
INSERT INTO `my_users` VALUES ('100231', '2', 'guest45630468325', '80e8cc64d4e7c69359ff162f8d8d2c74', null, null, null, null, null, null, null, null, null, null, '0', '6918393aa4fb699b', '2', null, null, null, '869763024078522', '610abce5-95af-3585-bd2c-9585e83064a8', 'eyI3IjoxLCIxIjoxfQ==', null, '103.192.224.136', '1502879623', '103.192.224.136', '1503312913', '0', '0');
INSERT INTO `my_users` VALUES ('100232', '1', 'a00001', '694d292d32489a613bf84a777b7189a6', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, null, null, 'iPad5,1', '70C006106A324375A8FF8D1647581D55', 'eyI4IjoxfQ==', null, '103.192.224.136', '1502883736', '112.96.179.78', '1503279391', '0', '0');
INSERT INTO `my_users` VALUES ('100233', '2', 'guest91821438187', '73eaa3853f681cae61dbc3854a56381a', null, null, null, null, null, null, null, null, null, null, '0', '78236a2160aba355', '2', null, null, null, '359587076079592', 'de5bfc88-1ae5-3179-8052-681b772e6122', 'eyI3IjoxfQ==', null, '108.177.7.85', '1502889369', '108.177.7.85', '1502889381', '0', '0');
INSERT INTO `my_users` VALUES ('100234', '2', 'guest10780289381', '5e0889ff74b562419ca78a3a7dda5646', null, null, null, null, null, null, null, null, null, null, '0', '3030faae0dfb13d4', '2', null, null, null, '35253108439391', 'a480f665-258d-3f76-b85d-1befc807bd86', 'eyI3IjoxLCIxIjoxfQ==', null, '108.177.6.56', '1502889389', '108.177.7.88', '1503290057', '0', '0');
INSERT INTO `my_users` VALUES ('100235', '2', 'guest41285062128', 'f35463d7036942c1be84cd98bd8aadb9', null, null, null, null, null, null, null, null, null, null, '0', '879b5ad74c7ac504', '2', null, null, null, '357973080844399', '6d888cd6-33fd-3569-b0b0-2f7442a61a87', 'eyI3IjoxfQ==', null, '108.177.6.54', '1502889411', null, '1502889411', '0', '0');
INSERT INTO `my_users` VALUES ('100236', '2', 'guest62288691363', '89b789b691ac3d3ec5cb93c9ac71e7b4', null, null, null, null, null, null, null, null, null, null, '0', '046a86fdb2d82972', '2', null, null, null, '357011071613422', '71ac6441-c8fd-3f41-86f0-cc4f6fcd0207', 'eyI3IjoxfQ==', null, '108.177.6.54', '1502889572', '108.177.6.54', '1502889583', '0', '0');
INSERT INTO `my_users` VALUES ('100237', '2', 'guest63479295565', '6f88d09896422d85e739efa8760920f1', null, null, null, null, null, null, null, null, null, null, '0', 'a708a948d5c2f5a6', '1', null, null, null, 'iPhone 7 (CDMA)', '00000000000000000000000000000000', 'eyI4IjoxfQ==', null, '60.29.18.51', '1502961084', '60.29.18.51', '1503388885', '0', '0');
INSERT INTO `my_users` VALUES ('100238', '1', 'shawntest', 'a353f8a350fb412e8f01dfcd180a5602', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, null, null, 'iPhone 6', '4E1FA67C4BFD4133A049107BA5B2FDBE', 'eyI4IjoxfQ==', null, '60.29.18.51', '1503024780', '60.29.18.51', '1503134398', '0', '0');
INSERT INTO `my_users` VALUES ('100239', '2', 'guest04450980048', '59e006eea138cde9e16371a11a3cc0d1', null, null, null, null, null, null, null, null, null, null, '0', '85964fcb791f4004', '2', null, null, null, '863817039342764', '6246e1fe-18c2-3b7e-bca0-d106adcb9bf2', 'eyI3IjoxfQ==', null, '118.184.53.61', '1503025417', '118.184.53.61', '1503028596', '0', '0');
INSERT INTO `my_users` VALUES ('100240', '3', 'fb11437525838423', 'c88836b21791416d09763f8ebef4b18b', 'fb11437525838423', 'c88836b21791416d09763f8ebef4b18b', null, null, null, null, null, null, null, null, '1', null, '1', null, 'xiaonigedamahua@gmail.com', null, 'Simulator', 'B5A72D6A3CF64DA892B0B524A9BAC9EE', 'eyI4IjoxfQ==', null, '103.192.224.136', '1503039617', null, '1503039617', '0', '0');
INSERT INTO `my_users` VALUES ('100241', '1', 'ceshi1', 'b5884db2adfb7441f146f63342f488ee', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, '527877218@qq.com', null, 'iPhone 5S', '9AA87FA9120A4ED5A3C46F1E982FF2B1', 'eyI4IjoxfQ==', null, '117.136.32.110', '1503284852', '117.136.79.36', '1503382791', '0', '0');
INSERT INTO `my_users` VALUES ('100242', '1', 'aa1122', 'ed0c1dea5f92795c052319c936db0224', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, null, null, 'iPhone 6s Plus', '49ECA18A9334446FB11009B7EB331225', 'eyI4IjoxfQ==', null, '103.192.224.136', '1503285233', '103.192.224.136', '1503389189', '0', '0');
INSERT INTO `my_users` VALUES ('100243', '2', 'guest43875359402', 'db74c16c0f05bfb3632e41471f96d134', null, null, null, null, null, null, null, null, null, null, '0', 'b7a0c0b1d1c9f7ef', '2', null, null, null, '352531080184474', '81056bf9-eb9a-32b0-a35b-8a8bcd7400f3', 'eyIxIjoxfQ==', null, '108.177.7.88', '1503290004', '108.177.7.88', '1503290055', '0', '0');
INSERT INTO `my_users` VALUES ('100244', '1', 'ebo001', '5d7c9c2eb7c11909432c6f9d4665dc35', null, null, null, null, null, null, null, null, null, null, '0', null, '1', null, null, null, 'iPhone 6', '4E1FA67C4BFD4133A049107BA5B2FDBE', 'eyI4IjoxfQ==', null, '60.29.18.51', '1503298966', '60.29.18.51', '1503302965', '0', '0');
INSERT INTO `my_users` VALUES ('100245', '3', 'fb30221224437606', '9f5601e8e04b6b5659d3aa103b269f96', 'fb30221224437606', '9f5601e8e04b6b5659d3aa103b269f96', null, null, null, null, null, null, null, null, '1', null, '1', null, 'xiaonigedamahua@gmail.com', null, 'Simulator', 'B5A72D6A3CF64DA892B0B524A9BAC9EE', 'eyI4IjoxfQ==', null, '103.192.224.136', '1503316509', null, '1503316509', '0', '0');
INSERT INTO `my_users` VALUES ('100246', '3', 'fb99270078889907', '4ee7405580023d3e48ad97f6794d9164', 'fb99270078889907', '4ee7405580023d3e48ad97f6794d9164', null, null, null, null, null, null, null, null, '1', null, '1', null, 'cookey91@gmail.com', null, 'Simulator', 'B5A72D6A3CF64DA892B0B524A9BAC9EE', 'eyI4IjoxfQ==', null, '103.192.224.136', '1503316860', null, '1503316860', '0', '0');

-- ----------------------------
-- Table structure for my_user_type
-- ----------------------------
DROP TABLE IF EXISTS `my_user_type`;
CREATE TABLE `my_user_type` (
  `user_type` tinyint(2) NOT NULL COMMENT '用户类型（1:正式，2:免注册临时，3:facebook)',
  `desc` varchar(255) DEFAULT NULL COMMENT '说明信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_user_type
-- ----------------------------
INSERT INTO `my_user_type` VALUES ('1', '正式账号');
INSERT INTO `my_user_type` VALUES ('2', '免注册临时账号');
INSERT INTO `my_user_type` VALUES ('3', 'Facebook账号');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `adv_id` bigint(20) NOT NULL COMMENT '广告id',
  `fb_name` varchar(255) NOT NULL COMMENT 'facebook name',
  `fbid` char(50) NOT NULL,
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `username` char(50) NOT NULL,
  `passwd` char(50) NOT NULL,
  `safe_email` varchar(255) NOT NULL COMMENT '安全邮箱',
  `email` char(50) NOT NULL,
  `is_fb_bind` tinyint(4) NOT NULL COMMENT '是否绑定 facebook',
  `sex` tinyint(4) NOT NULL,
  `birthday` datetime NOT NULL,
  `hashdir` char(200) DEFAULT NULL,
  `headpic` char(100) DEFAULT NULL,
  `tag` char(50) DEFAULT NULL,
  `intro` text NOT NULL,
  `reg_time` datetime NOT NULL,
  `reg_ip` char(15) NOT NULL,
  `reg_key` char(50) NOT NULL,
  `last_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_ip` char(15) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 正常用户 3 临时账号',
  `game_money` decimal(7,2) NOT NULL,
  `follows` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT '2 表示ipad 注册',
  `tel` bigint(20) NOT NULL COMMENT '电话号码',
  `real_name` varchar(255) NOT NULL COMMENT '正式姓名',
  `idcard` varchar(255) NOT NULL DEFAULT '' COMMENT '临时账户明文密码',
  `qq` int(11) NOT NULL,
  `udid` varchar(255) NOT NULL COMMENT '用户设备udid',
  `mac` varchar(255) NOT NULL COMMENT '用户设备mac 地址',
  `keyword_id` int(11) NOT NULL COMMENT 'sem 推广关键词id',
  `adid` varchar(255) NOT NULL,
  `alipay_uid` varchar(255) NOT NULL COMMENT '支付宝用户id',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `reg_time` (`reg_time`),
  KEY `status` (`status`),
  KEY `adv_id` (`adv_id`),
  KEY `fbid` (`fbid`),
  KEY `index_adid` (`adid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
