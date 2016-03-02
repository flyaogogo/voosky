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

<%-- 
<link rel="stylesheet" href="${ctx}/admin/include/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/admin/include/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctx}/admin/include/kindeditor-4.1.10/plugins/code/prettify.js"></script> 
--%>

<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/TreeSelector.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/singlepage.js"></script>

<!-- Baidu Ueditor -->
<!-- 配置文件 -->
<script type="text/javascript" src="${ctx }/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${ctx }/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/ueditor/lang/zh-cn/zh-cn.js"></script>
	    
</head>


<body>
<div id="vsWrap">
 	<%@ include file="./inc/header.jsp" %>
<!-- vsHead 结束 -->
	<%@ include file="./inc/left.jsp" %>
<!-- VSMENU 结束 -->
  <div id="vsMain">
   <div id="vsHere">VsPHP 管理中<b></b><strong>系统设置</strong></div>
   <div class="mainBox" style="{$workspace.height}">
    <div class="spage">
     <h3><a href="javascript:void(0)" class="actionBtn vs-sp-add-cls">添加单页面</a>单页面列表</h3>
      <s:if test="spList.size<1">
	      <dl>
	        <dt><strong>公司简介</strong><p>about</p></dt>
	        <dd><a href="javascript:void(0);" class="vs-sp-update-cls">编辑</a> | <a href="javascript:void(0)" class="vs-sp-delete-cls">删除</a></dd>
	      </dl>
      </s:if>
      
      <s:iterator value="spList" var="sp">
	      <dl class="child1">
	      	
	        <dt><strong><s:property value="#sp.pageName"/></strong>
	        <p><s:property value="#sp.uniqueName"/></p></dt>
	        <dd><input type="hidden" name="pageId" value="<s:property value="#sp.pageId"/>" id="hidden-singlepage-id"/>
	        <a href="javascript:void(0)" class="vs-sp-update-cls">编辑</a> | <a href="javascript:void(0)" class="vs-sp-delete-cls">删除</a></dd>
	      </dl>
      </s:iterator>
    </div>
	
	<div class="vs-sp-add-btn-cls" style="display: none;">
	<h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">返回列表</a><span class="vs-sp-span-type-cls">单页面列表-添加</span></h3>
    <form name="single-page-type-form" action="${ctx }/singlepage/addSPAction.htm" method="post">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="80" align="right">单页面标题</td>
       <td>
        <input type="hidden" name="pageId"/>
        <input type="text" name="pageName" value="" size="40" class="inpMain" required="required"/>
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
         <option value="0">无</option>
         <!-- <option value="" selected="selected">简介</option> -->
        </select>
       </td>
      </tr>
      <tr>
       <td align="right">单页面内容</td>
       <td>
        <!-- KindEditor 
        <script charset="utf-8" src="${ctx}/admin/include/kindeditor/kindeditor.js"></script>
        <script charset="utf-8" src="${ctx}/admin/include/kindeditor/lang/zh_CN.js"></script>
        
        <script>
	         var editor;
	         KindEditor.ready(function(K) {
	             editor = K.create('#content',{
	 				cssPath : ctx + 'admin/include/kindeditor-4.1.10/plugins/code/prettify.css',
					uploadJson : ctx + 'admin/include/kindeditor-4.1.10/jsp/upload_json.jsp',
					fileManagerJson : ctx + 'admin/include/kindeditor-4.1.10/jsp/file_manager_json.jsp',
					allowFileManager : true,
					afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['single-page-type-form'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['single-page-type-form'].submit();
						});
					}
	        	});
	        });
        </script>
        -->
        <!-- /KindEditor -->
        
        
	    <!-- 实例化编辑器 -->
	    <script type="text/javascript">
	    	UEDITOR_CONFIG.UEDITOR_HOME_URL = '../ueditor/'; //一定要用这句话，否则你需要去ueditor.config.js修改路径的配置信息
	        var ue = UE.getEditor('content');
	    </script>
	    
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
