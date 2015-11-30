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
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/product.js"></script>

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
   <div class="vs-product-show-cls">
    <h3><a href="javascript:void(0)" class="actionBtn vs-product-add-href-cls">添加商品</a>商品列表</h3>
    <div class="filter">
    <form action="product.php" method="post">
     <select name="cat_id">
      <option value="0">未分类</option>
      <option value="{$cate.cat_id}" selected="selected">电子</option>
     </select>
     <input name="keyword" type="text" class="inpMain" value="" size="20" />
     <input name="submit" class="btnGray" type="submit" value="筛选" />
    </form>
    <span>
    <a class="btnGray" href="javascript:void(0)">更新商品缩略图</a>
    <a class="btnGray" href="javascript:void(0)">开始筛选首页商品</a>
    </span>
    </div>
 
    <div>
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
        <th width="22" align="center"><input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check'></th>
        <th width="40" align="center">编号</th>
        <th align="left">商品名称	</th>
        <th width="150" align="center">商品分类</th>
       <th width="80" align="center">添加日期</th>
        <th width="80" align="center">操作</th>
      </tr>
   
   		<s:iterator value="proList" var="pro">
      <tr>
        <td align="center"><input type="checkbox" name="checkbox[]" value="<s:property value="#pro.id"/>" /></td>
        <td align="center"><s:property value="#pro.id"/></td>
        <td><a href="javascript:void(0)" class="vs-product-title-href-cls"><s:property value="#pro.title"/></a></td>
        <td align="center"><a href="javascript:void(0)" class="vs-product-query-href-cls"><s:property value="#pro.cateId"/></a></td>
        <td align="center"><s:property value="#pro.addTime"/></td>
        <td align="center">
        	<a href="javascript:void(0)" class="vs-product-edit-href-cls">编辑 | </a>
        	<a href="javascript:void(0)" class="vs-product-delete-href-cls">删除</a>
         	<!-- {if $if_sort} --><a href="javascript:void(0)" class="vs-product-first-title-href-cls">首页显示</a><!-- {/if} -->
        </td>
      </tr>
      </s:iterator>
    </table>
    </div>
    
    </div>
    
    <div class="vs-product-type-oper-cls" style="display: none;">
    <div class="clear"></div>
    <h3><a href="javascript:void(0)" class="actionBtn returnActionBtn">商品列表</a>添加商品</h3>
    <form name="product-type-form" action="" method="post" enctype="multipart/form-data">
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
      <tr>
       <td width="90" align="right">商品名称</td>
       <td>
        <input type="text" name="name" value="" size="80" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right">商品分类</td>
       <td>
        <select name="cat_id">
         <option value="0"></option>
         <option value="{$cate.cat_id}" selected="selected"></option>
        </select>
       </td>
      </tr>
      <tr>
       <td align="right">商品价格</td>
       <td>
        <input type="text" name="price" value="" size="40" class="inpMain" />
       </td>
      </tr>
      <tr>
       <td align="right" valign="top">商品价格</td>
       <td>
        <textarea name="defined" id="defined" cols="50" class="textAreaAuto"></textarea>
        <script type="text/javascript">
         {literal}
         $("#defined").autoTextarea({maxHeight:300});
         {/literal}
        </script>
        </td>
      </tr>

      <tr>
       <td align="right" valign="top">商品描述</td>
       <td>
        <!-- KindEditor -->
        <script charset="utf-8" src="include/kindeditor/kindeditor.js"></script>
        <script charset="utf-8" src="include/kindeditor/lang/zh_CN.js"></script>
        <script>
        {literal}
         var editor;
         KindEditor.ready(function(K) {
             editor = K.create('#content');
         });
        {/literal}
        </script>
        <!-- /KindEditor -->
        <textarea id="content" name="content" style="width:780px;height:400px;" class="textArea"></textarea>
       </td>
      </tr>
      <tr>
       <td align="right">缩略图</td>
       <td>
        <input type="file" name="image" size="38" class="inpFlie" />
        <img src="images/icon_no.png"></td>
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
        <input type="text" name="description" value="" size="50" class="inpMain" />
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
