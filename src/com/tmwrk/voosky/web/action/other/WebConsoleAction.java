package com.tmwrk.voosky.web.action.other;

import java.util.HashMap;
import java.util.List;

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
 *  登陆首页面展示
 *  
 * @author wfluo
 *
 */
public class WebConsoleAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -825649305868239942L;
	
	@Autowired
	private SinglePageServiceMgr singlePageService ;
	
	@Autowired
	private ProductServiceMgr productService ;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	@Autowired
	private ConfigServiceMgr configService ;
	
	private ConsoleMrg console = new ConsoleMrg() ;
	
	@Override
	public String execute() throws Exception{
		List<SinglePage> spList = singlePageService.getAllSinglePage() ;
		
		List<Product> proList = productService.findAllProductsInfo(null) ;
		
		List<Article> artList = articleService.findAllArticlesInfo(null) ;
		
		List<Config> confList = configService.listSysConfigByName(null) ;
		
		HashMap<String,String> mapSysConf = new HashMap<String, String>() ;
		for(Config c : confList){
			mapSysConf.put(c.getName(), c.getValue()) ;
		}
		console.setSysconfMap(mapSysConf);
		
		console.setSpList(spList);
		console.setSpNum(spList.size());
		
		console.setArtNum(artList.size());
		console.setProductNum(proList.size());
		
		console.setUser(getSessionUser());
		
		console.setSecurityStatus("error");
		
		return SUCCESS ;
	}

	public ConsoleMrg getConsole() {
		return console;
	}

	public void setConsole(ConsoleMrg console) {
		this.console = console;
	}
	
}
