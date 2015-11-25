package com.tmwrk.voosky.service.category;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.CategoryDaoImpl;
import com.tmwrk.voosky.database.vo.Category;

@Service("categoryService")
@Transactional
public class CategoryServiceMgr {
	@Autowired
	@Qualifier("categoryDao")
	private CategoryDaoImpl categoryDao ;
	
	/**
	 * 通过分类状态区分分类类型
	 * @param cate
	 * @return
	 */
	public List<Category> findCateByStatus(Map<String, Object> cate){
		
		List<Category> cList = categoryDao.findAll(cate) ;
		
		return cList ;
	}
	
	/**
	 *  通过分类Id，获取整条数据信息
	 * @param cate
	 * @return
	 */
	public Category findCategoryById(Map<String, Object> cate){
		Category c = categoryDao.findById(cate) ;
		return c ;
	}
	
	public void insertCategory(Category c) {
		
		categoryDao.add(c) ;
	}
	
	public void updateCateById(Category c){
		categoryDao.update(c) ;
	}
	
	public boolean deleteCateById(Category c){
		return categoryDao.deleteCateById(c) ;
	}
}
