package com.tmwrk.voosky.database.vo;

import java.util.List;

/**
 * 文章实体类
 * @author wfluo 2015-11-17
 *
 */
public class Article extends UploadFileBase{
	
	private int id ;
	private String cateId ;
	private String title ;
	private String isRecommend ;
	private String content ;
	private String thumbUrl ;
	private String keywords ;
	private String desc ;
	private int clickNum ;
	private String addTime ;
	private int vsort ;
	
	//2016.11.18 为更好区分数据的来源
	private String navName ; 
	private String navId ;
	private String author ;
	private String firstType ;//相同类型中区分大类
		
	private List<Category> cateList ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCateId() {
		return cateId;
	}
	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(String isRecommend) {
		this.isRecommend = isRecommend;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThumbUrl() {
		return thumbUrl;
	}
	public void setThumbUrl(String thumbUrl) {
		this.thumbUrl = thumbUrl;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getClickNum() {
		return clickNum;
	}
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public int getVsort() {
		return vsort;
	}
	public void setVsort(int vsort) {
		this.vsort = vsort;
	}
	public List<Category> getCateList() {
		return cateList;
	}
	public void setCateList(List<Category> cateList) {
		this.cateList = cateList;
	}
	public String getNavName() {
		return navName;
	}
	public void setNavName(String navName) {
		this.navName = navName;
	}
	public String getNavId() {
		return navId;
	}
	public void setNavId(String navId) {
		this.navId = navId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFirstType() {
		return firstType;
	}
	public void setFirstType(String firstType) {
		this.firstType = firstType;
	}
	
}
