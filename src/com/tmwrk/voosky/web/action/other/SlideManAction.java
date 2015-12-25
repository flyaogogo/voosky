package com.tmwrk.voosky.web.action.other;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Show;
import com.tmwrk.voosky.service.other.ShowServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class SlideManAction extends BaseAction implements ModelDriven<Show>{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5490981712548450603L;
	
	@Autowired
	private ShowServiceMgr showService ;
	
	Show show = new Show() ;
	
	private Show slide ;
	
	private List<Show> slideList ;
	
	private String msg ;
	
	@Override
	public String execute() throws Exception{
//		SmartUpload su = new  SmartUpload();
//		su.service(request,response);
//		//
//		su.getRequest().getParameter("showImg") ;//来获取form中的值了
		slideList = showService.listAllSlidePage(null) ;
		return SUCCESS ;
	}

	public String getSlideById() throws Exception{
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("id", show.getId()) ;
		slide = showService.listSlideById(params) ;
		return SUCCESS ;
	}

	public String insertSlide() throws Exception{
		String state = dealUploadInfo(false) ;
		if(ERROR.equals(state)){
			return ERROR ;
		}
		
		showService.addSlide(show);
		return SUCCESS ;
	}
	
	public String updateSlide() throws Exception{
		
		String state = dealUploadInfo(true) ;
		if(ERROR.equals(state)){
			return ERROR ;
		}
		
		showService.updateSlide(show);
		return SUCCESS ;
	}
	
	public String deleteSlideById() throws Exception{
		
		showService.deleteSlideById(show);
		
		//TODO 同步删除 相关图片
		
		return SUCCESS ;
	}
	
	/**
	 * 上传文件
	 * @param isUpdate
	 * @return
	 */
	private String dealUploadInfo(boolean isUpdate){
		/* Copy file to a safe location */
		// String destPath = "/upload/imange/";
		String myFileFileName = "image_" + show.getImageFileFileName() ;

		String slideFilePathStr = "upload/slide/" ;
		
		String imageFilePath = slideFilePathStr + myFileFileName;
		try {
//			System.out.println("request.getpathinfo():" + request.getPathInfo());
//			System.out.println("request.getrequesturl():" + request.getRequestURL());
//			System.out.println("request.getrequesturi():" + request.getRequestURI());
//			System.out.println("request.getservletpath():" + request.getServletPath());
//			System.out.println("request.getquerystring():" + request.getQueryString());
//			System.out.println("Src File name: " + imageFileFileName);
//			System.out.println("Src File Content Type: " + imageFileContentType);
			//正则式过滤非指定格式
			String specifiedFormat = "image/jpeg,image/gif,image/png,image/bmp,image/jpg" ;
			if(!specifiedFormat.contains(show.getImageFileContentType())){
				msg = "请上传指定范围内的图片（jpeg,gif,png,bmp,jpg）!" ;
				return ERROR ;
			}
			// 创建文件
			ServletContext context = request.getSession().getServletContext();
			String destPath = context.getRealPath("/") + slideFilePathStr ;
			//System.out.println("Dst File path: " + destPath);
//			System.out.println(imageFile);
			File destFile = new File(destPath, myFileFileName);
			if (destFile.exists()) {
				if(isUpdate){
					//System.out.println("input database image path:" + imageFilePath);
					show.setShowImg(imageFilePath.replace("\\", "/"));
					return SUCCESS ;
				}else{
					destFile.delete() ;
				}
				
			}else{
				boolean exiFlag = true ;
				if(!new File(destPath).exists()){
					exiFlag = new File(destPath).mkdirs() ;
				}
				if(!exiFlag){
					msg = "创建目录失败！或请手动在WEB-INF下创建upload目录！" ;
					return ERROR ;
				}
			}
			destFile.createNewFile() ;
//			System.out.println(destFile.getPath());
			// File destFile = new File(destPath, myFileFileName);
			
			FileUtils.copyFile(show.getImageFile(), destFile);
			
			//System.out.println("input database image path:" + imageFilePath);
			show.setShowImg(imageFilePath.replace("\\", "/"));
			
		} catch (IOException e) {
			e.printStackTrace();
			msg = "图片上传失败！" ;
			return ERROR;
		}
		return SUCCESS ;
	}
	
	
	@Override
	public Show getModel() {
		return show;
	}

	public Show getSlide() {
		return slide;
	}

	public void setSlide(Show slide) {
		this.slide = slide;
	}

	public List<Show> getSlideList() {
		return slideList;
	}

	public void setSlideList(List<Show> slideList) {
		this.slideList = slideList;
	}

	/*public File getImageFile() {
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
	}*/

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
