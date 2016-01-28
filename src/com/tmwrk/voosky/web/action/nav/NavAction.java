package com.tmwrk.voosky.web.action.nav;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tmwrk.voosky.database.vo.Navigation;
import com.tmwrk.voosky.service.nav.NavServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

/**
 * 导航相关操作前端接口类
 * 
 * @author wfluo 2015-11-23
 *
 */
public class NavAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1580844422782323678L;

	private String navType ;
	private String navId ;
	private String navName ;
	private String navMenu ;
	private String navAlise ;
	private String module ;
	private String moduleUrl ;
	private String parentId ;
	private String sort ;
	
	private NavServiceMgr navService ;
	
	private Navigation nav ;
	private List<Navigation> navList ;
	
	@Override
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>() ;
		params.put("navType", navType) ;
		navList = navService.getNavsByType(params) ;
		return SUCCESS ;
	}
	/**
	 * 通过导航Id获取相关信息
	 * @return
	 */
	public String listNavById(){
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("navId", navId) ;
		nav = navService.getNavByNavId(params) ;
		
		return SUCCESS ;
	}
	/**
	 * 添加
	 * @return
	 */
	public String addNav(){
		Navigation navs = new Navigation() ;
		navs.setNavName(navName);
		if(navMenu!=null){
			//说明是通过  站内导航添加
			String[] menus = navMenu.split("@") ; 
			if(menus.length==2){
				module = "m" ;
				moduleUrl = menus[1] ;
			}
		}
		navs.setModule(module) ;
		navs.setModuleUrl(moduleUrl);
		
		//parentId = (parentId==null||"".equals(parentId))?"0":parentId ;
		//处理  父  子  级的 拼装
		if(parentId==null||"".equals(parentId)){
			parentId = "0" ;
			navAlise = "" ;
		}else{
			String[] pgs = parentId.split("@") ; 
			
			parentId = pgs[0] ;
			if(pgs.length==1){
				navAlise = "-" ;
			}else{
				String level = pgs[1] ;
				if("".equals(level)){
					navAlise = "-" ;
				}else{
					navAlise = level + "-" ;
				}
			}
		}
		navs.setGuideAliases(navAlise);
		navs.setParentId(parentId);
		navs.setVtype(navType);
		navs.setVsort(Integer.parseInt(sort));
		try {
			navService.addNav(navs) ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS ;
	}
	/**
	 * 修改
	 * @return
	 */
	public String updateNav(){
		Navigation navs = new Navigation() ;
		navs.setNavId(Integer.parseInt(navId));
		navs.setNavName(navName);
		if(navMenu!=null){
			//说明是通过  站内导航添加
			String[] menus = navMenu.split("@") ; 
			if(menus.length==2){
				module = "m" ;
				moduleUrl = menus[1] ;
			}
		}
		navs.setModule(module) ;
		navs.setModuleUrl(moduleUrl);
		//parentId = (parentId==null||"".equals(parentId))?"0":parentId ;
		//处理  父  子  级的 拼装
		if (parentId == null||"".equals(parentId)) {
			parentId = "0";
			navAlise = "";
		} else {
			String[] pgs = parentId.split("@");
			parentId = pgs[0];
			if(pgs.length==1){
				navAlise = "-" ;
			}else{
				String level = pgs[1] ;
				if("".equals(level)){
					navAlise = "-" ;
				}else{
					navAlise = level + "-" ;
				}
			}
		}
		navs.setGuideAliases(navAlise);
		navs.setParentId(parentId);
		navs.setVtype(navType);
		navs.setVsort(Integer.parseInt(sort));
		navService.updateNavByNavId(navs) ;
		
		return SUCCESS ;
	}
	/**
	 * 删除
	 * @return
	 */
	public String deleteNavByNavId(){
		Navigation navs = new Navigation() ;
		navs.setNavId(Integer.parseInt(navId));
		navService.deteleNavByNavId(navs) ;
		
		return SUCCESS ;
	}
	
	/**
	 * 组装Tree 
	 * @throws IOException 
	 * 
	 */
	/*
	public void treeNodeData() throws IOException{
		List<TreeNode> trees = navService.getNavTree(null) ;
		response.setCharacterEncoding("UTF-8");  
		//利用Json插件将Array转换成Json格式   
        response.getWriter().print(JSONArray.fromObject(trees).toString()); 
	}*/
	
	public String allNodeData(){
		navList = navService.getAllNavigations(null) ;
		return SUCCESS ;
	}
	
	public String getNavType() {
		return navType;
	}
	public void setNavType(String navType) {
		this.navType = navType;
	}
	public String getNavId() {
		return navId;
	}
	public void setNavId(String navId) {
		this.navId = navId;
	}
	public String getNavName() {
		return navName;
	}
	public void setNavName(String navName) {
		this.navName = navName;
	}
	public String getNavMenu() {
		return navMenu;
	}
	public void setNavMenu(String navMenu) {
		this.navMenu = navMenu;
	}
	public String getNavAlise() {
		return navAlise;
	}
	public void setNavAlise(String navAlise) {
		this.navAlise = navAlise;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getModuleUrl() {
		return moduleUrl;
	}
	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public NavServiceMgr getNavService() {
		return navService;
	}
	public void setNavService(NavServiceMgr navService) {
		this.navService = navService;
	}
	public Navigation getNav() {
		return nav;
	}
	public void setNav(Navigation nav) {
		this.nav = nav;
	}
	public List<Navigation> getNavList() {
		return navList;
	}
	public void setNavList(List<Navigation> navList) {
		this.navList = navList;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
}
