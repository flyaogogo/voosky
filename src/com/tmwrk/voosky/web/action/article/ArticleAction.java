package com.tmwrk.voosky.web.action.article;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class ArticleAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8719721229661318663L;
	
	@Autowired
	private ArticleServiceMgr articleService ;
	
	
	@Override
	public String execute() throws Exception{
		
		return SUCCESS ;
	}
	
	
	public String findArticleInfoById() throws Exception{
		
		return SUCCESS ;
	}
	
	public String insertArticle() throws Exception{
		
		return SUCCESS ;
	}
	
	public String updateArticle() throws Exception{
		
		
		return SUCCESS ;
	}
	
	public String deleteArticleById() throws Exception{
		
		
		return SUCCESS ;
	}

}
