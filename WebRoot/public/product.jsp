<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../admin/inc/taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<title></title>
<link href="${ctx}/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/global.js"></script>
</head>
<body>
<div id="wrapper"> 
    <!-- 头部 -->
    <%@ include file="./inc/pheader.jsp" %>
  
 <div class="wrap mb">
  <div id="pageLeft">
   <div class="treeBox">
       <h3>产品分类</h3>
       <ul>

        <li class="cur"><a href="">电子数码</a></li>
        <ul>
         <li class="cur">-<a href="">平板电脑</a></li>
         <li class="cur">-<a href="">智能手机</a></li>
        </ul>
		<li class="cur"><a href="">家居百货</a></li>
        <li class="cur"><a href="">母婴用品</a></li>
        
       </ul>
      </div>
  
  </div>
  <div id="pageIn"> <div class="urHere">当前位置：<a href="#">首页</a><b>></b>企业简介</div>
   <div id="product">
    <div class="productImg"><a href="" target="_blank"><img src="pro_img/15_thumb.jpg" width="300" /></a></div>
    <div class="productInfo">
     <h1>衣物收纳箱</h1>
     <ul>
      <li class="productPrice">价格：<em class="price">￥56.00 元</em></li>
     
      <li></li>
  
     </ul>

     <dl class="btnBuy">
     <form action="" method="post">
      <input type="hidden" name="product_id" value="" />
      <input type="hidden" name="number" value="1" />
      <input type="submit" name="submit" class="addToCart" value="" />
     </form>
     </dl>
    
     <dl class="btnAsk">
      <dt>购买：</dt>
      <dd><a href="http://wpa.qq.com/msgrd?v=3&amp;uin={if is_array($qq)}{$qq.number}{else}{$qq}{/if}&amp;site=qq&amp;menu=yes" target="_blank"><img src="images/online_qq.jpg" /></a><a href=""><img src="images/online_email.jpg" /></a></dd>
     </dl>
    </div>
    <div class="clear"></div>
    <div class="productContent">
     <h3>产品介绍</h3>
     <ul>
      其实收纳工作并不麻烦，不管户型有多大，总会有更多的储物空间等待你去发现。小空间里的家居收纳尤为重要，面对井然有序的家，想必你的心情也会随之雀跃起来。
拥有较大户型的厨房固然是件好事，但杂碎的厨房用品同样需要合理归置。让我们跟上收纳达人安妮的脚步，剖析厨房里的秘密武器，学习如何布局实现简约风尚。
如果你也同安妮一样需要长时间保持坐姿状态，或是与你的宠物狗进行交流与互动，或是和你的好友海阔天空的闲谈，一款舒适的座椅则必不可少。亲切的色调可以拉近彼此的距离，而一盆新鲜的绿植亦能点亮各自的情绪，令双方都保有愉悦的心境。
这面精简的壁柜提供了毫不起眼的储藏空间，干练的线条搭配柔和的色调成为就餐区优雅的背景。不规则晕染开的色泽在原木色的基调中显露出不经意的变化之美。
造型令人惊叹的吊灯给餐厅带来魅力的同时也提供了更多的话题。抽象的演绎，充满现代的酷感，将会带给你更多厨房照明的灵感。
打开壁柜的拉门，你会发现安妮已根据不同物品的收纳需求，在内部为她们度身定制了巧妙的隔架内饰，以最大限度来存放这些与好友分享的红酒和盛器。
抽屉、壁橱、吊柜，这些再普通不过的设计元素，几乎是每个小户型厨房总会运用的一至两个收纳方式，而贴合墙面的U字型陈列更是节省空间的最佳方案。若你认为它仅此而已，那你就大错特错了。待我们展开柜门，带你领略其中的大不同。
灰色的不锈钢台面耐用且便于清洁。为一侧的吧台配置几把氛围轻松的椅子，让料理台的作用不再仅限于烹饪，从此让功能介于厨房和学习园地之间。
开放式的厨房需要一个功效强劲的油烟机，这款带有排气罩的壁挂式感应油烟机便是整个厨房的焦点。
直排抽取式的设计造就了一个身材苗条的调味品收纳架。你不觉得这样的创新富有生活的感悟吗?若是以前，即使将瓶瓶罐罐整齐地排放成四方形，也可能因为光线的死角而看不清楚最里面放的到底是酱油，还是陈醋呢。瓶身上的标签赤裸裸的展现你眼前，无需费时即可信手取得。
或许有人会说，我可以把这些调味品都摆放在料理台之上，那你有没有想过长时间暴露在油烟下会导致瓶身粘糊糊的呢?我想安妮的方法是目前最为理想的。对于体型稍高的瓶子，我们将拉门的内部进行微调，选用双层木条或提升挡板的高度来防止玻璃瓶在移动中跌落。而木条间的缝隙正好露出调味品的名称。
高性能的家电有时也能帮助你节省一定的收纳空间。当派对还未开始，当桌子上已满是各类食物，当刚烤好的甜点没有容身之处，这时具有保温功能的烤箱便能代为保管，不用再为没有空地而烦恼。四层的大型烤箱镶嵌于壁柜之间，也绝不会占用你多余的地盘。
存放餐具的抽屉里被三角形的小木条进行了合理分割，从而固定各类用品的位置。在抽取时就不会因为作用力的关系导致餐具之间的碰撞和磨损。
     </ul>
    </div>
   </div>
  </div>
  <div class="clear"></div>
 </div>
 
 	<!-- 底部 -->
  <%@ include file="./inc/pfooter.jsp" %>
 
 
  </div>
</body>
</html>