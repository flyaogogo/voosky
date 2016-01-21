package com.tmwrk.voosky.database.vo;

import java.util.HashMap;
import java.util.List;

/**
 * 登陆首页实体类
 * 
 * @author wfluo
 *
 */
public class ConsoleMrg {

	//单页面集合
	private List<SinglePage> spList ;
	
	private int spNum ; //单页面数
	
	private int artNum ; //文章总数
	
	private int productNum ; //商品总数
	
	private User user ; //当前登陆用户信息
	
	private HashMap<String, String> sysconfMap = new HashMap<String,String>(); //系统设置相关参数
	
	private String securityStatus ; //报警安全状态

	public List<SinglePage> getSpList() {
		return spList;
	}

	public void setSpList(List<SinglePage> spList) {
		this.spList = spList;
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
	
}