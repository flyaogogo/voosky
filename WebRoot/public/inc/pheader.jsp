<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
 	<div id="top">
     <div class="wrap">
      <ul class="topNav">
       <li><a href="" target="_blank">手机</a><s></s></li>
       <li><a href="javascript:AddFavorite('', '')">收藏</a></li>
      </ul>
     </div>
    </div>
    
    <div id="header">
	     <div class="wrap clearfix">
	      <ul class="logo">
	       <a href=""><img src="${ctx }/public/images/logo.gif" alt="" title="" /></a>
	      </ul>
	      <ul class="searchBox">
	       <form name="search" id="search" method="get" action="">
	        <label for="keyword">产品搜索</label>
	        <input name="s" type="text" class="keyword" title="" autocomplete="off" maxlength="128" value="" onclick="">
	        <input type="submit" class="btnSearch" value="">
	       </form>
	      </ul>
	     </div>
		<!-- 导航栏 -->
	    <div id="mainNav">
	     <ul class="wrap" id="public-header-nav-ul-id">
	     <%-- 
	      <li class="cur"><a href="${ctx }/index.htm" class="first">首页</a></li>
	      <li class="cur hover"><a href="page.html" target="_blank">公司简介</a> </li>
	      <li class="cur hover"><a href="${ctx }/web/getProductsInfo.htm" target="_blank">产品中心</a> </li>
	      <li class="cur hover"><a href="${ctx }/web/getArticlesInfo.htm" target="_blank">文章中心</a> </li>
	      <li class="cur hover"><a href="page.html" target="_blank">营销网络</a> </li>
	      <li class="cur hover"><a href="page.html" target="_blank">企业荣誉</a> </li>
	      <li class="cur hover"><a href="page.html" target="_blank">人才招聘</a> </li>
	      <li class="cur hover"><a href="page.html" class="last" target="_blank">联系我们</a> </li>
	       --%>
	      <div class="clear"></div>
	     </ul>
	    </div>
  </div>
</body>
