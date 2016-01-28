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
	
	/**
	 * 返回列表
	 */
	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("cateStatus", category.getCateStatus()) ;
		cateList = categoryService.findCateByStatus(param) ;
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
		String navAlise = null ;
		String parentId = category.getParentId() ;
		//处理  父  子  级的 拼装
		if (parentId == null || "".equals(parentId)) {
			parentId = "0";
			navAlise = "";
		} else {
			String[] pgs = parentId.split("@");

			parentId = pgs[0].trim();
			if (pgs.length == 1) {
				navAlise = "";
			} else {
				String level = pgs[1];
				if ("".equals(level)) {
					navAlise = "";
				} else {
					navAlise = level + "-";
				}
			}
		}
		category.setGuideAliases(navAlise);
		category.setNavId(Integer.parseInt(parentId.replaceFirst("^0*", "")));
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
