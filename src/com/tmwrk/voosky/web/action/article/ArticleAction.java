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
import com.tmwrk.voosky.module.util.PageBean;
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
	
	//2016-11-19 记录标识，上一篇，下一篇
	private String record ;
	private Article articleLast ;
	private Article articleNext ;
	
	private PageBean page ;
	// 项目案例导航ID
	private String caseNavId = "20" ;
	
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
		
		// 特注  ： 专为博恒处理
		param.put("notNavId", caseNavId) ;
		
		int pageSize = 10; 
		
		String pageId = request.getParameter("pageId"); 
		if (pageId == null || pageId.equals("")) { 
			pageId = "1"; 
		}
		int currentPage = Integer.parseInt(pageId); 
		
		//从服务层里得到用户的总记录数 
		int totalRows = articleService.getAllArticlesCount(param) ;
		// 处理分页
		
		page = new PageBean(pageSize, currentPage, totalRows); 
		
		param.put("startNum", page.getStartNum()) ;
		param.put("pageSize", page.getPageSize()) ;
		
		
		
		artList = articleService.findAllArticlesInfo(param) ;
		
		navBean = navService.getAllNavByParentId("getNewsInfo") ;//获取导航
		ctgryList = getArticleCategory() ;
		
		return SUCCESS ;
	}
	
	
	public String findArticleInfoById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", art.getId()) ;
		//处理上一条,下一条记录
		if (record != null) {
			param.put("record", record);
		}
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
	
	/**
	 * 单为bohen做的修改 
	 * @return
	 * @throws Exception
	 */
	public String findNewsInfoById() throws Exception{
//		Map<String, Object> param = new HashMap<String, Object>() ;
//		param.put("id", art.getId()) ;
//		
//		article = articleService.findArticleInfoById(param) ;
		
		
		Map<String, Object> param = new HashMap<String, Object>() ;
		if(art.getIsRecommend()!=null){
			param.put("isRecommend", art.getIsRecommend()) ;
		}
		param.put("notNavId", caseNavId) ;//特注：去除业务项目相关的数据条目
		
		artList = articleService.findAllArticlesInfo(param) ;
		setSingleArticleAtrr(art.getId());
		
		//文章左侧导航
		List<Category> cateList = getArticleCategory() ;
		article.setCateList(cateList);
		
//		for(Category c : cateList){
//			if(article.getNavId().equals(c.getNavId()+"")){
//				List<Category> cateTmpList = new ArrayList<Category>() ;
//				cateTmpList.add(c) ;
//				article.setCateList(cateTmpList);
//				break ;
//			}
//		}
		
		//查看时，修改点击次数
		article.setClickNum(article.getClickNum()+1);
		articleService.updateClickNumber(article);
		
		return SUCCESS ;
	}
	
	private void setSingleArticleAtrr(int artId){
		Article cur = null ;
		int artlen = artList.size() ;
		for(int i=artlen-1;i<=artlen;i--){
			cur = (Article)artList.get(i) ;
			if(cur.getId() == artId){
				article = cur ;
				artList.remove(i) ;
				
				if(i==0){
					if(i<artlen){
						articleLast = (Article)artList.get(i) ;
					}else{
						articleLast = null ;
					}
					articleNext = null ;
				}else if(i>=1){
					articleNext = (Article)artList.get(i-1) ;
					if(i<artlen-2){
						
						articleLast = (Article)artList.get(i+1) ;
					}else if(i==artlen-2){
						articleLast = (Article)artList.get(i) ;
					}else{
						articleLast = null ;
					}
				}
				break ;
			}else{
				cur = null ;
			}
		}
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
		art.setAuthor(getSessionUser().getUserName());
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


	public String getRecord() {
		return record;
	}


	public void setRecord(String record) {
		this.record = record;
	}


	public Article getArticleLast() {
		return articleLast;
	}


	public void setArticleLast(Article articleLast) {
		this.articleLast = articleLast;
	}


	public Article getArticleNext() {
		return articleNext;
	}


	public void setArticleNext(Article articleNext) {
		this.articleNext = articleNext;
	}


	public PageBean getPage() {
		return page;
	}


	public void setPage(PageBean page) {
		this.page = page;
	}

}
