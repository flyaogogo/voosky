package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Article;

@Repository("articleDao")
public class ArticleDaoImpl extends BaseDao<Article>{

	@Override
	public Article add(Article params) {
		getSqlMapClientTemplate().insert("article.addArticle", params) ;
		return null;
	}

	@Override
	public Article update(Article params) {
		getSqlMapClientTemplate().update("article.updateById", params) ;
		return null;
	}

	public Article updateShowFirstPageById(Article params) {
		getSqlMapClientTemplate().update("article.updateShowFirstPageById", params) ;
		return null;
	}
	
	@Override
	public Article findById(Map<String, Object> params) {
		Article p = (Article)getSqlMapClientTemplate().queryForObject("article.getArticleById", params) ;
		return p ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAll(Map<String, Object> params) {
		List<Article> prList = (List<Article>)getSqlMapClientTemplate().queryForList("article.getAllArticles", params) ;
		return prList;
	}
	
	public boolean deleteArticleById(Article p){
		getSqlMapClientTemplate().delete("article.deleteById", p) ;
		return true ;
	}
}
