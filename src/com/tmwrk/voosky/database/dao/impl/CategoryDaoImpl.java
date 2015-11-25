package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Category;

@Repository("categoryDao")
public class CategoryDaoImpl extends BaseDao<Category> {

	@Override
	public Category add(Category params) {
		getSqlMapClientTemplate().insert("category.insertCategory", params) ;
		return null;
	}

	@Override
	public Category update(Category params) {
		getSqlMapClientTemplate().update("category.updateCateById", params) ;
		return null;
	}

	@Override
	public Category findById(Map<String, Object> params) {
		Category c = (Category)getSqlMapClientTemplate().queryForObject("category.findCategoryById", params) ;
		return c ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> findAll(Map<String, Object> params) {
		List<Category> cateList = (List<Category>)getSqlMapClientTemplate().queryForList("category.findCategoryByStatus", params) ;
		return cateList;
	}

	public boolean deleteCateById(Category c){
		getSqlMapClientTemplate().delete("category.deleteCateById", c) ;
		return true ;
	}

}
