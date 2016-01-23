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
    <h3>关于我们</h3>
    <ul>
    <li class="cur"><a href="">公司简介</a></li>
    <li><a href="">企业荣誉</a></li>
    <li><a href="">发展历程</a></li>
    <li><a href="">联系我们</a></li>
    </ul>
    </div>
  </div>
  <div id="pageIn">
    <div class="urHere">当前位置：<a href="#">首页</a><b>></b>企业简介</div>
   <div id="page">
    <h1>企业简介</h1>
    <div class="content">公司简介jsp 是一款轻量级企业网站管理系统，基于jsp+Mysql架构的，可运行在Linux、Windows、MacOSX、Solaris等各种平台上，系统搭载Smarty模板引擎，支持自定义伪静态，前台模板采用DIV+CSS设计，后台界面设计简洁明了，功能简单易具有良好的用户体验，稳定性好、扩展性及安全性强，可面向中小型站点提供网站建设解决方案。</div>
   </div>
  </div>
  <div class="clear"></div>
 </div>
 
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>
 
 
  </div>
</body>
</html>