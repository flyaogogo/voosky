package com.tmwrk.voosky.web.action.article;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Article;
import com.tmwrk.voosky.database.vo.Category;
import com.tmwrk.voosky.database.vo.NavBean;
import com.tmwrk.voosky.database.vo.UploadFileBase;
import com.tmwrk.voosky.module.util.CalcUtil;
import com.tmwrk.voosky.module.util.DateUtil;
import com.tmwrk.voosky.service.article.ArticleServiceMgr;
import com.tmwrk.voosky.service.category.CategoryServiceMgr;
import com.tmwrk.voosky.service.nav.NavServiceMgr;
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
	
	@Autowired
	private NavServiceMgr navService ;
	
	Article art = new Article() ;
	
	private Article article ;
	
	private List<Article> artList ;
	
	private List<Category> ctgryList ;
	
	private NavBean navBean ;
	
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
			param.put("cateId", CalcUtil.dealParentId(art.getCateId())[0]) ;
//			param.put("cateId", art.getCateId()) ;
		}
		
		artList = articleService.findAllArticlesInfo(param) ;
		
		navBean = navService.getAllNavByParentId("getArticlesInfo") ;
		ctgryList = getArticleCategory() ;
		
		return SUCCESS ;
	}
	
	
	public String findArticleInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", art.getId()) ;
		article = articleService.findArticleInfoById(param) ;
		
		//文章左侧导航
		List<Category> cateList = getArticleCategory() ;
		//article.setCateList(cateList);
		
		for(Category c : cateList){
			if(article.getCateId().equals(c.getNavId()+"")){
				List<Category> cateTmpList = new ArrayList<Category>() ;
				cateTmpList.add(c) ;
				article.setCateList(cateTmpList);
				break ;
			}
		}
		
		//查看时，修改点击次数
		article.setClickNum(article.getClickNum()+1);
		articleService.updateClickNumber(article);
		
		return SUCCESS ;
	}
	
	public String insertArticle() throws Exception{
		/**/
		UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(false, art, "article", request);
		if(uplFileBase==null){
			art.setThumbUrl("");
		}else{
			if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
				article.setStatus(uplFileBase.getStatus());
				article.setMessage(uplFileBase.getMessage());
				return ERROR ;
			}
			art.setThumbUrl(uplFileBase.getFileRealPath());
		}
		
		art.setCateId(CalcUtil.dealParentId(art.getCateId())[0]);
		
		art.setAddTime(DateUtil.converNowDate());
		String is = (art.getIsRecommend()==null)?"false":"true" ;
		art.setIsRecommend(is);
		articleService.insertArticle(art);
		return SUCCESS ;
	}
	
	public String updateArticle() throws Exception{
		if(art.getFileRealPath()==null||"".equals(art.getFileRealPath().trim())){
			UploadFileBase uplFileBase = CalcUtil.dealUploadInfo(true, art, "article", request);
			if(uplFileBase==null){
				art.setThumbUrl("");
			}else{
				if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
					article.setStatus(uplFileBase.getStatus());
					article.setMessage(uplFileBase.getMessage());
					return ERROR ;
				}
				art.setThumbUrl(uplFileBase.getFileRealPath());
			}
		}else{
			art.setThumbUrl(art.getFileRealPath());
		}
		
		art.setCateId(CalcUtil.dealParentId(art.getCateId())[0]);
		
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
	private List<Category> getArticleCategory(){
		Map<String, Object> cateMap = new HashMap<String, Object>() ;
		cateMap.put("cateStatus", "article") ;
		List<Category> cateList = categoryService.listCatesUrlByStatus(cateMap) ;
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


	public NavBean getNavBean() {
		return navBean;
	}


	public void setNavBean(NavBean navBean) {
		this.navBean = navBean;
	}

}
