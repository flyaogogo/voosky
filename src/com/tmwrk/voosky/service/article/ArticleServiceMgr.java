package com.tmwrk.voosky.service.article;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.ArticleDaoImpl;
import com.tmwrk.voosky.database.vo.Article;

@Service("articleService")
@Transactional
public class ArticleServiceMgr {

	@Autowired
	@Qualifier("articleDao")
	private ArticleDaoImpl articleDao ;
	
	
	public List<Article> findAllArticlesInfo(Map<String, Object> param){
		List<Article> prList = articleDao.findAll(param) ;
		return prList ;
	}
	
	public Article findArticleInfoById(Map<String, Object> param){
		Article p = articleDao.findById(param) ;
		
		return p ;
	}
	
	public void insertArticle(Article p){
		articleDao.add(p) ;
	}
	
	public void updateArticle(Article p){
		
		articleDao.update(p) ;
	}
	
	public void updateClickNumber(Article p){
		articleDao.updateClickNumber(p) ;
	}
	
	public boolean deleteArticleById(Article p){
		return articleDao.deleteArticleById(p) ;
	}
	
	/**
	 * 更新是否在首页显示
	 * @param params
	 */
	public void updateShowFirstPageById(Article params) {
		articleDao.updateShowFirstPageById(params) ;
	}
}
