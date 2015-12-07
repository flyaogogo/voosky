package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Show;

@Repository("showDao")
public class ShowDaoImpl extends BaseDao<Show> {

	@Override
	public Show add(Show params) {
		getSqlMapClientTemplate().insert("show.addSlide",params) ;
		return null;
	}

	@Override
	public Show update(Show params) {
		getSqlMapClientTemplate().update("show.updateSlide", params) ;
		return null;
	}

	@Override
	public Show findById(Map<String, Object> params) {
		Show sp = (Show)getSqlMapClientTemplate().queryForObject("show.listAllslideById", params) ;
		return sp ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Show> findAll(Map<String, Object> params) {
		List<Show> spList = (List<Show>)getSqlMapClientTemplate().queryForList("show.listAllslides", params) ;
		return spList ;
	}
	
	public boolean deleteSlideById(Show sp){
		getSqlMapClientTemplate().delete("show.deleteSlideById", sp) ;
		return true ;
	}
}
