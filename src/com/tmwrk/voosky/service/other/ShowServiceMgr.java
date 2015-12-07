package com.tmwrk.voosky.service.other;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.ShowDaoImpl;
import com.tmwrk.voosky.database.vo.Show;

@Service("showService")
@Transactional
public class ShowServiceMgr {
	@Autowired
	@Qualifier("showDao")
	private ShowDaoImpl showDao ;
	
	public List<Show> listAllSlidePage(Map<String, Object> params){
		List<Show> slides = showDao.findAll(params) ;
		
		return slides ;
	}
	
	public Show listSlideById(Map<String, Object> params){
		Show slide = showDao.findById(params) ;
		return slide ;
	}
	
	public void addSlide(Show slide){
		showDao.add(slide) ;
	}
	
	public void updateSlide(Show slide){
		
		showDao.update(slide) ;
	}
	
	public void deleteSlideById(Show slide){
		showDao.deleteSlideById(slide) ;
	}
}
