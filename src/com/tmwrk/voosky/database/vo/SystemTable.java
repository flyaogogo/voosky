package com.tmwrk.voosky.database.vo;

public class SystemTable {

	private int id ;
	private String tabName ;
	private String type ;
	private long tabTows ;
	private long dataSize ;
	private long indexLength ;
	private long dataFree ;
	private String createTime ;
	private String updateTime ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTabName() {
		return tabName;
	}
	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	public long getTabTows() {
		return tabTows;
	}
	public void setTabTows(long tabTows) {
		this.tabTows = tabTows;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getDataSize() {
		return dataSize;
	}
	public void setDataSize(long dataSize) {
		this.dataSize = dataSize;
	}
	public long getIndexLength() {
		return indexLength;
	}
	public void setIndexLength(long indexLength) {
		this.indexLength = indexLength;
	}
	public long getDataFree() {
		return dataFree;
	}
	public void setDataFree(long dataFree) {
		this.dataFree = dataFree;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}
