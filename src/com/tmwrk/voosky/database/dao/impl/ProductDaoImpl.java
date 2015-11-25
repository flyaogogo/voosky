package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Product;

@Repository("productDao")
public class ProductDaoImpl extends BaseDao<Product> {

	@Override
	public Product add(Product params) {
		getSqlMapClientTemplate().insert("product.addProduct", params) ;
		return null;
	}

	@Override
	public Product update(Product params) {
		getSqlMapClientTemplate().update("product.updateById", params) ;
		return null;
	}

	@Override
	public Product findById(Map<String, Object> params) {
		Product p = (Product)getSqlMapClientTemplate().queryForObject("product.getProductById", params) ;
		return p ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findAll(Map<String, Object> params) {
		List<Product> prList = (List<Product>)getSqlMapClientTemplate().queryForList("product.getAllProducts", params) ;
		return prList;
	}

	public boolean deleteProductById(Product p){
		getSqlMapClientTemplate().delete("product.deleteById", p) ;
		return true ;
	}
}
