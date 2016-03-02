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
<title>article category</title>
<link href="${ctx}/admin/css/public.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/userManager.js"></script>

</head>


<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b>></b><strong>系统设置</strong></div>
   <div id="manager" class="mainBox" style="{$workspace.height}">
   	<div class="show-user-table">
    <h3><a href="javascript:void(0)" class="actionBtn vs-admin-add-btn-cls">添加管理员</a>网站管理员</h3>
 
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
     <tr>
      <th width="30" align="center">编号</th>
      <th align="left">管理员名称</th>
      <th align="center">E-mail地址</th>
      <th align="center">添加时间</th>
      <th align="center">最后登录时间</th>
      <th align="center">操作</th>
     </tr>
     
	<s:iterator value="puList" var="u">
     <tr>
      <td align="center"><s:property value="#u.userId"/></td>
      <td><s:property value="#u.userName"/></td>
      <td align="center"><s:property value="#u.userEmail"/></td>
      <td align="center"><s:property value="#u.addTime"/></td>
      <td align="center"><s:property value="#u.lastLoginTime"/></td>
      <td align="center"><a href="javascript:void(0)" class="vs-admin-update-btn-cls">编辑</a> | <a href="javascript:void(0)" class="vs-admin-removed-btn-cls">删除</a></td>
     </tr>
	</s:iterator>
    </table>
	</div>
	
	<div class="vs-admin-insert-cls" style="display: none;">
	<h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a>网站管理员</h3>
    <form id="adduserFormId" action="${ctx }/account/addUserAction.htm" method="post">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="100" align="right">管理员名称</td>
       <td>
        <input type="text" name="userName" size="40" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td width="100" align="right">E-mail地址</td>
       <td>
        <input type="text" name="userEmail" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">密码</td>
       <td>
        <input type="password" name="password" size="40" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td align="right">确认密码</td>
       <td>
        <input type="password" name="password_confirm" size="40" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td></td>
       <td>
        <input type="submit" name="submit" class="btn" value="提交" onclick="return addUserSubmit();"/>
       </td>
      </tr>
     </table>
    </form>
	</div>
	
	<div class="vs-admin-update" style="display: none;">
	<h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a>网站管理员</h3>
    <form action="${ctx }/account/updateUserAction.htm" method="post">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="100" align="right">管理员名称</td>
       <td>
       	<input type="hidden" name="userId"/>
        <input type="text" name="userName" value="" size="40" class="inpMain" >
       </td>
      </tr>
      <tr>
       <td width="100" align="right">E-mail地址</td>
       <td>
        <input type="text" name="userEmail" value="" size="40" class="inpMain" />
       </td>
      </tr>
    
      <tr>
       <td align="right">旧密码</td>
       <td>
        <input type="password" name="old_password" size="40" class="inpMain" />
        <input type="hidden" name="hidden_old_password" value=""/>
        
       </td>
      </tr>
      <!-- {/if} -->
      <tr>
       <td align="right">新密码</td>
       <td>
        <input type="password" name="password" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">确认新密码</td>
       <td>
        <input type="password" name="password_confirm" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td></td>
       <td>
    
        <input type="submit" name="submit" class="btn" value="提交" onclick="return updateUserSubmit();"/>
       </td>
      </tr>
     </table>
    </form>
	</div>
	
	<div class="vs-admin-log-show" style="display: none;">
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
     <tr>
      <th width="30" align="center">编号</th>
      <th width="150" align="left">	操作时间</th>
      <th width="100" align="center">操作者</th>
      <th align="left">	操作记录</th>
      <th width="100" align="center">IP地址</th>
     </tr>
   
     <tr>
      <td align="center">001</td>
      <td>2015-11-15 15:50:10</td>
      <td align="center">admin</td>
      <td align="left">数据备份: D20151115T155002.sql</td>
      <td align="center">127.0.0.1</td>
     </tr>

    </table>
    </div>
  
   </div>
  </div>
 <!-- VSMain 结束 -->
 <!-- footer 开始 -->
	<%@ include file="./inc/footer.jsp" %>
 <!-- footer 结束 -->
 </div>
</body>
</html>
