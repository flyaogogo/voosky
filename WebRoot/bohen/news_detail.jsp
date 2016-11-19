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
		<title>博恒建设公司网站模板|博恒建设企业网站模板-博恒建设</title>
		<meta name="renderer" content="webkit">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="voosky1.0" data-variable="" />
		<meta name="description" content="模板建站和纯手工建站的区别在于：模板是“成衣”，你只需要去服装店挑选，而所谓的纯手工建站是裁缝师傅给你定制。功能和稳定性模板+成熟的CMS管理后台大大优于“裁缝店”。" />
		<meta name="keywords" content="博恒建设公司网站模板|博恒建设企业网站模板" />
		<link href="${ctx}/bohen/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" href="${ctx}/bohen/css/boheng.css">
		<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.css">
		
		
		<!--[if lt IE 10]>
<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.min.css">
<script src="${ctx}/bohen/js/media.match.min.js"></script>
<script src="${ctx}/bohen/js/respond.min.js"></script>
<script src="${ctx}/bohen/js/classList.min.js"></script> 

<![endif]-->
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.parallax.min.js"></script>
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


<section class="met-shownews animsition">
	<div class="container">
		<div class="row">
			<div class="col-md-9 met-shownews-body">
				<div class="row">
					<div class="met-shownews-header">
						<h1><s:property value="article.title"/></h1>
						<div class="info">
							<span>
								<s:property value="article.addTime"/>
							</span>
							<span>
								<s:property value="article.author"/>
							</span>
							<span>
								<i class="icon wb-eye margin-right-5" aria-hidden="true"></i><s:property value="article.clickNum"/>
							</span>
						</div>
					</div>
					<div class="met-editor lazyload clearfix">
						<div><p>
	&nbsp;</p>
<div>
	<span style="font-size:13px;"><s:property value="article.content" escape="false"/></span></div>
<div>
	&nbsp;</div>
<div id="metinfo_additional"></div></div>
						<div class="center-block met_tools_code"></div>
					</div>
					<div class="met-shownews-footer">

						<ul class="pager pager-round">
							<li class="previous ">
								<a href="${ctx }/web/getArticleInfoById.htm?record='last'&id=<s:property value="#art.id"/>" title="成功打下矿山二期第一钻">
									上一篇
									<span aria-hidden="true" class='hidden-xs hidden-sm'>：成功打下矿山二期第一钻</span> 
								</a>
							</li>
							<li class="next ">
								<a href="${ctx }/web/getArticleInfoById.htm?record='next'&id=<s:property value="#art.id"/>" title="卡维中学项目保修期即将结束">
									下一篇
									<span aria-hidden="true" class='hidden-xs hidden-sm'>：卡维中学项目保修期即将结束</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="row">

					<div class="met-news-bar">

                       

						<div class="recommend news-list-md">
							<h3>为您推荐</h3>
							<ul class="list-group list-group-bordered">

								<li class="list-group-item"><a href="../" title="中建博恒建设规范用工成“香饽饽”" target='_self'>中建博恒建设规范用工成“香饽饽”</a></li>

								<li class="list-group-item"><a href="../" title="卡维中学项目保修期即将结束" target='_self'>卡维中学项目保修期即将结束</a></li>

								<li class="list-group-item"><a href="../" title="董事长访问墨西哥" target='_self'>董事长访问墨西哥</a></li>

								<li class="list-group-item"><a href="../" title="公司再次入选ENR排名榜" target='_self'>公司再次入选ENR排名榜</a></li>

								<li class="list-group-item"><a href="../" title="公司党委举办组工干部培训班" target='_self'>公司党委举办组工干部培训班</a></li>

							</ul>
						</div>

                        <ul class="column">
                            <li><a href="../" title="所有文章" target='_self'>所有文章</a></li>

                            <li><a href=""  title="公司新闻">公司新闻</a></li>


                            <li><a href="" class="active" title="媒体报道">媒体报道</a></li>


                        </ul>

					</div>

				</div>
			</div>
		</div>
	</div>
</section>


<!--footer结束模块 -->
			<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>

</div>

<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>
</body>
</html>