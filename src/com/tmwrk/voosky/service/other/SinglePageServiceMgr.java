package com.tmwrk.voosky.service.other;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.SinglePageDaoImpl;
import com.tmwrk.voosky.database.vo.SinglePage;

@Service("singlePageService")
@Transactional
public class SinglePageServiceMgr {
	@Autowired
	@Qualifier("singlePageDao")
	private SinglePageDaoImpl singlePageDao ;
	
	public List<SinglePage> getAllSinglePage(){
		
		//Map<String, Object> params
		
		List<SinglePage> spList = singlePageDao.findAll(null) ;
		
		return spList ;
	}
	
	public SinglePage getSinglePageById(Map<String, Object> params){
		SinglePage sp = singlePageDao.findById(params) ;
		
		return sp ;
		
	}
	
	public boolean addSinglePage(SinglePage sp){
		singlePageDao.add(sp) ;
		return true ;
	}
	
	public boolean updateSinglePageById(SinglePage sp){
		singlePageDao.update(sp) ;
		return true ;
	}
	
	public boolean deleteSpById(SinglePage sp){
		singlePageDao.deleteSinglePageById(sp) ;
		return true ;
	}
}
