<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<script type="text/javascript">
$(function(){
	$("li").click(function() {
		$(this).addClass('cur').siblings('li').removeClass('cur');
	});
})
</script>
<body>
<div id="vsLeft">
   <div id="menu">
     <ul class="top">
      <li class="vs-home"><a href="${ctx}/account/listConsoleManager.htm"><i class="home"></i><em>管理首页</em></a></li>
     </ul>
     <ul>
      <li class="vs-system"><a href="${ctx}/sysconfig/listSysConfigByTye.htm"><i class="system"></i><em>系统设置</em></a></li>
      <li class="vs-nav"><a href="${ctx}/nav/listNavsInfo.htm?navType=middle"><i class="nav"></i><em>自定义导航</em></a></li>
      <li class="vs-show"><a href="${ctx}/slide/listAllSlides.htm"><i class="show"></i><em>幻灯片管理</em></a></li>
      <li class="vs-spage"><a href="${ctx}/singlepage/listAllSPInfo.htm"><i class="page"></i><em>单页面管理</em></a></li>
     </ul>
     <ul>
        <li class="vs-pcate"><a href="${ctx}/category/listCategorysInfo.htm?cateStatus=product"><i class="productCat"></i><em>商品分类</em></a></li>
     
        <li class="vs-product"><a href="${ctx}/product/listProductsInfo.htm"><i class="product"></i><em>商品列表</em></a></li>
     
     </ul>
  
     <ul>
        <li class="vs-acate"><a href="${ctx}/category/listCategorysInfo.htm?cateStatus=article"><i class="articleCat"></i><em>文章分类</em></a></li>
        <li class="vs-article"><a href="${ctx}/article/listArticlesInfo.htm"><i class="article"></i><em>文章列表</em></a></li>
     </ul>
 
     <ul>
        <li class="vs-manager"><a href="${ctx}/account/listUserInfo.htm"><i class="manager"></i><em>网站管理员</em></a></li>
   
     </ul>
     <ul class="bot">
      <li class="vs-backup"><a href="${ctx}/backup/listBksInfo.htm"><i class="backup"></i><em>数据库备份</em></a></li>
      <%-- <li class="vs-mobile"><a href="${ctx}/admin/mobile.jsp"><i class="mobile"></i><em>手机版</em></a></li> --%>
      <%-- <li class="vs-theme"><a href="${ctx}/admin/theme.jsp"><i class="theme"></i><em>设置模板</em></a></li> --%>
      <li class="vs-manlog"><a href="#"><i class="managerLog"></i><em>操作记录</em></a></li>
     </ul>
  </div>
  </div>
  </body>