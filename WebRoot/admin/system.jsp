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
<script type="text/javascript" src="${ctx}/admin/js/global.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/jsMgr/system.js"></script>

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
    <h3>系统设置</h3>
    <div class="idTabs">
      <ul class="tab">
        <li><a href="javascript:void(0)" class="vs-system-tab-main-cls selected">常规设置</a></li>
        <li><a href="javascript:void(0)" class="vs-system-tab-display-cls">显示设置</a></li>
        <li><a href="javascript:void(0)" class="vs-system-tab-defined-cls">自定义</a></li>
        <li><a href="javascript:void(0)" class="vs-system-tab-mail-cls">邮件服务器</a></li>
      </ul>
      <div class="items">
       <!-- <form action="#" method="post" enctype="multipart/form-data"> -->
       	<input type="hidden" name="tabvalue" value="main" />
        <div id="main">
          <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
          	<tr>
              <th width="131">名称</th>
              <th>内容</th>
            </tr>
            <tr>
              <td align="right">站点名称</td>
              <td>
                <input name="sitename" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.name']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">站点标题</td>
              <td><input name="sitetitle" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.title']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">站点关键字</td>
              <td><input name="sitekeywords" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.keywords']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">站点描述</td>
              <td><input name="sitedesc" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.description']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
	              <td align="right">站点标志</td>
	              <td><input name="msmark" type="file" id="upload_file">&nbsp;<div class="upload_file_mark_msg_cls"></div></td>
            </tr>
            <tr>
              <td align="right">公司地址</td>
              <td><input name="siteaddress" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.address']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">是否关闭网站</td>
              <td>
              <s:if test="mapSysConf['main.site.whether.close']=='true'">
              	<input name="mswhetherclose" type="radio" value="true" checked>是<input name="mswhetherclose" type="radio" value="false">否
              </s:if>
              <s:else>
              	<input name="mswhetherclose" type="radio" value="true">是<input name="mswhetherclose" type="radio" value="false" checked>否
              </s:else>
              </td>
            </tr>
            <tr>
              <td align="right">ICP备案证书号</td>
              <td><input name="siteipcrecord" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.ICP.record.Certificate.No']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">客服电话</td>
              <td><input name="siteconsumerhotline" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.consumer.hotline']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">传真</td>
              <td><input name="sitefax" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.fax']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">客服QQ号码</td>
              <td><input name="siteqqnum" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.qq.num']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">邮件地址</td>
              <td><input name="sitemail" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.mail.address']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">系统语言</td>
              <td><input name="sitelanguage" type="text" id="textfield" value="<s:property value="mapSysConf['main.site.system.language']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
            </tr>
            <tr>
              <td align="right">URL 重写</td>
              <td>
              <s:if test="mapSysConf['main.site.URL.Rewrite']=='true'">
              	<input name="msurlrewrite" type="radio" value="true" checked>是
              	<input name="msurlrewrite" type="radio" value="false">否
              </s:if>
              <s:else>
              	<input name="msurlrewrite" type="radio" value="true" >是
              	<input name="msurlrewrite" type="radio" value="false" checked>否
              </s:else>
              </td>
            </tr>
            <tr>
              <td align="right">启用站点地图</td>
              <td>
              <s:if test="mapSysConf['main.site.enable.map']=='true'">
              	<input name="msenablemap" type="radio" value="true" checked>是
              	<input name="msenablemap" type="radio" value="false">否
              </s:if>
              <s:else>
              	<input name="msenablemap" type="radio" value="true" >是
              	<input name="msenablemap" type="radio" value="false" checked>否
              </s:else>
              </td>
            </tr>
            <tr>
              <td align="right">启用验证码</td>
              <td>
              <s:if test="mapSysConf['main.site.captcha']=='true'">
              	<input name="mscaptcha" type="radio" value="true" checked>是
              	<input name="mscaptcha" type="radio" value="false">否
              </s:if>
              <s:else>
              	<input name="mscaptcha" type="radio" value="true" >是
              	<input name="mscaptcha" type="radio" value="false" checked>否
              </s:else>
              </td>
            </tr>
            <tr>
              <td align="right">留言板强制中文输入</td>
              <td>
              <s:if test="mapSysConf['main.site.Message.boards.forced.chinese.input']=='true'">
              	<input name="msmsgforceboard" type="radio" value="true" checked>是
              	<input name="msmsgforceboard" type="radio" value="false">否
              </s:if>
              <s:else>
              	<input name="msmsgforceboard" type="radio" value="true" >是
              	<input name="msmsgforceboard" type="radio" value="false" checked>否
              </s:else>
              </td>
            </tr>
            <tr>
              <td align="right">统计/客服代码调用</td>
              <td><textarea name="mscodecall" cols="80" rows="60" id="textfield" style="border:1px solid #CCC; height:80px; vertical-align:middle; color:#999;">
              <s:property value="mapSysConf['main.site.statistics.or.service.code.calls']"/>
              </textarea></td>
            </tr>
          </table>
        </div>
        
        
        <div id="display" style="display: none;">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
         <tr>
           <th width="131">名称</th>
           <th>内容</th>
         </tr>
   
          <tr>
           <td align="right">缩略图宽度</td>
           <td>
            <input name="disthumbwidth" type="text" id="textfield" value="<s:property value="mapSysConf['display.thumb.width']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          
           </td>
          </tr>
        
         <tr>
          <td align="right">缩略图高度</td>
          <td>
           <input name="disthumbheight" type="text" id="textfield" value="<s:property value="mapSysConf['display.thumb.height']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr>
         <tr>
          <td align="right">商品价格保留小数位数</td>
          <td>
           <input name="dispricesdecimal" type="text" id="textfield" value="<s:property value="mapSysConf['display.prices.decimal.places']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr>
         <tr>
          <td align="right">文章列表数量</td>
          <td>
           <input name="disnumberart" type="text" id="textfield" value="<s:property value="mapSysConf['display.number.of.articles']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr>
         <tr>
          <td align="right">首页展示文章数量</td>
          <td>
           <input name="dishownumart" type="text" id="textfield" value="<s:property value="mapSysConf['display.home.shows.number.art']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr><tr>
          <td align="right">商品列表数量</td>
          <td>
           <input name="disnumberpro" type="text" id="textfield" value="<s:property value="mapSysConf['display.number.of.product']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr>
         <tr>
          <td align="right">首页展示商品数量</td>
          <td>
           <input name="dishownumpro" type="text" id="textfield" value="<s:property value="mapSysConf['display.home.shows.number.product']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
          </td>
         </tr>
         
        </table>
        </div>
        
        
        
        <div id="defined" style="display: none;">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
         <tr>
           <th width="131">名称</th>
           <th>内容</th>
         </tr>
       
          <tr>
           <td align="right"><table width="100%" border="0" cellpadding="8" cellspacing="0">
             <tbody>
               <tr>
                 <td align="right">文章自定义属性</td>
               </tr>
             </tbody>
           </table>
             <br></td>
           <td>
            <input name="defartattr" type="text" id="textfield" value="<s:property value="mapSysConf['defined.article.attributes']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
            
             <p class="cue">如"颜色,尺寸,型号"中间以英文逗号隔开</p>
           </td>
          </tr>
        
         <tr>
          <td align="right">商品自定义属性</td>
          <td>
           <input name="defproductattr" type="text" id="textfield" value="<s:property value="mapSysConf['defined.product.attributes']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;">
            <p class="cue">如"颜色,尺寸,型号"中间以英文逗号隔开</p>
      
          </td>
         </tr>
        
        </table>
        </div>
        
        
        <div id="mail" style="display: none;">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
         <tr>
           <th width="131">名称</th>
           <th>内容</th>
         </tr>
        
         <tr>
          <td align="right">邮件服务</td>
          <td>
          	<s:if test="mapSysConf['mail.service']=='mail'">
            <input type="radio" name="mailservice" id="" value="mail" checked>系统内置Mail服务
            <input type="radio" name="mailservice" id="" value="smtp" >SMTP服务   
            </s:if>
            <s:else>
            <input type="radio" name="mailservice" id="" value="mail" >系统内置Mail服务
            <input type="radio" name="mailservice" id="" value="smtp" checked>SMTP服务   
             </s:else>  
          </td>
         </tr>
         <tr>
           <td align="right">SMTP服务器</td>
           <td><input name="mailsmtpservice" type="text" id="textfield" value="<s:property value="mapSysConf['mail.smtp.service']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
         </tr>
         <tr>
           <td align="right">服务器端口</td>
           <td><input name="mailsmtpport" type="text" id="textfield" value="<s:property value="mapSysConf['mail.smtp.port']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
         </tr>
         <tr>
           <td align="right">是否使用SSL安全协议</td>
           <td>
           <s:if test="mapSysConf['mail.SSL.security.protocol']=='true'">
     		<input type="radio" name="msslsecprotocol" id="" value="true" checked> 是
           	<input type="radio" name="msslsecprotocol" id="" value="false"> 否
           	</s:if>
           	<s:else>
           	<input type="radio" name="msslsecprotocol" id="" value="true" > 是
           	<input type="radio" name="msslsecprotocol" id="" value="false" checked> 否
           	</s:else>
     	   </td>
     	  </tr>
          <tr>
           <td align="right">发件邮箱</td>
           <td><input name="mailoutbox" type="text" id="textfield" value="<s:property value="mapSysConf['mail.outbox.mailboxes']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
         </tr>
         <tr>
           <td align="right">发件邮箱密码</td>
           <td><input name="mailpassword" type="text" id="textfield" value="<s:property value="mapSysConf['mail.outbox.mail.password']"/>" size="80" maxlength="200"  style="border:1px solid #CCC; height:30px; vertical-align:middle; color:#999;"></td>
         </tr>
     
        </table>
        </div>

        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
         <tr>
          <td width="131"></td>
          <td>
         
           <input name="submit" class="btn sys-config-update-cls" type="submit" value="提交" />
          </td>
         </tr>
        </table>
        <!-- </form> -->
      </div>-
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
