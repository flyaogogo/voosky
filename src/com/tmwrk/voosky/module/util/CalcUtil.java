package com.tmwrk.voosky.module.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tmwrk.voosky.database.vo.UploadFileBase;


public class CalcUtil {
	
	public static String FILE_UPDATE_STATUS_ERROR = "error" ;
	public static String FILE_UPDATE_STATUS_SUCCESS = "success" ;
	
	
	private static final Log log = LogFactory.getLog(CalcUtil.class);
	
	public static void main(String[] args) {
		int a = Integer.parseInt("001") ;
		System.out.println(a);
	}
	

	/**
	 * 上传文件  服务器所在的  本地磁盘
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
		/*
		String os = System.getProperty("os.name") ;
		String driver = "" ;
		System.out.println("os 操作系统类型：" + os);
		if(os.toLowerCase().startsWith("win")){
			driver = readConfigProperties().getProperty("upload.drive.path") ;
		}else if(os.toLowerCase().indexOf("linux")>=0){
			driver = "/" ;
		}
		*/
		String myFileFileName = "image_" + fbase.getImageFileFileName() ;
		// 处理上传文件带空格
		myFileFileName = myFileFileName.replace(" ", "") ;
		
		//String slideFilePathStr = driver + "vooskyupload/" + fileDirectory + "/" ;
		String slideFilePathStr = "upload/" + fileDirectory + "/" ;
		
		String imageFilePath = slideFilePathStr + myFileFileName;
		
		String retStatus = null ;
		UploadFileBase fb = new UploadFileBase() ;
		// 上传到服务器上的路径
		String serviceFilePathStr = null ;
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
			/*
			if("".equals(driver)){
				ServletContext context = request.getSession().getServletContext();
				destPath = context.getRealPath("/") + slideFilePathStr ;
			}else{
				destPath = slideFilePathStr ;
			}
			*/
			ServletContext context = request.getSession().getServletContext();
			destPath = context.getRealPath("/") + slideFilePathStr ;
			///******************************////
			//System.out.println(" before :" + destPath);
			/////******************************////
			
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
			
			//*************图片存储到服务器上的磁盘上*****************//
			//http://blog.sina.com.cn/s/blog_8d960c4c0101cd4m.html
			serviceFilePathStr = request.getScheme() + "://" + request.getServerName() + ":" 
									+ request.getServerPort() + request.getContextPath() + "/" + imageFilePath  ;

//			System.out.println( " after :" + serviceFilePathStr);
//			System.out.println(fbase.getImageFile() + " --->>>" + destFile);
//			System.out.println( " imageFilePath :" + imageFilePath);
			String encode = judyCharacterEncoding(serviceFilePathStr); 
			URL theURL = new URL(serviceFilePathStr);
			String virtualServerImagePath = readConfigProperties().getProperty("upload.service.disk") ;
			//服务器上的文件下载到服务器本地磁盘
			downloadFile(theURL,myFileFileName, virtualServerImagePath + slideFilePathStr,encode);
			
			/////******************************//// 
			
			fb.setStatus(FILE_UPDATE_STATUS_SUCCESS);
			fb.setFileRealPath(imageFilePath);
			retStatus = "图片上传成功！" ;
			log.info(retStatus);
			return fb;
		} catch (IOException e) {
			e.printStackTrace();
			retStatus = "图片上传失败！" ;
			fb.setStatus(FILE_UPDATE_STATUS_ERROR);
			fb.setMessage(retStatus);
			log.error(retStatus + " : " + e);
			return fb;
		}finally{
			//删除服务器上的文件
			if(serviceFilePathStr != null){
				System.out.println(serviceFilePathStr);
				File serviceFilePath = new File(serviceFilePathStr) ;
				serviceFilePath.delete() ;
			}
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
	
	public static void downloadFile(URL theURL,String fileName, String filePath,String encode)
			throws IOException {
		
		File dirFile = new File(filePath);
		if (!dirFile.exists()) {// 文件路径不存在时，自动创建目录
			dirFile.mkdir();
		}
		// 从服务器上获取图片并保存
		HttpURLConnection connection = (HttpURLConnection)theURL.openConnection();
		//System.out.println("get Encode : " + connection.getContentEncoding());
		connection.setRequestProperty("User-Agent","Mozilla/5.0 ( compatible ) ");
		connection.setRequestProperty("Accept","*/*");
		connection.setRequestProperty("contentType", encode);
		connection.setConnectTimeout(5 * 1000);  
		connection.setRequestProperty("Accept-Language", "zh-CN");  
		connection.setDoOutput(true);
        connection.setDoInput(true);
        connection.setInstanceFollowRedirects(false); 
        connection.setRequestMethod("POST"); 
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
        connection.setRequestProperty("charset", "utf-8");
        connection.setUseCaches (false);

		
		
		InputStream in = connection.getInputStream();
		FileOutputStream os = new FileOutputStream(filePath + "/" + fileName);
		byte[] buffer = new byte[4 * 1024];
		int read;
		while ((read = in.read(buffer)) > 0) {
			os.write(buffer, 0, read);
		}
		os.close();
		in.close();
	}
	
	/**
	 * 字符串编码格式判断及转码
	 * @param character
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private static String judyCharacterEncoding(String character) throws UnsupportedEncodingException{
		//String temp = null ;
		String enCode = null ;
		if(character.equals(new String(character.getBytes("ISO-8859-1"), "ISO-8859-1"))) {
          //temp = new String(character.getBytes("ISO-8859-1"),"UTF-8");
          enCode = "ISO-8859-1" ;
        }else if(character.equals(new String(character.getBytes("GBK"), "GBK"))) {
            //temp = new String(character.getBytes("GBK"),"UTF-8");
            enCode = "GBK" ;
        }else if(character.equals(new String(character.getBytes("UTF-8"), "UTF-8"))) {
        	//temp = new String(character.getBytes("UTF-8"),"UTF-8");
        	enCode = "UTF-8" ;
        }else if(character.equals(new String(character.getBytes("GB2312"), "GB2312"))) {
        	//temp = new String(character.getBytes("GB2312"),"UTF-8");
        	enCode = "GB2312" ;
        }else if(character.equals(new String(character.getBytes("US-ASCII"), "US-ASCII"))) {
        	//temp = new String(character.getBytes("US-ASCII"),"UTF-8");
        	enCode = "US-ASCII" ;
        }else if(character.equals(new String(character.getBytes("UTF-16BE"), "UTF-16BE"))) {
        	//temp = new String(character.getBytes("UTF-16BE"),"UTF-8");
        	enCode = "UTF-16BE" ;
        }else if(character.equals(new String(character.getBytes("UTF-16LE"), "UTF-16LE"))) {
        	//temp = new String(character.getBytes("UTF-16LE"),"UTF-8");
        	enCode = "UTF-16LE" ;
        }else if(character.equals(new String(character.getBytes("UTF-16"), "UTF-16"))) {
        	//temp = new String(character.getBytes("UTF-16"),"UTF-8");
        	enCode = "UTF-16" ;
        }
		//System.out.println("---------character---->> :" + temp);
		//System.out.println("---------enCode---->> :" + enCode);
		return enCode ;
	}
	
	/**
	 * 上传文件 到服务器  原始处理方法
	 * @param isUpdate 是否已经上传
	 * @param fbase 上传必备三个参数类
	 * @param fileDirectory 上传到服务器的文件目录
	 * @param request http请求
	 * @return
	 */
	public static UploadFileBase dealUploadServiceInfo(boolean isUpdate , UploadFileBase fbase , String fileDirectory , HttpServletRequest request){
		
		if(fbase.getImageFile()==null){
			return null ;
		}
		
		/*
		String os = System.getProperty("os.name") ;
		String driver = "" ;
		System.out.println("os 操作系统类型：" + os);
		if(os.toLowerCase().startsWith("win")){
			driver = readConfigProperties().getProperty("upload.drive.path") ;
		}else if(os.toLowerCase().indexOf("linux")>=0){
			driver = "/" ;
		}
		 */
		String myFileFileName = "image_" + fbase.getImageFileFileName() ;
		
		//String slideFilePathStr = driver + "vooskyupload/" + fileDirectory + "/" ;
		String slideFilePathStr = "upload/" + fileDirectory + "/" ;
		
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
			/*
			if("".equals(driver)){
				ServletContext context = request.getSession().getServletContext();
				destPath = context.getRealPath("/") + slideFilePathStr ;
			}else{
				destPath = slideFilePathStr ;
			}
			 */
			ServletContext context = request.getSession().getServletContext();
			destPath = context.getRealPath("/") + slideFilePathStr ;
		
			
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
			retStatus = "图片上传成功！" ;
			log.info(retStatus);
			return fb;
		} catch (IOException e) {
			e.printStackTrace();
			retStatus = "图片上传失败！" ;
			fb.setStatus(FILE_UPDATE_STATUS_ERROR);
			fb.setMessage(retStatus);
			log.error(retStatus + " : " + e);
			return fb;
		}
		
	}
}
