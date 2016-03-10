package com.tmwrk.voosky.web.action.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.database.vo.NavBean;
import com.tmwrk.voosky.service.category.CategoryServiceMgr;
import com.tmwrk.voosky.service.nav.NavServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class CategoryAction extends BaseAction implements ModelDriven<Category>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6055926198413053234L;

	@Autowired
	private CategoryServiceMgr categoryService ;
	
	@Autowired
	private NavServiceMgr navService ;
	
	Category category = new Category() ;
	private List<Category> cateList ;
	
	private Category ctgry ;
	
	private NavBean navBean ;
	
	/**
	 * 返回列表
	 */
	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("cateStatus", category.getCateStatus()) ;
		cateList = categoryService.findCateByStatus(param) ;
		
		//add tree
		String mURL = null ;
		if("product".equals(category.getCateStatus())){
			mURL = "getProductsInfo" ;
		}else if("article".equals(category.getCateStatus())){
			mURL = "getArticlesInfo" ;
		}
		navBean = navService.getAllNavByParentId(mURL) ;
		return category.getCateStatus() ;
	}
	
	/**
	 * 通过Json返回指定类型的所有数据
	 * @return
	 */
	public String allNodeData(){
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("cateStatus", category.getCateStatus()) ;
		cateList = categoryService.findCateByStatus(param) ;
		return SUCCESS ;
	}
	
	public String findCategoryInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		//param.put("cateStatus", category.getCateStatus()) ;
		param.put("cateId", category.getCateId()) ;
		
		ctgry = categoryService.findCategoryById(param) ;
		return SUCCESS ;
	}
	
	public String insertCategory() throws Exception{
		String navAlise = "" ;
		String parentId = category.getParentId() ;
		//处理  父  子  级的 拼装
		String[] pgs = parentId.split("@");

		parentId = pgs[0].trim();
		String level = "" ;
		if(pgs.length==2){
			level = pgs[1];
			navAlise = level + "-";
			navAlise = navAlise.substring(0, navAlise.length() - 2);
		}
		
		category.setGuideAliases(navAlise);
		category.setNavId(Integer.parseInt(parentId));
		categoryService.insertCategory(category);
		return SUCCESS ;
	}
	
	public String updateCategory() throws Exception{
		String navAlise = null ;
		String parentId = category.getParentId() ;
		//处理  父  子  级的 拼装

		String[] pgs = parentId.split("@");

		parentId = pgs[0].trim();
		String level = pgs[1];
		navAlise = level + "-";
		navAlise = navAlise.substring(0, navAlise.length() - 2);

		category.setGuideAliases(navAlise);
		category.setNavId(Integer.parseInt(parentId));
		
		categoryService.updateCateById(category);
		
		return SUCCESS ;
	}
	
	public String deleteCategoryById() throws Exception{
		categoryService.deleteCateById(category) ;
		
		return SUCCESS ;
	}

	@Override
	public Category getModel() {
		return category;
	}

	public Category getCtgry() {
		return ctgry;
	}

	public void setCtgry(Category ctgry) {
		this.ctgry = ctgry;
	}

	public List<Category> getCateList() {
		return cateList;
	}

	public void setCateList(List<Category> cateList) {
		this.cateList = cateList;
	}

	public NavBean getNavBean() {
		return navBean;
	}

	public void setNavBean(NavBean navBean) {
		this.navBean = navBean;
	}
}
