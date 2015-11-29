package com.tmwrk.voosky.web.action.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.service.category.CategoryServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class CategoryAction extends BaseAction implements ModelDriven<Category>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6055926198413053234L;

	@Autowired
	private CategoryServiceMgr categoryService ;
	
	Category category = new Category() ;
	private List<Category> cateList ;
	
	private Category ctgry ;
	
	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("cateStatus", category.getCateStatus()) ;
		cateList = categoryService.findCateByStatus(param) ;
		return category.getCateStatus() ;
	}
	
	public String findCategoryInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		//param.put("cateStatus", category.getCateStatus()) ;
		param.put("cateId", category.getCateId()) ;
		
		category = categoryService.findCategoryById(param) ;
		return SUCCESS ;
	}
	
	public String insertCategory() throws Exception{
		categoryService.insertCategory(category);
		return SUCCESS ;
	}
	
	public String updateCategory() throws Exception{
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
}
