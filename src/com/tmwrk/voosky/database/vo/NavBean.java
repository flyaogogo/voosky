package com.tmwrk.voosky.database.vo;

import java.util.List;

public class NavBean {
	private List<Navigation> navList ;
	private String parentId ;
	
	public List<Navigation> getNavList() {
		return navList;
	}
	public void setNavList(List<Navigation> navList) {
		this.navList = navList;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
}
