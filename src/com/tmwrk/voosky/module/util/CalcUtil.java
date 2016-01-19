package com.tmwrk.voosky.module.util;

import java.io.File;
import java.io.IOException;

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
		String myFileFileName = "image_" + fbase.getImageFileFileName() ;
		
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
			ServletContext context = request.getSession().getServletContext();
			String destPath = context.getRealPath("/") + slideFilePathStr ;
			
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
}
