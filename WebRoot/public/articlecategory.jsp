<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../admin/inc/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<title>文章中心</title>
<link href="${ctx}/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/global.js"></script>
</head>
<body>
<div id="wrapper"> 
  	<!-- 头部 -->
    <%@ include file="./inc/pheader.jsp" %>

 <div class="wrap mb">
  <div id="pageLeft"> 
  
    <div class="treeBox">
     <h3>文章分类</h3>
     <ul>
     <s:iterator value="ctgryList" var="ctgry">
     	<li class="cur"><a href="${ctx }/web/getArticlesInfo.htm?cateId=<s:property value="#ctgry.cateId"/>"><s:property value="#ctgry.cateName"/></a></li>
     </s:iterator>
      <!-- <li class="cur"><a href="">公司动态</a></li>
      <li class="cur"><a href="">行业新闻</a></li> -->
     </ul>
     <ul class="searchBox">
      <form name="search" id="search" method="get" action="">
       <input type="hidden" name="module" value="article">
       <label for="keyword"></label>
       <input name="s" type="text" class="keyword" title="}" autocomplete="off" maxlength="128" value="" onclick="">
       <input type="submit" class="btnSearch" value="">
      </form>
     </ul>
    </div>

  </div>
  <div id="pageIn"> <div class="urHere">当前位置：<a href="#">首页</a><b>></b>企业简介</div>
   <div id="articleList"> 
   
   <s:iterator value="artList" var="art">
    <dl class="last">
    <div class="numDate"> <em>100</em>
     <p><s:property value="#art.addTime"/></p>
    </div>
    <dt><a href="${ctx }/web/getArticleInfoById.htm?id=<s:property value="#art.id"/>"><s:property value="#art.title"/></a></dt>
    <dd>
     <p class="img"><img src="" height="42"></p>
   
     <p class="desc"><s:property value="#art.content" escape="false"/></p>
    </dd>
    </dl>
    </s:iterator>
    
<div class="pager">总计 15 个记录，共 2 页 当前第 1 页 | <a href="">第一页</a><a href="">上一页</a><a href="">下一页</a><a href="">最后一页</a></div>
   </div>
   
   </div>
  <div class="clear"></div>
 </div>
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>
 </div>
</body>
</html>