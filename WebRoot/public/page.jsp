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
<meta name="keywords" content="<s:property value="sp.keywords"/>" />
<meta name="description" content="<s:property value="sp.desc"/>" />
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
    <s:iterator value="navBean.navList" var="nav">
    	<s:if test="#nav.moduleUrl.contains(navBean.curStatus)">
    		<li class="cur"><a href="${ctx }<s:property value='#nav.moduleUrl'/>"><s:property value="#nav.navName"/></a></li>
    	</s:if>
    	<s:else>
    		<li ><a href="${ctx }<s:property value='#nav.moduleUrl'/>"><s:property value="#nav.navName"/></a></li>
    	</s:else>
    	
    </s:iterator>
    <!-- 
    <li class="cur"><a href="">公司简介</a></li>
    <li><a href="">企业荣誉</a></li>
    <li><a href="">发展历程</a></li>
    <li><a href="">联系我们</a></li>
     -->
    </ul>
    </div>
  </div>
  <div id="pageIn">
    <div class="urHere">当前位置：<a href="#">首页</a><b>></b><s:property value="sp.pageName"/></div>
   <div id="page">
    <h1><s:property value="sp.pageName"/></h1>
    <div class="content">
    	<s:property value="sp.content" escape="false"/>
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