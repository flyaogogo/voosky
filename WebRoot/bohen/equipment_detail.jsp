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

<%-- 
<script type="text/javascript" src="${ctx}/bohen/js/extensions/revolution.extension.video.min.js"></script>
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
    
<section class="met-shownews animsition">
	<div class="container">
		<div class="row">
			<div class="col-md-9 met-shownews-body">
				<div class="row">
					<div class="met-shownews-header">
						<h1><s:property value="pro.title"/></h1>
						<div class="info">
							<span>
								<s:property value="pro.addTime"/>
							</span>
							<span>
								<s:property value="pro.author"/>
							</span>
							<span>
								<i class="icon fa fa-eye margin-right-5" aria-hidden="true"></i><s:property value="pro.clickNum"/>
							</span>
						</div>
					</div>
					<div class="met-editor lazyload clearfix">

					<p class='text-center'>
						<img data-original="${ctx_img }/<s:property value="pro.thumbUrl"/>" alt='<s:property value="pro.title"/>'/>
					</p>
					<p class='text-center'><s:property value="pro.title"/></p>

						
						<div class="center-block met_tools_code"></div>
					</div>
					<div class="met-shownews-footer">

						<ul class="pager pager-round">
							<li class="previous ">
								<s:if test="proLast!=null">
								<a href="${ctx }/bohen/getMachineInfoById.htm?id=<s:property value="proLast.id"/>" title="<s:property value="proLast.title"/>">
									上一篇
									<span aria-hidden="true" class='hidden-xs hidden-sm'>：<s:property value="proLast.title"/> </span> 
								</a>
								</s:if>
							</li>
							<li class="next ">
								<s:if test="proNext!=null">
								<a href="${ctx }/bohen/getMachineInfoById.htm?id=<s:property value="proNext.id"/>" title="<s:property value="proNext.title"/>">
									下一篇
									<span aria-hidden="true" class='hidden-xs hidden-sm'>：<s:property value="proNext.title"/> </span>
								</a>
								</s:if>
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
								<s:iterator value="proList" var="prod" status = "status">
									<s:if test="#status.index<5">
									<li class="list-group-item"><a href="${ctx }/bohen/getMachineInfoById.htm?id=<s:property value="#prod.id"/>" title="<s:property value="#prod.title"/>" target='_self'><s:property value="#prod.title"/></a></li>
									</s:if>
								</s:iterator>
								<!-- 
								<li class="list-group-item"><a href="" title="露天钻机 " target='_self'>露天钻机 </a></li>

								<li class="list-group-item"><a href="" title="露天钻机 " target='_self'>露天钻机 </a></li>

								<li class="list-group-item"><a href="" title="水泥沥青砂浆车 " target='_self'>水泥沥青砂浆车 </a></li>

								<li class="list-group-item"><a href="" title="水泥沥青砂浆车 " target='_self'>水泥沥青砂浆车 </a></li>

								<li class="list-group-item"><a href="" title="造桥机" target='_self'>造桥机</a></li>
 -->
							</ul>
						</div>

                        <ul class="column">
                            <li><a href="${ctx }/bohen/getMachineductsInfo.htm?cateId=14" title="所有案例" target='_self'>所有案例</a></li>

                        </ul>

                    </div>

				</div>
			</div>
		</div>
	</div>
</section>

	<!--footer开始模块-->
				<!-- 底部 -->
    <%@ include file="./inc/bfooter.jsp" %>

</div>


<script type="text/javascript" src="${ctx}/bohen/js/13b4293ffe964f00.js"></script>
</body>
</html>