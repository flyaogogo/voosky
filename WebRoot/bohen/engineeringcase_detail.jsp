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
		<title><s:property value="pro.title"/></title>
		<meta name="renderer" content="webkit">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="voosky1.0" data-variable="" />
		<meta name="description" content="<s:property value="pro.desc"/>" />
		<meta name="keywords" content="<s:property value="pro.keywords"/>" />
		<link href="${ctx}/bohen/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="${ctx}/bohen/css/boheng.css">
		<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.css">
		
		
		<!--[if lt IE 10]>
<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.min.css">
<script src="${ctx}/bohen/js/media.match.min.js"></script>
<script src="${ctx}/bohen/js/respond.min.js"></script>
<script src="${ctx}/bohen/js/classList.min.js"></script> 

<![endif]-->
<%-- <script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.parallax.min.js"></script>
 --%>	
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
<div class="met-position  pattern-show">
	<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li>
					<a href="${ctx}/index.htm" title="首页">
						<i class="icon wb-home" aria-hidden="true"></i>首页
					</a>
				</li>
				<li class="dropdown">

						<a href="" 
							title="工程案例" 
							class="dropdown-toggle" 
							data-toggle="dropdown" 
							aria-expanded="false"
						>工程案例 <i class="caret"></i></a>
						<ul class="dropdown-menu bullet">
	
							<li><a href="${ctx}/bohen/getCaseductsInfo.htm"  title="全部">全部</a></li>
	
							<s:iterator value="pro.cateList" var="ctgry">
								<s:if test="#ctgry.guideAliases == null || #ctgry.guideAliases.trim() == ''">
									<li><a href="${ctx }/bohen/getCaseductsInfo.htm?cateId=<s:property value="#ctgry.navId"/>"  title="<s:property value="#ctgry.cateName"/>"><s:property value="#ctgry.cateName"/></a></li>
								</s:if>
							</s:iterator>
							<!-- 
							<li><a href="" title="铁路">铁路</a></li>

							<li><a href="" title="公路">公路</a></li>

							<li><a href="" title="桥梁">桥梁</a></li>

							<li><a href="" title="房建">房建</a></li>

							<li><a href="" title="铁路">铁路</a></li>
 -->
						</ul>

				</li>

				<!-- <li class="dropdown">

					<a href="" title="铁路">
						铁路
					</a>

				</li> -->


			</ol>
		</div>
	</div>
</div>

<div class="page met-showproduct pagetype1 animsition">

<div class="met-showproduct-head">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div id="gallery" class="ad-gallery" data-x="380" data-y="350"> 
					<div class="ad-image-wrapper"></div> 
					<div class="ad-controls"></div> 
					<div class="ad-nav"> 
						<div class="ad-thumbs"> 
							<ul class="ad-thumb-list" id="lightgallery"> 
								<li data-src="${ctx_img }/<s:property value="pro.thumbUrl"/>" data-exthumbimage="${ctx_img }/<s:property value="pro.thumbUrl"/>">
									<a href="${ctx_img }/<s:property value="pro.thumbUrl"/>"> 
										<img src="${ctx_img }/<s:property value="pro.thumbUrl"/>" width="64" height="64"  class="img-responsive" alt="<s:property value="pro.title"/>" />
									</a> 
								</li> 
<!-- 
								<li data-src="../upload/201311/1385370224.jpg" data-exthumbimage="upload/1385370224.jpg">
									<a href="upload/1385370224.jpg"> 
										<img src="upload/1385370224.jpg" width="64" height="64" class="img-responsive" alt="展示" />
									</a> 
								</li> 
 -->
							</ul> 
						</div> 
					</div> 
				</div>
			</div>
			<div class="visible-xs-block visible-sm-block height-20"></div>
			<div class="col-md-5 product-intro">
				<h1><s:property value="pro.title"/></h1>

				<p class="description"><s:property value="pro.desc"/></p>
	
				<div class="para">
					<div class="row">
						
						<div class="col-md-6 col-sm-6 col-xs-6 margin-bottom-15 blue-grey-500">
							项目名称 : <s:property value="pro.title"/>
						</div>
						
						<div class="col-md-6 col-sm-6 col-xs-6 margin-bottom-15 blue-grey-500">
							开工时间 : <s:property value="pro.addTime"/>
						</div>
	
					</div>
				</div>

				<div class="tools"></div>

			</div>
		</div>
	</div>
</div>

	<div class="met-showproduct-body">
		<div class="container">
			<div class="row no-space">
				<div class="col-md-9 product-content-body">
					<div class="row">

					<div class="panel product-detail">
						<div class="panel-body">
							<ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">
								<li class="active"><a data-toggle="tab" href="#product-details" data-get="product-details">详细信息</a></li>

							</ul>
							<div class="tab-content">
								<div class="tab-pane met-editor lazyload clearfix animation-fade active" id="product-details">
									<s:property value="pro.content" escape="false"/>
								</div>

							</div>
						</div>
					</div>

					</div>
				</div>

				<!--右侧开始-->
				<div class="col-md-3">
				<div class="row">
					<div class="panel product-hot">
						<div class="panel-body">
						<h4 class="example-title">热门推荐</h4>
							<div class="row">
								<s:iterator value="proList" var="prod" status = "status">
									<s:if test="#status.index<5">
									
										<div class="product-hot-list col-md-12 col-sm-4 col-xs-4 text-center margin-bottom-10">
											<a href="${ctx }/bohen/getCaseInfoById.htm?id=<s:property value="#prod.id"/>" target="_blank" class="img" title="<s:property value="#prod.title"/> ">
												<img data-original="${ctx_img }/<s:property value="#prod.thumbUrl"/>" class="img-responsive" style='height:250px' alt="<s:property value="#prod.title"/> ">
											</a>
											<a href="${ctx }/bohen/getCaseInfoById.htm?id=<s:property value="#prod.id"/>" class="txt"  title="<s:property value="#prod.title"/>" target='_blank'><s:property value="#prod.title"/></a>
										
										</div>
									
									
									</s:if>
								</s:iterator>
							</div>
						</div>
					</div>
				</div>
				</div>
				<!--右侧结束-->

			</div>
		</div>
	</div>
</div>

	<!--footer开始模块-->
					<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>

</div>


<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>

</body>
</html>