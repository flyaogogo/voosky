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
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/slide.js"></script>

</head>


<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b>></b><strong>系统设置</strong></div>
   <div class="mainBox imgModule">
    <h3>首页幻灯广告</h3>
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
    <tr>
       <th><span class="vs-slide-span-type-oper-cls">添加幻灯 </span></th>
       <th>幻灯列表</th>
     </tr>
     <tr>
      <td width="350" valign="top">
      <div class="vs-slide-type-oper-cls">
       <form name="slide-type-form" action="${ctx }/slide/addSlideAction.htm" class="formEdit"  method="post" enctype="multipart/form-data">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableOnebor">
         <tr>
          <td><strong>幻灯名称</strong>
          <input type="hidden" name="id" />
          <input type="text" name="showName" value="" size="20" class="inpMain" />
          </td>
         </tr>
         <tr>
          <td><strong>幻灯图片</strong>
            <input type="file" name="showImg" class="inpFlie" />
          </td>
         </tr>
         <tr>
          <td><strong>链接地址</strong><br><input type="text" name="showLink" value="" size="40" class="inpMain" />
          </td>
         </tr>
         <tr>
          <td><strong>排序</strong><input type="text" name="vsort" value="" size="20" class="inpMain" />
          </td>
         </tr>
         <tr>
          <td>
           <input name="submit" class="btn" type="submit" value="提交" />
          </td>
         </tr>
        </table>
       </form>
       </div>
      </td>
      <td valign="top">
       <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableOnebor">
        <tr>
         <td colspan="2">幻灯名称</td>
         <td width="50" align="center">排序</td>
         <td width="80" align="center">操作</td>
        </tr>
        
        <s:iterator value="slideList" var="sld">
	        <tr>
	         <td width="100"><a href="javascript:void(0)" target="_blank"><img src="<s:property value="#sld.showImg"/>" width="100" /></a></td>
	         <td><s:property value="#sld.showName"/></td>
	         <td align="center"><s:property value="#sld.vsort"/></td>
	         <td align="center">
	         <input type="hidden" name="slideId" value="<s:property value="#sld.id"/>" />
	         <a href="javascript:void(0)" class="vs-slide-edit-oper-cls">编辑</a> | <a href="javascript:void(0)" class="vs-slide-delete-oper-cls">删除</a></td>
	        </tr>
        </s:iterator>
       </table>
      </td>
     </tr>
    </table>
   </div>
  </div>
 <!-- VSMain 结束 -->
 <!-- footer 开始 -->
	<%@ include file="./inc/footer.jsp" %>
 <!-- footer 结束 -->
 </div>
</body>
</html>
