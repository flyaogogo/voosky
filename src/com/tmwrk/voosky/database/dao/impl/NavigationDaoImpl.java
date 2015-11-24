package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Navigation;

@Repository("navDao")
public class NavigationDaoImpl extends BaseDao<Navigation>{

	@Override
	public Navigation add(Navigation params) {
		getSqlMapClientTemplate().insert("navigation.addNav",params) ;
		return null ;
	}

	@Override
	public Navigation update(Navigation params) {
		getSqlMapClientTemplate().update("navigation.updateNav", params) ;
		return null ;
	}

	@Override
	public Navigation findById(Map<String, Object> params) {
		Navigation nav = (Navigation)getSqlMapClientTemplate().queryForObject("navigation.getNavigationByTypeId", params) ;
		return nav ;
	}

	@Override
	public List<Navigation> findAll(Map<String, Object> params) {
		
		return null ;
	}
	/**
	 * 通过导航Id删除导航
	 * @param params
	 * @return
	 */
	public Navigation delete(Navigation params) {
		getSqlMapClientTemplate().delete("navigation.deleteNavByNavId", params) ;
		return null ;
	}
	/**
	 * 通过导航类型找到相关信息
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public List<Navigation> getNavigationsByType(Map<String, String> params) {
		List<Navigation> navList = (List<Navigation>)getSqlMapClientTemplate().queryForList("navigation.getNavigationsByType", params) ;
		
		return navList ;
	}
	/**
	 * 获取所有的导航
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public List<Navigation> getAllNavigations(Map<String, String> params) {
		List<Navigation> navList = (List<Navigation>)getSqlMapClientTemplate().queryForList("navigation.getAllNavigations", params) ;
		
		return navList ;
	}
	
	/**
	 * 通过父类找到相关子类
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public List<Navigation> getNavigationsByParentId(Map<String, Object> params) {
		List<Navigation> navList = (List<Navigation>)getSqlMapClientTemplate().queryForList("navigation.getNavigationsByParentId", params) ;
		
		return navList ;
	}

}
