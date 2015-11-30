package com.tmwrk.voosky.web.action.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Article;
import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class ArticleAction extends BaseAction implements ModelDriven<Article>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8719721229661318663L;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	Article art = new Article() ;
	
	private Article article ;
	
	private List<Article> artList ;
	
	@Override
	public String execute() throws Exception{
		artList = articleService.findAllArticlesInfo(null) ;
		return SUCCESS ;
	}
	
	
	public String findArticleInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", art.getId()) ;
		article = articleService.findArticleInfoById(param) ;
		return SUCCESS ;
	}
	
	public String insertArticle() throws Exception{
		articleService.insertArticle(art);
		return SUCCESS ;
	}
	
	public String updateArticle() throws Exception{
		articleService.updateArticle(art);
		
		return SUCCESS ;
	}
	
	public String deleteArticleById() throws Exception{
		articleService.deleteArticleById(art) ;
		
		return SUCCESS ;
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

}
