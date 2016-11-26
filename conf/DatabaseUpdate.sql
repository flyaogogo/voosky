create database voosky ;

use voosky ;


drop table if exists user;
drop table if exists vs_admin;
drop table if exists vs_admin_log;
drop table if exists vs_nav;
drop table if exists vs_category;
drop table if exists vs_article;
drop table if exists vs_product;
drop table if exists vs_config;
drop table if exists vs_singlepage;
drop table if exists vs_show;
drop table if exists vs_backup;



create table vs_admin(
	user_id	varchar(10) not null,
	user_name	varchar(50) not null,
	pwd	varchar(30) not null,
	user_email	varchar(50) null,
	add_time	varchar(25) not null,
	last_login_time	varchar(25) ,
	removed_time	varchar(25) ,
	user_state	int not null,
	last_login_ip varchar(15) ,
	PRIMARY KEY (user_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;

INSERT INTO `vs_admin` VALUES ('0001', 'admin', 'a', 'admin@t.com', '2015-11-19 23:05:13', '2015-12-27 16:17:38', '', '0', '192.168.1.100');

create table vs_admin_log(
	log_id int not null,
	oper_model	varchar(50) not null,
	oper_user	varchar(50) not null,
	oper_note	varchar(254) not null,
	oper_time	varchar(25) not null,
	ip	varchar(15) not null,
	PRIMARY KEY (log_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_nav(
	nav_id	int not null,
	module	varchar(50) not null,
	nav_name	varchar(50) not null,
	guide	varchar(254) ,
	module_url	varchar(254) not null,
	parent_id	int not null,
	vtype	varchar(15) not null,
	vsort	int	 not null,
	
	nav_type	varchar(30) ,
	cate_type	varchar(30) ,
	param		varchar() ,
	note	varchar(50) ,
	PRIMARY KEY (nav_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;

-- ----------------------------
-- Records of vs_nav
-- ----------------------------
INSERT INTO `vs_nav` VALUES ('6', 'm', '电子数码', '-', '/web/getProductsInfo.htm', '5', 'middle', '31');
INSERT INTO `vs_nav` VALUES ('3', 'devcourse', '发展历程', '-', '/web/getSPInfoByName.htm?uniqueName=devcourse', '1', 'middle', '12');
INSERT INTO `vs_nav` VALUES ('4', 'contactus', '联系我们', '-', '/web/getSPInfoByName.htm?uniqueName=contactus', '1', 'middle', '13');
INSERT INTO `vs_nav` VALUES ('5', 'product', '产品中心', '', '/web/getProductsInfo.htm', '0', 'middle', '30');
INSERT INTO `vs_nav` VALUES ('1', 'about', '公司简介', '', '/web/getSPInfoByName.htm?uniqueName=about', '0', 'middle', '10');
INSERT INTO `vs_nav` VALUES ('2', 'honor', '企业荣誉', '-', '/web/getSPInfoByName.htm?uniqueName=honor', '1', 'middle', '11');
INSERT INTO `vs_nav` VALUES ('7', 'm', '智能手机', '--', '/web/getProductsInfo.htm', '6', 'middle', '32');
INSERT INTO `vs_nav` VALUES ('8', 'm', '平板电脑', '--', '/web/getProductsInfo.htm', '6', 'middle', '33');
INSERT INTO `vs_nav` VALUES ('9', 'm', '家居百货', '-', '/web/getProductsInfo.htm', '5', 'middle', '34');
INSERT INTO `vs_nav` VALUES ('10', 'm', '母婴用品', '-', '/web/getProductsInfo.htm', '5', 'middle', '35');
INSERT INTO `vs_nav` VALUES ('11', 'article', '文章中心', '', '/web/getArticlesInfo.htm', '0', 'middle', '50');
INSERT INTO `vs_nav` VALUES ('12', 'm', '公司动态', '-', '/web/getArticlesInfo.htm', '11', 'middle', '51');
INSERT INTO `vs_nav` VALUES ('13', 'm', '行业新闻', '-', '/web/getArticlesInfo.htm', '11', 'middle', '52');
INSERT INTO `vs_nav` VALUES ('14', 'market', '营销网络', '', '/web/getSPInfoByName.htm?uniqueName=market', '0', 'middle', '60');
INSERT INTO `vs_nav` VALUES ('15', 'm', '企业荣誉', '', '/web/getSPInfoByName.htm?uniqueName=honor', '0', 'middle', '70');
INSERT INTO `vs_nav` VALUES ('16', 'job', '人才招聘', '', '/web/getSPInfoByName.htm?uniqueName=job', '0', 'middle', '80');
INSERT INTO `vs_nav` VALUES ('17', 'm', '联系我们', '', '/web/getSPInfoByName.htm?uniqueName=contactus', '0', 'middle', '90');


create table vs_category(
	cat_id	varchar(10) not null,
	unique_name	varchar(50) not null,
	cat_name	varchar(50) not null,
	keywords	varchar(254) ,
	description	varchar(25) ,
	cate_status	varchar(10) not null,
	nav_id	int not null,
	guide	varchar(254) ,
	vsort	int not null,
	PRIMARY KEY (cat_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;

-- ----------------------------
-- Records of vs_category
-- ----------------------------
INSERT INTO `vs_category` VALUES ('008', 'ElectronicDigital', '电子数码', '电子 数码', '电子数码', 'product', '6', '', '10');
INSERT INTO `vs_category` VALUES ('009', 'smartphone', '智能手机', '智能手机', '智能手机', 'product', '7', '-', '11');
INSERT INTO `vs_category` VALUES ('013', 'CompanyNews', '公司动态', '公司动态', '公司动态', 'article', '12', '', '10');
INSERT INTO `vs_category` VALUES ('010', 'tablet', '平板电脑', '平板电脑', '平板电脑', 'product', '8', '-', '12');
INSERT INTO `vs_category` VALUES ('011', 'HomeDepot', '家居百货', '家居百货', '家居百货', 'product', '9', '', '30');
INSERT INTO `vs_category` VALUES ('012', 'BabyProducts', '母婴用品', '母婴用品', '母婴用品', 'product', '10', '', '40');
INSERT INTO `vs_category` VALUES ('014', 'IndustryNews', '行业新闻', '行业新闻', '行业新闻', 'article', '13', '', '30');

create table vs_article(
	id	int not null,
	cat_id	varchar(10) not null,
	title	varchar(254) not null,
	is_recommend	varchar(10) not null,
	content		text ,
	thumb_url	Varchar(254) ,
	keywords	varchar(254) ,
	description	varchar(254) ,
	author	varchar(100) ,
	firstType	varchar(20) ,
	clicknum	int not null,
	add_time	varchar(25) not null,
	vsort		int,
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_product(
	id	int not null,
	cat_id	varchar(10) not null,
	title	varchar(254) not null,
	is_recommend	varchar(10) not null,
	price	decimal(10,2) not null,
	content		text ,
	thumb_url	Varchar(254) ,
	keywords	varchar(254) ,
	description	varchar(254) ,
	author	varchar(100) ,
	firstType	varchar(20) ,
	clicknum	int not null,
	add_time	varchar(25) not null,
	vsort		int,
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_config(
	id int not null,
	name varchar(50) not null,
	value varchar(250) not null,
	vsort int not null,
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_singlepage(
	page_id		int not null,
	unique_name	varchar(50) not null,
	page_name varchar(50) not null,
	content text,
	keywords varchar(254),
	description	varchar(254),
	nav_id int not null,
	guide varchar(254) ,
	PRIMARY KEY (page_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_show(
	id int not null,
	show_name varchar(50) not null,
	show_link varchar(254) not null,
	show_img varchar(254) not null,
	vtype varchar(25),
	vsort int,
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;


create table vs_backup(
	id int not null,
	file_name	varchar(50) not null,
	file_size	long not null,
	slave_time	varchar(25) not null,
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;

-- ----------------------------
-- Records of vs_singlepage
-- ----------------------------
INSERT INTO `vs_singlepage` VALUES ('1', 'about', '公司简介', '<p><span style=\"color: rgb(153, 153, 153); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, 宋体, Arial, Lucida, Verdana, Helvetica, sans-serif; font-size: 12px; line-height: 24px; background-color: rgb(244, 244, 244);\">VsJava是一款轻量级企业网站管理系统，基于jsp+Mysql架构的，可运行在Linux、Windows、MacOSX、Solaris等各种平台上，系统搭载Smarty模板引擎，支持自定义伪静态，前台模板采用DIV+CSS设计，后台界面设计简洁明了，功能简单易具有良好的用户体验，稳定性好、扩展性及安全性强，可面向中小型站点提供网站建设解决方案。</span></p>', 'Vsjava   轻量级  企业  网站   管理系统', 'Vsjava轻量级企业网站管理系统', '0', null);
INSERT INTO `vs_singlepage` VALUES ('2', 'honor', '企业荣誉', '<p>afadfaadsfasdfsa</p>', 'adfad', 'adfd', '2', '--');
INSERT INTO `vs_singlepage` VALUES ('3', 'devcourse', '发展历程', '<p>sdsadfa</p>', 'a', 'd', '3', '--');
INSERT INTO `vs_singlepage` VALUES ('4', 'contactus', '联系我们', '<p>sdsa<br/></p>', 'ad', 'ad', '17', '-');
INSERT INTO `vs_singlepage` VALUES ('5', 'market', '营销网络', '<p>fadss</p>', 'ad', 'df', '14', '-');
INSERT INTO `vs_singlepage` VALUES ('6', 'job', '人才招聘', '<p>sdsa</p>', 'adf', 'adf', '16', '-');



insert into vs_config values(1,"main.site.name","voosky",50);
insert into vs_config values(2,"main.site.title","长空",50);
insert into vs_config values(3,"main.site.keywords","长空 飞翔",50);
insert into vs_config values(4,"main.site.description","长空技术有限公司",50);
insert into vs_config values(5,"main.site.mark","image mark",50);
insert into vs_config values(6,"main.site.address","北京嘉兴",50);
insert into vs_config values(7,"main.site.whether.close","false",50);
insert into vs_config values(8,"main.site.ICP.record.Certificate.No","© 2013-2015 ",50);
insert into vs_config values(9,"main.site.consumer.hotline","137462672",50);
insert into vs_config values(10,"main.site.fax","0756-828292294",50);
insert into vs_config values(11,"main.site.mail.address","voosky@vsky.com",50);
insert into vs_config values(12,"main.site.system.language","cn",50);
insert into vs_config values(13,"main.site.URL.Rewrite","true",50);
insert into vs_config values(14,"main.site.enable.map","true",50);
insert into vs_config values(15,"main.site.captcha","true",50);
insert into vs_config values(16,"main.site.Message.boards.forced.chinese.input","true",50);
insert into vs_config values(17,"main.site.statistics.or.service.code.calls","voosky",50);
insert into vs_config values(18,"main.site.qq.num","283846213",50);

insert into vs_config values(19,"display.thumb.width","30",50);
insert into vs_config values(20,"display.thumb.height","40",50);
insert into vs_config values(21,"display.prices.decimal.places","2",50);
insert into vs_config values(22,"display.number.of.articles","10",50);
insert into vs_config values(23,"display.home.shows.number.art","30",50);
insert into vs_config values(24,"display.number.of.product","30",50);
insert into vs_config values(25,"display.home.shows.number.product","30",50);

insert into vs_config values(26,"defined.article.attributes","30",50);
insert into vs_config values(27,"defined.product.attributes","30",50);


insert into vs_config values(28,"mail.service","stmp",50);
insert into vs_config values(29,"mail.smtp.service","stmp",50);
insert into vs_config values(30,"mail.smtp.port","2342",50);
insert into vs_config values(31,"mail.SSL.security.protocol","2342",50);
insert into vs_config values(32,"mail.outbox.mailboxes","ss@163.com",50);
insert into vs_config values(33,"mail.outbox.mail.password","1234567",50);

insert into vs_config values(34,"main.net.address","www.voosky.com",50);

commit ;