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
	
	private File imageFile ;
	
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

		/* Copy file to a safe location */
		// String destPath = "/upload/imange/";
		String myFileFileName = "image_" + System.currentTimeMillis() + ".jpg";

		try {
			//System.out.println("Src File name: " + imageFile);
			//System.out.println("Dst File name: " + myFileFileName);

			// 创建文件
			ServletContext context = request.getSession().getServletContext();
			String destPath = context.getRealPath("WEB-INF/upload/");
			System.out.println("Dst File path: " + destPath);
//			System.out.println(imageFile);
			File destFile = new File(destPath, myFileFileName);
			if (!destFile.exists()) {
				boolean exiFlag = true ;
				if(!new File(destPath).exists()){
					exiFlag = new File(destPath).mkdirs() ;
				}
				if(!exiFlag){
					return ERROR ;
				}
				destFile.createNewFile() ;
			}
			System.out.println(destFile.getPath());
			// File destFile = new File(destPath, myFileFileName);
			
			FileUtils.copyFile(imageFile, destFile);
			
			show.setShowImg(destFile.getPath().replace("\\", "/"));
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		
		showService.addSlide(show);
		return SUCCESS ;
	}
	
	public String updateSlide() throws Exception{
		
        
		showService.updateSlide(show);
		return SUCCESS ;
	}
	
	public String deleteSlideById() throws Exception{
		
		showService.deleteSlideById(show);
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

	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

}
