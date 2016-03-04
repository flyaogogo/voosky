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
<meta name="keywords" content="<s:property value="pro.keywords"/>" />
<meta name="description" content="<s:property value="pro.desc"/>" />
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
       <h3>产品分类</h3>
       <ul>

		<s:iterator value="pro.cateList" var="ctgry">
			<li class="cur"><s:property value="#ctgry.guideAliases"/> <a href="${ctx }<s:property value='#ctgry.desc'/>?navId=<s:property value='#ctgry.navId'/>"><s:property value="#ctgry.cateName"/></a></li>
		</s:iterator>
        <!-- <li class="cur"><a href="">电子数码</a></li>
        <ul>
         <li class="cur">-<a href="">平板电脑</a></li>
         <li class="cur">-<a href="">智能手机</a></li>
        </ul>
		<li class="cur"><a href="">家居百货</a></li>
        <li class="cur"><a href="">母婴用品</a></li> -->
        
       </ul>
      </div>
  
  </div>
  <div id="pageIn"> <div class="urHere">当前位置：<a href="#">首页</a><b>></b><s:property value="pro.message"/></div>
   <div id="product">
    <div class="productImg"><a href="" target="_blank"><img src="${ctx }/<s:property value="pro.thumbUrl"/>" width="135" height="135" /></a></div>
    <div class="productInfo">
     <h1><s:property value="pro.title"/></h1>
     <ul>
      <li class="productPrice">价格：<em class="price">￥<s:property value="pro.price"/> 元</em></li>
     
      <li></li>
  
     </ul>
<!-- 
     <dl class="btnBuy">
     <form action="" method="post">
      <input type="hidden" name="product_id" value="" />
      <input type="hidden" name="number" value="1" />
      <input type="submit" name="submit" class="addToCart" value="" />
     </form>
     </dl>
     -->
     <dl class="btnAsk">
      <dt>购买：</dt>
      <dd><a href="" target="_blank"><img src="${ctx }/public/images/online_qq.jpg" /></a><a href=""><img src="${ctx }/public/images/online_email.jpg" /></a></dd>
     </dl>
    </div>
    <div class="clear"></div>
    <div class="productContent">
     <h3>产品介绍</h3>
     <ul>
      
		<s:property value="pro.content" escape="false"/>
     </ul>
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