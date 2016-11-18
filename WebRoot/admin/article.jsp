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
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/article.js"></script>

<!-- Baidu Ueditor -->
<!-- 配置文件 -->
<script type="text/javascript" src="${ctx }/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${ctx }/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript" src="${ctx}/admin/js/TreeSelector.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/category.js"></script>

</head>
<script type="text/javascript">

	var tmpData = "" ;
	//对列表数据，拼装Json
	tmpData = "[" ;
	<c:forEach items="${navBean.navList}" var="a"> 
		tmpData = tmpData + "{'navId':${a.navId},'parentId':${a.parentId},'navName':'${a.navName}','module':'${a.module}','moduleUrl':'${a.moduleUrl}','guideAliases':'${a.guideAliases}'},"
	</c:forEach> 
//	<c:forEach items="${cateList}" var="a"> 
		//console.log("${a.cateName}"); //生成如 array.push(123)的字符串 这样前台拿到后就是js 
//		tmpData = tmpData + "{'cateId':'${a.cateId} ','uniqueName':'${a.uniqueName}','cateName':'${a.cateName}','navId':${a.navId},'desc':'${a.desc}','guideAliases':'${a.guideAliases}'},"
//	</c:forEach> 
	var tmpdatalen = tmpData.length ;
	if(tmpdatalen>1){
		tmpData = tmpData.substring(0,tmpData.length-1) ;//去掉最后一个逗号
	}
	tmpData = tmpData + "]" ;
	//console.log(tmpData) ;
	dataList = eval(tmpData) ;
	
	var parentId = '<s:property value="navBean.parentId"/>' ;
	
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
   <div class="vs-article-show-cls">
    <h3><a href="javascript:void(0)" class="actionBtn vs-article-add-href-cls">添加文章</a>文章列表</h3>
    <div class="filter">
    <form action="${ctx }/article/listArticlesInfo.htm" method="post">
     <select id="selectTree-parent-category-Id" name="cateId">
      <option value="all" selected="selected">未分类</option>
      <%-- <s:iterator value="ctgryList" var="ctl">
      	<option value="<s:property value="#ctl.cateId"/>"><s:property value="#ctl.cateName"/></option>
      </s:iterator> --%>
     </select>
     <input name="title" type="text" class="inpMain" value="" size="20" />
     <input name="submit" class="btnGray" type="submit" value="筛选" />
    </form>
    <span>
    <a class="btnGray" href="javascript:void(0)">更新商品缩略图</a>
    <a href="javascript:void(0)" class="btnGray vs-article-select-firstpro-href-cls">开始筛选首页商品</a>
    </span>
    </div>
 
    <div>
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
        <th width="22" align="center"><input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check'></th>
        <th width="40" align="center">编号</th>
        <th align="left">文章名称	</th>
        <th width="150" align="center">企业分类</th>
       <th width="80" align="center">添加日期</th>
        <th width="120" align="center">操作</th>
      </tr>
   
      <s:iterator value="artList" var="art">
      <tr>
        <td align="center"><input type="checkbox" name="checkbox[]" value="<s:property value="#art.id"/>" /></td>
        <td align="center"><s:property value="#art.id"/></td>
        <td><a href="javascript:void(0)" class="vs-article-title-href-cls"><s:property value="#art.title"/></a></td>
        <td align="center"><a href="javascript:void(0)" class="vs-article-query-href-cls"><s:property value="#art.navName"/></a></td>
        <td align="center"><s:property value="#art.addTime"/></td>
        <td align="center">
        	<a href="javascript:void(0)" class="vs-article-edit-href-cls">编辑 |</a> 
        	<a href="javascript:void(0)" class="vs-article-delete-href-cls">删除 |</a> 
        	<s:if test="isRecommend=='true'">
         		<a href="javascript:void(0)" class="vs-article-update-first-title-href-cls first-page">首页显示</a>
        	</s:if>
        	<s:else>
         		<a href="javascript:void(0)" class="vs-article-update-first-title-href-cls">后台显示</a>
        	</s:else>
        </td>
      </tr>
      </s:iterator>
    </table>
    </div>
    
    </div>
    
    <div class="vs-article-type-oper-cls" style="display: none;">
    <h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">文章列表</a><span class="vs-pro-span-type-cls">添加</span>-文章</h3>
    <form name="article-type-form" action="${ctx }/article/insrtArtAction.htm" method="post" enctype="multipart/form-data">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="90" align="right">文章名称</td>
       <td>
        <input type="hidden" name="id" />
        <input type="text" name="title" value="" size="80" class="inpMain" required="required"/>
       </td>
      </tr>
      <tr>
       <td align="right">分类</td>
       <td>
        <select id="selectTree-parent-category-oper-Id" name="cateId">
          <%-- <option value="all" selected="selected">未分类</option>
	      <s:iterator value="ctgryList" var="ctl">
      		<option value="<s:property value="#ctl.cateId"/>"><s:property value="#ctl.cateName"/></option>
      	 </s:iterator> --%>
        </select>
       </td>
      </tr>

      <tr>
        <td align="right" valign="top">文章内容</td>
        <td>
          <!-- 实例化编辑器 -->
		    <script type="text/javascript">
		    	UEDITOR_CONFIG.UEDITOR_HOME_URL = '../ueditor/'; //一定要用这句话，否则你需要去ueditor.config.js修改路径的配置信息
		        var ue = UE.getEditor('content');
		    </script>
		    <!-- 加载编辑器的容器 -->
	      <script id="content" name="content" type="text/plain" style="width:780px;height:400px;"></script>
          <!-- <textarea id="content" name="content" style="width:780px;height:400px;" class="textArea"></textarea> -->
          </td>
      </tr>
      <tr>
       <td align="right">缩略图</td>
       <td>
        <input type="file" name="imageFile" size="38" class="inpFlie" />
        <input type="hidden" name="fileRealPath" />
        <img name="imageShow" width="20" height="20"></td>
      </tr>
      <tr>
       <td align="right">关键字</td>
       <td>
        <input type="text" name="keywords" value="" size="50" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">简单描述</td>
       <td>
        <input type="text" name="desc" value="" size="50" class="inpMain" />
       </td>
      </tr>
      <tr>
            <td height="35" align="right">排序</td>
            <td>
             <input type="text" name="vsort" value="50" size="5" class="inpMain" />
            </td>
       </tr>
      <tr>
            <td height="35" align="right">是否推荐</td>
            <td>
             <input id="vs-art-checkbox-is-recommend" type="checkbox" name="isRecommend" value="false"/>
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
 <!-- VSMain 结束 -->
 <!-- footer 开始 -->
	<%@ include file="./inc/footer.jsp" %>
 <!-- footer 结束 -->
 </div>
</body>
</html>
