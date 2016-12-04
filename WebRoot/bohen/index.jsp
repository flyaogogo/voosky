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
	<title>博恒建设公司网站 -博恒建设</title>
	<meta name="renderer" content="webkit">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="generator" content="voosky1.0" data-variable="" />
	<meta name="description"
		content="" />
	<meta name="keywords" content="博恒建设公司网站|博恒建设企业网站" />
	<link href="${ctx}/bohen/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link rel="stylesheet" href="${ctx}/bohen/css/boheng.css">
	<link rel="stylesheet" href="${ctx}/bohen/css/wstyle.css">
	<link rel="stylesheet" href="${ctx}/bohen/fontawesome/font-awesome-4.6.3/css/font-awesome.css">
	<!--[if lt IE 10]>
			<script src="http://show.metinfo.cn/muban/M1089007/343/app/system/include/static/vendor/media-match/media.match.min.js"></script>
			<script src="http://show.metinfo.cn/muban/M1089007/343/app/system/include/static/vendor/respond/respond.min.js"></script>
			<script src="http://show.metinfo.cn/muban/M1089007/343/app/system/include/static/js/classList.min.js"></script> 
	<![endif]-->
	<%-- <script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script> 
	<script type="text/javascript" src="http://www.sucaihuo.com/Public/js/other/jquery.js"></script>--%>
    <script type="text/javascript" src="${ctx}/bohen/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/bohen/wjs/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="${ctx}/bohen/wjs/jquery.themepunch.revolution.min.js"></script>
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

			
<!-- banner幻灯片效果开始 -->

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		  <s:iterator value="index.slideList" var="slide" status="status">
		  	<s:if test="#status.index == 0">
			  	<div class="item active">
				  <a href="javascript:void(0);"><img src="${ctx_img }/<s:property value="#slide.showImg"/>" alt="<s:property value="#slide.showName"/>"></a>
				  <div class="carousel-caption baner_adv">
					<s:property value="#slide.showName"/>
				  </div>
				</div>
		  	</s:if>
		  	<s:else>
			  	<div class="item">
				  <a href="javascript:void(0);"><img src="${ctx_img }/<s:property value="#slide.showImg"/>" alt="<s:property value="#slide.showName"/>"></a>
				  <div class="carousel-caption baner_adv">
					<s:property value="#slide.showName"/>
				  </div>
				</div>
		  	</s:else>
		  </s:iterator>
		  <%-- 
			<div class="item active">
			  <a href=""><img src="${ctx}/bohen/img/banner.jpg" alt="..."></a>
			  <div class="carousel-caption baner_adv">
				众观全城，世界有我！
			  </div>
			</div>
			<div class="item">
			  <a href=""><img src="${ctx}/bohen/img/banner1.jpg" alt="..."></a>
			  <div class="carousel-caption baner_adv">
				唯美是艺术追求!
			  </div>
			</div>
			<div class="item">
			  <a href=""><img src="${ctx}/bohen/img/banner1.jpg" alt="..."></a>
			  <div class="carousel-caption baner_adv">
				造就艺术那就是你!
			  </div>
			</div>
			 --%>
			
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div>
       
		
<!-- 工程案例模块开始-->
            <div class="met-index-product met-index-body">
				<div class="container">
					<h3 class="invisible" data-plugin="appear" data-animate="slide-top" data-repeat="false">工程案例</h3>
					
					<ul class="nav nav-tabs invisible" data-plugin="appear" data-animate="fade" data-repeat="false">
						<li class="active">
							<a href="#productlist" title="全部" data-toggle="tab" data-num='10' data-filter="*">全部</a>
						</li>

						<s:iterator value="index.navList" var="nav">
							<li role="presentation">
								<a href="#productlist" title="<s:property value="#nav.navName"/>" data-toggle="tab" data-filter="list_<s:property value="#nav.navId"/>"><s:property value="#nav.navName"/></a>
							</li>
						</s:iterator>
					</ul>

				</div>
				<div class="body">
					<ul class="blocks no-space blocks-xlg-5 blocks-md-5 blocks-sm-3 blocks-xs-2" id="productlist">

				  		
				  		<s:iterator value="index.proList" var="pro">
							<li data-type="list_<s:property value="#pro.navId"/>">
								<div class="widget widget-shadow">
									<figure class="widget-header cover">
										<a href="${ctx }/bohen/getCaseInfoById.htm?id=<s:property value="#pro.id"/>" title="<s:property value="#pro.title"/>" target='_self'>
											<img class="cover-image" data-original="${ctx_img }/<s:property value="#pro.thumbUrl"/>" height='350' alt="<s:property value="#pro.title"/>">
											<div class="content-wrapper hvr-sweep-to-right">
												<div class="content">
													<div class="text-box">
														<h4><s:property value="#pro.title"/></h4>
	
														<span class="ohto">
															<s:if test="#pro.content.length()>30">
											       		 		<s:property value="#pro.content.substring(0,30)" escape="false"/> ... ...
												       		</s:if>
												       		<s:else>
												       		 	<s:property value="#pro.content" escape="false"/>
												       		</s:else>
														</span>
													</div>
												</div>
											</div>
										</a>
									</figure>
								</div>
							</li>
						</s:iterator>
						
						

					</ul>
				</div>

				<div class="view-all-btn text-center">
					<a href="${ctx }/bohen/getCaseductsInfo.htm" class="view-all hvr-bounce-to-right">查看更多</a>
				</div>

			</div>
<!-- 工程案例模块结束-->
<!-- 关于我们块结束-->	
		<div class="met-index-about met-index-body" data-bg="${ctx}/bohen/upload/intro_bg.png" bg-repeat="false">
				<div class="container">
					<div class="met-editor lazyload clearfix invisible" data-plugin="appear" data-animate="slide-bottom" data-repeat="false">
						<div class="video-preview">
                           <div class="con_shipin">
						   <a href="${ctx}/bohen/getSPInfoByName.htm?uniqueName=summary">
							<img data-original="${ctx}/bohen/upload/1456453179.jpg" class="cover-image" style='opacity:1;'><i></i>
							</a>
                            </div>
						</div>
						<div class="video-text">
							<h2>公司简介</h2>
							<p class="met_editor">
								<p> 
								 <s:if test="index.spAbout.content.length()>100">
						         	<s:property value="index.spAbout.content.substring(0,100)" escape="false"/> ... ...
						         </s:if>
						         <s:else>
						         	<s:property value="index.spAbout.content" escape="false"/>
						         </s:else>
								</p>
							</p>
							<a href="${ctx}/bohen/getSPInfoByName.htm?uniqueName=contactus" class="contact-us hvr-bounce-to-right">联系我们</a>
						</div>
					</div>
				</div>
			</div>

<!-- 关于我们模块结束-->

<!--业务项目模块开始-->	
           	<div class="met-index-imglist met-index-body" data-bg="" bg-repeat="false">
				<div class="container">
					<h3 class="invisible" data-plugin="appear" data-animate="slide-top" data-repeat="false">业务项目</h3>
					<!-- <p class="desc invisible" data-plugin="appear" data-animate="fade" data-repeat="false">最新公司动态</p> -->
					<div class="owl-carousel owl-theme">

						<s:iterator value="index.artList" var="art">
						<s:if test="#art.navId=='20'">
						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>"><img class="owl-lazy" data-src="${ctx_img }/<s:property value="#art.thumbUrl"/>" alt="<s:property value="#art.title"/>"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>"><s:property value="#art.title"/></a></h3>
										<p class="ohto"><s:property value="#art.content" escape="false"/></p>
									</div>
								</div>
							</div>
						</div>
						</s:if>
						</s:iterator>

					</div>
				</div>
			</div>
<!-- 业务项目模块结束-->	

<!-- 新闻动态模块开始-->	
			<div class="met-index-news met-index-body">
				<div class="container">
					<h3 class="invisible" data-plugin="appear" data-animate="slide-top" data-repeat="false">公司新闻</h3>
					<p class="desc invisible" data-plugin="appear" data-animate="fade" data-repeat="false">最新公司新闻</p>
					<ul class="blocks blocks-2">
						
						<s:iterator value="index.artList" var="art">
						<s:if test="#art.navId!='20'">
						<li class="invisible" data-plugin="appear" data-animate="slide-bottom" data-repeat="false">
							<div class="media media-lg">
								<div class="media-left">
									<a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>" title="<s:property value="#art.title"/>" target='_self' class="img-holder hvr-rectangle-out">
										<img class="media-object" data-original="${ctx_img }/<s:property value="#art.thumbUrl"/>" height='120' alt="<s:property value="#art.title"/>">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										<a href="${ctx }/bohen/getNewInfoById.htm?id=<s:property value="#art.id"/>" title="<s:property value="#art.title"/>" target='_self'>
											<s:property value="#art.title"/>
										</a>
									</h4>
									<p class="des">
									 <s:if test="#art.desc.length()>30">
						       		 	<s:property value="#art.desc.substring(0,30)"/> ... ...
						       		 </s:if>
						       		 <s:else>
						       		 	<s:property value="#art.desc"/>
						       		 </s:else>
									</p>
									<p class="info">
										<span><s:property value="#art.addTime"/></span>
										<span class="margin-left-10"><s:property value="#art.author"/></span>
										<span class="margin-left-10"><i class="fa-eye margin-right-5" aria-hidden="true"></i><s:property value="#art.clickNum"/></span>
									</p>
								</div>
							</div>
						</li>
						</s:if>
						</s:iterator>
						

					</ul>
				</div>
			</div>

<!-- 新闻动态模块结束-->
			<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>
			


		</div>
	<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>
	</body>

</html>