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
		        <p class="name">
			        <a href="${ctx }/web/getProInfoById.htm?id=<s:property value="#pro.id"/>">
			        	
			        	<s:if test="#pro.title.length()>30">
		       		 		<s:property value="#pro.title.substring(0,30)"/> ... ...
			       		 </s:if>
			       		 <s:else>
			       		 	<s:property value="#pro.title"/>
			       		 </s:else>
			        </a>
		        </p>
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
         <dt><s:property value="index.spAbout.desc"/></dt>
         <dd>
         <s:if test="index.spAbout.content.length()>100">
         	<s:property value="index.spAbout.content.substring(0,100)" escape="false"/> ... ...
         </s:if>
         <s:else>
         	<s:property value="index.spAbout.content" escape="false"/>
         </s:else>
         
         </dd>
        </dl>
        <div class="clear"></div>
        <a href="${ctx }/web/getSPInfoByName.htm?uniqueName=about" class="aboutBtn">查看公司详细简介</a>
       </div>
      </div>
    </div>
    
  <div id="indexRight">
     <div class="incBox">
       <h3><a href="">新闻中心</a></h3>
       <ul class="recommendArticle">
       <s:iterator value="index.artList" var="art">
       		<li>
       		<b><s:property value="#art.addTime"/></b>
       		<a href="${ctx }/web/getArticleInfoById.htm?id=<s:property value="#art.id"/>">
       		 <s:if test="#art.title.length()>30">
       		 	<s:property value="#art.title.substring(0,30)"/> ... ...
       		 </s:if>
       		 <s:else>
       		 	<s:property value="#art.title"/>
       		 </s:else>
       		</a></li>
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