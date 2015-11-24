package com.tmwrk.voosky.service.nav;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.NavigationDaoImpl;
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
		
		//TODO
		
		
		
		return navList ;
	}
	public Navigation getNavByNavId(Map<String, Object> params){
		Navigation nav = navDao.findById(params) ;
		return nav ;
	}
}
