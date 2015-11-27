package com.tmwrk.voosky.web.action.other;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.SinglePage;
import com.tmwrk.voosky.service.other.SinglePageServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class SinglePageAction extends BaseAction implements ModelDriven<SinglePage> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8210696078335992426L;
	
	@Autowired
	private SinglePageServiceMgr singlePageService ;
	
	
	private List<SinglePage> spList ;
	private SinglePage sp ;
	
	SinglePage singlePage = new SinglePage() ;
	
	@Override
	public String execute() throws Exception{
		spList = singlePageService.getAllSinglePage() ;
		return SUCCESS ;
	}
	
	
	public String findSinglePageInfoById() throws Exception{
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("pageId", singlePage.getPageId()) ;
		sp = singlePageService.getSinglePageById(params) ;
		return SUCCESS ;
	}
	
	public String insertSinglePage() throws Exception{
		singlePageService.addSinglePage(singlePage) ;
		return SUCCESS ;
	}
	
	public String updateSinglePage() throws Exception{
		
		singlePageService.updateSinglePageById(singlePage) ;
		return SUCCESS ;
	}
	
	public String deleteSinglePageById() throws Exception{
		
		singlePageService.deleteSpById(singlePage) ;
		return SUCCESS ;
	}


	@Override
	public SinglePage getModel() {
		return singlePage;
	}

	public SinglePage getSp() {
		return sp;
	}


	public void setSp(SinglePage sp) {
		this.sp = sp;
	}


	public List<SinglePage> getSpList() {
		return spList;
	}


	public void setSpList(List<SinglePage> spList) {
		this.spList = spList;
	}

}
