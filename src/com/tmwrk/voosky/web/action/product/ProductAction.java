package com.tmwrk.voosky.web.action.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Product;
import com.tmwrk.voosky.service.product.ProductServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

/**
 * 
 * @author wfluo 2015-11-30
 *
 */
public class ProductAction extends BaseAction implements ModelDriven<Product>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1819152777794076784L;
	
	@Autowired
	private ProductServiceMgr productService ;
	
	Product product = new Product() ;
	
	private Product pro ;
	
	private List<Product> proList ;

	@Override
	public String execute() throws Exception{
//		Map<String, Object> param = new HashMap<String, Object>() ;
//		param.put(key, value)
		proList = productService.findAllProductsInfo(null) ;
		return SUCCESS ;
	}
	
	/**
	 * 通过产品Id获取详细信息
	 * @return
	 * @throws Exception
	 */
	public String findProductInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", pro.getId()) ;
		pro = productService.findProductInfoById(param) ;
		return SUCCESS ;
	}
	
	public String insertProduct() throws Exception{
		productService.insertProduct(product);
		return SUCCESS ;
	}
	
	public String updateProduct() throws Exception{
		productService.updateProduct(product);
		
		return SUCCESS ;
	}
	
	public String deleteProductById() throws Exception{
		productService.deleteProductById(product) ;
		
		return SUCCESS ;
	}


	@Override
	public Product getModel() {
		return product;
	}

	public Product getPro() {
		return pro;
	}


	public void setPro(Product pro) {
		this.pro = pro;
	}


	public List<Product> getProList() {
		return proList;
	}


	public void setProList(List<Product> proList) {
		this.proList = proList;
	}
}
