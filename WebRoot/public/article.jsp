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
<meta name="keywords" content="<s:property value="article.keywords"/>" />
<meta name="description" content="<s:property value="article.desc"/>" />
<title></title>
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
		<s:iterator value="article.cateList" var="ctgry">
			<li class="cur"><s:property value="#ctgry.guideAliases"/> <a href="${ctx }<s:property value='#ctgry.desc'/>?navId=<s:property value='#ctgry.navId'/>"><s:property value="#ctgry.cateName"/></a></li>
		</s:iterator>
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
   <div id="article">
    <h1><s:property value="article.title"/></h1>
    <div class="info">发布时间：<s:property value="article.addTime"/> 点击数：<s:property value="article.clickNum"/> 
   
    </div>
    <div class="content">
    	<s:property value="article.content" escape="false"/>
    	
    <div class="lift"><span>下一篇：<a href="">新手如何选购虚拟主机</a></span> </div>
   </div>
  </div>
  <div class="clear"></div>
 </div>
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>
 
  </div>
</body>
</html>