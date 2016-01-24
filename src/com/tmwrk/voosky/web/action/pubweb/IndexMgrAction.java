package com.tmwrk.voosky.web.action.pubweb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.database.vo.Article;
import com.tmwrk.voosky.database.vo.Config;
import com.tmwrk.voosky.database.vo.ConsoleMrg;
import com.tmwrk.voosky.database.vo.Product;
import com.tmwrk.voosky.database.vo.SinglePage;
import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.service.other.ConfigServiceMgr;
import com.tmwrk.voosky.service.other.SinglePageServiceMgr;
import com.tmwrk.voosky.service.product.ProductServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

/**
 * 公开  首页  展示 页面
 * 
 * @author wfluo 
 *
 */
public class IndexMgrAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3130478758902128748L;
	
	
	@Autowired
	private SinglePageServiceMgr singlePageService ;
	
	@Autowired
	private ProductServiceMgr productService ;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	@Autowired
	private ConfigServiceMgr configService ;
	
	private ConsoleMrg index = new ConsoleMrg() ;
	
	@Override
	public String execute() throws Exception{
		List<SinglePage> spList = singlePageService.getAllSinglePage() ;
		
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("isRecommend", "true") ;//取出推荐显示在首页的数据
		List<Product> proList = productService.findAllProductsInfo(param) ;
		
		List<Article> artList = articleService.findAllArticlesInfo(param) ;
		
		List<Config> confList = configService.listSysConfigByName(null) ;
		
		HashMap<String,String> mapSysConf = new HashMap<String, String>() ;
		for(Config c : confList){
			mapSysConf.put(c.getName(), c.getValue()) ;
		}
		index.setSysconfMap(mapSysConf);
		
		index.setSpList(spList);
		
		index.setProList(proList);
		
		index.setArtList(artList);
		
//		index.setUser(getSessionUser());
//		
//		index.setSecurityStatus("error");
		
		return SUCCESS ;
	}

	
	public String findProductInfoById() throws Exception {
		
		return SUCCESS ;
	}
	
	public String findArticleInfoById() throws Exception {
		
		return SUCCESS ;
	}
	
	
	public ConsoleMrg getIndex() {
		return index;
	}

	public void setIndex(ConsoleMrg index) {
		this.index = index;
	}
	
}
