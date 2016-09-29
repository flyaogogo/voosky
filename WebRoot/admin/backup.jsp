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
<title>DB backup category</title>
<link href="${ctx}/admin/css/public.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/backup.js"></script>

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
    <h3><a href="" class="actionBtn">恢复数据</a>数据库备份</h3>
  
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <th align="center">
        <input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check' checked>
       </th>
       <th align="left">数据表名</th>
       <th align="center">类型</th>
       <th align="center">记录数</th>
       <th align="center">数据</th>
       <th align="center">索引</th>
       <th align="center">碎片</th>
      </tr>

	<s:iterator value="tabList" var="tab">
      <tr>
       <td align="center"><input type=checkbox name=tables[] value="<s:property value="#tab.tabName"/>" checked></td>
       <td align="left"><s:property value="#tab.tabName"/></td>
       <td align="center"><s:property value="#tab.type"/></td>
       <td align="center"><s:property value="#tab.tabTows"/></td>
       <td align="center"><s:property value="#tab.dataSize"/></td>
       <td align="center"><s:property value="#tab.indexLength"/></td>
       <td align="center"><s:property value="#tab.dataFree"/></td>
      </tr>
	</s:iterator>
      <tr>
       <td colspan="7" align="right">数据库占用 <s:property value="tabTotal"/></td>
      </tr>
      <tr>
       <td colspan="7" align="center">分卷备份设置</td>
      </tr>
      <tr>
       <td colspan="7" align="center">
        文件名：<input type="text" class="inpMain" name="file_name" value="" size=30>
        每个分卷文件大小：<input type="text" class="inpMain" name="vol_size" value="2048" size="5">K
       </td>
      </tr>
      <tr>
       <td height="26" colspan="7">
        <input type="hidden" name="token" value="{$token}" />
        <input type="hidden" name="totalsize" value="{$totalsize}">
        <input type="submit" name="submit" class="btn" value="确定备份"  onClick="">
       </td>
      </tr>
    </table>

	<div class="vs-backup-show-cls">
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
     <tr>
      <th width="" align="left">文件名</th>
      <th width="100">大小</th>
      <th width="160">备份日期</th>
      <th width="140">操作</th>
     </tr>
   <s:iterator value="bkList" var="bk">
     <tr>
      <td align="left"><s:property value="#bk.fileName"/></td>
      <td align="center"><s:property value="#bk.fileSize"/></td>
      <td align="center"><s:property value="#bk.slaveTime"/></td>
      <td align="center">
      <input type="hidden" name="vs-bk-id" value="<s:property value="#bk.id"/>" />
      <a href="" class="vs-backup-import-href-cls">导入</a> | <a href="l" class="vs-backup-download-href-cls">下载</a> | <a href="" class="vs-backup-del-href-cls">删除</a></td>
     </tr>
   </s:iterator>
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
