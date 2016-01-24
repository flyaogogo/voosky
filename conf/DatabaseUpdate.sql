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
	PRIMARY KEY (nav_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;

create table vs_category(
	cat_id	varchar(10) not null,
	unique_name	varchar(50) not null,
	cat_name	varchar(50) not null,
	keywords	varchar(254) ,
	description	varchar(25) ,
	cate_status	varchar(10) not null,
	nav_id	int not null,
	vsort	int not null,
	PRIMARY KEY (cat_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8	;



create table vs_article(
	id	int not null,
	cat_id	varchar(10) not null,
	title	varchar(254) not null,
	is_recommend	varchar(10) not null,
	content		Varchar(3000) ,
	thumb_url	Varchar(15) ,
	keywords	varchar(254) ,
	description	varchar(254) ,
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
	content		Varchar(3000) ,
	thumb_url	Varchar(254) ,
	keywords	varchar(254) ,
	description	varchar(254) ,
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
	content varchar(3000) not null,
	keywords varchar(254),
	description	varchar(254),
	nav_id int not null,
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