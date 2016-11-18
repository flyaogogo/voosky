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
	<meta name="description"
		content="模板建站和纯手工建站的区别在于：模板是“成衣”，你只需要去服装店挑选，而所谓的纯手工建站是裁缝师傅给你定制。功能和稳定性模板+成熟的CMS管理后台大大优于“裁缝店”。" />
	<meta name="keywords" content="博恒建设公司网站模板|博恒建设企业网站模板" />
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


			<div class="main-slider met-banner" style="background: url(${ctx}/bohen/upload/1456467317.jpg) 50% 50% no-repeat; background-size: cover;transition: all 0.3s;">
				<div class="rev_slider_wrapper">
					<div class="tp-banner" >
                <ul>
                    <!-- SLIDE  -->
                    <li  data-transition="slideleft" data-slotamount="14">
                        <!-- MAIN IMAGE -->
                        <img src="${ctx}/bohen/images/bg1.jpg" alt="Rev Full">
                            <div class="caption sfb" data-x="693" data-y="75" data-speed="700" data-start="0"data-easing="easeOutBack">
                                <img src="${ctx}/bohen/images/mobile.png" alt=""/>
                            </div>

                            <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="280" data-start="1500" data-easing="easeOutBack" data-end="5000" data-endspeed="500">
                                <a href="#" class="button btn-flat">More Info</a>
                            </div>   
                    </li>
                    <!-- SLIDE  -->
                    <li data-transition="boxslide" data-slotamount="7" data-masterspeed="300" >
                        <!-- MAIN IMAGE -->
                        <img src="${ctx}/bohen/images/bg2.jpg"  alt="darkblurbg"   data-fullwidthcentering="on">
                            <!-- LAYERS -->
                            <div class="tp-caption lft stb stl"
                                 data-x="650"
                                 data-y="93"
                                 data-speed="500"
                                 data-start="500"
                                 data-easing="easeOutExpo" data-end="6000" data-endspeed="500"><img src="${ctx}/bohen/images/imac.png" alt="Image 1"></div>

                            <div class="tp-caption lfb stb stl"
                                 data-x="616"
                                 data-y="194"
                                 data-speed="500"
                                 data-start="700"
                                 data-easing="easeOutExpo" data-end="6000" data-endspeed="500"><img src="${ctx}/bohen/images/ipad.png" alt="Image 1"></div>

                            <div class="tp-caption lfr stb stl"
                                 data-x="751"
                                 data-y="290"
                                 data-speed="1000"
                                 data-start="1000"
                                 data-easing="easeOutExpo" data-end="6000" data-endspeed="500"><img src="${ctx}/bohen/images/iphone.png" alt="Image 1"></div>

                            <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="280" data-start="1500" data-easing="easeOutBack" data-end="5000" data-endspeed="500">
                                <a href="#" class="button btn-flat">More Info</a>
                            </div>  
                    </li>
                </ul>
                <div class="tp-bannertimer"></div>
            </div>
				</div>
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
						<!-- <li role="presentation">
							<a href="#productlist" title="铁路" data-toggle="tab" data-filter="list_13">铁路</a>
						</li>

						<li role="presentation">
							<a href="#productlist" title="公路" data-toggle="tab" data-filter="list_14">公路</a>
						</li>

						<li role="presentation">
							<a href="#productlist" title="桥梁" data-toggle="tab" data-filter="list_15">桥梁</a>
						</li>

						<li role="presentation">
							<a href="#productlist" title="房建" data-toggle="tab" data-filter="list_16">房建</a>
						</li>

						<li role="presentation">
							<a href="#productlist" title="铁路" data-toggle="tab" data-filter="list_20">铁路</a>
						</li>
 -->
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
						   <a href="">
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
							<a href="" class="contact-us hvr-bounce-to-right">联系我们</a>
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

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456455557.jpg" alt="卡维中学项目保修期即将结束"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="">卡维中学项目保修期即将结束</a></h3>
										<p class="ohto">近日，公司在卡维高级中学项目竣工交验后为期一年的保修期即将结束，目前学校各类设施运行良好。</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456456124.jpg" alt="董事长访问墨西哥"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="">董事长访问墨西哥</a></h3>
										<p class="ohto">为配合主席访问墨西哥，公司董事长于6月3日至10日参加了由中国贸促会组织的经贸代表团访问墨西哥。</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456456808.jpg" alt="公司再次入选ENR排名榜"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="">公司再次入选ENR排名榜</a></h3>
										<p class="ohto">8 月 23 日，美国《工程新闻记录》（Engineering News Record，简称 ENR） 杂志官网发布了 2013 年度 ENR“最大 250 家国际承包商”排名榜。</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456456386.jpg" alt="公司党委举办组工干部培训班"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="">公司党委举办组工干部培训班</a></h3>
										<p class="ohto">6月4日至8日,公司党委举办组工干部培训班，公司各部门、各事业部、境内各单位及部分境外单位的组织委员或具体负责组织工作的同志共计34人参加了培训。公司党委副书记、纪委书记到会作总结讲话。</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456455060.jpg" alt="团员青年积极参加“五四”主题活动"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="">团员青年积极参加“五四”主题活动</a></h3>
										<p class="ohto">春到京城万物苏，携手绿林正当时。为在广大团员青年中树立环保责任意识，以实际行动迎接“五四”青年节的到来，公司团委在5月3日组织在京团员青年55人赴怀柔京螺山庄植树基地参加“美丽中国携手共创”植树活动。</p>
									</div>
								</div>
							</div>
						</div>

						<div class="item">
							<div class="single-testimonial-construct clearfix">
								<div class="img-holder hvr-rectangle-out">
									<a href=""><img class="owl-lazy" data-src="${ctx}/bohen/upload/1456455454.jpg" alt="签约汤加机场消防楼项目"></a>
								</div>
								<div class="content">
									<div class="content2">
										<h3 class="ohto wn"><a href="0">签约汤加机场消防楼项目</a></h3>
										<p class="ohto">5月16日，博恒建设公司与汤加交通部民航局签署了汤加机场消防楼建设项目实施合同。</p>
									</div>
								</div>
							</div>
						</div>

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