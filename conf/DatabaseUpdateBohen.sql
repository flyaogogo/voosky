/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : bohen

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2016-11-30 21:39:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vs_admin`
-- ----------------------------
DROP TABLE IF EXISTS `vs_admin`;
CREATE TABLE `vs_admin` (
  `user_id` varchar(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `add_time` varchar(25) NOT NULL,
  `last_login_time` varchar(25) DEFAULT NULL,
  `removed_time` varchar(25) DEFAULT NULL,
  `user_state` int(11) NOT NULL,
  `last_login_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_admin
-- ----------------------------
INSERT INTO `vs_admin` VALUES ('0001', 'admin', 'a', 'admin@t.com', '2015-11-19 23:05:13', '2016-11-27 22:12:36', '', '0', '127.0.0.1');

-- ----------------------------
-- Table structure for `vs_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `vs_admin_log`;
CREATE TABLE `vs_admin_log` (
  `log_id` int(11) NOT NULL,
  `oper_model` varchar(50) NOT NULL,
  `oper_user` varchar(50) NOT NULL,
  `oper_note` varchar(254) NOT NULL,
  `oper_time` varchar(25) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_article`
-- ----------------------------
DROP TABLE IF EXISTS `vs_article`;
CREATE TABLE `vs_article` (
  `id` int(11) NOT NULL,
  `cat_id` varchar(10) NOT NULL,
  `title` varchar(254) NOT NULL,
  `is_recommend` varchar(10) NOT NULL,
  `content` text,
  `thumb_url` varchar(254) DEFAULT NULL,
  `keywords` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `clicknum` int(11) NOT NULL,
  `add_time` varchar(25) NOT NULL,
  `vsort` int(11) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `firstType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_article
-- ----------------------------
INSERT INTO `vs_article` VALUES ('4', '13', '公司再次入选ENR排名榜', 'true', '<p>公司再次入选ENR排名榜8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR</p>', 'upload/article/image_1456456808.jpg', '公司再次入选ENR排名榜', '8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR', '9', '2016-11-18 23:29:54', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('2', '12', '卡维中学项目保修期即将结束', 'true', '<p>近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...</p>', 'upload/article/image_1456455557.jpg', '卡维中学项目保修期即将结束', '近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。...', '14', '2016-11-18 23:23:47', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('3', '12', '董事长访问墨西哥', 'true', '<p>为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。</p>', 'upload/article/image_1456456124.jpg', '董事长访问墨西哥', '为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。', '13', '2016-11-18 23:27:38', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('5', '13', '别样的幸福', 'true', '<p>别样的幸福 &nbsp;&nbsp;莎士比亚有句脍炙人口的谚语：“一千个读者就有有一千个哈姆雷特”，同样，对于幸福“仁者见仁，智者见智”莎士比亚有句脍炙人口的谚语：“一千个读者就有有一千个哈姆雷特”，同样，对于幸福“仁者见仁，智者见智”</p>', 'upload/article/image_1456455219.jpg', '别样的幸福', '莎士比亚有句脍炙人口的谚语：“一千个读者就有有一千个哈姆雷特”，同样，对于幸福“仁者见仁，智者见智”', '18', '2016-11-19 00:04:26', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('6', '20', '董事长访问墨西哥', 'true', '<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。</span> &nbsp;-- &nbsp;<span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。</span></p>', '', '董事长访问墨西哥', '董事长访问墨西哥 董事长访问墨西哥', '9', '2016-11-24 19:36:33', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('7', '20', '公司再次入选ENR排名榜', 'true', '<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR） 杂志官网发布了 2013 年度 ENR“最大 250 家国际承包商”排名榜。</span><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR） 杂志官网发布了 2013 年度 ENR“最大 250 家国际承包商”排名榜。</span><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR） 杂志官网发布了 2013 年度 ENR“最大 250 家国际承包商”排名榜。</span></p>', 'upload/article/image_1456456808.jpg', '公司再次入选ENR排名榜', '公司再次入选ENR排名榜', '3', '2016-11-24 19:40:41', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('8', '20', '公司党委举办组工干部培训班', 'true', '<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">6月4日至8日,公司党委举办组工干部培训班，公司各部门、各事业部、境内各单位及部分境外单位的组织委员或具体负责组织工作的同志共计34人参加了培训。公司党委副书记、纪委书记到会作总结讲话。</span><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">6月4日至8日,公司党委举办组工干部培训班，公司各部门、各事业部、境内各单位及部分境外单位的组织委员或具体负责组织工作的同志共计34人参加了培训。公司党委副书记、纪委书记到会作总结讲话。</span><span style=\"color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">6月4日至8日,公司党委举办组工干部培训班，公司各部门、各事业部、境内各单位及部分境外单位的组织委员或具体负责组织工作的同志共计34人参加了培训。公司党委副书记、纪委书记到会作总结讲话。</span></p>', 'upload/article/image_1456456386.jpg', '公司党委举办组工干部培训班', '公司党委举办组工干部培训班', '10', '2016-11-24 19:42:04', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('9', '20', 'ddd', 'true', '<p>ddadafadsfadsfasdfadsf</p>', 'upload/article/image_1456456808.jpg', 'adf', 'adf', '8', '2016-11-24 20:05:15', '50', 'admin', null);
INSERT INTO `vs_article` VALUES ('10', '12', 'dfadfad second', 'true', '<p>adsfadsfadsfsecond</p>', 'upload/article/image_1456456808.jpg', 'second', 'second', '11', '2016-11-24 20:06:02', '50', 'admin', null);

-- ----------------------------
-- Table structure for `vs_backup`
-- ----------------------------
DROP TABLE IF EXISTS `vs_backup`;
CREATE TABLE `vs_backup` (
  `id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_size` mediumtext NOT NULL,
  `slave_time` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_backup
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_category`
-- ----------------------------
DROP TABLE IF EXISTS `vs_category`;
CREATE TABLE `vs_category` (
  `cat_id` varchar(10) NOT NULL,
  `unique_name` varchar(50) NOT NULL,
  `cat_name` varchar(50) NOT NULL,
  `keywords` varchar(254) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `cate_status` varchar(10) NOT NULL,
  `nav_id` int(11) NOT NULL,
  `guide` varchar(254) DEFAULT NULL,
  `vsort` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_category
-- ----------------------------
INSERT INTO `vs_category` VALUES ('008', 'railway', '铁路', '铁路', '铁路', 'product', '6', null, '10');
INSERT INTO `vs_category` VALUES ('009', 'test11', '测试11', '测试11', '测试11', 'product', '7', '-', '11');
INSERT INTO `vs_category` VALUES ('013', 'CompanyNews', '公司新闻', '公司新闻', '公司新闻', 'article', '12', '', '10');
INSERT INTO `vs_category` VALUES ('010', 'test22', '测试22', '测试22', '测试22', 'product', '19', '-', '12');
INSERT INTO `vs_category` VALUES ('011', 'highway', '公路', '公路', '公路', 'product', '9', '', '30');
INSERT INTO `vs_category` VALUES ('012', 'bridge', '桥梁', '桥梁', '桥梁', 'product', '10', '', '40');
INSERT INTO `vs_category` VALUES ('014', 'IndustryNews', '媒体报道', '媒体报道', '媒体报道', 'article', '13', '', '30');
INSERT INTO `vs_category` VALUES ('015', 'Housing', '房建', '房建', '房建', 'product', '15', null, '50');

-- ----------------------------
-- Table structure for `vs_config`
-- ----------------------------
DROP TABLE IF EXISTS `vs_config`;
CREATE TABLE `vs_config` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `vsort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_config
-- ----------------------------
INSERT INTO `vs_config` VALUES ('1', 'main.site.name', 'voosky', '50');
INSERT INTO `vs_config` VALUES ('2', 'main.site.title', '长空', '50');
INSERT INTO `vs_config` VALUES ('3', 'main.site.keywords', '长空 飞翔', '50');
INSERT INTO `vs_config` VALUES ('4', 'main.site.description', '长空技术有限公司', '50');
INSERT INTO `vs_config` VALUES ('5', 'main.site.mark', 'image mark', '50');
INSERT INTO `vs_config` VALUES ('6', 'main.site.address', '北京嘉兴', '50');
INSERT INTO `vs_config` VALUES ('7', 'main.site.whether.close', 'false', '50');
INSERT INTO `vs_config` VALUES ('8', 'main.site.ICP.record.Certificate.No', '© 2013-2015 ', '50');
INSERT INTO `vs_config` VALUES ('9', 'main.site.consumer.hotline', '137462672', '50');
INSERT INTO `vs_config` VALUES ('10', 'main.site.fax', '0756-828292294', '50');
INSERT INTO `vs_config` VALUES ('11', 'main.site.mail.address', 'voosky@vsky.com', '50');
INSERT INTO `vs_config` VALUES ('12', 'main.site.system.language', 'cn', '50');
INSERT INTO `vs_config` VALUES ('13', 'main.site.URL.Rewrite', 'true', '50');
INSERT INTO `vs_config` VALUES ('14', 'main.site.enable.map', 'true', '50');
INSERT INTO `vs_config` VALUES ('15', 'main.site.captcha', 'true', '50');
INSERT INTO `vs_config` VALUES ('16', 'main.site.Message.boards.forced.chinese.input', 'true', '50');
INSERT INTO `vs_config` VALUES ('17', 'main.site.statistics.or.service.code.calls', 'voosky', '50');
INSERT INTO `vs_config` VALUES ('18', 'main.site.qq.num', '283846213', '50');
INSERT INTO `vs_config` VALUES ('19', 'display.thumb.width', '30', '50');
INSERT INTO `vs_config` VALUES ('20', 'display.thumb.height', '40', '50');
INSERT INTO `vs_config` VALUES ('21', 'display.prices.decimal.places', '2', '50');
INSERT INTO `vs_config` VALUES ('22', 'display.number.of.articles', '10', '50');
INSERT INTO `vs_config` VALUES ('23', 'display.home.shows.number.art', '30', '50');
INSERT INTO `vs_config` VALUES ('24', 'display.number.of.product', '30', '50');
INSERT INTO `vs_config` VALUES ('25', 'display.home.shows.number.product', '30', '50');
INSERT INTO `vs_config` VALUES ('26', 'defined.article.attributes', '30', '50');
INSERT INTO `vs_config` VALUES ('27', 'defined.product.attributes', '30', '50');
INSERT INTO `vs_config` VALUES ('28', 'mail.service', 'stmp', '50');
INSERT INTO `vs_config` VALUES ('29', 'mail.smtp.service', 'stmp', '50');
INSERT INTO `vs_config` VALUES ('30', 'mail.smtp.port', '2342', '50');
INSERT INTO `vs_config` VALUES ('31', 'mail.SSL.security.protocol', '2342', '50');
INSERT INTO `vs_config` VALUES ('32', 'mail.outbox.mailboxes', 'ss@163.com', '50');
INSERT INTO `vs_config` VALUES ('33', 'mail.outbox.mail.password', '1234567', '50');
INSERT INTO `vs_config` VALUES ('34', 'main.net.address', 'www.voosky.com', '50');
insert into `vs_config` values ('35',"defined.weixin.pic.url","pic.url",50);
insert into `vs_config` values ('36',"defined.qq.weibo.url","/qq/weibo/url",50);
insert into `vs_config` values ('37',"defined.sina.weibo.url","/sina/weibo/url",50);

-- ----------------------------
-- Table structure for `vs_nav`
-- ----------------------------
DROP TABLE IF EXISTS `vs_nav`;
CREATE TABLE `vs_nav` (
  `nav_id` int(11) NOT NULL,
  `module` varchar(50) NOT NULL,
  `nav_name` varchar(50) NOT NULL,
  `guide` varchar(254) DEFAULT NULL,
  `module_url` varchar(254) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `vtype` varchar(15) NOT NULL,
  `vsort` int(11) NOT NULL,
  `cate_type` varchar(20) DEFAULT NULL,
  `nav_type` varchar(30) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_nav
-- ----------------------------
INSERT INTO `vs_nav` VALUES ('6', 'm', '铁路', '-', '/bohen/getCaseductsInfo.htm', '5', 'middle', '510', null, null, null);
INSERT INTO `vs_nav` VALUES ('3', 'm', '经营区域', '-', '/bohen/getSPInfoByName.htm?uniqueName=region', '1', 'middle', '120', null, null, null);
INSERT INTO `vs_nav` VALUES ('4', 'm', '联系我们', '-', '/bohen/getSPInfoByName.htm?uniqueName=contactus', '1', 'middle', '140', null, null, null);
INSERT INTO `vs_nav` VALUES ('5', 'product', '工程案例 ', '   ', '/bohen/getCaseductsInfo.htm', '0', 'middle', '500', null, null, null);
INSERT INTO `vs_nav` VALUES ('1', 'm', '关于我们', '', '/bohen/getSPInfoByName.htm?uniqueName=about', '0', 'middle', '100', null, null, null);
INSERT INTO `vs_nav` VALUES ('2', 'm', '公司简介', '-', '/bohen/getSPInfoByName.htm?uniqueName=summary', '1', 'middle', '110', null, null, null);
INSERT INTO `vs_nav` VALUES ('7', 'm', '测试11', '--', '/bohen/getCaseductsInfo.htm', '6', 'middle', '511', null, null, null);
INSERT INTO `vs_nav` VALUES ('19', 'm', '测试22', '--', '/bohen/getCaseductsInfo.htm', '6', 'middle', '512', null, null, null);
INSERT INTO `vs_nav` VALUES ('9', 'm', '公路', '-', '/bohen/getCaseductsInfo.htm', '5', 'middle', '540', null, null, null);
INSERT INTO `vs_nav` VALUES ('10', 'm', '桥梁', '-', '/bohen/getCaseductsInfo.htm', '5', 'middle', '550', null, null, null);
INSERT INTO `vs_nav` VALUES ('11', 'article', '新闻资讯', '', '/bohen/getNewsInfo.htm', '0', 'middle', '300', null, null, null);
INSERT INTO `vs_nav` VALUES ('12', 'm', '公司新闻', '-', '/bohen/getNewsInfo.htm', '11', 'middle', '310', null, null, null);
INSERT INTO `vs_nav` VALUES ('13', 'm', '媒体报道', '-', '/bohen/getNewsInfo.htm', '11', 'middle', '320', null, null, null);
INSERT INTO `vs_nav` VALUES ('14', 'show', '机械设备展示', '', '/bohen/getMachineductsInfo.htm?cateId=14', '0', 'destory', '600', null, null, null);
INSERT INTO `vs_nav` VALUES ('15', 'm', '房建', '-', '/bohen/getCaseductsInfo.htm', '5', 'middle', '560', null, null, null);
INSERT INTO `vs_nav` VALUES ('16', 'job', '招贤纳士', '', '/bohen/getSPInfoByName.htm?uniqueName=job', '0', 'middle', '800', null, null, null);
INSERT INTO `vs_nav` VALUES ('17', 'm', '联系我们', '', '/bohen/getSPInfoByName.htm?uniqueName=contactus', '0', 'middle', '900', null, null, null);
INSERT INTO `vs_nav` VALUES ('18', 'm', '企业荣誉', '-', '/bohen/getSPInfoByName.htm?uniqueName=honor', '1', 'middle', '130', null, null, null);
INSERT INTO `vs_nav` VALUES ('20', 'm', '业务项目', '', '/bohen/getNewsInfo.htm', '0', 'middleshow', '50', null, null, null);
INSERT INTO `vs_nav` VALUES ('21', 'm', '企业视屏', '', '/bohen/getSPInfoByName.htm?uniqueName=qiyeshipin', '1', 'middle', '135', null, null, null);

-- ----------------------------
-- Table structure for `vs_product`
-- ----------------------------
DROP TABLE IF EXISTS `vs_product`;
CREATE TABLE `vs_product` (
  `id` int(11) NOT NULL,
  `cat_id` varchar(10) NOT NULL,
  `title` varchar(254) NOT NULL,
  `is_recommend` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `content` text,
  `thumb_url` varchar(254) DEFAULT NULL,
  `keywords` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `clicknum` int(11) NOT NULL,
  `add_time` varchar(25) NOT NULL,
  `vsort` int(11) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `firstType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_product
-- ----------------------------
INSERT INTO `vs_product` VALUES ('1', '6', '塞拉矿山铁路', 'true', '1.00', '<p>非洲矿业（AML）铁矿铁路新线建设。起点位于Luns，终点位于Tonko，正线全长121.4..</p>', 'upload/product/image_1385341412.jpg', '塞拉 矿山 铁路', '塞拉 矿山 铁路', '3', '2016-11-18 21:23:46', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('2', '6', '沙特南北铁路C项目', 'true', '1.00', '<p>项目内容：位于沙特阿拉伯利雅得—卡西姆，主线全长463.26公里铁路的修复改造项目。项目内容..</p>', 'upload/product/image_1385342128.jpg', '沙特南北铁路C项目', '沙特南北铁路C项目', '2', '2016-11-18 21:24:38', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('3', '6', '尼日利亚铁路现代化项目', 'true', '1.00', '<p>为尼日利亚铁路现代化建设项目</p><p><br/></p><p>1）阿-卡杜纳段</p><p><br/></p><p>项目内容：阿至卡杜纳段，..</p><p><br/></p>', 'upload/product/image_1385365613.jpg', '尼日利亚铁路现代化项目', '尼日利亚铁路现代化项目', '0', '2016-11-18 21:25:57', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('4', '6', '坦140公里铁路更新改造项目', 'true', '1.00', '<p>项目内容：主要工程为完成140公里铁路线路更新和修复主要工程为完成140公里铁路线路更新和修..</p>', 'upload/product/image_1385365456.jpg', '坦140公里铁路更新改造项目', '坦140公里铁路更新改造项目', '7', '2016-11-18 21:27:00', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('5', '9', '博茨瓦纳帕塞公路', 'true', '1.00', '<p>项目名称：博茨瓦纳帕塞公路工程</p><p><br/></p><p>项目地点：博茨瓦纳绍雄</p><p><br/></p><p>业主：博茨瓦纳工程运输部..</p><p><br/></p>', 'upload/product/image_1385364997.jpg', '博茨瓦纳帕塞公路', '博茨瓦纳帕塞公路', '2', '2016-11-18 21:31:30', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('6', '9', '尼日利亚N公路', 'true', '1.00', '<p>项目名称：尼日利亚N公路项目</p><p><br/></p><p>业主：尼日利亚尼日尔开发委员会</p><p><br/></p><p>项目内容：修复总长..</p><p><br/></p>', 'upload/product/image_1385365428.jpg', '尼日利亚N公路', '尼日利亚N公路', '1', '2016-11-18 21:32:35', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('7', '9', '尼泊尔波公路', 'true', '1.00', '<p>项目名称：尼泊尔波公路</p><p><br/></p><p>项目地点：尼泊尔诺比西至</p><p><br/></p><p>业主：工程运输部公路局</p><p><br/></p><p>..</p><p><br/></p>', 'upload/product/image_1385365009.jpg', '尼泊尔波公路', '尼泊尔波公路', '0', '2016-11-18 21:33:22', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('8', '10', '丁大桥', 'true', '2.00', '<p>丁大桥是一座公路、铁路两用大桥，铁路桥全长为2938.5米，公路桥全长为2151.3米，项目丁大桥是一座公路、铁路两用大桥，铁路桥全长为2938.5米，公路桥全长为2151.3米，项目丁大桥是一座公路、铁路两用大桥，铁路桥全长为2938.5米，公路桥全长为2151.3米，项目丁大桥是一座公路、铁路两用大桥，铁路桥全长为2938.5米，公路桥全长为2151.3米，项目</p>', 'upload/product/image_1385370071.jpg', '丁大桥', '丁大桥', '0', '2016-11-19 00:01:40', '50', 'admin', null);
INSERT INTO `vs_product` VALUES ('9', '14', '机器设备展示-Test露天钻机', 'true', '1.00', '<p>机器设备展示-Test</p>', 'upload/product/image_1385445580.jpg', '露天钻机', '露天钻机', '29', '2016-11-26 22:09:49', '50', 'admin', null);

-- ----------------------------
-- Table structure for `vs_show`
-- ----------------------------
DROP TABLE IF EXISTS `vs_show`;
CREATE TABLE `vs_show` (
  `id` int(11) NOT NULL,
  `show_name` varchar(50) NOT NULL,
  `show_link` varchar(254) NOT NULL,
  `show_img` varchar(254) NOT NULL,
  `vtype` varchar(25) DEFAULT NULL,
  `vsort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_show
-- ----------------------------

-- ----------------------------
-- Table structure for `vs_singlepage`
-- ----------------------------
DROP TABLE IF EXISTS `vs_singlepage`;
CREATE TABLE `vs_singlepage` (
  `page_id` int(11) NOT NULL,
  `unique_name` varchar(50) NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `content` text,
  `keywords` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `nav_id` int(11) NOT NULL,
  `guide` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vs_singlepage
-- ----------------------------
INSERT INTO `vs_singlepage` VALUES ('1', 'summary', '公司简介', '<p>1979年经国务院批准成立，是中国最早进入国际市场的外经企业之一，目前已发展成为拥有中国铁路工程施工总承包特级资质的大型国有企业，连续多年入选全球最大225家国际承包商百强行列。</p>', 'Vsjava   轻量级  企业  网站   管理系统', 'Vsjava轻量级企业网站管理系统', '2', '--');
INSERT INTO `vs_singlepage` VALUES ('2', 'honor', '企业荣誉', '<p>荣誉荣誉荣誉荣誉荣誉荣誉</p>', '荣誉', '荣誉', '18', '--');
INSERT INTO `vs_singlepage` VALUES ('3', 'region', '经营范围', '<p>经营区域经营区域经营区域经营区域经营区域经营区域经营区域</p>', '经营区域', '经营区域', '3', '--');
INSERT INTO `vs_singlepage` VALUES ('4', 'contactus', '联系我们', '<p>sdsa<br/></p>', 'ad', 'ad', '17', '-');
INSERT INTO `vs_singlepage` VALUES ('6', 'job', '人才招聘', '<p>sdsa</p>', 'adf', 'adf', '16', '-');
INSERT INTO `vs_singlepage` VALUES ('7', 'qiyeshipin', '企业视屏', '<p>sdsa</p>', 'adf', 'adf', '21', '--');
