<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="VSjsp" />
<title></title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/jquery.min.js"></script>
<script type="text/javascript" src="images/global.js"></script>
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
      <li class="cur"><a href="">公司动态</a></li>
      <li class="cur"><a href="">行业新闻</a></li>
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
   
    <dl class="last">
    <div class="numDate"> <em>100</em>
     <p>06-26</p>
    </div>
    <dt><a href="article.html">移动互联网产品设计的核心要素有哪些？</a></dt>
    <dd>
     <p class="img"><img src="" height="42"></p>
   
     <p class="desc">移动互联网和传统互联网的设计有很多不同移动互联网和传统互联网的设计有很多不同，针对前者有哪些关键的设计重点、考虑要素、交互或体验要特别注意的呢？本文来自知乎网友可风的回答。可风最近越来越...</p>
    </dd>
    </dl>
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