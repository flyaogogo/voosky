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
	 * 关联vs_nav找到与之对应的URL
	 * @param cate
	 * @return
	 */
	public List<Category> listCatesUrlByStatus(Map<String, Object> cate){
		
		List<Category> cList = categoryDao.listCatesUrlByStatus(cate) ;
		
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
	
	/**
	 *  2016.11.06  通过分类Id，获取整条数据信息
	 * @param cate
	 * @return
	 */
	public Category findCategoryAndNavParentIdByCateId(Map<String, Object> cate){
		Category c = categoryDao.findCategoryAndNavParentIdByCateId(cate) ;
		return c ;
	}
	/**
	 *  2016.11.06 通过Nav Id，获取整条数据信息
	 * @param cate
	 * @return
	 */
	public Category findCategoryByNavId(int navId){
		Category c = categoryDao.findCategoryByNavId(navId) ;
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
	
	/**
	 * 2016.11.06 通过Nav Id 删除分类
	 * @param navId
	 * @return
	 */
	public boolean deleteCateByNavId(int navId){
		return categoryDao.deleteCateByNavId(navId) ;
	}
}
