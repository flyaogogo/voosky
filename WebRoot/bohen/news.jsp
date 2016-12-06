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
		<title>搏恒建设公司网站 |搏恒建设</title>
		<meta name="renderer" content="webkit">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="voosky1.0" data-variable="" />
		<meta name="description" content="模板建站和纯手工建站的区别在于：模板是“成衣”，你只需要去服装店挑选，而所谓的纯手工建站是裁缝师傅给你定制。功能和稳定性模板+成熟的CMS管理后台大大优于“裁缝店”。" />
		<meta name="keywords" content="搏恒建设公司网站模板|搏恒建设企业网站模板" />
		<link href="${ctx}/bohen/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="${ctx}/bohen/css/boheng.css">
		<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.css">
		
		
		<!--[if lt IE 10]>
<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.min.css">
<script src="${ctx}/bohen/js/media.match.min.js"></script>
<script src="${ctx}/bohen/js/respond.min.js"></script>
<script src="${ctx}/bohen/js/classList.min.js"></script> 

<![endif]-->
	<%-- <script src="${ctx}/bohen/js/13b4293ffe964f00.js"></script> --%>
	
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
						<h1>新闻资讯</h1>
					</div>
					
				</div>
			</div>
		</div>
	</div>



<section class="met-news animsition">
	<div class="container">
		<div class="row">
			<div class="col-md-9 met-news-body">
				<div class="row">
					<div class="met-news-list">

<ul class="met-page-ajax">

<s:iterator value="artList" var="art">
<%-- 
<s:if test="#art.navId!='20'">
</s:if>
 --%>
	<li>
		<h4>
			<a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>" title="<s:property value="#art.title"/>" target='_self'>
				<s:property value="#art.title"/>
			</a>
		</h4>
		<p class="des"><s:property value="#art.desc"/></p>
		<p class="info">
			<span><s:property value="#art.addTime"/></span>
			<span class="margin-left-10"><s:property value="#art.author"/></span>
			<span class="margin-left-10"><i class="icon fa fa-eye margin-right-5" aria-hidden="true"></i><s:property value="#art.clickNum"/></span>
		</p>
	</li>

</s:iterator>

</ul>

<div class="hidden-xs">
		    <div class='met_pager'>
			    <s:if test="page.hasPreviousPage==true">
			    	<a href="${ctx }/bohen/getNewsInfo.htm?pageId=<s:property value="page.previousPage"/>" class="PreSpan">上一页</a>
			    	<a href="${ctx }/bohen/getNewsInfo.htm?pageId=<s:property value="page.previousPage"/>"><s:property value="page.previousPage"/></a>
			    </s:if>
			    <a href="javascript:void(0);" class="Ahover"><s:property value="page.currentPage"/></a>
			    <s:if test="page.hasNextPage==true">
				    <a href="${ctx }/bohen/getNewsInfo.htm?pageId=<s:property value="page.nextPage"/>"><s:property value="page.nextPage"/></a>
			    	<a href="${ctx }/bohen/getNewsInfo.htm?pageId=<s:property value="page.nextPage"/>" class="NextA">下一页</a>
			    </s:if>
			    
			    <span class='PageText'>转至第</span>
			    <input type='text' id='metPageT' data-pageurl='' value='1' />
			    <input type='button' id='metPageB' value='页' />
			    
			    <%-- 
				<span class='PreSpan'>上一页</span><a href=../ class='Ahover'>1</a><a href= >2</a><a href="" class='NextA'>下一页</a>
			    <span class='PageText'>转至第</span>
			    <input type='text' id='metPageT' data-pageurl='' value='1' />
			    <input type='button' id='metPageB' value='页' />
			     --%>
		    </div>
		</div>
<div class="met-page-ajax-body visible-xs-block">
	<button type="button" class="btn btn-default btn-block btn-squared ladda-button" id="met-page-btn" data-style="slide-left" data-url="?lang=cn&class1=4&class2=0&class3=0&mbpagelist=1" data-page="1"><i class="icon wb-chevron-down margin-right-5" aria-hidden="true"></i>更多文章</button>
</div>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="row">

					<div class="met-news-bar">



						<div class="recommend news-list-md">
							<h3>为您推荐</h3>
							<ul class="list-group list-group-bordered">
								<s:iterator value="artList" var="art" status = "status">
									<s:if test="#art.navId!='20' ">
									<li class="list-group-item"><a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>" title="<s:property value="#art.title"/>" target='_self'><s:property value="#art.title"/></a></li>
									</s:if>
								</s:iterator>
								<!-- <li class="list-group-item"><a href="" title="中建土木公司规范用工成“香饽饽”" target='_self'>中建土木公司规范用工成“香饽饽”</a></li>

								<li class="list-group-item"><a href="../" title="卡维中学项目保修期即将结束" target='_self'>卡维中学项目保修期即将结束</a></li>

								<li class="list-group-item"><a href="../" title="董事长访问墨西哥" target='_self'>董事长访问墨西哥</a></li>

								<li class="list-group-item"><a href="" title="公司再次入选ENR排名榜" target='_self'>公司再次入选ENR排名榜</a></li>

								<li class="list-group-item"><a href="" title="公司党委举办组工干部培训班" target='_self'>公司党委举办组工干部培训班</a></li> -->

							</ul>
						</div>

                        <ul class="column">
                            <li><a href="${ctx }/bohen/getNewsInfo.htm" title="所有文章" target='_self'>所有文章</a></li>
							<s:iterator value="ctgryList" var="ctgry">
								<li><a href="${ctx }/bohen/getNewsInfo.htm?cateId=<s:property value="#ctgry.navId"/>"  title="<s:property value="#ctgry.cateName"/>"><s:property value="#ctgry.cateName"/></a></li>
							</s:iterator>
							<!-- 
                            <li><a href=""  title="公司新闻">公司新闻</a></li>
                            <li><a href=""  title="媒体报道">媒体报道</a></li> -->


                        </ul>

					</div>

				</div>
			</div>
		</div>
	</div>
</section>

			<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>




</div>



<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>
</body>
</html>