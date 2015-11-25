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

<link rel="stylesheet" href="${ctx}/admin/include/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/admin/include/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/plugins/code/prettify.js"></script>
	
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/singlepage.js"></script>

</head>


<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b>></b><strong>系统设置</strong></div>
   <div class="mainBox" style="{$workspace.height}">
    <h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">添加单页面</a>单页面列表</h3>
    <div class="page">
      <dl>
        <dt><strong>公司简介</strong><p>about</p></dt>
        <dd><a href="javascript:void(0)" class="vs-sp-update-cls">编辑</a> | <a href="javascript:void(0)" class="vs-sp-delete-cls">删除</a></dd>
      </dl>
      <s:iterator value="spList" var="sp">
	      <dl class="child1">
	      	
	        <dt><strong><s:property value="#sp.pageName"/></strong>
	        <p><s:property value="#sp.uniqueName"/></p></dt>
	        <dd><input type="hidden" name="pageId" value="<s:property value="#sp.pageId"/>"/>
	        <a href="javascript:void(0)" class="vs-sp-update-cls">编辑</a> | <a href="javascript:void(0)" class="vs-sp-delete-cls">删除</a></dd>
	      </dl>
      </s:iterator>
    </div>
	
	<div class="vs-sp-add-btn-cls" style="display: none;">
	<h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a>单页面列表-添加</h3>
    <form action="${ctx }/singlepage/addSPAction.html" method="post">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="80" align="right">单页面标题</td>
       <td>
        <input type="text" name="pageName" value="" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">别名</td>
       <td>
        <input type="text" name="uniqueName" value="" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">上级分类</td>
       <td>
        <select name="navId">
         <option value="0">无</option>
         <option value="" selected="selected">简介</option>
        </select>
       </td>
      </tr>
      <tr>
       <td align="right">单页面内容</td>
       <td>
        <!-- KindEditor 
        <script charset="utf-8" src="${ctx}/admin/include/kindeditor/kindeditor.js"></script>
        <script charset="utf-8" src="${ctx}/admin/include/kindeditor/lang/zh_CN.js"></script>
        -->
        <script>
	         var editor;
	         KindEditor.ready(function(K) {
	             editor = K.create('#content');
	         });
        </script>
        <!-- /KindEditor -->
        <textarea id="content" name="content" style="width:780px;height:400px;" class="textArea"></textarea>
       </td>
      </tr>
      <tr>
       <td align="right">关键字</td>
       <td>
        <input type="text" name="keywords" value="" size="90" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">简单描述</td>
       <td>
        <input type="text" name="desc" value="" size="90" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td></td>
       <td>
        
        <input name="submit" class="btn" type="submit" value="提交" />
       </td>
      </tr>
     </table>
    </form>
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
