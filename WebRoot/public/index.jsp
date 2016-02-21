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
<script type="text/javascript" src="${ctx}/public/images/slide_show.js"></script>
</head>
<body>
<div id="wrapper">
	<!-- 头部 -->
    <%@ include file="./inc/pheader.jsp" %>
  
 <div id="index" class="wrap mb"> 
      <div class="slideShow">
       <ul class="slides">
        <li><img src="${ctx }/public/images/lnk.png" /></li>
       </ul>
      </div>
      <script type="text/javascript">
      </script>
     
  	<div id="indexLeft"> 

         <div class="incBox">
       <h3><a href="">产品展示</a></h3>
       <ul class="recommendProduct">
  		
  		<s:iterator value="index.proList" var="pro">
  			<li>
		        <p class="img"><a href="${ctx }/web/getProInfoById.htm?id=<s:property value="#pro.id"/>"><img src="${ctx }/<s:property value="#pro.thumbUrl"/>" width="135" height="135" /></a></p>
		        <p class="name"><a href="${ctx }/web/getProInfoById.htm?id=<s:property value="#pro.id"/>"><s:property value="#pro.title"/></a></p>
		        <p class="price">￥<s:property value="#pro.price"/>元</p>
	        </li>
  		</s:iterator>
  		<!-- 
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
        </li> -->
        
       </ul>
      </div>
      <div class="incBox">
       <h3>公司简介</h3>
       <div class="about">
        <p><img src="${ctx }/public/images/img_company.jpg" /></p>
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
       <s:iterator value="index.artList" var="art">
       		<li><b><s:property value="#art.addTime"/></b><a href="${ctx }/web/getArticleInfoById.htm?id=<s:property value="#art.id"/>"><s:property value="#art.title"/></a></li>
       </s:iterator>
       </ul>
    </div>
    <div class="contact">
     <h3>联系我们</h3>
     <div class="box">
      <dl><dt class="address"></dt><dd>公司地址：<s:property value="index.sysconfMap['main.site.address']"/></dd></dl>
      <dl><dt class="tel"></dt><dd>销售热线：<s:property value="index.sysconfMap['main.site.consumer.hotline']"/></dd></dl>
      <dl><dt class="fax"></dt><dd>传真号码：<s:property value="index.sysconfMap['main.site.fax']"/></dd></dl>
      <dl><dt class="url"></dt><dd>公司网址：<s:property value="index.sysconfMap['main.net.address']"/></dd></dl>
      <dl><dt class="email"></dt><dd>电子邮箱：<s:property value="index.sysconfMap['main.site.mail.address']"/></dd></dl>
     </div>
    </div>
    
  </div>
  
  <div class="clear"></div>
 </div>
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>


 </div>
</body>
</html>