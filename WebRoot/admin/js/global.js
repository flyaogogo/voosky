/**
 +----------------------------------------------------------
 * 下拉菜单
 +----------------------------------------------------------
 */
$(function() {
    $('.M').hover(function() {
        $(this).addClass('active');
    },
    function() {
        $(this).removeClass('active');
    });
});

/**
 +----------------------------------------------------------
 * 刷新验证码
 +----------------------------------------------------------
 */
function refreshimage() {
    var cap = document.getElementById('vcode');
    cap.src = cap.src + '?';
}

/**
 +----------------------------------------------------------
 * 无组件刷新局部内容
 +----------------------------------------------------------
 */
function dou_callback(page, name, value, target) {
    $.ajax({
        type: 'GET',
        url: page,
        data: name + '=' + value,
        dataType: "html",
        success: function(html) {
            $('#' + target).html(html);
        }
    });
}

/**
 +----------------------------------------------------------
 * 表单全选
 +----------------------------------------------------------
 */
function selectcheckbox(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall' && e.disabled != true) e.checked = form.chkall.checked;
    }
}

/**
 +----------------------------------------------------------
 * 显示服务端扩展列表
 +----------------------------------------------------------
 */
function get_cloud_list(unique_id, get, localsite) {
    $.ajax({
        type: 'GET',
        url: 'http://cloud.douco.com/extend&rec=client',
        data: {'unique_id':unique_id, 'get':get, 'localsite':localsite},
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        success: function(cloud) {
            $('.selector').html(cloud.selector)
            $('.cloudList').html(cloud.html)
            $('.pager').html(cloud.pager)
        }
    });
}

/**
 +----------------------------------------------------------
 * 写入可更新数量
 +----------------------------------------------------------
 */
function cloud_update_number(localsite) {
    $.ajax({
        type: 'GET',
        url: 'http://cloud.douco.com/extend&rec=cloud_update_number',
        data: {'localsite':localsite},
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        success: function(cloud) {
            change_update_number(cloud.update, cloud.patch, cloud.module, cloud.plugin, cloud.theme, cloud.mobile)
        }
    });
}

/**
 +----------------------------------------------------------
 * 修改update_number值
 +----------------------------------------------------------
 */
function change_update_number(update, patch, module, plugin, theme, mobile) {
    $.ajax({
        type: 'POST',
        url: 'cloud.php?rec=update_number',
        data: {'update':update, 'patch':patch, 'module':module, 'plugin':plugin, 'theme':theme}
    });
}

/**
 +----------------------------------------------------------
 * 弹出窗口
 +----------------------------------------------------------
 */
function douFrame(name, frame, url ) {
    $.ajax({
        type: 'POST',
        url: url,
        data: {'name':name, 'frame':frame},
        dataType: 'html',
        success: function(html) {
            $(document.body).append(html);
        }
    });
}

/**
 +----------------------------------------------------------
 * 显示和隐藏
 +----------------------------------------------------------
 */
function douDisplay(target, action) {
    var traget = document.getElementById(target);
    if (action == 'show') {
        traget.style.display = 'block';
    } else {
        traget.style.display = 'none';
    }
}

/**
 +----------------------------------------------------------
 * 清空对象内HTML
 +----------------------------------------------------------
 */
function douRemove(target) {
    var obj = document.getElementById(target);
    obj.parentNode.removeChild(obj);
}

/**
 +----------------------------------------------------------
 * 无刷新自定义导航名称
 +----------------------------------------------------------
 */
function change(id, choose) {
    document.getElementById(id).value = choose.options[choose.selectedIndex].title;
}

/**
 * 模拟Form的Post请求
 * @param URL
 * @param PARAMS
 * @returns {___anonymous793_796}
 */
function post(URL, PARAMS) {
	var temp = document.createElement("form");
	temp.action = URL;
	temp.method = "post";
	temp.enctype = "multipart/form-data";
	temp.style.display = "none";
	for ( var x in PARAMS) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = PARAMS[x];
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;
}

//页面打开时  加载  导航
window.onload = function(selectId) {
	//console.log(".... index global..." );
	
	var ul = document.getElementById("public-header-nav-ul-id");
	var m_ul = document.getElementById("public-header-mobile-nav-ul-id");
	
	var first_li = document.createElement("li");
	//设置 li 属性，如 class   <li class="cur"><a href="${ctx }/index.htm" class="first">首页</a></li>
　　　first_li.setAttribute("class", "cur");

	var first_a = document.createElement("a");
	first_a.setAttribute("href", ctx + "/index.htm");
	first_a.setAttribute("class", "first");
	first_a.innerHTML="首页" ;
	
	first_li.appendChild(first_a);
　　　ul.appendChild(first_li);
	m_ul.appendChild(first_li);
	
	var dataList ;
	if($("#public-header-nav-ul-id").hasClass('bohengcls')||
			$("public-header-mobile-nav-ul-id").hasClass('bohengcls')){
		
		dataList = setTopAndFooter(ul,m_ul);
		//dataList = setNavigation(ul) 
	}else{
		dataList = setNavigation(ul) 
	}
	
	//console.log(dataList) 
}

/**
 * 通过递归找到子节点
 * @param tmpul		:上一层的ul标签
 * @param map		:通过父结点组成的一个集合Map
 * @param mapValue	:通过key，获得的集合
 * @param p_url		:父的url
 * @param p_name	:父的导航名称
 * @param flag		:处理第二级的样式
 * @param flag		:处理无限子结点的样式
 */
function findChild(tmpul,map,mapValue,p_url,p_name,flag,flag2) {
	
	if(flag==true){
		var child_all_li = document.createElement("li");
		//设置 li 属性，如 class
		//child_all_li.setAttribute("class", "visible-xs-block");
		
		var child_all_a = document.createElement("a");
		child_all_a.setAttribute("href", ctx + p_url);
		//child_a.setAttribute("target", "_blank");
		//console.log(i+"----"+ item.module) ;
		
		child_all_a.innerHTML="全部" ;
		
		child_all_li.appendChild(child_all_a);
		tmpul.appendChild(child_all_li);
	}
	
	$.each(mapValue, function(i,item){
		
		var child_li = document.createElement("li");
		
		var child_a = document.createElement("a");
		if(flag2 == true){
			child_li.setAttribute("class", "presentation");
			child_a.setAttribute("role", "menuitem");
			child_a.setAttribute("tabindex", "-1");
		}
		//console.log(item.navId + "  ---  " + ((item.moduleUrl).indexOf("?")>0))
		if((item.moduleUrl).indexOf("?")>0){
			
			child_a.setAttribute("href", ctx + item.moduleUrl + "&cateId=" + item.navId);
		}else{
			child_a.setAttribute("href", ctx + item.moduleUrl + "?cateId=" + item.navId);
		}
		child_a.setAttribute("title", item.navName);
		child_a.innerHTML=item.navName ;
		
		//console.log("child -- " + item.navId) ;
		var tmp_v = map[item.navId];
		if(tmp_v != undefined){
			//设置 li 属性，如 class
			child_li.setAttribute("class", "dropdown-submenu");
			
			var p_child_ul = document.createElement("ul");
			p_child_ul.setAttribute("class", "dropdown-menu animate");
			p_child_ul.setAttribute("role", "menu");
			
			findChild(p_child_ul,map,tmp_v,item.moduleUrl,item.navName,false,true);
			child_li.appendChild(p_child_ul);
		}
		child_li.appendChild(child_a);
		
		tmpul.appendChild(child_li);
		
		
	});
}

//创建a标签
function create_header_a(li,url,name,i) {
	
	var p_middle_first_a = document.createElement("a");
	//<a class="dropdown-toggle link " data-toggle="dropdown" data-hover="dropdown" href="success.html" 
	//aria-expanded="false" role="button" title="工程案例">工程案例 <span class="caret"></span></a>
	p_middle_first_a.setAttribute("href", ctx + url);
	p_middle_first_a.setAttribute("title", name);
	
	var child_first_span = document.createElement("span");
	child_first_span.innerHTML = name ;
	
	p_middle_first_a.appendChild(child_first_span);
	
	if(i==1){
		li.setAttribute("class", "cur hover dropdown margin-left-0 mouseoverclass");
		p_middle_first_a.setAttribute("class", "dropdown-toggle link");
		p_middle_first_a.setAttribute("data-toggle", "dropdown");
		p_middle_first_a.setAttribute("data-hover", "dropdown");
		p_middle_first_a.setAttribute("aria-expanded", "false");
		p_middle_first_a.setAttribute("role", "button");
		
		var child_first_span_cls = document.createElement("span");
		child_first_span_cls.setAttribute("class", "caret");
		p_middle_first_a.appendChild(child_first_span_cls);
	}else if(i==2){
		li.setAttribute("class", "cur hover margin-left-0 mouseoverclass");
		p_middle_first_a.setAttribute("class", "link");
	}
	
	
	
	li.appendChild(p_middle_first_a) ;
	
}

/**
 * 对新增页面的设置公共的头及底
 * @param ul
 */
function setTopAndFooter(ul,m_ul) {
	var urls = ctx+"/bohen/getTopFooterInfo.htm" ;
	//alert(urls);
	var dataList ;
	$.ajax({
		type : 'POST',
		dataType : "json",
		url : urls,//请求的action路径   
		error : function(XMLHttpRequest, textStatus, errorThrown) {//请求失败处理函数   
			alert('请求失败!');
			//console.log(XMLHttpRequest) 
			//console.log(textStatus) 
			//console.log(errorThrown) 
		},
		success : function(data) { //请求成功后处理函数。
			//alert('success data!');
			//console.log(data) ;
			
			//top
			var top_header_ul = document.getElementById("common-header-top-id");
			
			var common_header_top_marker_a = document.getElementById("common-header-top-marker-id");
			common_header_top_marker_a.innerHTML = (data.sysconfMap['main.site.address']).trim() ;
			
			var common_header_top_envelope_a = document.getElementById("common-header-top-envelope-id");
			common_header_top_envelope_a.innerHTML = (data.sysconfMap['main.site.mail.address']).trim() ;
			
			var common_header_top_phone_a = document.getElementById("common-header-top-phone-id");
			common_header_top_phone_a.innerHTML = (data.sysconfMap['main.site.consumer.hotline']).trim() ;
			
			///-----------top end----------------------
			
			var navListMap = data.navListMap ;
			var artList = data.artList ;
			//找出第一级显示栏
			dataList = navListMap["0"] ;
			
			$.each(dataList, function(i,item){
				
				/*var middle_li = document.createElement("li");
				
				//console.log("0000 -- " + item.navId) ;
				var tmp_v = navListMap[item.navId];
				
				if(tmp_v != undefined){
					//middle_li.setAttribute("class", "cur hover dropdown margin-left-0 mouseoverclass");
					create_header_a(middle_li,item.moduleUrl,item.navName,1) ;
					
					var p_middle_ul = document.createElement("ul");
					p_middle_ul.setAttribute("class", "dropdown-menu dropdown-menu-left bullet");
					p_middle_ul.setAttribute("role", "menu");
					
					
					findChild(p_middle_ul,navListMap,tmp_v,item.moduleUrl,item.navName,true,false);
					middle_li.appendChild(p_middle_ul) ;
					//console.log("ok") ;
				}else{
					//middle_li.setAttribute("class", "cur hover margin-left-0 mouseoverclass");
					create_header_a(middle_li,item.moduleUrl,item.navName,2) ;
				}
				
				ul.appendChild(middle_li);
				*/
				setPcNavigation(ul,navListMap,item)
				setMobileNavigation(m_ul,navListMap,item)
				
			});

			//公司简介
			//TODO
			var company_footer_div = document.getElementById("common-footer-company-id");
			var company_footer_h4 = document.createElement("h4");
			company_footer_h4.innerHTML = "公司简介" ;
			company_footer_div.appendChild(company_footer_h4) ;
			
			var company_footer_p1 = document.createElement("p");
			var company_footer_p2 = document.createElement("p");
			company_footer_p2.innerHTML = data.spAbout.content ;
			company_footer_p1.appendChild(company_footer_p2) ;
			company_footer_div.appendChild(company_footer_p1) ;
			//<a href="" title="公司简介" target='_self' class="read-more">查看详细简介<i class="fa fa-arrow-circle-right"></i></a>
			var company_footer_a = document.createElement("a");
			company_footer_a.setAttribute("href", ctx + "/bohen/getSPInfoByName.htm?uniqueName=summary");
			company_footer_a.setAttribute("class", "read-more");
			company_footer_a.setAttribute("target", "_self");
			company_footer_a.setAttribute("title", data.spAbout.pageName);
			
			var company_footer_span = document.createElement("span");
			company_footer_span.innerHTML="查看详细简介" ;
			company_footer_a.appendChild(company_footer_span);
			
			var company_footer_li = document.createElement("li");
			company_footer_li.setAttribute("class", "fa fa-arrow-circle-right");
			company_footer_a.appendChild(company_footer_li);
			
			company_footer_div.appendChild(company_footer_a);
			
			
			//底部新闻
			var footerInt = 0 ;
			$.each(artList, function(i,item){
				//只显示最新5条
				if(item.navId!="20" && footerInt<5){
				
				
				
				footerInt ++ ;
				var footer_ul = document.getElementById("common-footer-news-id");
				var first_footer_li = document.createElement("li");
				//设置 li 属性，如 class   <li ><a href="" target='_self' title="中建土木公司规范用工">中建土木公司规范用工</a></li>
				var first_footer_a = document.createElement("a");
				first_footer_a.setAttribute("href", ctx + "/bohen/getCaseInfoById.htm?id=" + item.id);
				first_footer_a.setAttribute("target", "_self");
				first_footer_a.setAttribute("title", item.title);
				first_footer_a.innerHTML=item.title ;
				
				first_footer_li.appendChild(first_footer_a);
			　　　footer_ul.appendChild(first_footer_li);
				}
			});
			
			//联系我们
			var contact_ul = document.getElementById("common-footer-contact-us-id");
			contact_ul.setAttribute("class", "contact-info");
			/*地址*/
			var contact_marker_li = document.createElement("li");
			//设置 li 属性，如 class   <li><a><i class="fa fa-map-marker"></i>&nbsp;北京大兴区</a></li>
			var contact_marker_a = document.createElement("a");
			var contact_marker_i = document.createElement("i");
			contact_marker_i.setAttribute("class", "fa fa-map-marker");
			var contact_marker_span = document.createElement("span");
			contact_marker_span.innerHTML="&nbsp;北京大兴区" ;
			contact_marker_a.appendChild(contact_marker_i);
			contact_marker_a.appendChild(contact_marker_span);
			//contact_marker_a.innerHTML="&nbsp;北京大兴区" ;
			contact_marker_li.appendChild(contact_marker_a);
			
			/*电话*/
			var contact_phone_li = document.createElement("li");
			//设置 li 属性，如 class   <a href="tel:86-12345678901" title="86-12345678901"><i class="fa fa-phone"></i>&nbsp;86-12345678901</a>
			var contact_phone_a = document.createElement("a");
			var contact_phone_i = document.createElement("i");
			contact_phone_i.setAttribute("class", "fa fa-phone");
			var contact_phone_span = document.createElement("span");
			contact_phone_span.innerHTML="&nbsp;86-12345678901" ;
			contact_phone_a.appendChild(contact_phone_i);
			contact_phone_a.appendChild(contact_phone_span);
			//contact_phone_a.innerHTML="&nbsp;86-12345678901" ;
			
			contact_phone_li.appendChild(contact_phone_a);
			/*邮件*/
			var contact_mail_li = document.createElement("li");
			//设置 li 属性，如 class   <li><a><i class="fa fa-envelope"></i>&nbsp;123456789@qq.com</a></li>
			var contact_mail_a = document.createElement("a");
			var contact_mail_i = document.createElement("i");
			contact_mail_i.setAttribute("class", "fa-envelope");
			var contact_mail_span = document.createElement("span");
			contact_mail_span.innerHTML="&nbsp;123456789@qq.com" ;
			
			contact_mail_a.appendChild(contact_mail_i);
			contact_mail_a.appendChild(contact_mail_span);
			//contact_mail_a.innerHTML="&nbsp;123456789@qq.com" ;
			contact_mail_li.appendChild(contact_mail_a);
			
			/*域名*/
			var contact_globe_li = document.createElement("li");
			//设置 li 属性，如 class   <li><a><i class="fa fa-globe"></i>&nbsp;www.spademo.com</a></li>
			var contact_globe_a = document.createElement("a");
			var contact_globe_i = document.createElement("i");
			contact_globe_i.setAttribute("class", "fa-globe");
			var contact_globe_span = document.createElement("span");
			contact_globe_span.innerHTML="&nbsp;www.spademo.com" ;
			contact_globe_a.appendChild(contact_globe_i);
			contact_globe_a.appendChild(contact_globe_span);
			//contact_globe_a.innerHTML="&nbsp;www.spademo.com" ;
			contact_globe_li.appendChild(contact_globe_a);
			
			////
		　　　contact_ul.appendChild(contact_marker_li);
			contact_ul.appendChild(contact_phone_li);
			contact_ul.appendChild(contact_mail_li);
			contact_ul.appendChild(contact_globe_li);
			
		}
	});
}

/**
 * 电脑端 导航栏
 * @param ul
 * @param navListMap
 * @param item
 */
function setPcNavigation(ul,navListMap,item){
	var middle_li = document.createElement("li");
	
	//console.log("0000 -- " + item.navId) ;
	var tmp_v = navListMap[item.navId];
	
	if(tmp_v != undefined){
		//middle_li.setAttribute("class", "cur hover dropdown margin-left-0 mouseoverclass");
		create_header_a(middle_li,item.moduleUrl,item.navName,1) ;
		
		var p_middle_ul = document.createElement("ul");
		p_middle_ul.setAttribute("class", "dropdown-menu dropdown-menu-left bullet");
		p_middle_ul.setAttribute("role", "menu");
		
		
		findChild(p_middle_ul,navListMap,tmp_v,item.moduleUrl,item.navName,true,false);
		middle_li.appendChild(p_middle_ul) ;
		//console.log("ok") ;
	}else{
		//middle_li.setAttribute("class", "cur hover margin-left-0 mouseoverclass");
		create_header_a(middle_li,item.moduleUrl,item.navName,2) ;
	}
	
	ul.appendChild(middle_li);
}

/**
 * 手机端 导航栏
 * @param ul
 * @param navListMap
 * @param item
 */
function setMobileNavigation(ul,navListMap,item){
	var middle_li = document.createElement("li");
	
	//console.log("0000 -- " + item.navId) ;
	var tmp_v = navListMap[item.navId];
	
	if(tmp_v != undefined){
		//middle_li.setAttribute("class", "cur hover dropdown margin-left-0 mouseoverclass");
		create_header_a(middle_li,item.moduleUrl,item.navName,1) ;
		
		var p_middle_ul = document.createElement("ul");
		p_middle_ul.setAttribute("class", "dropdown-menu dropdown-menu-left bullet");
		p_middle_ul.setAttribute("role", "menu");
		
		
		findChild(p_middle_ul,navListMap,tmp_v,item.moduleUrl,item.navName,true,false);
		middle_li.appendChild(p_middle_ul) ;
		//console.log("ok") ;
	}else{
		//middle_li.setAttribute("class", "cur hover margin-left-0 mouseoverclass");
		create_header_a(middle_li,item.moduleUrl,item.navName,2) ;
	}
	
	ul.appendChild(middle_li);
}

function setNavigation(ul) {
	var dataList ;
	$.ajax({
		async:false,
		type : 'POST',
		dataType : "json",
		url : ctx+"/nav/listAllParentNavInfo.htm",//请求的action路径    第一版请求方式，Public
		error : function() {//请求失败处理函数   
			alert('请求失败');
		},
		success : function(data) { //请求成功后处理函数。
			dataList = data ;
			//console.log(dataList );
			//<li class="cur hover"><a href="${ctx }/web/getProductsInfo.htm" target="_blank">产品中心</a> </li>
			$.each(data, function(i,item){  
				//console.log(item.navId+","+item.navName);
				
				var middle_li = document.createElement("li");
				//设置 li 属性，如 class
				middle_li.setAttribute("class", "cur hover dropdown margin-left-0 mouseoverclass");
				
				var middle_a = document.createElement("a");
				middle_a.setAttribute("href", ctx + item.moduleUrl);
				//middle_a.setAttribute("target", "_blank");
				//console.log(i+"----"+ item.module) ;
				if(i==6){
					middle_a.setAttribute("class", "last");
				}
				
				middle_a.innerHTML=item.navName ;
				
				middle_li.appendChild(middle_a);
				ul.appendChild(middle_li);
				
			});  
			
		}
	});
}


// 鼠标 悬浮 触发事件 2016.11.17
window.onmouseover = function(selectId) {
	//console.log($("#public-header-nav-ul-id li").hasClass('mouseoverclass'))
	//var liId = $("#public-header-nav-ul-id") ;
	if($("#public-header-nav-ul-id li").hasClass('mouseoverclass')){
		//alert(1);
	}
}