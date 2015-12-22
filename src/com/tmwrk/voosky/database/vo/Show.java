package com.tmwrk.voosky.database.vo;

import java.io.File;

/**
 * 图片展示，或者说 幻灯片   实体类
 * @author wfluo 2015-11-17
 *
 */
public class Show {

	
	private int id ;
	private String showName ;
	private String showLink ;
	private String showImg ;
	private String vtype ;
	private int vsort ;
	
	// 上传file要在action中定义,三者缺一不可。
	private File imageFile;

	private String imageFileFileName;

	private String imageFileContentType;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public String getShowLink() {
		return showLink;
	}
	public void setShowLink(String showLink) {
		this.showLink = showLink;
	}
	public String getShowImg() {
		return showImg;
	}
	public void setShowImg(String showImg) {
		this.showImg = showImg;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public int getVsort() {
		return vsort;
	}
	public void setVsort(int vsort) {
		this.vsort = vsort;
	}
	public File getImageFile() {
		return imageFile;
	}
	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}
	public String getImageFileFileName() {
		return imageFileFileName;
	}
	public void setImageFileFileName(String imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}
	public String getImageFileContentType() {
		return imageFileContentType;
	}
	public void setImageFileContentType(String imageFileContentType) {
		this.imageFileContentType = imageFileContentType;
	}
	
}
