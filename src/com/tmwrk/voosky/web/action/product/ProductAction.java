package com.tmwrk.voosky.web.action.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.database.vo.NavBean;
import com.tmwrk.voosky.database.vo.Product;
import com.tmwrk.voosky.database.vo.UploadFileBase;
import com.tmwrk.voosky.module.util.CalcUtil;
import com.tmwrk.voosky.module.util.DateUtil;
import com.tmwrk.voosky.service.category.CategoryServiceMgr;
import com.tmwrk.voosky.service.nav.NavServiceMgr;
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
	
	private static final Log log = LogFactory.getLog(ProductAction.class) ;
	
	@Autowired
	private ProductServiceMgr productService ;
	
	@Autowired
	private CategoryServiceMgr categoryService ;
	
	@Autowired
	private NavServiceMgr navService ;
	
	Product product = new Product() ;
	
	private Product pro ;
	
	private List<Product> proList ;
	
	private List<Category> ctgryList ;
	
	private NavBean navBean ;
	//关键字查询
	private String filterkeywords ;
	
	//2016-11-19 记录标识，上一篇，下一篇
	private String record ;

	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		if(filterkeywords!=null&&!"".equals(filterkeywords.trim())){
			param.put("filterkey", product.getTitle()) ;
		}
		if(product.getIsRecommend()!=null){
			param.put("isRecommend", product.getIsRecommend()) ;
		}
		if(product.getCateId()!=null&& !"all".equals(product.getCateId())){
			param.put("cateId", CalcUtil.dealParentId(product.getCateId())[0]) ;
//			param.put("cateId", product.getCateId()) ;
		}
		proList = productService.findAllProductsInfo(param) ;
		
		navBean = navService.getAllNavByParentId("getProductsInfo") ;
		ctgryList = getProductCategory() ;
		
		return SUCCESS ;
	}
	
	/**
	 * 通过产品Id获取详细信息
	 * @return
	 * @throws Exception
	 */
	public String findProductInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", product.getId()) ;
		//处理上一条,下一条记录
		if(record!=null){
			param.put("record", record) ;
		}
		pro = productService.findProductInfoById(param) ;
		
		//商品左侧导航
		List<Category> cateList = getProductCategory() ;
		
		for(Category c : cateList){
			if(pro.getCateId().equals(c.getNavId()+"")){
				List<Category> cateTmpList = new ArrayList<Category>() ;
				cateTmpList.add(c) ;
				pro.setCateList(cateTmpList);
				break ;
			}
		}
		
		return SUCCESS ;
	}
	
	public String insertProduct() throws Exception{
		/**/
		UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(false, product, "product", request);
		if(uplFileBase==null){
			product.setThumbUrl("");
		}else{
			if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
				pro.setStatus(uplFileBase.getStatus());
				pro.setMessage(uplFileBase.getMessage());
				return ERROR ;
			}
			product.setThumbUrl(uplFileBase.getFileRealPath());
		}
		
		product.setCateId(CalcUtil.dealParentId(product.getCateId())[0]);
		
		product.setAddTime(DateUtil.converNowDate());
		String is = (product.getIsRecommend()==null)?"false":"true" ;
		product.setIsRecommend(is);
		product.setAuthor(getSessionUser().getUserName());
		productService.insertProduct(product);
		return SUCCESS ;
	}
	
	public String updateProduct() throws Exception{
		/**/
		if(product.getFileRealPath()==null||"".equals(product.getFileRealPath().trim())){
			UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(true, product, "product", request);
			if(uplFileBase==null){
				product.setThumbUrl("");
			}else{
				if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
					pro.setStatus(uplFileBase.getStatus());
					pro.setMessage(uplFileBase.getMessage());
					return ERROR ;
				}
				product.setThumbUrl(uplFileBase.getFileRealPath());
			}
		}else{
			product.setThumbUrl(product.getFileRealPath());
		}
		
		product.setCateId(CalcUtil.dealParentId(product.getCateId())[0]);
		
		String is = (product.getIsRecommend()==null)?"false":"true" ;
		product.setIsRecommend(is);
		productService.updateProduct(product);
		log.info("update product success !");
		return SUCCESS ;
	}
	
	public String updateShowFirstPageById() throws Exception{
		productService.updateShowFirstPageById(product);
		return SUCCESS ;
	}
	
	public String deleteProductById() throws Exception{
		productService.deleteProductById(product) ;
		
		return SUCCESS ;
	}

	/**
	 * 商品分类
	 * @return
	 */
	private List<Category> getProductCategory(){
		Map<String, Object> cateMap = new HashMap<String, Object>() ;
		cateMap.put("cateStatus", "product") ;
		List<Category> cateList = categoryService.listCatesUrlByStatus(cateMap) ;
		return cateList ;
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

	public List<Category> getCtgryList() {
		return ctgryList;
	}

	public void setCtgryList(List<Category> ctgryList) {
		this.ctgryList = ctgryList;
	}

	public String getFilterkeywords() {
		return filterkeywords;
	}

	public void setFilterkeywords(String filterkeywords) {
		this.filterkeywords = filterkeywords;
	}

	public NavBean getNavBean() {
		return navBean;
	}

	public void setNavBean(NavBean navBean) {
		this.navBean = navBean;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

}
