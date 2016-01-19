package com.tmwrk.voosky.web.action.other;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Show;
import com.tmwrk.voosky.database.vo.UploadFileBase;
import com.tmwrk.voosky.module.util.CalcUtil;
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
		UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(false, show, "slide", request);
		if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
			slide.setStatus(uplFileBase.getStatus());
			slide.setMessage(uplFileBase.getMessage());
			return ERROR ;
		}
		show.setShowImg(uplFileBase.getFileRealPath());
		showService.addSlide(show);
		return SUCCESS ;
	}
	
	public String updateSlide() throws Exception{
		
		UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(true, show, "slide", request);
		if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
			slide.setStatus(uplFileBase.getStatus());
			slide.setMessage(uplFileBase.getMessage());
			return ERROR ;
		}
		show.setShowImg(uplFileBase.getFileRealPath());
		showService.updateSlide(show);
		return SUCCESS ;
	}
	
	public String deleteSlideById() throws Exception{
		
		showService.deleteSlideById(show);
		
		//TODO 同步删除 相关图片
		
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
