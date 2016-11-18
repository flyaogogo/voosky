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
<script type="text/javascript" src="${ctx}/admin/js/TreeSelector.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/category.js"></script>

</head>
<script type="text/javascript">
	//对列表数据，拼装Json
	var tmpData = "[" ;
	<c:forEach items="${navBean.navList}" var="a"> 
		tmpData = tmpData + "{'navId':${a.navId},'parentId':${a.parentId},'navName':'${a.navName}','module':'${a.module}','moduleUrl':'${a.moduleUrl}','guideAliases':'${a.guideAliases}'},"
	</c:forEach> 
// 	<c:forEach items="${cateList}" var="a"> 
	//console.log("${a.cateName}"); //生成如 array.push(123)的字符串 这样前台拿到后就是js 
//	tmpData = tmpData + "{'cateId':'${a.cateId} ','uniqueName':'${a.uniqueName}','cateName':'${a.cateName}','navId':${a.navId},'desc':'${a.desc}','guideAliases':'${a.guideAliases}'},"
//</c:forEach>  
	//console.log(tmpData) ;
	var tmpdatalen = tmpData.length ;
	if(tmpdatalen>1){
		tmpData = tmpData.substring(0,tmpData.length-1) ;//去掉最后一个逗号
	}
	tmpData = tmpData + "]" ;
	//console.log(tmpData) ;
	dataList = eval(tmpData) ;
	var parentId = '<s:property value="navBean.parentId"/>' ;
	$(function(){
		//左导航样式
		$("#vsLeft .vs-acate").addClass("cur");
	})
</script>

<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b>></b><strong>系统设置</strong></div>
   <div class="mainBox" style="{$workspace.height}">
 
 	<div class ="vs-category-show-cls">
    <h3><a href="javascript:void(0)" class="actionBtn vs-category-add-btn-cls">添加分类</a>文章分类</h3>
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
        <th width="120" align="left">分类名称	</th>
        <th align="left">别名</th>
        <th align="left">简单描述</th>
        <th width="60" align="center">排序</th>
        <th width="80" align="center">操作</th>
     </tr>
     
	<s:iterator value="cateList" var="cl">
      <tr>
        <td align="left"><input type="hidden" name="cateId" value="<s:property value="#cl.cateId"/>"/><s:property value="#cl.guideAliases"/> <s:property value="#cl.cateName"/></td>
        <td><s:property value="#cl.uniqueName"/></td>
        <td><s:property value="#cl.desc"/></td>
        <td align="center"><s:property value="#cl.vsort"/></td>
        <td align="center"><a href="javascript:void(0)" class="vs-category-update-btn-cls">编辑</a> | <a href="javascript:void(0)" class="vs-category-delete-btn-cls">删除</a></td>
     </tr>
   	</s:iterator>
    </table>
    </div>
    
   <div class="vs-category-type-btn-cls" style="display: none;">
    <!-- 分类添加或编辑 -->
    <h3><a href="javascript:void(0)" class="actionBtn returnCateActionBtn">返回文章分类</a><span class="vs-category-title-name-cls">添加</span>文章分类</h3>
    <form name="category-type-form" action="${ctx }/category/insertCateAction.htm" method="post">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="80" align="right">分类名称</td>
       <td>
        <input type="hidden" name="cateId" />
        <input type="hidden" name="navId" />
        <input type="hidden" name="cateStatus" value="article" class="vs-category-hidden-input-val" />
        <input type="text" name="cateName" value="" size="40" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td align="right">别名</td>
       <td>
        <input type="text" name="uniqueName" value="" size="40" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td align="right">上级分类</td>
       <td>
        <select id="selectTree-parent-category-Id" name="parentId">
         <!-- <option value="0">无</option> -->
         <!-- <option value="" selected="selected">空</option> -->
        </select>
       </td>
      </tr>
      <tr>
       <td align="right">关键字</td>
       <td>
        <input type="text" name="keywords" value="" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">简单描述</td>
       <td>
        <textarea name="desc" cols="60" rows="4" class="textArea"></textarea>
       </td>
      </tr>
      <tr>
       <td align="right">排序</td>
       <td>
        <input type="text" name="vsort" value="" size="5" class="inpMain" />
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
