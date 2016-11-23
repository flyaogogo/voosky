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


	<div class="met-banner-econy"  style="background-color:;" >
	<img src="upload/1456471567.jpg">
	  <div class="econynr">
		<div class="container">
			<div class="row">                
					<div class="title col-sm-6 pull-left">
						<h1>工程案例</h1>
					</div>
					<div class="breadcumb col-sm-6 pull-right">
						<i class="fa fa-home"></i> <a href="${ctx}/index.htm" title="首页">首页</a> &gt; <a href= >工程案例</a>
					</div>
				</div>
			</div>
		</div>
	</div>



		<div class="met-column-nav product-search-body bordernone">
			<div class="container">
				<div class="row">

					<div class="col-md-9 sidebar_tile">
						<div class="row">
							<ul class="met-column-nav-ul">
	
							<li><a href="" class="link"  title="全部">全部</a></li>
	

					<li class="dropdown">

						<a href="" title="铁路" class="link " data-toggle="dropdown">
							铁路 <span class="caret"></span>
						</a>
						<ul class="dropdown-menu bullet">
	
							<li><a href=""  title="全部">全部</a></li>


								<li><a href=""  title="测试一">测试一</a></li>

								<li><a href=""  title="测试二">测试二</a></li>

						</ul>

					</li>

					<li class="dropdown">

						<a href="" title="公路" class="link ">公路</a>

					</li>

					<li class="dropdown">

						<a href="" title="桥梁" class="link ">桥梁</a>

					</li>

					<li class="dropdown">

						<a href="" title="房建" class="link ">房建</a>

					</li>

					<li class="dropdown">

						<a href="" title="铁路" class="link ">铁路</a>

					</li>

						</ul>
						</div>
					</div>

	
					<div class="col-md-3 product_search ">
						<div class="row">
						<form method="get" action="">
							<input type="hidden" name="search" value="search">
							<input type="hidden" name="lang" value="cn">
							<input type="hidden" name="class1" value="6">
							<div class="form-group">
								<div class="input-search">
									<button type="submit" class="input-search-btn"><i class="icon wb-search" aria-hidden="true"></i></button>
									<input 
										type="text" 
										class="form-control" 
										name="content" 
										value=""
										placeholder="Search"
									>
								</div>
							</div>
						</form>
						</div>
					</div>
	
				</div>
			</div>
		</div>

<div class="met-product animsition type-1">
	<div class="container">
		<div class="row">
			<div class="less-page-content">

			<ul class="blocks blocks-100 blocks-xlg-5 blocks-md-4 blocks-sm-3 met-page-ajax met-grid" id="met-grid">

				<s:iterator value="proList" var="pro">
				  <li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="${ctx }/bohen/getCaseInfoById.htm?id=<s:property value="#pro.id"/>" title="<s:property value="#pro.title"/>" target='_self'>
								<img class="cover-image" src="${ctx_img }/<s:property value="#pro.thumbUrl"/>" height='350' alt="<s:property value="#pro.title"/>">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="${ctx }/bohen/getCaseInfoById.htm?id=<s:property value="#pro.id"/>" title="<s:property value="#pro.title"/>" target='_self'><s:property value="#pro.title"/> </a>
							
						</h4>
					</div>
				  </li>
				</s:iterator>
				<!-- 
				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="库高等法院大楼  " target='_self'>
								<img class="cover-image" src="upload/1385371348.jpg" height='350' alt="库高等法院大楼  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="库高等法院大楼  " target='_self'>库高等法院大楼  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="阿布扎环路项目     " target='_self'>
								<img class="cover-image" src="upload/1385370162.jpg" height='350' alt="阿布扎环路项目     ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="阿布扎环路项目     " target='_self'>阿布扎环路项目     </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="塞拉矿山铁路  " target='_self'>
								<img class="cover-image" src="upload/1385341412.jpg" height='350' alt="塞拉矿山铁路  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="塞拉矿山铁路  " target='_self'>塞拉矿山铁路  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="沙特南北铁路C项目" target='_self'>
								<img class="cover-image" src="upload/1385342128.jpg" height='350' alt="沙特南北铁路C项目">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="沙特南北铁路C项目" target='_self'>沙特南北铁路C项目</a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="0" title="尼日利亚铁路现代化项目  " target='_self'>
								<img class="cover-image" data-original="upload/1385365613.jpg" height='350' alt="尼日利亚铁路现代化项目  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="0" title="尼日利亚铁路现代化项目  " target='_self'>尼日利亚铁路现代化项目  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="坦140公里铁路更新改造项目" target='_self'>
								<img class="cover-image" data-original="upload/1385365456.jpg" height='350' alt="坦140公里铁路更新改造项目">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="坦140公里铁路更新改造项目" target='_self'>坦140公里铁路更新改造项目</a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="博茨瓦纳帕塞公路  " target='_self'>
								<img class="cover-image" data-original="upload/1385364997.jpg" height='350' alt="博茨瓦纳帕塞公路  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="博茨瓦纳帕塞公路  " target='_self'>博茨瓦纳帕塞公路  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="尼日利亚N公路" target='_self'>
								<img class="cover-image" data-original="upload/1385365428.jpg" height='350' alt="尼日利亚N公路">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="尼日利亚N公路" target='_self'>尼日利亚N公路</a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="尼泊尔波公路  " target='_self'>
								<img class="cover-image" data-original="upload/1385365009.jpg" height='350' alt="尼泊尔波公路  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="尼泊尔波公路  " target='_self'>尼泊尔波公路  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="尼日利亚四小镇公路项目 " target='_self'>
								<img class="cover-image" data-original="upload/1385365937.jpg" height='350' alt="尼日利亚四小镇公路项目 ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="尼日利亚四小镇公路项目 " target='_self'>尼日利亚四小镇公路项目 </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="阿布扎环路项目     " target='_self'>
								<img class="cover-image" data-original="upload/1385370162.jpg" height='350' alt="阿布扎环路项目     ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="阿布扎环路项目     " target='_self'>阿布扎环路项目     </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="丁大桥      " target='_self'>
								<img class="cover-image" data-original="upload/1385370071.jpg" height='350' alt="丁大桥      ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="丁大桥      " target='_self'>丁大桥      </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="库高等法院大楼  " target='_self'>
								<img class="cover-image" data-original="upload/1385371348.jpg" height='350' alt="库高等法院大楼  ">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="库高等法院大楼  " target='_self'>库高等法院大楼  </a>
							
						</h4>
					</div>
				</li>

				<li class="masonry-item ">
					<div class="widget widget-shadow">
						<figure class="widget-header cover">
							<a href="" title="吉工商学校项目" target='_self'>
								<img class="cover-image" data-original="upload/1385371075.jpg" height='350' alt="吉工商学校项目">
							</a>
						</figure>
						<h4 class="widget-title">
							<a href="" title="吉工商学校项目" target='_self'>吉工商学校项目</a>
							
						</h4>
					</div>
				</li> -->


			</ul>



<div class="hidden-xs">
		    <div class='met_pager'>
			<span class='PreSpan'>上一页</span><a href= class='Ahover'>1</a><span class='NextSpan'>下一页</span>
			    <span class='PageText'>转至第</span>
			    <input type='text' id='metPageT' data-pageurl='' value='1' />
			    <input type='button' id='metPageB' value='页' />
		    </div>
		</div>
<div class="met-page-ajax-body visible-xs-block">
	<button type="button" class="btn btn-default btn-block btn-squared ladda-button" id="met-page-btn" data-style="slide-left" data-url="?lang=cn&class1=6&class2=0&class3=0&mbpagelist=1" data-page="1"><i class="icon wb-chevron-down margin-right-5" aria-hidden="true"></i>更多产品</button>
</div>

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