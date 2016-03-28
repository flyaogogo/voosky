<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
 <div id="vsHead">
   <div id="head">
    <div class="logo"><a href="index.php"><img src="${ctx}/admin/images/vslogo.gif" alt="logo"></a></div>
    <div class="nav">
     <ul>
      <li class="M"><a href="${ctx }/index.htm" class="topAdd">前台首页</a></li>
      <li><a href="#" target="_blank">查看站点</a></li>
      <li><a href="#">清除缓存</a></li>
      <li><a href="#" target="_blank">帮助</a></li>
      <li class="noRight"><a href="#">vsPHP+</a></li>
     </ul>
     <ul class="navRight">
      <li class="M noLeft"><a href="#">您好，${sessionScope.user.userName }</a>
      </li>
      <li class="noRight"><a href="${ctx}/account/logout.htm">退出</a></li>
      </ul>
    </div>
   </div>
  </div>
<!-- dcHead 结束 -->
</body>
