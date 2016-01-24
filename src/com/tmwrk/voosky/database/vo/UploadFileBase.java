package com.tmwrk.voosky.database.vo;

import java.io.File;

/**
 * 结合Struts上传文档类
 * 
 * 1、需要继承此类
 * 2、调用CalcUtil.java中的方法dealUploadInfo
 * 3、界面配置上传文件name为imageFile
 * 
 * @author wfluo
 *
 */
public class UploadFileBase {
	// 上传file要在action中定义,三者缺一不可。    
	//前台JSP界面name设置为imageFile
	//<input type="file" name="imageFile" size="38" class="inpFlie" />
	private File imageFile;

	private String imageFileFileName;

	private String imageFileContentType;
	
	private String status ;
	
	private String fileRealPath ;
	
	private String message ;

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileRealPath() {
		return fileRealPath;
	}

	public void setFileRealPath(String fileRealPath) {
		this.fileRealPath = fileRealPath;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
