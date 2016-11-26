<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../admin/inc/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html class='nicescroll'>
<head>
		<title><s:property value="sp.pageName"/></title>
		<meta name="renderer" content="webkit">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="voosky1.0" data-variable="" />
		<meta name="description" content="<s:property value="sp.desc"/>" />
		<meta name="keywords" content="<s:property value="sp.keywords"/>" />
		<link href="${ctx}/bohen/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="${ctx}/bohen/css/boheng.css">
		<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.css">
		
		
		<!--[if lt IE 10]>
<link rel="stylesheet" href="fontawesome/font-awesome-4.6.3/css/font-awesome.min.css">
<script src="${ctx}/bohen/js/media.match.min.js"></script>
<script src="${ctx}/bohen/js/respond.min.js"></script>
<script src="${ctx}/bohen/js/classList.min.js"></script> 

<![endif]-->
<%-- <script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/revolution.extension.parallax.min.js"></script> --%>
<script type="text/javascript" src="${ctx}/bohen/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/global.js"></script>
	</head>




<body class="met-navfixed">
<!--[if lte IE 8]>
	<div class="text-center padding-top-50 padding-bottom-50 bg-blue-grey-100">
	<p class="browserupgrade font-size-18">你正在使用一个<strong>过时</strong>的浏览器。请<a href="http://browsehappy.com/" target="_blank">升级您的浏览器</a>，以提高您的体验。</p>
	</div>
<![endif]-->
				<!-- 手机头部 -->
    <%@ include file="./inc/mheader.jsp" %>

<div id="page">

		<!-- 头部 -->
    <%@ include file="./inc/bheader.jsp" %>



	<div class="met-banner-econy"  style="background-color:;" >
	<img src="upload/1456471567.jpg">
	  <div class="econynr">
		<div class="container">
			<div class="row">
					<div class="title col-sm-6 pull-left">
						<h1>关于我们</h1>
					</div>
					<!-- <div class="breadcumb col-sm-6 pull-right">
						<i class="fa fa-home"></i> <a href="" title="首页">首页</a> &gt; <a href= >关于我们</a>
					</div> -->
				</div>
			</div>
		</div>
	</div>



		<div class="met-column-nav  ">
			<div class="container">
				<div class="row">

					<div class="col-md-12 sidebar_tile">
						<div class="row">
							<ul class="met-column-nav-ul">
	
							<%-- <li><a href="${ctx }/bohen/getSPInfoByName.htm?uniqueName=about" class="link"  title="关于我们">关于我们</a></li>
							 --%>
							<s:iterator value="navBean.navList" var="nav">
								<s:if test="#nav.moduleUrl.contains(navBean.curStatus)">
						    		<li class="dropdown cur"><a href="${ctx }<s:property value='#nav.moduleUrl'/>"><s:property value="#nav.navName"/></a></li>
						    	</s:if>
						    	<s:else>
						    		<li ><a href="${ctx }<s:property value='#nav.moduleUrl'/>" class="link "><s:property value="#nav.navName"/></a></li>
						    	</s:else>
							</s:iterator>
					<!-- 
						<li class="dropdown">
	
							<a href="" title="公司简介" class="link ">公司简介</a>
	
						</li>
					
					<li class="dropdown">

						<a href="" title="经营区域" class="link ">经营区域</a>

					</li>

					<li class="dropdown">

						<a href="" title="企业荣誉" class="link ">企业荣誉</a>

					</li>

					<li class="dropdown">

						<a href="" title="联系我们" class="link ">联系我们</a>

					</li> -->

						</ul>
						</div>
					</div>

	
				</div>
			</div>
		</div>

<section class="met-show animsition">
	<div class="container">
		<div class="row">
		<h1><s:property value="sp.pageName"/></h1>
			<div class="met-editor lazyload clearfix">
				<div><s:property value="sp.content" escape="false"/></div>
			</div>
		</div>
	</div>
</section>

			<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>
<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>

</body>
</html>