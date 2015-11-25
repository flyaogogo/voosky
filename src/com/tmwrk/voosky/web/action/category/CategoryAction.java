package com.tmwrk.voosky.web.action.category;

import java.util.List;

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
	
	private Category category = new Category() ;
	private List<Category> cateList ;
	
	@Override
	public String execute() throws Exception{
		
		return SUCCESS ;
	}
	
	public String findCategoryInfoById() throws Exception{
		
		return SUCCESS ;
	}
	
	public String insertCategory() throws Exception{
		
		return SUCCESS ;
	}
	
	public String updateCategory() throws Exception{
		
		
		return SUCCESS ;
	}
	
	public String deleteCategoryById() throws Exception{
		
		
		return SUCCESS ;
	}

	@Override
	public Category getModel() {
		return category;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getCateList() {
		return cateList;
	}

	public void setCateList(List<Category> cateList) {
		this.cateList = cateList;
	}
}
