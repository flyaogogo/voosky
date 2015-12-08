package com.tmwrk.voosky.database.vo;

public class VSTable {

	private int id ;
	private String tName ;
	private String type ;
	private int tTows ;
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
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int gettTows() {
		return tTows;
	}
	public void settTows(int tTows) {
		this.tTows = tTows;
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
