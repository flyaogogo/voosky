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
<title>Custom Nav</title>
<link href="${ctx}/admin/css/public.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/nav.js"></script>

</head>


<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b>></b><strong>系统设置</strong></div>
   <div class="mainBox" style="">
    <div class="navList">
    <h3><a href="javascript:void(0)" class="actionBtn vs-nav-add-btn-cls">添加导航</a>自定义导航栏</h3>
     <ul class="tab">
	     <s:if test="navType=='middle'">
	      <li><a href="javascript:void(0)" class="selected vs-nav-main-tab">主导航</a></li>
	     </s:if>
	     <s:else>
	      <li><a href="javascript:void(0)" class="vs-nav-main-tab">主导航</a></li>
	     </s:else>
	     
	     <s:if test="navType=='top'">
	      <li><a href="javascript:void(0)" class="selected vs-nav-top-tab">顶部</a></li>
	     </s:if>
	     <s:else>
	      <li><a href="javascript:void(0)" class="vs-nav-top-tab">顶部</a></li>
	     </s:else>
	     
	     <s:if test="navType=='bottom'">
	      <li><a href="javascript:void(0)" class="selected vs-nav-bottom-tab">底部</a></li>
	     </s:if>
	     <s:else>
	      <li><a href="javascript:void(0)" class="vs-nav-bottom-tab">底部</a></li>
	     </s:else>
     </ul>
     <table width="100%" border="0" cellpadding="10" cellspacing="0" class="tableBasic vs-nav-show-tbl">
      <tr>
       <th width="113" align="center">导航名称</th>
       <th align="left">链接地址</th>
       <th width="80" align="center">排序</th>
       <th width="120" align="center">操作</th>
      </tr>

	<s:iterator value="navList" var ="nav">
      <tr>
       <td><input type="hidden" name="navId" value="<s:property value="#nav.navId"/>"/><s:property value="#nav.navName"/></td>
       <td><s:property value="#nav.moduleUrl"/></td>
       <td align="center"><s:property value="#nav.vsort"/></td>
       <td align="center"><a href="javascript:void(0)" class="vs-nav-update-href">编辑 | </a><a href="javascript:void(0)" class="vs-nav-delete-href">删除</a></td>
      </tr>
 	</s:iterator>
     </table>
    </div>

<%--     <script type="text/javascript">
     {literal}
     $(function(){ $(".idTabs").idTabs(); });
     {/literal}
    </script> --%>
    <div class="idTabs vs-nav-add-idtab-cls" style="display: none;">
     <h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a>自定义导航栏-添加</h3>
      <ul class="tab">
        <li><a href="javascript:void(0)" class="selected vs-nav-add-tab-cls">添加站内导航</a></li>
        <li><a href="javascript:void(0)" class="vs-nav-add-defined-tab-cls">添加自定义链接</a></li>
      </ul>
      <div class="items">
        <div id="nav_add">
         <form action="${ctx }/nav/addNavAction.htm" method="post">
          <table width="100%" border="0" cellpadding="5" cellspacing="1" class="tableBasic">
           <tr>
            <td width="80" height="35" align="right">导航模板</td>
            <td>
             <select name="navMenu" onchange="change('nav_name', this)">
              <option value="">请选择你链接的项目</option>
         
              <option value="企业简介" selected="selected" title="企业简介">企业简介</option>
           
             </select>
            </td>
           </tr>
           <tr>
            <td width="80" height="35" align="right">导航名称</td>
            <td>
             <input type="text" id="nav_name" name="navName" value="" size="40" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td height="35" align="right">位置</td>
            <td>
             <label for="type_0">
              <input type="radio" name="navType" id="type_0" value="middle" checked="checked" onChange="">
            	  主导航</label>
             <label for="type_1">
              <input type="radio" name="navType" id="type_1" value="top" onChange="">
             	 顶部</label>
             <label for="type_2">
              <input type="radio" name="navType" id="type_2" value="bottom" onChange="">
            	 底部</label>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">上级分类</td>
            <td id="parent">
             <select name="parentId">
              <option value="0">无</option>
              <option value="{$list.id}">简介</option>
             </select>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">排序</td>
            <td>
             <input type="text" name="sort" value="50" size="5" class="inpMain" />
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
        <div id="nav_defined" style="display: none;">
         <form action="${ctx }/nav/addNavAction.htm" method="post">
          <table width="100%" border="0" cellpadding="5" cellspacing="1" class="tableBasic">
           <tr>
            <td width="80" height="35" align="right">模板名称</td>
            <td>
             <input type="text" id="module" name="module" value="" size="40" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td width="80" height="35" align="right">导航名称</td>
            <td>
             <input type="text" id="nav_name" name="navName" value="" size="40" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td height="35" align="right">位置</td>
            <td>
             <label for="type_0">
				 <input type="radio" name="navType" id="type_0" value="middle" checked="checked" onChange="">主导航
				 </label>
				<label for="type_1">
				 <input type="radio" name="navType" id="type_1" value="top" onChange="">顶部
				</label>
				<label for="type_2">
				 <input type="radio" name="navType" id="type_2" value="bottom" onChange="">底部
				</label>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">链接地址</td>
            <td>
             <input type="text" name="moduleUrl" value="" size="80" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td height="35" align="right">上级分类</td>
            <td id="parent_external">
             <select name="parentId">
              <option value="0">无</option>
             
              <option value="{$list.id}">简介</option>
             
             </select>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">排序</td>
            <td>
             <input type="text" name="sort" value="50" size="5" class="inpMain" />
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

	<div class="vs-nav-update-data" style="display: none;">
	<h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a>自定义导航栏-修改</h3>
    <form action="${ctx }/nav/updateNavByIdAction.htm" method="post">
     <table width="100%" border="0" cellpadding="5" cellspacing="1" class="tableBasic">
           <tr>
            <td width="80" height="35" align="right">导航模板</td>
            <td>
             <input type="hidden" name="navId"/>
             <select name="navMenu" onchange="change('nav_name', this)">
              <option value="">请选择你链接的项目</option>
         
              <option value="企业简介" selected="selected" title="企业简介">企业简介</option>
           
             </select>
            </td>
           </tr>
           <tr>
            <td width="80" height="35" align="right">导航名称</td>
            <td>
             <input type="text" id="nav_name" name="navName" value="" size="40" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td height="35" align="right">位置</td>
            <td>
             <label for="type_0">
              <input type="radio" name="navType" id="type_0" value="middle" onChange="">
             	 主导航</label>
             <label for="type_1">
              <input type="radio" name="navType" id="type_1" value="top" onChange="">
              	顶部</label>
             <label for="type_2">
              <input type="radio" name="navType" id="type_2" value="bottom" onChange="">
             	底部</label>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">上级分类</td>
            <td id="parent">
             <select name="parentId">
              <option value="0">无</option>
              <option value="{$list.id}">简介</option>
             </select>
            </td>
           </tr>
           <tr>
            <td height="35" align="right">排序</td>
            <td>
             <input type="text" name="sort" value="50" size="5" class="inpMain" />
            </td>
           </tr>
           <tr>
            <td></td>
            <td>
             <input type="hidden" name="token" value="{$token}" />
             <input name="submit" class="btn" type="submit" value="提交" />
            </td>
           </tr>
          </table>
    </form>
    </div>
    <!-- {/if} -->
   </div>
  </div>
 <!-- VSMain 结束 -->
 <!-- footer 开始 -->
	<%@ include file="./inc/footer.jsp" %>
 <!-- footer 结束 -->
 </div>
</body>
</html>
