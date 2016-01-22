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
  <div id="pageIn"><div class="urHere">当前位置：<a href="#">首页</a><b>></b>企业简介</div>

   <div class="productList"> 

    <dl class="last">
    <dt><a href=""><img src="pro_img/12_thumb.jpg" alt="" width="158" height="158" /></a></dt>
    <dd>
     <p class="name"><a href="" title="">亨氏Heinz金装粒粒面鳕鱼胡萝卜面</a></p>
     <p class="brief">亨氏公司是在1869年由HJHeinz在美国宾夕法尼亚州夏普斯堡创立的，经过一百多年卓有成效的...</p>
     <p class="price">价格：￥68.00 元</p>
     <p><a href="" class="btn">购买咨询</a></p>
    </dd>
    </dl>

    <div class="clear"></div>
   </div>
<div class="pager">总计 15 个记录，共 2 页 当前第 1 页 | <a href="">第一页</a><a href="">上一页</a><a href="">下一页</a><a href="">最后一页</a></div> </div>
  <div class="clear"></div>
 </div>

 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>


</div>
</body>
</html>