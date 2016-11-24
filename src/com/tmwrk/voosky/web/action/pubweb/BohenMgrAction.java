package com.tmwrk.voosky.web.action.pubweb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.database.vo.Article;
import com.tmwrk.voosky.database.vo.Config;
import com.tmwrk.voosky.database.vo.ConsoleMrg;
import com.tmwrk.voosky.database.vo.Navigation;
import com.tmwrk.voosky.database.vo.Product;
import com.tmwrk.voosky.database.vo.SinglePage;
import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.service.nav.NavServiceMgr;
import com.tmwrk.voosky.service.other.ConfigServiceMgr;
import com.tmwrk.voosky.service.other.SinglePageServiceMgr;
import com.tmwrk.voosky.service.product.ProductServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

/**
 * 博恒建设公司界面数据显示
 * @author wfluo 2016-11-16
 *
 */
public class BohenMgrAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4711475048605669061L;

	@Autowired
	private SinglePageServiceMgr singlePageService ;
	
	@Autowired
	private ProductServiceMgr productService ;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	@Autowired
	private ConfigServiceMgr configService ;
	
	@Autowired
	private NavServiceMgr navService ;
	
	private ConsoleMrg index = new ConsoleMrg() ;
	
	private ConsoleMrg topFooterInfo ;
	
	@Override
	public String execute() throws Exception{
		List<SinglePage> spList = singlePageService.getAllSinglePage() ;
		
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("isRecommend", "true") ;//取出推荐显示在首页的数据
		List<Product> proList = productService.findAllProductsInfo(param) ;
		
		List<Article> artList = articleService.findAllArticlesInfo(param) ;
		
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("parentId", "5") ;
		List<Navigation> navList = navService.getNavsByParentId(params) ;
		index.setNavList(navList);
		
		index.setSpList(spList);
		
		index.setProList(proList);
		
		index.setArtList(artList);
		index.setSpAbout(getSinglePageAbout());
		
		return SUCCESS ;
	}
	
	/**
	 * 公共的处理
	 * 
	 * 针对头及底部信息的处理
	 * @return
	 * @throws Exception
	 */
	public String topAndFooterValue() throws Exception{
		topFooterInfo = new ConsoleMrg() ;
		
		List<Config> confList = configService.listSysConfigByName(null) ;
		
		HashMap<String,String> mapSysConf = new HashMap<String, String>() ;
		for(Config c : confList){
			mapSysConf.put(c.getName(), c.getValue()) ;
		}
		topFooterInfo.setSysconfMap(mapSysConf);
		
		topFooterInfo.setNavListMap(groupNav());
		
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("isRecommend", "true") ;//取出推荐显示在首页的数据
		List<Article> artList = articleService.findAllArticlesInfo(param) ;
		topFooterInfo.setArtList(artList);
		
		topFooterInfo.setSpAbout(getSinglePageAbout());//公司简介
		
		return SUCCESS ;
	}

	/**
	 * 通过Nav的父ID进行分组，存到map中
	 * @return
	 */
	private Map<String, List<Navigation>> groupNav(){
		Map<String, List<Navigation>> map = new HashMap<String, List<Navigation>>() ;
		List<Navigation> navList = navService.getAllNavigations(null) ;
		List<Navigation> navMapList = null ;
		for(Navigation nav : navList){
			String key = nav.getParentId() ;
			List<Navigation> value = map.get(key) ;
			if(value==null){
				navMapList = new ArrayList<Navigation>() ;
				navMapList.add(nav) ;
				map.put(key, navMapList) ;
			}else{
				value.add(nav) ;
			}
			
		}
		
		return map ;
	}
	/**
	 * 获取  about 页面
	 * @param spList
	 * @return
	 */
	private SinglePage getSinglePageAbout(){
		List<SinglePage> spList = singlePageService.getAllSinglePage() ;
		SinglePage spAbout = null ;
		for(SinglePage sp : spList){
			if(sp.getUniqueName().equals("summary")){
				spAbout = sp ;
				break ;
			}
		}
		return spAbout ;
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

	public ConsoleMrg getTopFooterInfo() {
		return topFooterInfo;
	}

	public void setTopFooterInfo(ConsoleMrg topFooterInfo) {
		this.topFooterInfo = topFooterInfo;
	}

}
