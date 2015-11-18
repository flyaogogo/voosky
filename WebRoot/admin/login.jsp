<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="./inc/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>voosky login</title>
<link href="css/public.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

</head>


<body>
<div id="login">
  <div class="vslogo"></div>
  <div>
    <ul>  
      <li class="inpLi"><b>用户名：</b><input type="text" name="user_name" class="inpLogin"></li>
      <li class="inpLi"><b>密码：</b><input type="password" name="password" class="inpLogin"></li>
      <li class="captchaPic">
        <div class="inpLi"><b>验证码：</b><input type="text" name="captcha" class="captcha"></div>
        <img id="vcode" src="images/code.png">
      </li>
    
      <li class="sub"><input type="submit" name="submit" class="btn" value="登陆"></li> 
      <li class="action"><a href="#">忘记密码？</a> | <a href="#">返回首页</a></li> 
     </ul>
  </div>
</div>
</body>
</html>