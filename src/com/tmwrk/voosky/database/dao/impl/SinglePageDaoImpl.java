package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.SinglePage;

@Repository("singlePageDao")
public class SinglePageDaoImpl extends BaseDao<SinglePage> {

	@Override
	public SinglePage add(SinglePage params) {
		getSqlMapClientTemplate().insert("singlePage.insertSinglePage",params) ;
		return null;
	}

	@Override
	public SinglePage update(SinglePage params) {
		getSqlMapClientTemplate().update("singlePage.update", params) ;
		return null;
	}

	@Override
	public SinglePage findById(Map<String, Object> params) {
		SinglePage sp = (SinglePage)getSqlMapClientTemplate().queryForObject("singlePage.findSiglePageById", params) ;
		return sp ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SinglePage> findAll(Map<String, Object> params) {
		List<SinglePage> spList = (List<SinglePage>)getSqlMapClientTemplate().queryForList("singlePage.findAllSinglePages", params) ;
		return spList ;
	}
	
	public boolean deleteSinglePageById(SinglePage sp){
		getSqlMapClientTemplate().delete("singlePage.deleteSinglePageById", sp) ;
		return true ;
	}

}
