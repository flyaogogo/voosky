package com.tmwrk.voosky.web.action.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.database.vo.NavBean;
import com.tmwrk.voosky.database.vo.Navigation;
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
	public String findCategoryAndNavParentIdByCateId() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		//param.put("cateStatus", category.getCateStatus()) ;
		param.put("cateId", category.getCateId()) ;
		
		ctgry = categoryService.findCategoryAndNavParentIdByCateId(param) ;
		return SUCCESS ;
	}
	
	public String insertCategory() throws Exception{
		String navAlise = "" ;
		String cateParentId = category.getParentId() ;
		//处理  父  子  级的 拼装
		String[] pgs = cateParentId.split("@");
		cateParentId = pgs[0].trim();
		
		String level = "" ;
		if(pgs.length==2){
			level = pgs[1];
			//2016.11.06 不知道之前的处理方式，暂且注释
			//navAlise = level + "-";
			//navAlise = navAlise.substring(0, navAlise.length() - 2);
			navAlise = level ;
		}
		
		//2016.11.06  后台自动添加导航
		int parentId = insertNavigation(cateParentId) ;
		if(parentId == -1){
			return ERROR ;
		}
				
		// 类别分类添加处理
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("navName", category.getCateName()) ;
		params.put("parentId", parentId) ;
		int navId = navService.getNavigationsByName(params).get(0).getNavId() ;
		
		category.setGuideAliases(navAlise);
		category.setNavId(navId);
		categoryService.insertCategory(category);
		
		return SUCCESS ;
	}
	
	public String updateCategory() throws Exception{
		String navAlise = null ;
		String cateParentId = category.getParentId() ;
		
		//处理  父  子  级的 拼装

		String[] pgs = cateParentId.split("@");

		cateParentId = pgs[0].trim();
		
		if(pgs.length==2){
			String level = pgs[1];
			//2016.11.06 不知道之前的处理方式，暂且注释
			//navAlise = level + "-";
			//navAlise = navAlise.substring(0, navAlise.length() - 2);
			navAlise = level ;
		}
		
		//2016.11.06 修改导航栏
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("navId", category.getNavId()) ;
		Navigation cateNav = navService.getNavByNavId(params) ;
		if(cateParentId.equals(cateNav.getParentId())){
			//如果上级分类没有修改，则只修改名称即可
			cateNav.setNavName(category.getCateName());
			navService.updateNavByNavId(cateNav) ;
		}else{
			//否则，先删除之前添加的导航栏，加重新添加
			navService.deteleNavByNavId(cateNav) ;
			int parentId = insertNavigation(cateParentId) ;
			if(parentId == -1){
				return ERROR ;
			}
			params = new HashMap<String, Object>() ;
			params.put("navName", category.getCateName()) ;
			params.put("parentId", parentId) ;
			cateNav = navService.getNavigationsByName(params).get(0);
		}
		
		category.setGuideAliases(navAlise);
		category.setNavId(cateNav.getNavId());
		
		categoryService.updateCateById(category);
		
		return SUCCESS ;
	}
	
	public String deleteCategoryById() throws Exception{
		categoryService.deleteCateById(category) ;
		
		return SUCCESS ;
	}

	/**
	 * 在新增分类时，同时插入导入栏
	 * 2016.11.06  
	 * @param cateParentId
	 * @return
	 * @throws Exception
	 */
	private int insertNavigation(String cateParentId) throws Exception{
		int parentId = -1 ; 
		Map<String, Object> params = null ;
		Navigation nav = null ;
		if("0".equals(cateParentId)){
			params = new HashMap<String, Object>() ;
			params.put("module", category.getCateStatus()) ;
			params.put("parentId", cateParentId) ;
			nav = navService.getNavigationsByModule(params).get(0) ;
			nav.setGuideAliases("-");
		}else{
			params = new HashMap<String, Object>() ;
			params.put("navId", cateParentId) ;
			nav = navService.getNavByNavId(params) ;
			nav.setGuideAliases(nav.getGuideAliases() + "-");
		}
		parentId = nav.getNavId() ;
		nav.setNavName(category.getCateName());
		nav.setModule("m");
		nav.setParentId(parentId + "");
		nav.setVsort(nav.getVsort() + 1); // 在父类上加1形成子的排序
		navService.addNav(nav) ;
		return parentId ;
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
