package com.tmwrk.voosky.module.util;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;

import com.tmwrk.voosky.database.vo.UploadFileBase;


public class CalcUtil {
	
	public static String FILE_UPDATE_STATUS_ERROR = "error" ;
	public static String FILE_UPDATE_STATUS_SUCCESS = "success" ;
	
	public static void main(String[] args) {
		int a = Integer.parseInt("001") ;
		System.out.println(a);
	}
	

	/**
	 * 上传文件
	 * @param isUpdate 是否已经上传
	 * @param fbase 上传必备三个参数类
	 * @param fileDirectory 上传到服务器的文件目录
	 * @param request http请求
	 * @return
	 */
	public static UploadFileBase dealUploadInfo(boolean isUpdate , UploadFileBase fbase , String fileDirectory , HttpServletRequest request){
		
		if(fbase.getImageFile()==null){
			return null ;
		}
		String os = System.getProperty("os.name") ;
		String driver = "" ;
		System.out.println("os 操作系统类型：" + os);
		if(os.toLowerCase().startsWith("win")){
			driver = readConfigProperties().getProperty("upload.drive.path") ;
		}else if(os.toLowerCase().indexOf("linux")>=0){
			driver = "/" ;
		}
		
		String myFileFileName = "image_" + fbase.getImageFileFileName() ;
		
		String slideFilePathStr = driver + "vooskyupload/" + fileDirectory + "/" ;
		
		String imageFilePath = slideFilePathStr + myFileFileName;
		
		String retStatus = null ;
		UploadFileBase fb = new UploadFileBase() ;
		try {
			//正则式过滤非指定格式
			String specifiedFormat = "image/jpeg,image/gif,image/png,image/bmp,image/jpg" ;
			if(!specifiedFormat.contains(fbase.getImageFileContentType())){
				retStatus = "请上传指定范围内的图片（jpeg,gif,png,bmp,jpg）!" ;
				fb.setStatus(FILE_UPDATE_STATUS_ERROR);
				fb.setMessage(retStatus);
				return fb ;
			}
			
			// 创建文件
			String destPath = null ;
			if("".equals(driver)){
				ServletContext context = request.getSession().getServletContext();
				destPath = context.getRealPath("/") + slideFilePathStr ;
			}else{
				destPath = slideFilePathStr ;
			}
			
			File destFile = new File(destPath, myFileFileName);
			if (destFile.exists()) {
				if(isUpdate){
					imageFilePath = imageFilePath.replace("\\", "/") ;
					fb.setStatus(FILE_UPDATE_STATUS_SUCCESS);
					fb.setFileRealPath(imageFilePath);
					return fb;
				}else{
					destFile.delete() ;
				}
				
			}else{
				boolean exiFlag = true ;
				if(!new File(destPath).exists()){
					exiFlag = new File(destPath).mkdirs() ;
				}
				if(!exiFlag){
					retStatus = "创建目录失败！或请手动创建upload/" + fileDirectory + "目录！" ;
					fb.setStatus(FILE_UPDATE_STATUS_ERROR);
					fb.setMessage(retStatus);
					return fb;
				}
			}
			destFile.createNewFile() ;
			
			//上传文件
			FileUtils.copyFile(fbase.getImageFile(), destFile);
			
			imageFilePath = imageFilePath.replace("\\", "/") ;
			fb.setStatus(FILE_UPDATE_STATUS_SUCCESS);
			fb.setFileRealPath(imageFilePath);
			return fb;
		} catch (IOException e) {
			e.printStackTrace();
			retStatus = "图片上传失败！" ;
			fb.setStatus(FILE_UPDATE_STATUS_ERROR);
			fb.setMessage(retStatus);
			return fb;
		}
		
	}
	
	/**
	 * 处理拼接的字符串
	 * @param parentId
	 * @return
	 */
	public static String[] dealParentId(String parentId){
		String[] arr = new String[2] ;
		
		String navAlise = null ;
		//处理  父  子  级的 拼装
		if (parentId == null || "".equals(parentId) || "0".equals(parentId)) {
			parentId = "0";
			navAlise = "";
		} else {
			String[] pgs = parentId.split("@");

			parentId = pgs[0].trim();
			parentId = parentId.replaceFirst("^0*", "");
			if (pgs.length == 1) {
				navAlise = "-";
			} else {
				String level = pgs[1];
				if ("".equals(level)) {
					navAlise = "";
				} else {
					navAlise = level + "-";
				}
			}
		}
		arr[0] = parentId ;
		arr[1] = navAlise ;
		return arr ;
	}
	
	/**
	 * wfluo 2015.07.23 add
	 * 读取系统config.properties配置文件
	 * @return
	 */
	public static Properties readConfigProperties() {
		Properties props = new Properties();
		try {
			props.load(CalcUtil.class.getClassLoader().getResourceAsStream("config.properties"));
		}catch (IOException e) {
			e.printStackTrace();
		}
		return props ;
	}
}
