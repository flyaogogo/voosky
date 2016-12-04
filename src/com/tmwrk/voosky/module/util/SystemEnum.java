package com.tmwrk.voosky.module.util;

public enum SystemEnum {
	sitename(1,"main.site.name"),
	sitetitle(2,"main.site.title"),
	sitekeywords(3,"main.site.keywords"),
	sitedesc(4,"main.site.description"),
	msmark(5,"main.site.mark"),
	siteaddress(6,"main.site.address"),
	mswhetherclose(7,"main.site.whether.close"),
	siteipcrecord(8,"main.site.ICP.record.Certificate.No"),
	siteconsumerhotline(9,"main.site.consumer.hotline"),
	sitefax(10,"main.site.fax"),
	sitemail(11,"main.site.mail.address"),
	sitelanguage(12,"main.site.system.language"),
	msurlrewrite(13,"main.site.URL.Rewrite"),
	msenablemap(14,"main.site.enable.map"),
	mscaptcha(15,"main.site.captcha"),
	msmsgforceboard(16,"main.site.Message.boards.forced.chinese.input"),
	mscodecall(17,"main.site.statistics.or.service.code.calls"),
	siteqqnum(18,"main.site.qq.num"),
	
	disthumbwidth(19,"display.thumb.width"),
	disthumbheight(20,"display.thumb.height"),
	dispricesdecimal(21,"display.prices.decimal.places"),
	disnumberart(22,"display.number.of.articles"),
	dishownumart(23,"display.home.shows.number.art"),
	disnumberpro(24,"display.number.of.product"),
	dishownumpro(25,"display.home.shows.number.product"),
	
	defartattr(26,"defined.article.attributes"),
	defproductattr(27,"defined.product.attributes"),
	
	mailservice(28,"mail.service"),
	mailsmtpservice(29,"mail.smtp.service"),
	mailsmtpport(30,"mail.smtp.port"),
	msslsecprotocol(31,"mail.SSL.security.protocol"),
	mailoutbox(32,"mail.outbox.mailboxes"),
	mailpassword(33,"mail.outbox.mail.password"),
	
	netaddress(34,"main.net.address"),
	
	defweixin(35,"defined.weixin.pic.url"),
	defqqwburl(36,"defined.qq.weibo.url"),
	defsinawburl(37,"defined.sina.weibo.url");
	
	private int id ;
	private String name ;
	
	private SystemEnum(int id,String name){
		this.id = id ;
		this.name = name ;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
