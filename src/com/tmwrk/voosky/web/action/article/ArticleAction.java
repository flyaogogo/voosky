package com.tmwrk.voosky.web.action.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Article;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.module.util.DateUtil;
import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.service.category.CategoryServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class ArticleAction extends BaseAction implements ModelDriven<Article>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8719721229661318663L;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	@Autowired
	private CategoryServiceMgr categoryService ;
	
	Article art = new Article() ;
	
	private Article article ;
	
	private List<Article> artList ;
	
	private List<Category> ctgryList ;
	
	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		if(art.getTitle()!=null){
			param.put("title", art.getTitle()) ;
		}
		if(art.getIsRecommend()!=null){
			param.put("isRecommend", art.getIsRecommend()) ;
		}
		if(art.getCateId()!=null&& !"all".equals(art.getCateId())){
			param.put("cateId", art.getCateId()) ;
		}
		
		artList = articleService.findAllArticlesInfo(param) ;
		
		ctgryList = getProductCategory() ;
		
		return SUCCESS ;
	}
	
	
	public String findArticleInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", art.getId()) ;
		article = articleService.findArticleInfoById(param) ;
		article.setCateList(getProductCategory());
		return SUCCESS ;
	}
	
	public String insertArticle() throws Exception{
		art.setAddTime(DateUtil.converNowDate());
		String is = (art.getIsRecommend()==null)?"false":"true" ;
		art.setIsRecommend(is);
		articleService.insertArticle(art);
		return SUCCESS ;
	}
	
	public String updateArticle() throws Exception{
		String is = (art.getIsRecommend()==null)?"false":"true" ;
		art.setIsRecommend(is);
		articleService.updateArticle(art);
		
		return SUCCESS ;
	}
	
	public String updateShowFirstPageById() throws Exception{
		articleService.updateShowFirstPageById(art);
		return SUCCESS ;
	}
	
	public String deleteArticleById() throws Exception{
		articleService.deleteArticleById(art) ;
		
		return SUCCESS ;
	}

	/**
	 * 商品分类
	 * @return
	 */
	private List<Category> getProductCategory(){
		Map<String, Object> cateMap = new HashMap<String, Object>() ;
		cateMap.put("cateStatus", "article") ;
		List<Category> cateList = categoryService.findCateByStatus(cateMap) ;
		return cateList ;
	}
	
	@Override
	public Article getModel() {
		return art;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public List<Article> getArtList() {
		return artList;
	}

	public void setArtList(List<Article> artList) {
		this.artList = artList;
	}

	public List<Category> getCtgryList() {
		return ctgryList;
	}

	public void setCtgryList(List<Category> ctgryList) {
		this.ctgryList = ctgryList;
	}

}
