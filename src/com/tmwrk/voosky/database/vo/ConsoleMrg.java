package com.tmwrk.voosky.database.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登陆首页实体类
 * 
 * @author wfluo
 *
 */
public class ConsoleMrg implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -2887400622965432809L;

	//单页面集合
	private List<SinglePage> spList ;
	
	private List<Product> proList ;
	
	private List<Article> artList ;
	
	private int spNum ; //单页面数
	
	private int artNum ; //文章总数
	
	private int productNum ; //商品总数
	
	private User user ; //当前登陆用户信息
	
	private HashMap<String, String> sysconfMap = new HashMap<String,String>(); //系统设置相关参数
	
	private String securityStatus ; //报警安全状态
	
	private List<Navigation> navList ;
	
	private SinglePage spAbout ;
	
	//对父ID进行分组
	private Map<String, List<Navigation>> navListMap = new HashMap<String, List<Navigation>>() ;

	public List<SinglePage> getSpList() {
		return spList;
	}

	public void setSpList(List<SinglePage> spList) {
		this.spList = spList;
	}

	public List<Product> getProList() {
		return proList;
	}

	public void setProList(List<Product> proList) {
		this.proList = proList;
	}

	public List<Article> getArtList() {
		return artList;
	}

	public void setArtList(List<Article> artList) {
		this.artList = artList;
	}

	public int getSpNum() {
		return spNum;
	}

	public void setSpNum(int spNum) {
		this.spNum = spNum;
	}

	public int getArtNum() {
		return artNum;
	}

	public void setArtNum(int artNum) {
		this.artNum = artNum;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public HashMap<String, String> getSysconfMap() {
		return sysconfMap;
	}

	public void setSysconfMap(HashMap<String, String> sysconfMap) {
		this.sysconfMap = sysconfMap;
	}

	public String getSecurityStatus() {
		return securityStatus;
	}

	public void setSecurityStatus(String securityStatus) {
		this.securityStatus = securityStatus;
	}

	public List<Navigation> getNavList() {
		return navList;
	}

	public void setNavList(List<Navigation> navList) {
		this.navList = navList;
	}

	public SinglePage getSpAbout() {
		return spAbout;
	}

	public void setSpAbout(SinglePage spAbout) {
		this.spAbout = spAbout;
	}

	public Map<String, List<Navigation>> getNavListMap() {
		return navListMap;
	}

	public void setNavListMap(Map<String, List<Navigation>> navListMap) {
		this.navListMap = navListMap;
	}

}
