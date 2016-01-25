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
<title>产品中心</title>
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

        <li class="cur"><a href="">电子数码</a></li>
          <ul>
         <li class="cur">-<a href="">平板电脑</a></li>
         <li class="cur">-<a href="">智能手机</a></li>
        </ul>
		<li class="cur"><a href="">家居百货</a></li>
        <li class="cur"><a href="">母婴用品</a></li>
        
       </ul>
      </div>
  
  
  </div>
  <div id="pageIn"> <div class="urHere">当前位置：<a href="#">首页</a><b>></b>产品中心</div>
   <div class="productList"> 
   
    <s:iterator value="proList" var="pro">
	    <dl class="last">
	    <dt><a href=""><img src="${ctx }/<s:property value="#pro.thumbUrl"/>" alt="" width="" height="" /></a></dt>
	    <dd>
	     <p class="name"><a href="${ctx }/web/getProInfoById.htm?id=<s:property value="#pro.id"/>" title=""><s:property value="#pro.title"/></a></p>
	     <p class="brief"><s:property value="#pro.content" escape="false"/></p>
	     <p class="price">价格：￥<s:property value="#pro.price"/> 元</p>
	   
	    </dd>
	    </dl>
    </s:iterator>
    
    
    <!-- <dl class="last">
    <dt><a href="product.html"><img src="pro_img/14_thumb.jpg" alt="" width="" height="" /></a></dt>
    <dd>
     <p class="name"><a href="" title="">亨氏Heinz金装粒粒面鳕鱼胡萝卜面</a></p>
     <p class="brief">亨氏公司是在1869年由HJHeinz在美国宾夕法尼亚州夏普斯堡创立的，经过一百多年卓有成效的...</p>
     <p class="price">价格：￥68.00 元</p>
 
    </dd>
    </dl> -->

    <div class="clear"></div>
   </div>
   <div class="pager">总计 15 个记录，共 2 页 当前第 1 页 | <a href="">第一页</a><a href="">上一页</a><a href="">下一页</a><a href="">最后一页</a></div>
   
   
    </div>
  <div class="clear"></div>
 </div>
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>
 
</div>
</body>
</html>