<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="./inc/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<title></title>
<link href="${ctx}/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/global.js"></script>
<script type="text/javascript" src="${ctx}/public/images/slide_show.js"></script>
</head>
<body>
<div id="wrapper">
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
       <a href=""><img src="images/logo.gif" alt="" title="" /></a>
      </ul>
      <ul class="searchBox">
       <form name="search" id="search" method="get" action="">
        <label for="keyword">产品搜索</label>
        <input name="s" type="text" class="keyword" title="" autocomplete="off" maxlength="128" value="" onclick="">
        <input type="submit" class="btnSearch" value="">
       </form>
      </ul>
     </div>

    <div id="mainNav">
     <ul class="wrap">
      <li class="cur"><a href="index.html" class="first">首页</a></li>
      <li class="cur hover"><a href="page.html" target="_blank">公司简介</a> </li>
      <li class="cur hover"><a href="product_category.html" target="_blank">产品中心</a> </li>
      <li class="cur hover"><a href="article_category.html" target="_blank">文章中心</a> </li>
      <li class="cur hover"><a href="page.html" target="_blank">营销网络</a> </li>
      <li class="cur hover"><a href="page.html" target="_blank">企业荣誉</a> </li>
      <li class="cur hover"><a href="page.html" target="_blank">人才招聘</a> </li>
      <li class="cur hover"><a href="page.html" class="last" target="_blank">联系我们</a> </li>
      <div class="clear"></div>
     </ul>
    </div>
  </div>
  
  
  
 <div id="index" class="wrap mb"> 
      <div class="slideShow">
       <ul class="slides">
        <li><img src="images/lnk.png" /></li>
       </ul>
      </div>
      <script type="text/javascript">
      {literal}
      $(document).ready(function(){
       $('.slides').bxSlider({
         mode: 'fade'
       });
      })
      {/literal}
      </script>
     
  <div id="indexLeft"> 

         <div class="incBox">
       <h3><a href="">产品展示</a></h3>
       <ul class="recommendProduct">
  
        <li>
        <p class="img"><a href=""><img src="pro_img/12_thumb.jpg" width="" height="" /></a></p>
        <p class="name"><a href="">Pampers帮宝适超薄干爽纸尿裤</a></p>
        <p class="price">￥118.00 元</p>
        </li>
        <li>
        <p class="img"><a href=""><img src="pro_img/13_thumb.jpg" width="" height="" /></a></p>
        <p class="name"><a href="">Pampers帮宝适超薄干爽纸尿裤</a></p>
        <p class="price">￥118.00 元</p>
        </li>
        <li>
        <p class="img"><a href=""><img src="pro_img/14_thumb.jpg" width="" height="" /></a></p>
        <p class="name"><a href="">Pampers帮宝适超薄干爽纸尿裤</a></p>
        <p class="price">￥118.00 元</p>
        </li><li>
        <p class="img"><a href=""><img src="pro_img/15_thumb.jpg" width="" height="" /></a></p>
        <p class="name"><a href="">Pampers帮宝适超薄干</a></p>
        <p class="price">￥118.00 元</p>
        </li>
        
       </ul>
      </div>
      <div class="incBox">
       <h3>公司简介</h3>
       <div class="about">
        <p><img src="images/img_company.jpg" /></p>
        <dl>
         <dt>Vsjava轻量级企业网站管理系统</dt>
         <dd>VsJava是一款轻量级企业网站管理系统，基于jsp+Mysql架构的，可运行在Linux、Windows、MacOSX、Solaris等各种平台上，系统搭载Smarty模板引擎，支持自定义伪静态，前台模板采用DIV+CSS设计，后台界面设计简洁明了，功能简单易具有良好的用户体验，稳定性好、扩展性及安全性强，可面向中小型站点提供网站建设解决方案。</dd>
        </dl>
        <div class="clear"></div>
        <a href="" class="aboutBtn">查看公司详细简介</a>
       </div>
      </div>
    </div>
  <div id="indexRight">
     <div class="incBox">
       <h3><a href="">新闻中心</a></h3>
       <ul class="recommendArticle">
       
        <li><b>06-26</b><a href="{$article.url}">移动互联网产品设计的核心要素有哪些？</a></li>
        <li><b>06-26</b><a href="{$article.url}">移动互联网产品设计的核心要素有哪些？</a></li>
        <li><b>06-26</b><a href="{$article.url}">移动互联网产品设计的核心要素有哪些？</a></li>
        <li><b>06-26</b><a href="{$article.url}">移动互联网产品设计的核心要素有哪些？</a></li>
        <li><b>06-26</b><a href="{$article.url}">移动互联网产品设计的核心要素有哪些？</a></li>
       
       </ul>
    </div>
    <div class="contact">
     <h3>联系我们</h3>
     <div class="box">
      <dl><dt class="address"></dt><dd>公司地址：北京市昌平区沙河镇</dd></dl>
      <dl><dt class="tel"></dt><dd>销售热线：0596-8888888</dd></dl>
      <dl><dt class="fax"></dt><dd>传真号码：0596-6666666</dd></dl>
      <dl><dt class="url"></dt><dd>公司网址：http://www.voosky.cn/</dd></dl>
      <dl><dt class="email"></dt><dd>电子邮箱：voosky@sina.com</dd></dl>
     </div>
    </div>
    
    
  </div>
  <div class="clear"></div>
 </div>
 
<div id="footer">
 <div class="wrap">
 <div class="link"> 
公司简介|营销网络|企业荣誉|人才招聘|联系我们|手机版
 </div>
</div>
 <div class="wrap">
  <div class="footNav"><a href="">© vsjsp轻量级企业网站管理系统 2015 All Rights Reserved. Powered by vs</a></div>
  
  </div>
</div>


 </div>
</body>
</html>