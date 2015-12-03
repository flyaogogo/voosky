package com.tmwrk.voosky.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.ProductDaoImpl;
import com.tmwrk.voosky.database.vo.Product;

@Service("productService")
@Transactional
public class ProductServiceMgr {
	@Autowired
	@Qualifier("productDao")
	private ProductDaoImpl productDao ;
	
	public List<Product> findAllProductsInfo(Map<String, Object> param){
		List<Product> prList = productDao.findAll(param) ;
		return prList ;
	}
	
	public Product findProductInfoById(Map<String, Object> param){
		Product p = productDao.findById(param) ;
		
		return p ;
	}
	
	public void insertProduct(Product p){
		productDao.add(p) ;
	}
	
	public void updateProduct(Product p){
		
		productDao.update(p) ;
	}
	
	public boolean deleteProductById(Product p){
		return productDao.deleteProductById(p) ;
	}
	/**
	 * 更新是否在首页显示
	 * @param params
	 */
	public void updateShowFirstPageById(Product params) {
		productDao.updateShowFirstPageById(params) ;
	}
}
