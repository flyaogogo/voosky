package com.tmwrk.voosky.service.nav;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.NavigationDaoImpl;
import com.tmwrk.voosky.database.vo.NavBean;
import com.tmwrk.voosky.database.vo.Navigation;

@Service("navService")
@Transactional
public class NavServiceMgr {
	@Autowired
	@Qualifier("navDao")
	private NavigationDaoImpl navDao ;
	
	public boolean addNav(Navigation nav){
		navDao.add(nav) ;
		return true ;
	}
	public boolean updateNavByNavId(Navigation nav){
		navDao.update(nav) ;
		return true ;
	}
	public boolean deteleNavByNavId(Navigation nav){
		navDao.delete(nav) ;
		return true ;
	}
	
	/**
	 * 2016.11.06 通过导航Id删除分类中对航的目录
	 * @param navId
	 * @return
	 */
	public boolean deleteCateByNavId(int navId){
		navDao.deleteCateByNavId(navId);
		return true ;
	}
	
	public List<Navigation> getNavsByType(Map<String, String> params){
		List<Navigation> navList = navDao.getNavigationsByType(params) ;
		return navList ;
	}
	public List<Navigation> getNavsByParentId(Map<String, Object> params){
		List<Navigation> navList = navDao.getNavigationsByParentId(params) ;
		return navList ;
	}
	/**
	 * 组装树型结构
	 * @param params
	 * @return
	 */
	public List<Navigation> getAllNavigations(Map<String, String> params){
		List<Navigation> navList = navDao.getAllNavigations(null) ;
		return navList ;
	}
	
	public Navigation getNavByNavId(Map<String, Object> params){
		Navigation nav = navDao.findById(params) ;
		return nav ;
	}
	
	/**
	 * 根据模板名称找到相关信息
	 * @param params
	 * @return
	 */
	public List<Navigation> getNavigationsByModule(Map<String, Object> params) {
		
		List<Navigation> navList = navDao.getNavigationsByModule(params) ;
		return navList ;
	}
	
	/**
	 * 2016.11.06 根据导航名称找到相关信息
	 * @param params
	 * @return
	 */
	public List<Navigation> getNavigationsByName(Map<String, Object> params) {
		
		List<Navigation> navList = navDao.getNavigationsByName(params) ;
		return navList ;
	}
	
	/**
	 * 获取指定结点下的所有  子级节点
	 * @param modelURL
	 * @return
	 */
	public NavBean getAllNavByParentId(String modelURL){
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("murl", modelURL) ;
		List<Navigation> tmpList = navDao.getNavigateByURLId(params) ;
		
		NavBean navbean = new NavBean() ;
		if(tmpList.size()>0){
			List<Navigation> navChildList = new ArrayList<Navigation>() ;
			String parentId = tmpList.get(0).getNavId() + "" ;
			List<Navigation> navList = navDao.getAllNavigations(null) ;
			getAllChildByParentId(navList, navChildList, parentId);
			navbean.setNavList(navChildList);
			navbean.setParentId(parentId);
		}
		return navbean ;
	}
	
	/**
	 * 递归获取所有子节点
	 * @param navList
	 * @param navChildList
	 * @param parentId
	 */
	private void getAllChildByParentId(List<Navigation> navList,List<Navigation> navChildList,String parentId){
		
		for(Navigation nav :navList){
			if(parentId.equals(nav.getParentId())){
				navChildList.add(nav) ;
				getAllChildByParentId(navList, navChildList, nav.getNavId()+"");
			}
		}
	}
	
	/**
	 * 获取导航不重复的单页面
	 * @param modelURL
	 * @return
	 */
	public NavBean getSinglePageNavBySp(String status){
		String modelURL = "getSPInfoByName" ;
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("murl", modelURL) ;
		List<Navigation> tmpList = navDao.getNavigateByURLId(params) ;
		
		NavBean navbean = new NavBean() ;
		//为去重
		HashMap<String, String> map = new HashMap<String, String>();
		for(int i=0;i<tmpList.size();i++){
			if(map.get(tmpList.get(i).getModuleUrl())!=null){
				tmpList.remove(tmpList.get(i));
            } else {
                map.put(tmpList.get(i).getModuleUrl(), "OK");
            }
		}
		navbean.setNavList(tmpList);
		navbean.setCurStatus(status);
		return navbean ;
	}
	
	/*
	public List<TreeNode> getNavTree(String initParentId) {
		List<TreeNode> trees = new ArrayList<TreeNode>() ;
		List<Navigation> navList = getAllNavigations(null) ;
		
		TreeNode node = null ;
		
		for(Navigation nav : navList){
			node = new TreeNode() ;
			
			node.setId(nav.getNavId());
			node.setpId(Integer.parseInt(nav.getParentId()));
			node.setName(nav.getNavName());
			node.setModule(nav.getModule());
//			node.setUrl(nav.getModuleUrl());
			
			trees.add(node);
		}
		return trees ;
	}*/
}
